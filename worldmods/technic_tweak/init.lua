-- tweaks for technic
--
-- License: WTFPL
--

--------------------------------------------------------------------------------------
-- tools
--
-- super fast = carbon steel

minetest.register_tool("technic_tweak:pick_carbon_steel", {
	description = "Carbon Steel Pickaxe",
	inventory_image = "techtweak_tool_carbonpick.png",
	tool_capabilities = {
		full_punch_interval = 0.2,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=0.8, [2]=0.4, [3]=0.2}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
})

-- super durable and pretty fast = stainless

minetest.register_tool("technic_tweak:pick_stainless_steel", {
	description = "Stainless Steel Pickaxe",
	inventory_image = "techtweak_tool_stainlesspick.png",
	tool_capabilities = {
		full_punch_interval = 0.3,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=1.0, [2]=0.5, [3]=0.25}, uses=60, maxlevel=3},
		},
		damage_groups = {fleshy=3},
	},
})

-- default iron pick should look a little different

minetest.override_item("default:pick_steel", {inventory_image="techtweak_tool_ironpick.png"})

minetest.register_craft({
	output = 'technic_tweak:pick_carbon_steel',
	recipe = {
		{'technic:carbon_steel_ingot', 'technic:carbon_steel_ingot', 'technic:carbon_steel_ingot'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'technic_tweak:pick_stainless_steel',
	recipe = {
		{'technic:stainless_steel_ingot', 'technic:stainless_steel_ingot', 'technic:stainless_steel_ingot'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

local function set_can_wear(itemstack, level, max_level)
	local temp
	if level == 0 then
		temp = 0
	else
		temp = 65536 - math.floor(level / max_level * 65535)
		if temp > 65535 then temp = 65535 end
		if temp < 1 then temp = 1 end
	end
	itemstack:set_wear(temp)
end


--------------------------------------------------------------------------------------
-- arcane quarry
--
-- the ultimate machine for mining
--
-- requires 90000 EU/s, digs out a 100x100x100 space and stores liquids

-- to take the liquids, put a container in the slot next to the indicated liquid
-- the bucket buttons indicate the amount of each liquid that has been stored
-- and clicking the button purges that liquid from storage

-- to auto-trash a particular item, place an item of that type in the trash slot
-- (note that stone is always auto-trashed regardless of the trash slot)
--
-- the dig area is in front of and below the machine...
-- so, if you place the machine facing north at (0, 0, 0)
-- the hole will go from (-50, 0, 1) to (49, -99, 100)

local function set_quarry_formspec(pos, x, z)
	local meta = minetest.get_meta(pos)
	local water = meta:get_int("water")
	local lava = meta:get_int("lava")
	local row = meta:get_int("row")
	local formspec = "size[8,7]"..
		default.gui_bg ..
		default.gui_bg_img ..
		default.gui_slots ..
		"image_button[0,0;1,1;bucket_water.png;water;" .. tostring(water) .. "]" ..
		"tooltip[water;Purge water]" ..
		"list[context;water;1,0;1,1;]" ..
		"image_button[2,0;1,1;bucket_lava.png;lava;".. tostring(lava) .. "]" ..
		"tooltip[lava;Purge lava]" ..
		"list[context;lava;3,0;1,1;]" ..

		"image[4.06,0.4;0.8,0.8;creative_trash_icon.png]" ..
		"list[context;trash;4,0.3;1,1;]" ..

		"label[0,1;x="..tostring(x)..", y="..tostring(pos.y-row)..
			", z="..tostring(z).."]" ..

		"list[current_player;main;0,2.85;8,1;]" ..
		"list[current_player;main;0,4.08;8,3;8]" ..
		default.get_hotbar_bg(0, 2.85)

	if meta:get_int("enabled") == 0 then
		formspec = formspec.."button[6,0;2,1;enable;".."Enable".."]"
	else
		formspec = formspec.."button[6,0;2,1;disable;".."Disable".."]"
	end
	formspec = formspec.."button[6,1;2,1;restart;".."Restart".."]"
	meta:set_string("formspec", formspec)
end

local function set_quarry_demand(meta)
	local machine_name = "HV Arcane Quarry"
	if meta:get_int("enabled") == 0 then
		meta:set_string("infotext", machine_name .. " Disabled")
		meta:set_int("HV_EU_demand", 0)
	else
		if meta:get_int("HV_EU_input") >= 90000 then
			meta:set_string("infotext", machine_name .. " Active")
		end
		meta:set_int("HV_EU_demand", 90000)
	end
end

local function quarry_receive_fields(pos, formname, fields, sender)
	local meta = minetest.get_meta(pos)
	if fields.enable then meta:set_int("enabled", 1) end
	if fields.disable then meta:set_int("enabled", 0) end
	if fields.water then meta:set_int("water", 0) end
	if fields.lava then meta:set_int("lava", 0) end
	if fields.restart then
		meta:set_int("row", 0)
	end
	set_quarry_formspec(pos, 0, 0)
	set_quarry_demand(meta)
end

local function quarry_area(pos, node)
	local pdir = minetest.facedir_to_dir(node.param2)
	local qdir = pdir.x == 1 and vector.new(0,0,-1) or
		(pdir.z == -1 and vector.new(-1,0,0) or
		(pdir.x == -1 and vector.new(0,0,1) or
		vector.new(1,0,0)))
	local startpos = vector.add(vector.add(vector.add(pos,
		vector.new(0, 0, 0)),
		pdir),
		vector.multiply(qdir, -10))
	local endpos = vector.add(vector.add(vector.add(startpos,
		vector.new(0, -333, 0)),
		vector.multiply(pdir, 10)),
		vector.multiply(qdir, 10))

	return startpos, endpos
end

local function quarry_run(pos, node)
	local meta = minetest.get_meta(pos)
	local water = meta:get_int("water")
	local lava = meta:get_int("lava")
	local inv = meta:get_inventory()
	local x = 0
	local z = 0

	-- fluid transfer is a freebie (no EU involved)

	local ws = inv:get_stack("water", 1)
	if water > 0 and not ws:is_empty() then
		if ws:get_name() == "bucket:bucket_empty" and ws:get_count() == 1 then
			inv:set_stack("water", 1, ItemStack("bucket:bucket_water"))
			water = water - 1
		end
		if ws:get_name() == "technic:water_can" then
			local charge = 0
			if ws:get_metadata() ~= "" then
				charge = tonumber(ws:get_metadata())
			end
			if charge < 16 then
				local a = math.min(water, 16 - charge)
				water = water - a
				charge = charge + a
				ws:set_metadata(tostring(charge))
				set_can_wear(ws, charge, 16)
				inv:set_stack("water", 1, ws)
			end
		end
	end
	local ls = inv:get_stack("lava", 1)
	if lava > 0 and not ls:is_empty() then
		if ls:get_name() == "bucket:bucket_empty" and ls:get_count() == 1 then
			inv:set_stack("lava", 1, ItemStack("bucket:bucket_lava"))
			lava = lava - 1
		end
		if ls:get_name() == "technic:lava_can" then
			local charge = 0
			if ls:get_metadata() ~= "" then
				charge = tonumber(ls:get_metadata())
			end
			if charge < 8 then
				local a = math.min(lava, 8 - charge)
				lava = lava - a
				charge = charge + a
				ls:set_metadata(tostring(charge))
				set_can_wear(ls, charge, 8)
				inv:set_stack("lava", 1, ls)
			end
		end
	end

	-- the mining portion

	if meta:get_int("enabled") and meta:get_int("HV_EU_input") >= 90000 then

		local startpos, endpos = quarry_area(pos, node)

		local row = meta:get_int("row")
		local owner = meta:get_string("owner")
		local ts = inv:get_stack("trash", 1)
		local trash = "air"
		if not ts:is_empty() then trash = ts:get_name() end

		local start2 = { x=startpos.x, y=startpos.y-row, z=startpos.z }
		local end2 = { x=endpos.x, y=startpos.y-row, z=endpos.z }

		local c_air = minetest.get_content_id("air")
		local c_water = minetest.get_content_id("default:water_source")
		local c_water2 = minetest.get_content_id("default:water_flowing")
		local c_lava = minetest.get_content_id("default:lava_source")
		local c_lava2 = minetest.get_content_id("default:lava_flowing")
		local c_stone = minetest.get_content_id("default:stone")

		local vm = VoxelManip()
		local minpos, maxpos = vm:read_from_map(start2, end2)
		local area = VoxelArea:new({MinEdge=minpos, MaxEdge=maxpos})
		local data = vm:get_data()

		local dig = 0
		local upl = false
		local stack = 33
		local block = nil

		z = math.min(start2.z, end2.z)
		local z2 = math.max(start2.z, end2.z)
		while z < z2 and dig == 0 do

		x = math.min(start2.x, end2.x)
		local x2 = math.max(start2.x, end2.x)
		while x < x2 and dig == 0 do

			local rem = false
			local p = {x=x, y=end2.y, z=z}
			local i = area:indexp(p)
			local b = data[i]

			if not minetest.is_protected(p, owner) then
				if b == c_air then
					-- nothing
				elseif b == c_water then
					rem = true
					water = water + 1
					upl = true
				elseif b == c_water2 then
					upl = true
				elseif b == c_lava then
					rem = true
					lava = lava + 1
					upl = true
				elseif b == c_lava2 then
					upl = true
				elseif b == c_stone then	-- vaporize stone
					rem = true
				else
					local n = minetest.get_name_from_content_id(b)
					local d = minetest.registered_nodes[n]
					if d and not d.diggable or (d.can_dig and not d.can_dig(p, nil)) then
						-- nothing
					else
						rem = true
						local drops = minetest.get_node_drops(n, "")
						if #drops > 1 then
							-- more than one drop from a block
							for _, dropped_item in ipairs(drops) do
								if dropped_item ~= trash then
									dig = 1
									technic.tube_inject_item(pos, pos,
										vector.new(0, 1, 0), dropped_item)
								end
							end
						else
							-- just one drop = add to the ongoing stack
							-- if it matches
							local dropped_item = drops[1]
							if dropped_item ~= trash then
								if block then
									if block:get_name() == dropped_item then
										block:add_item(dropped_item)
										if block:get_count() >= stack then dig = 1 end
									else
										rem = false
									end
								else
									block = ItemStack(dropped_item)
								end
							end
						end

						-- todo: evaluate whether this is necessary:

						-- remove meta data
--						local meta = minetest.get_meta(p)
--						meta:from_table()	-- this is undocumented (!)
					end
				end
				if rem then
					data[i] = c_air
				end
			end -- if not protected

		x = x + 1
		end -- while x
		z = z + 1
		end -- while z

		if dig == 0 and not block then row = row + 1 end

		x = x - 1
		z = z - 1

		if block then
			technic.tube_inject_item(pos, pos, vector.new(0, 1, 0), block)
		end

		vm:set_data(data)
		vm:write_to_map(data)
		vm:update_map()
		if upl then vm:update_liquids() end

		meta:set_int("row", row)
		if row >= 333 then meta:set_int("enabled", 0) end
	end -- if enabled

	meta:set_int("water", water)
	meta:set_int("lava", lava)
	set_quarry_formspec(pos, x, z)
	set_quarry_demand(meta)
end

minetest.register_node("technic_tweak:quarry", {
	description = "HV Arcane Quarry",
	tiles = {"default_diamond_block.png", "default_diamond_block.png",
	         "default_diamond_block.png", "default_diamond_block.png",
	         "default_diamond_block.png^default_tool_mesepick.png",
	         "default_diamond_block.png"},
	inventory_image = minetest.inventorycube("default_diamond_block.png",
	         "default_diamond_block.png^default_tool_mesepick.png",
	         "default_diamond_block.png"),
	paramtype2 = "facedir",
	groups = {cracky=2, technic_machine=1, technic_hv=1},
	connect_sides = {"bottom", "front", "left", "right"},
	tube = {
		connect_sides = {top = 1},
	},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", "HV Arcane Quarry")
		meta:set_int("enabled", 0)
		meta:set_int("water", 0)
		meta:set_int("lava", 0)
		meta:set_int("row", 0)
		local inv = meta:get_inventory()
		inv:set_size("water", 1)
		inv:set_size("lava", 1)
		inv:set_size("trash", 1)
		set_quarry_formspec(pos, 0, 0)
		set_quarry_demand(meta)
	end,
	after_place_node = function(pos, placer, itemstack)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", placer:get_player_name())
		pipeworks.scan_for_tube_objects(pos)

		-- todo: make sure this doesn't flake out with a callback
		-- although I can't really do much if this goes awry
		local startpos, endpos = quarry_area(pos, minetest.get_node(pos))
		minetest.emerge_area(startpos, endpos)
	end,
	can_dig = function(pos, player)
		local meta = minetest.get_meta(pos)
		local water = meta:get_int("water")
		local lava = meta:get_int("lava")
		local inv = meta:get_inventory()
		return (inv:is_empty("water") and inv:is_empty("lava") and
			water == 0 and lava == 0)
	end,
	on_rotate = function() return false end,	-- don't screw this
	after_dig_node = pipeworks.scan_for_tube_objects,
	on_receive_fields = quarry_receive_fields,
	technic_run = quarry_run,
})

minetest.register_craft({
	output = "technic_tweak:quarry",
	recipe = {
		{"pipeworks:teleport_tube_1", "technic:quarry",    "pipeworks:teleport_tube_1"},
		{"pipeworks:storage_tank_0",  "technic:quarry",    "pipeworks:storage_tank_0"},
		{"default:diamondblock",      "technic:laser_mk3", "default:diamondblock"},
	}
})

technic.register_machine("HV", "technic_tweak:quarry", technic.receiver)


--------------------------------------------------------------------------------------
-- stone ladder

minetest.register_node("technic_tweak:ladder", {
	description = "Stone Ladder",
	drawtype = "signlike",
	tiles = {"techtweak_ladder.png"},
	inventory_image = "techtweak_ladder.png",
	wield_image = "techtweak_ladder.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {choppy = 2, oddly_breakable_by_hand = 3},
	legacy_wallmounted = true,
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "technic_tweak:ladder 4",
	recipe = {
		{'default:cobble', '', 'default:cobble'},
		{'default:cobble', 'default:cobble', 'default:cobble'},
		{'default:cobble', '', 'default:cobble'},
	}
})

--------------------------------------------------------------------------------------
-- compressed cobble, hard as obsidian

minetest.register_node("technic_tweak:cobble", {
	description = "Compressed Cobble",
	tiles = {"techtweak_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
	on_blast = function() end,
})

if minetest.get_modpath("mesecons_mvps") ~= nil then
	mesecon:register_mvps_stopper("technic_tweak:cobble")
end

technic.register_compressor_recipe(
	{ input = { "default:cobble 99" },
	output = "technic_tweak:cobble" }
)

minetest.register_craft({
	output = "default:cobble 99",
	type = "shapeless",
	recipe = {"technic_tweak:cobble"}
})

--------------------------------------------------------------------------------------
-- clean glass that connects textures (if enabled)

minetest.register_node("technic_tweak:glass", {
	description = "Clear Glass",
	drawtype = "glasslike_framed",
	tiles = {"techtweak_glass.png", "techtweak_glass_detail.png"},
	paramtype = "light",
	sunlight_propagates = true,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults()
})

minetest.register_craft({
	output = "technic_tweak:glass 8",
	recipe = {
		{"default:glass", "default:glass", "default:glass" },
		{"default:glass", "default:paper", "default:glass" },
		{"default:glass", "default:glass", "default:glass" },
	},
})

-- super glow light, for when normal light just won't do

local lightbox = {
	type = "fixed",
	fixed = { -0.4,-0.5,-0.4, 0.4,-0.4,0.4 }
}

minetest.register_node("technic_tweak:light", {
	description = "Super Glow Light",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = { "techtweak_white_frame.png",
		"techtweak_white_frame.png","techtweak_white.png" },
	selection_box = lightbox,
	node_box = lightbox,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	light_source = default.LIGHT_MAX,
	sounds = default.node_sound_glass_defaults(),
	on_place = minetest.rotate_node,
})

minetest.register_craft({
	output = "technic_tweak:light 8",
	recipe = {
		{"default:glass", "default:glass", "default:glass" },
		{"default:glass", "technic:battery", "default:glass" },
		{"default:glass", "default:glass", "default:glass" },
	},
})

--------------------------------------------------------------------------------------
-- I don't often change recipes, but I have been noticing a pattern to Technic
-- we need some alternatives to all the copper- and iron-heavy crafting recipes

-- the Classic Coke version of a machine casing

minetest.register_craft({
	output = "technic:machine_casing",
	recipe = {
		{ "moreores:tin_ingot", "moreores:tin_ingot", "moreores:tin_ingot" },
		{ "moreores:tin_ingot", "technic:mixed_metal_ingot", "moreores:tin_ingot" },
		{ "moreores:tin_ingot", "moreores:tin_ingot", "moreores:tin_ingot" },
	},
})

-- hey, silver coil... because why not?

minetest.register_craftitem("technic_tweak:silver_coil", {
	description = "Silver Coil",
	inventory_image = "techtweak_silver_coil.png",
})

minetest.register_craft({
	output = 'technic_tweak:silver_coil',
	recipe = {
		{'technic:fine_silver_wire', 'technic:carbon_steel_ingot', 'technic:fine_silver_wire'},
		{'technic:carbon_steel_ingot', '', 'technic:carbon_steel_ingot'},
		{'technic:fine_silver_wire', 'technic:carbon_steel_ingot', 'technic:fine_silver_wire'},
	}
})

-- the silver version of a motor

minetest.register_craft({
	output = 'technic:motor',
	recipe = {
		{'technic:carbon_steel_ingot', 'technic_tweak:silver_coil', 'technic:carbon_steel_ingot'},
		{'technic:carbon_steel_ingot', 'technic_tweak:silver_coil', 'technic:carbon_steel_ingot'},
		{'technic:carbon_steel_ingot', 'technic:copper_plate', 'technic:carbon_steel_ingot'},
	}
})

-- the silver version of transformers

minetest.register_craft({
	output = 'technic:lv_transformer',
	recipe = {
		{"technic:carbon_plate",   'moreores:tin_ingot', "technic:composite_plate"},
		{'technic_tweak:silver_coil', 'moreores:tin_ingot', 'technic_tweak:silver_coil'},
		{'moreores:tin_ingot',      'moreores:tin_ingot', 'moreores:tin_ingot'},
	}
})

minetest.register_craft({
	output = 'technic:mv_transformer',
	recipe = {
		{"technic:carbon_plate",   'technic:carbon_steel_ingot', "technic:composite_plate"},
		{'technic_tweak:silver_coil', 'technic:carbon_steel_ingot', 'technic_tweak:silver_coil'},
		{'technic:carbon_steel_ingot', 'technic:carbon_steel_ingot', 'technic:carbon_steel_ingot'},
	}
})

minetest.register_craft({
	output = 'technic:hv_transformer',
	recipe = {
		{"technic:carbon_plate",   'technic:stainless_steel_ingot', "technic:composite_plate"},
		{'technic_tweak:silver_coil', 'technic:stainless_steel_ingot', 'technic_tweak:silver_coil'},
		{'technic:stainless_steel_ingot', 'technic:stainless_steel_ingot', 'technic:stainless_steel_ingot'},
	}
})

-- and make rubber tree saplings useful again

minetest.register_craft({
	output = "mesecons_materials:glue 2",
	type = "cooking",
	recipe = "moretrees:rubber_tree_sapling",
	cooktime = 2
})

--------------------------------------------------------------------------------------
-- advanced supply converter, combines 5 supply converters into 1

-- for when it's just getting silly how much space you waste on
-- wimpy little supply converters that only give 10000 EU/s

local asc_run = function(pos, node)
	local demand = 50000
	local remain = 0.9
	-- Machine information
	local machine_name  = "Advanced Supply Converter"
	local meta          = minetest.get_meta(pos)

	local pos_up        = {x=pos.x, y=pos.y+1, z=pos.z}
	local pos_down      = {x=pos.x, y=pos.y-1, z=pos.z}
	local name_up       = minetest.get_node(pos_up).name
	local name_down     = minetest.get_node(pos_down).name

	local from = technic.get_cable_tier(name_up)
	local to   = technic.get_cable_tier(name_down)

	if from and to then
		local input = meta:get_int(from.."_EU_input")
		meta:set_int(from.."_EU_demand", demand)
		meta:set_int(from.."_EU_supply", 0)
		meta:set_int(to.."_EU_demand", 0)
		meta:set_int(to.."_EU_supply", input * remain)
		meta:set_string("infotext", machine_name.." Active")
	else
		meta:set_string("infotext", machine_name.." Has Bad Cabling")
		if to then
			meta:set_int(to.."_EU_supply", 0)
		end
		if from then
			meta:set_int(from.."_EU_demand", 0)
		end
		return
	end

end

minetest.register_node("technic_tweak:supply_converter", {
	description = "Advanced Supply Converter",
	tiles  = {"technic_supply_converter_tb.png^technic_cable_connection_overlay.png", "technic_supply_converter_tb.png^technic_cable_connection_overlay.png",
	          "techtweak_supply_converter_side.png", "techtweak_supply_converter_side.png",
	          "techtweak_supply_converter_side.png", "techtweak_supply_converter_side.png"},
	groups = {snappy=2, choppy=2, oddly_breakable_by_hand=2, technic_machine=1,
		technic_all_tiers=1},
	sounds = default.node_sound_wood_defaults(),
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", "Advanced Supply Converter")
		meta:set_float("active", 0)
	end,
	technic_run = asc_run,
})

minetest.register_craft({
	output = 'technic_tweak:supply_converter',
	recipe = {
		{'technic:supply_converter', 'technic:supply_converter', 'technic:supply_converter'},
		{'technic:supply_converter', 'technic:hv_transformer',   'technic:supply_converter'},
		{'',						 'technic:hv_cable', ''},
	}
})

for tier, machines in pairs(technic.machines) do
	technic.register_machine(tier, "technic_tweak:supply_converter", technic.producer_receiver)
end

--------------------------------------------------------------------------------------
-- crafted centrifuge array, for when you REALLY want uranium enriched
-- this combines five centrifuges into one glorious monster
--
-- 2 batteries = 30000 EU/s, you have to manually input everything
-- 1 battery = 35000 EU/s, 0 batteries = 40000 EU/s
-- 1 CLU = injector moves dust into one centrifuge at a time
-- 2 CLUs = 25% increase in speed (4s/operation rather than 5s)

minetest.register_craft({
	output = 'technic_tweak:hv_centrifuge',
	recipe = {
		{'technic:mv_centrifuge', 'technic:mv_centrifuge', 'technic:mv_centrifuge'},
		{'technic:mv_centrifuge', 'technic:hv_transformer', 'technic:mv_centrifuge'},
		{'technic:injector', 'technic:hv_cable', 'pipeworks:tube_1'},
	}
})

local cen_formspec =
	"size[10,10]"..
	default.gui_bg ..
	default.gui_bg_img ..
	default.gui_slots ..
	"image[0,0;1,1;technic_mv_centrifuge_front.png]"..
	"list[context;src;1.25,0;5,1;]" ..
	"list[context;dst;0,1.3;10,4;]" ..
	"list[current_player;main;1,5.85;8,1;]" ..
	"list[current_player;main;1,7.08;8,3;8]" ..
	"listring[context;dst]" ..
	"listring[current_player;main]" ..
	"image[7,0;1,1;techtweak_up_arrow.png]" ..
	"list[context;upgrade1;8,0;1,1;]"..
	"list[context;upgrade2;9,0;1,1;]"..
	default.get_hotbar_bg(1, 5.85)

local cen_formspec_active =
	"size[10,10]"..
	default.gui_bg ..
	default.gui_bg_img ..
	default.gui_slots ..
	"image[0,0;1,1;technic_mv_centrifuge_front_active.png]"..
	"list[context;src;1.25,0;5,1;]" ..
	"list[context;dst;0,1.3;10,4;]" ..
	"list[current_player;main;1,5.85;8,1;]" ..
	"list[current_player;main;1,7.08;8,3;8]" ..
	"listring[context;dst]" ..
	"listring[current_player;main]" ..
	"image[7,0;1,1;techtweak_up_arrow.png]" ..
	"list[context;upgrade1;8,0;1,1;]"..
	"list[context;upgrade2;9,0;1,1;]"..
	default.get_hotbar_bg(1, 5.85)

local cen_run = function(pos, node)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local eu_input = meta:get_int("HV_EU_input")
	local demand = 40000
	local mode = 0

	meta:set_string("infotext", "HV Centrifuge Array")

	-- handle upgrades
	local upgrades = { "upgrade1", "upgrade2" }
	for _, u in pairs(upgrades) do
		local s = inv:get_stack(u, 1)
		if s then
			if s:get_name() == "technic:battery" then
				demand = demand - 5000
			elseif s:get_name() == "technic:control_logic_unit" then
				mode = mode + 1
			end
		end
	end

	-- check if machine is on
	local is_on = false
	local activate = false
	if minetest.get_node(pos).name == "technic_tweak:hv_centrifuge_active" then
		is_on = true
	end

	-- get times
	local stime = { 1, 1, 1, 1, 1 }
	for i = 1, 5 do
		local v = meta:get_int("src_time"..i)
		if not v then v = 1 end
		stime[i] = v
	end

	if not eu_input then
		-- setup
		meta:set_int("HV_EU_demand", 0)
		meta:set_int("HV_EU_input", 0)

	else
		-- process
		local rtype = "separating"

		if eu_input >= demand then
			local loops = 5
			if mode == 2 then loops = 30 end
			for i = 1, loops do
				local result = technic.get_recipe(rtype, { inv:get_stack("src", i) })
				if result then
					activate = true

						local output = result.output
						if type(output) ~= "table" then output = { output } end
						for _, o in ipairs(output) do
							local s = ItemStack(o)
							if not inv:room_for_item("dst", s) then
								minetest.add_item({x=pos.x, y=pos.y+1, z=pos.z}, s)
							else
								inv:add_item("dst", s)
							end
						end
						inv:set_stack("src", i, result.new_input[1])
						stime[i] = 1

				end
			end
		end

		-- store times
		for i = 1, 5 do
			 meta:set_int("src_time"..i, stime[i])
		end

		-- load the src slots with dust, if not already filled
		local slots = 0
		for i = 1, 5 do
			if inv:get_stack("src", i):is_empty() then
				if mode > 0 then
					local load = nil
					local j = 1
					while j <= 40 and not load do
						local s = inv:get_stack("dst", j)
						if s:get_count() > 1 then
							if string.match(s:get_name(), ".+uranium.*_dust$") then
								if technic.get_recipe(rtype, { s }) then
									local c = s:get_count()
									if c % 2 == 1 then c = c - 1 end
									load = ItemStack(s:get_name().." "..c)
								end
							end
						end
						j = j + 1
					end
					if load then
						inv:remove_item("dst", load)
						inv:set_stack("src", i, load)
						if mode == 1 then mode = 0 end
						slots = slots + 1
					end
				end
			else
				slots = slots + 1
			end
		end

		-- determine whether we should be active
		meta:set_int("HV_EU_demand", 0)
		meta:set_string("formspec", cen_formspec)
		if slots > 0 then
			meta:set_string("infotext", "HV Centrifuge Array Active")
			meta:set_int("HV_EU_demand", demand)
			meta:set_string("formspec", cen_formspec_active)
		end

	
	end

	-- switch state
	if activate and not is_on then
		technic.swap_node(pos, "technic_tweak:hv_centrifuge_active")
	elseif not activate and is_on then
		technic.swap_node(pos, "technic_tweak:hv_centrifuge")
	end
end

minetest.register_node("technic_tweak:hv_centrifuge", {
		description = "HV Centrifuge Array",
		tiles = { "technic_mv_centrifuge_top.png", "technic_mv_centrifuge_bottom.png",
			"technic_mv_centrifuge_side.png", "technic_mv_centrifuge_side.png",
			"technic_mv_centrifuge_side.png", "techtweak_centrifuge_front.png" },
		paramtype2 = "facedir",
		groups = {cracky=2, technic_machine=1, technic_hv=1},
		legacy_facedir_simple = true,
		sounds = default.node_sound_wood_defaults(),
		on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("formspec", cen_formspec)
			local inv = meta:get_inventory()
			inv:set_size("src", 5)
			inv:set_size("dst", 40)
			inv:set_size("upgrade1", 1)
			inv:set_size("upgrade2", 1)
		end,
		can_dig = technic.machine_can_dig,
		allow_metadata_inventory_put = technic.machine_inventory_put,
		allow_metadata_inventory_take = technic.machine_inventory_take,
		allow_metadata_inventory_move = technic.machine_inventory_move,
		technic_run = cen_run,
})

minetest.register_node("technic_tweak:hv_centrifuge_active", {
		description = "HV Centrifuge Array",
		tiles = { "technic_mv_centrifuge_top.png", "technic_mv_centrifuge_bottom.png",
			"technic_mv_centrifuge_side.png", "technic_mv_centrifuge_side.png",
			"technic_mv_centrifuge_side.png", "techtweak_centrifuge_front_active.png" },
		paramtype2 = "facedir",
		drop = "technic_tweak:hv_centrifuge",
		groups = {cracky=2, technic_machine=1, technic_hv=1,
			not_in_creative_inventory=1},
		legacy_facedir_simple = true,
		sounds = default.node_sound_wood_defaults(),
		can_dig = technic.machine_can_dig,
		allow_metadata_inventory_put = technic.machine_inventory_put,
		allow_metadata_inventory_take = technic.machine_inventory_take,
		allow_metadata_inventory_move = technic.machine_inventory_move,
		technic_run = cen_run,
})

technic.register_machine("HV", "technic_tweak:hv_centrifuge", technic.receiver)
technic.register_machine("HV", "technic_tweak:hv_centrifuge_active", technic.receiver)

--------------------------------------------------------------------------------------
-- double grinder and furnace which I creatively entitled Advanced Furnace
-- four machines in one that auto inject their ore inputs and autocraft blocks

-- TODO (maybe): proper timings

minetest.register_craft({
	output = 'technic_tweak:mv_furnace',
	recipe = {
		{'technic:mv_grinder', 'technic:injector', 'technic:mv_electric_furnace'},
		{'technic:mv_grinder', 'pipeworks:autocrafter', 'technic:mv_electric_furnace'},
		{'pipeworks:tube_1',   'technic:mv_cable', 'pipeworks:tube_1'},
	}
})

local fur_formspec =
	"size[8,10]"..
	default.gui_bg ..
	default.gui_bg_img ..
	default.gui_slots ..
	"image[0,0;1,1;technic_mv_grinder_front.png]"..
	"list[context;src;1.25,0;2,1;]" ..
	"image[4,0;1,1;technic_mv_electric_furnace_front.png]"..
	"list[context;src;5.25,0;2,1;2]" ..
	"list[context;dst;0,1.3;8,4;]" ..
	"list[current_player;main;0,5.85;8,1;]" ..
	"list[current_player;main;0,7.08;8,3;8]" ..
	"listring[context;dst]" ..
	"listring[current_player;main]" ..
	default.get_hotbar_bg(0, 5.85)

local fur_formspec_active =
	"size[8,10]"..
	default.gui_bg ..
	default.gui_bg_img ..
	default.gui_slots ..
	"image[0,0;1,1;technic_mv_grinder_front_active.png]"..
	"list[context;src;1.25,0;2,1;]" ..
	"image[4,0;1,1;technic_mv_electric_furnace_front_active.png]"..
	"list[context;src;5.25,0;2,1;2]" ..
	"list[context;dst;0,1.3;8,4;]" ..
	"list[current_player;main;0,5.85;8,1;]" ..
	"list[current_player;main;0,7.08;8,3;8]" ..
	"listring[context;dst]" ..
	"listring[current_player;main]" ..
	default.get_hotbar_bg(0, 5.85)

local fur_run = function(pos, node)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local eu_input = meta:get_int("MV_EU_input")
	local demand = 3200		-- I like to waste energy, but maybe I could work on this

	meta:set_string("infotext", "MV Advanced Furnace")

	-- check if machine is on
	local is_on = false
	local activate = false
	if minetest.get_node(pos).name == "technic_tweak:mv_furnace_active" then
		is_on = true
	end

	if not eu_input then
		-- setup
		meta:set_int("MV_EU_demand", 0)
		meta:set_int("MV_EU_input", 0)

	else
		local types = { "grinding", "grinding", "cooking", "cooking" }

		-- process
		if eu_input >= demand then
			-- do furnaces first, then grinders
			for i = 4, 1, -1 do
				local c = 0
				while c < 2 do
					local result = technic.get_recipe(types[i], { inv:get_stack("src", i) })
					if result then
						activate = true
					
						local output = result.output
						if type(output) ~= "table" then output = { output } end
						for _, o in ipairs(output) do
							local s = ItemStack(o)
							if not inv:room_for_item("dst", s) then
								minetest.add_item({x=pos.x, y=pos.y+1, z=pos.z}, s)
							else
								inv:add_item("dst", s)
							end
						end
						inv:set_stack("src", i, result.new_input[1])
					end
					c = c + 1					-- furnace gives two results / sec
					if i < 3 then c = c + 1 end -- grinder gives one result / sec
				end
			end
		end

		-- load the src slots with lumps and dust, if not already filled
		local slots = 0
		for i = 1, 4 do
			if inv:get_stack("src", i):is_empty() then
				local load = nil
				local j = 1
				while j <= 32 and not load do
					local s = inv:get_stack("dst", j)
					if not s:is_empty() then
						if i < 3 then
							if string.match(s:get_name(), ".+_lump$") then
								if technic.get_recipe(types[i], { s }) then
									load = s
								end
							end
						else
							if string.match(s:get_name(), ".+_dust$") then
								if s:get_name() ~= "technic:uranium_dust" and
										technic.get_recipe(types[i], { s }) then
									load = s
								end
							end
						end
					end
					j = j + 1
				end
				if load then
					inv:remove_item("dst", load)
					inv:set_stack("src", i, load)
					slots = slots + 1
				end
			else
				slots = slots + 1
			end
		end

		-- determine whether we should be active
		meta:set_int("MV_EU_demand", 0)
		meta:set_string("formspec", fur_formspec)
		if slots > 0 then
			meta:set_string("infotext", "MV Advanced Furnace Active")
			meta:set_int("MV_EU_demand", demand)
			meta:set_string("formspec", fur_formspec_active)
		end

		-- autocraft ingots into blocks
		for j = 1, 32 do
			local s = inv:get_stack("dst", j)
			if not s:is_empty() then
				local m = string.match(s:get_name(), "(.+)_ingot$")
				if m and s:get_count() == 99 then
					local x = m.."_block 11"
					-- default neglects the underscore
					if string.match(m, "default:.+") then x = m.."block 11" end
					local b = ItemStack(x)
					if b:is_known() then
						inv:remove_item("dst", s)
						inv:add_item("dst", b)
					end
				end
			end
		end
		
	end

	-- active state is pretty much just cosmetic
	if activate and not is_on then
		technic.swap_node(pos, "technic_tweak:mv_furnace_active")
	elseif not activate and is_on then
		technic.swap_node(pos, "technic_tweak:mv_furnace")
	end

end

minetest.register_node("technic_tweak:mv_furnace", {
		description = "MV Advanced Furnace",
		tiles = { "technic_mv_electric_furnace_top.png", "technic_mv_electric_furnace_bottom.png",
			"technic_mv_electric_furnace_side.png", "technic_mv_electric_furnace_side.png",
			"technic_mv_electric_furnace_side.png", "techtweak_furnace_front.png" },
		paramtype2 = "facedir",
		groups = {cracky=2, technic_machine=1, technic_mv=1},
		legacy_facedir_simple = true,
		sounds = default.node_sound_wood_defaults(),
		on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("formspec", fur_formspec)
			local inv = meta:get_inventory()
			inv:set_size("src", 4)
			inv:set_size("dst", 32)
		end,
		can_dig = technic.machine_can_dig,
		allow_metadata_inventory_put = technic.machine_inventory_put,
		allow_metadata_inventory_take = technic.machine_inventory_take,
		allow_metadata_inventory_move = technic.machine_inventory_move,
		technic_run = fur_run,
})

minetest.register_node("technic_tweak:mv_furnace_active", {
		description = "MV Advanced Furnace",
		tiles = { "technic_mv_electric_furnace_top.png", "technic_mv_electric_furnace_bottom.png",
			"technic_mv_electric_furnace_side.png", "technic_mv_electric_furnace_side.png",
			"technic_mv_electric_furnace_side.png", "techtweak_furnace_front_active.png" },
		paramtype2 = "facedir",
		drop = "technic_tweak:mv_furnace",
		groups = {cracky=2, technic_machine=1, technic_mv=1, not_in_creative_inventory=1},
		legacy_facedir_simple = true,
		sounds = default.node_sound_wood_defaults(),
		can_dig = technic.machine_can_dig,
		allow_metadata_inventory_put = technic.machine_inventory_put,
		allow_metadata_inventory_take = technic.machine_inventory_take,
		allow_metadata_inventory_move = technic.machine_inventory_move,
		technic_run = fur_run,
})

technic.register_machine("MV", "technic_tweak:mv_furnace", technic.receiver)
technic.register_machine("MV", "technic_tweak:mv_furnace_active", technic.receiver)

--------------------------------------------------------------------------------------
-- crafted replacements for the usual geothermal arrays I always end up making
-- steam power FTW

minetest.register_craft({
	output = 'technic_tweak:mv_geothermal',
	recipe = {
		{'technic:geothermal', 'technic:geothermal', 'technic:geothermal'},
		{'technic:geothermal', 'technic:mv_transformer', 'technic:geothermal'},
		{'',                   'technic:mv_cable', ''},
	}
})

minetest.register_craft( {
	output = "technic_tweak:hv_geothermal",
	recipe = {
		{'technic_tweak:mv_geothermal', 'technic_tweak:mv_geothermal', 'technic_tweak:mv_geothermal'},
		{'technic_tweak:mv_geothermal', 'technic:hv_transformer', 'technic_tweak:mv_geothermal'},
		{'',                   'technic:hv_cable', ''},
	},
})

-- the rest is pretty much just copied from technic

local check_node_around = function(pos)
	local node = minetest.get_node(pos)
	if minetest.get_item_group(node.name, "water") > 0 then return 1 end
	if minetest.get_item_group(node.name, "lava") > 0 then return 2 end
	return 0
end

local geo_run = function(pos, node)
	local meta             = minetest.get_meta(pos)
	local water_nodes      = 0
	local lava_nodes       = 0
	local production_level = 0
	local eu_supply        = 0

	-- assume MV by default
	local supply_name      = "MV_EU_supply"
	local tier_name        = "MV"
	local name_off         = "technic_tweak:mv_geothermal"
	local name_on          = "technic_tweak:mv_geothermal_active"
	local unit_value       = 375	-- 75 * 5 (1500 at full power)

	-- assume machine is inactive
	local is_on            = false

	local n = minetest.get_node(pos).name

	-- check which tier we're using
	if n == "technic_tweak:hv_geothermal" or n == "technic_tweak:hv_geothermal_active" then
		supply_name = "HV_EU_supply"
		tier_name = "HV"
		name_off = "technic_tweak:hv_geothermal"
		name_on = "technic_tweak:hv_geothermal_active"
		unit_value = 1875	-- 75 * 5 * 5 (7500 at full power)
	end

	-- check whether it really is active
	if n == "technic_tweak:mv_geothermal_active" or n == "technic_tweak:hv_geothermal_active" then
		is_on = true
	end

	-- check cardinal positions at and one block below the machine
	local positions = {
		{x=pos.x+1, y=pos.y,   z=pos.z},
		{x=pos.x+1, y=pos.y-1, z=pos.z},
		{x=pos.x-1, y=pos.y,   z=pos.z},
		{x=pos.x-1, y=pos.y-1, z=pos.z},
		{x=pos.x,   y=pos.y,   z=pos.z+1},
		{x=pos.x,   y=pos.y-1, z=pos.z+1},
		{x=pos.x,   y=pos.y,   z=pos.z-1},
		{x=pos.x,   y=pos.y-1, z=pos.z-1},
	}
	for _, p in pairs(positions) do
		local check = check_node_around(p)
		if check == 1 then water_nodes = water_nodes + 1 end
		if check == 2 then lava_nodes  = lava_nodes  + 1 end
	end

	-- no lava or no water = no steam = no power
	if lava_nodes == 0 or water_nodes == 0 then
		lava_nodes = 0
		water_nodes = 0
	end

	-- and thus, this is nice and simple
	eu_supply = (water_nodes + lava_nodes) * unit_value
	production_level = (water_nodes + lava_nodes) * 25

	meta:set_int(supply_name, eu_supply)
	meta:set_string("infotext",
		"Geothermal "..tier_name.." Array".." ("..production_level.."%)")

	-- check for and deploy change state
	if production_level > 0 and not is_on then
		technic.swap_node(pos, name_on)
	elseif production_level == 0 and is_on then
		technic.swap_node(pos, name_off)
	end
end

minetest.register_node("technic_tweak:mv_geothermal", {
	description = "Geothermal MV Array",
	tiles = {"technic_geothermal_top.png", "technic_machine_bottom.png", "techtweak_mvgeo_side.png",
	         "techtweak_mvgeo_side.png", "techtweak_mvgeo_side.png", "techtweak_mvgeo_side.png"},
	paramtype2 = "facedir",
	groups = {snappy=2, choppy=2, oddly_breakable_by_hand=2, technic_machine=1, technic_mv=1},
	legacy_facedir_simple = true,
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", "Geothermal MV Array")
		meta:set_int("MV_EU_supply", 0)
	end,
	technic_run = geo_run,
})

minetest.register_node("technic_tweak:mv_geothermal_active", {
	description = "Geothermal MV Array",
	tiles = {"technic_geothermal_top_active.png", "technic_machine_bottom.png", "techtweak_mvgeo_side.png",
	         "techtweak_mvgeo_side.png", "techtweak_mvgeo_side.png", "techtweak_mvgeo_side.png"},
	paramtype2 = "facedir",
	groups = {snappy=2, choppy=2, oddly_breakable_by_hand=2, technic_machine=1, technic_mv=1,
		not_in_creative_inventory=1},
	legacy_facedir_simple = true,
	sounds = default.node_sound_wood_defaults(),
	drop = "technic_tweak:mv_geothermal",
	technic_run = geo_run,
})

minetest.register_node("technic_tweak:hv_geothermal", {
	description = "Geothermal HV Array",
	tiles = {"technic_geothermal_top.png", "technic_machine_bottom.png", "techtweak_hvgeo_side.png",
	         "techtweak_hvgeo_side.png", "techtweak_hvgeo_side.png", "techtweak_hvgeo_side.png"},
	paramtype2 = "facedir",
	groups = {snappy=2, choppy=2, oddly_breakable_by_hand=2, technic_machine=1, technic_hv=1},
	legacy_facedir_simple = true,
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", "Geothermal HV Array")
		meta:set_int("HV_EU_supply", 0)
	end,
	technic_run = geo_run,
})

minetest.register_node("technic_tweak:hv_geothermal_active", {
	description = "Geothermal HV Array",
	tiles = {"technic_geothermal_top_active.png", "technic_machine_bottom.png", "techtweak_hvgeo_side.png",
	         "techtweak_hvgeo_side.png", "techtweak_hvgeo_side.png", "techtweak_hvgeo_side.png"},
	paramtype2 = "facedir",
	groups = {snappy=2, choppy=2, oddly_breakable_by_hand=2, technic_machine=1, technic_hv=1,
		not_in_creative_inventory=1},
	legacy_facedir_simple = true,
	sounds = default.node_sound_wood_defaults(),
	drop = "technic_tweak:hv_geothermal",
	technic_run = geo_run,
})

technic.register_machine("MV", "technic_tweak:mv_geothermal",        technic.producer)
technic.register_machine("MV", "technic_tweak:mv_geothermal_active", technic.producer)
technic.register_machine("HV", "technic_tweak:hv_geothermal",        technic.producer)
technic.register_machine("HV", "technic_tweak:hv_geothermal_active", technic.producer)
