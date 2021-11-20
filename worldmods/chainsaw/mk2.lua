-- Configuration

local damage_per_node = 2

local chainsaw_leaves = true -- Cut down tree leaves.
-- Leaf decay may cause slowness on large trees if this is disabled.

local chainsaw_vines = true -- Cut down vines

local timber_nodenames = {} -- Cuttable nodes

local max_saw_radius = 12 -- max x/z distance away from starting position to allow cutting
-- Prevents forest destruction, increase for extra wide trees


-- Support for nodes not in any supported node groups (tree, leaves, leafdecay, leafdecay_drop)

timber_nodenames["default:papyrus"] = true
timber_nodenames["default:cactus"] = true
timber_nodenames["default:bush_stem"] = true
timber_nodenames["default:acacia_bush_stem"] = true
timber_nodenames["default:pine_bush_stem"] = true

if minetest.get_modpath("fruit") then
	timber_nodenames["fruit:leaves_with_peach"] = true
	timber_nodenames["fruit:leaves_with_pear"] = true
	timber_nodenames["fruit:leaves_with_plum"] = true
	timber_nodenames["fruit:leaves_with_mango"] = true
	timber_nodenames["fruit:leaves_with_berry"] = true
	timber_nodenames["fruit:leaves_with_orange"] = true
end

if minetest.get_modpath("growing_trees") then
	timber_nodenames["growing_trees:branch_sprout"] = true
	if chainsaw_leaves then
		timber_nodenames["growing_trees:leaves"] = true
	end
end

if minetest.get_modpath("snow") then
	if chainsaw_leaves then
		timber_nodenames["snow:needles"] = true
		timber_nodenames["snow:needles_decorated"] = true
		timber_nodenames["snow:star"] = true
	end
end

if minetest.get_modpath("trunks") then
	if chainsaw_leaves then
		timber_nodenames["trunks:moss"] = true
		timber_nodenames["trunks:moss_fungus"] = true
		timber_nodenames["trunks:treeroot"] = true
	end
end


-- Table for saving what was sawed down
local produced = {}

-- Save the items sawed down so that we can drop them in a nice single stack
local function handle_drops(drops)
	for _, item in ipairs(drops) do
		local stack = ItemStack(item)
		local name = stack:get_name()
		local p = produced[name]
		if not p then
			produced[name] = stack
		else
			p:set_count(p:get_count() + stack:get_count())
		end
	end
end

-- This function does all the hard work. Recursively we dig the node at hand
-- if it is in the table and then search the surroundings for more stuff to dig.
local function recursive_dig(pos, origin, itemstack)
	local node = minetest.get_node(pos)

	if not timber_nodenames[node.name] then
		return
	end

	-- Wood found - cut it
	handle_drops(minetest.get_node_drops(node.name, ""))
	minetest.remove_node(pos)
	itemstack:add_wear(damage_per_node)

	-- Check for snow on pine trees, sand/gravel on leaves, etc
	minetest.check_for_falling(pos)

	-- Check surroundings and run recursively
	for y=-1, 1 do
		if (pos.y + y) >= origin.y then
			for x=-1, 1 do
				if (pos.x + x) <= (origin.x + max_saw_radius) and (pos.x + x) >= (origin.x - max_saw_radius) then
					for z=-1, 1 do
						if (pos.z + z) <= (origin.z + max_saw_radius) and (pos.z + z) >= (origin.z - max_saw_radius) then
							local npos = {x=pos.x+x, y=pos.y+y, z=pos.z+z}
							if timber_nodenames[minetest.get_node(npos).name] then
								recursive_dig(npos, origin, itemstack)
							end
						end
					end
				end
			end
		end
	end
	return
end

-- Function to randomize positions for new node drops
local function get_drop_pos(pos)
	local drop_pos = {}

	for i = 0, 8 do
		-- Randomize position for a new drop
		drop_pos.x = pos.x + math.random(-3, 3)
		drop_pos.y = pos.y - 1
		drop_pos.z = pos.z + math.random(-3, 3)

		-- Move the randomized position upwards until
		-- the node is air or unloaded.
		for y = drop_pos.y, drop_pos.y + 5 do
			drop_pos.y = y
			local node = minetest.get_node_or_nil(drop_pos)

			if not node then
				-- If the node is not loaded yet simply drop
				-- the item at the original digging position.
				return pos
			elseif node.name == "air" then
				-- Add variation to the entity drop position,
				-- but don't let drops get too close to the edge
				drop_pos.x = drop_pos.x + (math.random() * 0.8) - 0.5
				drop_pos.z = drop_pos.z + (math.random() * 0.8) - 0.5
				return drop_pos
			end
		end
	end

	-- Return the original position if this takes too long
	return pos
