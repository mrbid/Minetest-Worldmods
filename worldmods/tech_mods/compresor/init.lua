local default_path = minetest.get_modpath("compresor")
dofile(default_path.."/furnace.lua")

function get_compresor_inactivo_formspec()
	return "size[8,8.5]"..
		default.gui_bg..
		default.gui_bg_img..
		default.gui_slots..
		"image[1,2.5;1,1;compresor_bslot.png]"..
		"image[3.5,2.5;1,1;compresor_plates.png]"..
		"image[3.5,0.5;1,1;compresor_plates.png^[transformR180]"..
		"image[2.5,1.5;1,1;compresor_plates.png^[transformR270]"..
		"image[4.5,1.5;1,1;compresor_plates.png^[transformR90]"..
		"list[context;a_comprimir;3.5,1.5;1,1;]"..
		"list[context;batery_slot;1,2.5;1,1;]"..
		"list[current_player;main;0,4.25;8,1;]"..
		"list[current_player;main;0,5.5;8,3;8]"..
		"listring[current_player;main]"..
		"listring[context;a_comprimir]"..
		"listring[context;batery_slot]"..
		"listring[current_player;main]"..
		"listring[current_player;main]"..
		default.get_hotbar_bg(0, 4.25)
end

function get_compresor_activo_formspec()
	return "size[8,8.5]"..
		default.gui_bg..
		default.gui_bg_img..
		default.gui_slots..
		"image[2.5,1.5;3,1;compresor_working.png]"..
		"list[current_player;main;0,4.25;8,1;]"..
		"list[current_player;main;0,5.5;8,3;8]"..
		"listring[current_player;main]"..
		"listring[current_player;main]"..
		"listring[current_player;main]"..
		default.get_hotbar_bg(0, 4.25)
end

local function swap_node(pos, name)
	local node = minetest.get_node(pos)
	if node.name == name then
		return
	end
	node.name = name
	minetest.swap_node(pos, node)
end

minetest.register_craftitem("compresor:tf_pattern", {
	description = "Triforce pattern to decorate sandstone.",
	inventory_image = "compresor_tf_pattern.png"
})

minetest.register_craftitem("compresor:blocky_pattern", {
	description = "Blocky pattern to decorate desert stone blocks.",
	inventory_image = "compresor_blocky_pattern.png"
})

minetest.register_craftitem("compresor:q_pattern", {
	description = "? pattern to decorate desert sandstone blocks.",
	inventory_image = "compresor_q_pattern.png"
})

minetest.register_craftitem("compresor:pilar_pattern", {
	description = "Pilar pattern to decorate silver sandstone.",
	inventory_image = "compresor_pilar_pattern.png"
})

minetest.register_craftitem("compresor:circle_pattern", {
	description = "Circle pattern to decorate stone blocks.",
	inventory_image = "compresor_circle_pattern.png"
})

minetest.register_craftitem("compresor:pressure_plates", {
	description = "Pressure plate, part of the compressor",
	inventory_image = "compresor_plates.png"
})

minetest.register_craftitem("compresor:steel_plate", {
	description = "Compressed steel plate",
	inventory_image = "compresor_steel_plate.png"
})

minetest.register_craftitem("compresor:steel_stick", {
	description = "Compressed steel stick",
	inventory_image = "compresor_steel_stick.png"
})

minetest.register_craftitem("compresor:AAA_Batery", {
	description = "AAA Batery",
	inventory_image = "compresor_aaa_batery.png",
	groups = {batery = 1},
})

