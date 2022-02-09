-- Original code comes from walkin_light mod by Echo
-- http://minetest.net/forum/viewtopic.php?id=2621


minetest.register_alias("flashlight:light_off", "air")

minetest.register_tool("flashlight:flashlight", {
	description = "Flashlight",
	inventory_image = "flashlight_flashlight.png",
	stack_max = 1,
})

minetest.register_craft({
	output = "flashlight:flashlight",
	recipe = {
		{"basic_materials:silicon", "basic_materials:silicon", "basic_materials:silicon"},
		{"basic_materials:copper_wire", "morelights:bulb", "basic_materials:silver_wire"},
		{"basic_materials:brass_ingot", "basic_materials:energy_crystal_simple", "basic_materials:brass_ingot"}
	}
})

local player_positions = {}
local was_wielding = {}

local function check_for_flashlight(player)
	if player == nil then
		return false
	end
	local inv = player:get_inventory()
	local hotbar = inv:get_list("main")
	if hotbar ~= nil then
		for i = 1, 32 do
			if hotbar[i] ~= nil then
				if hotbar[i]:get_name() == "flashlight:flashlight" then
					return true
				end
			end
		end
	end
	return false
end

minetest.register_on_joinplayer(function(player)
	local player_name = player:get_player_name()
	local pos = player:get_pos()
	local rounded_pos = vector.round(pos)
	rounded_pos.y = rounded_pos.y + 1
	player_positions[player_name] = rounded_pos
	was_wielding[player_name] = true
end)


minetest.register_on_leaveplayer(function(player)
	local player_name = player:get_player_name()
	local pos = player_positions[player_name]
	local nodename = minetest.get_node(pos).name
	if nodename == "flashlight:light" then
		minetest.remove_node(pos)
	end
	player_positions[player_name] = nil
end)

minetest.register_globalstep(function(dtime)
	for i, player in pairs(minetest.get_connected_players()) do
		local player_name = player:get_player_name()
		local flashlight_weared = check_for_flashlight(player)
		local pos = player:get_pos()
		local rounded_pos = vector.round(pos)
		rounded_pos.y = rounded_pos.y + 1
		local old_pos = player_positions[player_name]
		local player_moved = old_pos and not vector.equals(old_pos, rounded_pos)
		if not old_pos then
			old_pos = rounded_pos
			player_moved = true
		end

		-- Remove light, flashlight weared out or was removed from hotbar
		if was_wielding[player_name] and not flashlight_weared then
			was_wielding[player_name] = false
			local node = minetest.get_node_or_nil(old_pos)
			if node and node.name == "flashlight:light" then
				minetest.remove_node(old_pos)
			end
		elseif (player_moved or not was_wielding[player_name]) and flashlight_weared then
			local node = minetest.get_node_or_nil(rounded_pos)
			if node and node.name == "air" then
				minetest.set_node(rounded_pos, {name="flashlight:light"})
			end
			node = minetest.get_node_or_nil(old_pos)
			if node and node.name == "flashlight:light" then
				minetest.remove_node(old_pos)
			end
			player_positions[player_name] = rounded_pos
			was_wielding[player_name] = true
		end
	end
end)

minetest.register_node("flashlight:light", {
	drawtype = "glasslike",
	tiles = {"flashlight_light.png"},
	paramtype = "light",
	groups = {not_in_creative_inventory = 1},
	drop = "",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	light_source = minetest.LIGHT_MAX,
	pointable = false,
})