end

-- Chainsaw entry point
local function chainsaw_dig(pos, itemstack)
	-- Start sawing things down
	recursive_dig(pos, pos, itemstack)

	if next(produced) ~= nil then
		minetest.sound_play("chainsaw", {pos = pos, gain = 1.0, max_hear_distance = 10})
		if itemstack:get_wear() >= 32767 then
			minetest.sound_play("default_tool_breaks", {pos = pos, gain = 1.0, max_hear_distance = 10})
		end
	end

	-- Now drop items for the player
	for name, stack in pairs(produced) do
		-- Drop stacks of stack max or less
		local count, max = stack:get_count(), stack:get_stack_max()
		stack:set_count(max)
		while count > max do
			minetest.add_item(get_drop_pos(pos), stack)
			count = count - max
		end
		stack:set_count(count)
		minetest.add_item(get_drop_pos(pos), stack)
	end

	-- Clean up
	produced = {}

	return
end

-- lifted from laser_mod
local use_sound = true

local players = {}

minetest.register_on_joinplayer(function(player)
	local player_name = player:get_player_name()
	players[player_name] = {soundToggle = 0}
end)

minetest.register_on_leaveplayer(function(player)
	player_name = player:get_player_name()
	players[player_name] = nil
end)

-- sound handle
local handle

if use_sound == true then
	minetest.register_globalstep(function(dtime)
		--Loop through all connected players
		for player_name,player_info in pairs(players) do
			local player = minetest.get_player_by_name(player_name)
			if player ~= nil then
				-- if user is wielding laser_mod weapon
				if string.find(player:get_wielded_item():get_name(), "chainsaw:chainsaw2") then
					-- if user is pressing left mouse button
					if player:get_player_control()["LMB"] == true then
						if players[player_name]["soundToggle"] == 0 then
							players[player_name]["soundToggle"] = 1
							local player_pos = player:getpos()
							-- play sound at player's location so others nearby can hear
							handle = minetest.sound_play("chainsaw", {pos = player_pos, gain = 1.0, max_hear_distance = 10})
							-- stop sound after 2 seconds
							minetest.after(2, function()
								minetest.sound_stop(handle)
								if players[player_name] then
								    players[player_name]["soundToggle"] = 0
								end
							end)
						end
					end
				end
			end
		end
	end)
end


minetest.register_tool("chainsaw:chainsaw2", {
	description = "Biofuel Chainsaw MK2",
	inventory_image = "standalone_chainsaw2.png",
	stack_max = 1,
	-- lifted from lavastuff
	groups = {tool = 1, axe = 1},
	tool_capabilities = {
		full_punch_interval = 0.16,
		max_drop_level = 1,
		groupcaps = {
			choppy = {
				times = {[1] = 2.00, [2] = 0.80, [3] = 0.40},
				uses = 40,
				maxlevel = 3
			},
		},
		damage_groups = {fleshy = 17, burns = 1},
	},
	sound = {breaks = "default_tool_breaks"},
	on_place = function(itemstack, user, pointed_thing)
		if pointed_thing.type ~= "node" then
			return itemstack
		end

		local name = user:get_player_name()
		if minetest.is_protected(pointed_thing.under, name) then
			minetest.record_protection_violation(pointed_thing.under, name)
			return
		end

		chainsaw_dig(pointed_thing.under, itemstack)
		return itemstack
	end
})

minetest.register_craft({
	output = "chainsaw:chainsaw2",
	recipe = {
		{"default:gold_ingot", "basic_materials:gear_steel", "basic_materials:silicon"},
		{"moreores:silver_ingot", "basic_materials:motor", "default:diamondblock"},
		{"biofuel:fuel_can", "biofuel:fuel_can", "moreores:mithril_ingot"},
	},
})

-- Add cuttable nodes after all mods loaded
minetest.after(0, function ()
	for k, v in pairs(minetest.registered_nodes) do
		if v.groups.tree then
			timber_nodenames[k] = true
		elseif chainsaw_leaves and (v.groups.leaves or v.groups.leafdecay or v.groups.leafdecay_drop) then
			timber_nodenames[k] = true
		elseif chainsaw_vines and v.groups.vines then
			timber_nodenames[k] = true
		end
	end
end)