minetest.register_node("compresor:inactivo", {
	description = "Electric compressor",
	tiles = {
		"compresor_side.png", "compresor_side.png",
		"compresor_side.png", "compresor_side.png",
		"compresor_side.png", "compresor_inactive.png"
	},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
	groups = {cracky=2},
	can_dig = function(pos, player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("a_comprimir") and inv:is_empty("batery_slot")
	end,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_compresor_inactivo_formspec())
		local inv = meta:get_inventory()
		inv:set_size("a_comprimir", 1)
		inv:set_size("batery_slot", 1)
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local cmplist = inv:get_list("a_comprimir")
		local btrlist = inv:get_list("batery_slot")
		if listname == "a_comprimir" then
			if cmplist[1]:get_name() ~= "" then
				return 0
			else
				return 1
			end
		end
		if listname == "batery_slot" then
			if btrlist[1]:get_name() == "compresor:AAA_Batery" then
				return 0
			else
				if stack:get_name() == "compresor:AAA_Batery" then
					return 1
				else
					return 0
				end

			end
		end
	end,
	drop = "compresor:inactivo",
	on_punch = function(pos, node, player, pointed_thing)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local cmplist = inv:get_list("a_comprimir")
		local btrlist = inv:get_list("batery_slot")
		if (cmplist[1]:get_name() == "default:coalblock" or cmplist[1]:get_name() == "default:steelblock") and btrlist[1]:get_name() == "compresor:AAA_Batery" then
			local meta = minetest.get_meta(pos)
			meta:set_string("formspec", get_compresor_activo_formspec())
			local inv = meta:get_inventory()
			inv:set_size("a_comprimir", 1)
			inv:set_size("batery_slot", 1)
			minetest.get_node_timer(pos):start(300)
			swap_node(pos, "compresor:activo")
		end
	end,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("compresor:activo", {
	description = "Electric compressor",
	tiles = {
		"compresor_side.png", "compresor_side.png",
		"compresor_side.png", "compresor_side.png",
		"compresor_side.png", "compresor_active.png"
	},
	paramtype2 = "facedir",
	light_source = 4,
	legacy_facedir_simple = true,
	groups = {cracky=2, not_in_creative_inventory=1},
	diggable = false,
	on_timer = function(pos, elapsed)
--	instercambiar el carbon por el diamante
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local cmplist = inv:get_list("a_comprimir")
		local btrlist = inv:get_list("batery_slot")
		if cmplist[1]:get_name() == "default:coalblock" then
			cmplist[1]:clear()
			btrlist[1]:clear()
			inv:set_stack("batery_slot", 1, btrlist[1])
			inv:set_stack("a_comprimir", 1, cmplist[1])
			cmplist[1]:add_item("a_comprimir", "default:diamond")
			inv:set_stack("a_comprimir", 1, cmplist[1])
		end
		if cmplist[1]:get_name() == "default:steelblock" then
			cmplist[1]:clear()
			btrlist[1]:clear()
			inv:set_stack("batery_slot", 1, btrlist[1])
			inv:set_stack("a_comprimir", 1, cmplist[1])
			cmplist[1]:add_item("a_comprimir", "compresor:steel_plate")
			inv:set_stack("a_comprimir", 1, cmplist[1])
		end
--	volver al formspec inactivo
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_compresor_inactivo_formspec())
		local inv = meta:get_inventory()
		inv:set_size("a_comprimir", 1)
		inv:set_size("batery_slot", 1)
--	volver al nodo inactivo
		swap_node(pos, "compresor:inactivo")
	end,
	sounds = default.node_sound_stone_defaults(),
})

--	recipes

minetest.register_craft({
	output = "compresor:inactivo",
	recipe = {
		{"group:stone","compresor:pressure_plates","group:stone"},
		{"compresor:pressure_plates","default:steel_ingot","compresor:pressure_plates"},
		{"group:stone","compresor:pressure_plates","group:stone"}
	},
})

minetest.register_craft({
	output = "compresor:pressure_plates",
	recipe = {
		{"default:obsidian","default:obsidian","default:obsidian"},
		{"","default:steel_ingot",""},
		{"","default:steel_ingot",""}
	},
})

minetest.register_craft({
	output = "compresor:AAA_Batery",
	recipe = {
		{"default:bronze_ingot"},
		{"default:gold_ingot"}
	},
})

minetest.register_craft({
	output = "compresor:steel_stick 3",
	recipe = {
		{"compresor:steel_plate"},
		{"compresor:steel_plate"},
		{"compresor:steel_plate"}
	},
})

minetest.register_craft({
	output = "compresor:tf_pattern",
	recipe = {
		{"compresor:steel_plate","compresor:steel_plate","compresor:steel_plate"},
		{"compresor:steel_stick","compresor:steel_stick","compresor:steel_stick"},
		{"compresor:steel_plate","compresor:steel_stick","compresor:steel_plate"}
	},
})

minetest.register_craft({
	output = "compresor:blocky_pattern",
	recipe = {
		{"compresor:steel_plate","compresor:steel_plate","compresor:steel_stick"},
		{"compresor:steel_plate","compresor:steel_plate","compresor:steel_stick"},
		{"compresor:steel_stick","compresor:steel_stick","compresor:steel_stick"}
	},
})

minetest.register_craft({
	output = "compresor:q_pattern",
	recipe = {
		{"compresor:steel_plate","compresor:steel_stick","compresor:steel_stick"},
		{"compresor:steel_plate","compresor:steel_plate","compresor:steel_stick"},
		{"compresor:steel_plate","compresor:steel_stick","compresor:steel_plate"}
	},
})

minetest.register_craft({
	output = "compresor:circle_pattern",
	recipe = {
		{"compresor:steel_stick","compresor:steel_stick","compresor:steel_stick"},
		{"compresor:steel_stick","compresor:steel_plate","compresor:steel_stick"},
		{"compresor:steel_stick","compresor:steel_stick","compresor:steel_stick"}
	},
})

minetest.register_craft({
	output = "compresor:pilar_pattern",
	recipe = {
		{"compresor:steel_stick","compresor:steel_plate","compresor:steel_stick"},
		{"compresor:steel_stick","compresor:steel_plate","compresor:steel_stick"},
		{"compresor:steel_stick","compresor:steel_plate","compresor:steel_stick"}
	},
})

minetest.register_craft({
	output = "compresor:tf_stone 8",
	recipe = {
		{"default:sandstone","default:sandstone","default:sandstone"},
		{"default:sandstone","compresor:tf_pattern","default:sandstone"},
		{"default:sandstone","default:sandstone","default:sandstone"}
	},
	replacements = {
		{"compresor:compresor:tf_pattern", "compresor:compresor:tf_pattern"},
	}
})

minetest.register_craft({
	output = "compresor:blocky_desert_stone 8",
	recipe = {
		{"default:desert_stone_block","default:desert_stone_block","default:desert_stone_block"},
		{"default:desert_stone_block","compresor:blocky_pattern","default:desert_stone_block"},
		{"default:desert_stone_block","default:desert_stone_block","default:desert_stone_block"}
	},
	replacements = {
		{"compresor:compresor:blocky_pattern", "compresor:compresor:blocky_pattern"},
	}
})

minetest.register_craft({
	output = "compresor:circle_stone 8",
	recipe = {
		{"default:stone","default:stone","default:stone"},
		{"default:stone","compresor:circle_pattern","default:stone"},
		{"default:stone","default:stone","default:stone"}
	},
	replacements = {
		{"compresor:circle_pattern", "compresor:circle_pattern"},
	}
})

minetest.register_craft({
	output = "compresor:pilar_stone 8",
	recipe = {
		{"default:silver_sandstone","default:silver_sandstone","default:silver_sandstone"},
		{"default:silver_sandstone","compresor:pilar_pattern","default:silver_sandstone"},
		{"default:silver_sandstone","default:silver_sandstone","default:silver_sandstone"}
	},
	replacements = {
		{"compresor:pilar_pattern", "compresor:pilar_pattern"},
	}
})

minetest.register_craft({
	output = "compresor:q_sandstone 8",
	recipe = {
		{"default:desert_sandstone_block","default:desert_sandstone_block","default:desert_sandstone_block"},
		{"default:desert_sandstone_block","compresor:q_pattern","default:desert_sandstone_block"},
		{"default:desert_sandstone_block","default:desert_sandstone_block","default:desert_sandstone_block"}
	},
	replacements = {
		{"compresor:q_pattern", "compresor:q_pattern"},
	}
})


--	decoration blocks

minetest.register_node("compresor:circle_stone", {
	description = "Circle decorated stone",
	tiles = {"compresor_circle_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = "default:cobble",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("compresor:pilar_stone", {
	description = "Pilar stone",
	tiles = {"default_silver_sandstone.png", "default_silver_sandstone.png", "compresor_pilar_svstone.png"},
	paramtype2 = "facedir",
	groups = {cracky = 3, stone = 1},
	drop = "default:silver_sandstone",
	sounds = default.node_sound_stone_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("compresor:q_sandstone", {
	description = "? decorated stone",
	tiles = {"compresor_q_dsandstone.png"},
	groups = {cracky = 3, stone = 1},
	drop = "default:desert_sandstone_block",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("compresor:blocky_desert_stone", {
	description = "Block decorated stone",
	tiles = {"compresor_blocky_desert_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = "default:desert_stone_block",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("compresor:tf_stone", {
	description = "Triforce decorated stone",
	tiles = {"compresor_tf_sandstone.png"},
	groups = {cracky = 3, stone = 1},
	drop = "default:cobble",
	sounds = default.node_sound_stone_defaults(),
})
