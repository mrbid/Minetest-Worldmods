minetest.register_node("xblox:ocean_cobble", {
	description = "Ocean Cobble",
	tile_images = {"xblox_ocean_cobble.png"},
	groups = {cracky=3},
})

minetest.register_craft({
	output = '"xblox:ocean_cobble" 4',
	recipe = {
		{'', 'default:cobble', '', },
		{'default:cobble', 'bucket:bucket_water', 'default:cobble', },
		{'', 'default:cobble', '', },
		},
	replacements = {{ "bucket:bucket_water", "bucket:bucket_empty"}}
})

minetest.register_node("xblox:ocean_stone", {
	description = "Ocean Stone",
	tile_images = {"xblox_ocean_stone.png"},
	groups = {cracky=3},
	drop= "xblox:ocean_cobble",
})

minetest.register_craft({
	output = '"xblox:ocean_stone" 4',
	recipe = {
		{'', 'default:stone', '', },
		{'default:stone', 'bucket:bucket_water', 'default:stone', },
		{'', 'default:stone', '', },
		},
	replacements = {{ "bucket:bucket_water", "bucket:bucket_empty"}}
})

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "xblox:ocean_stone",
		wherein         = {"default:sand"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_min           = -15,
		y_max           = 0,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = -316,
			octaves = 1,
			persist = 0.0
		},
	})

minetest.register_node("xblox:ocean_carved", {
	description = "Carved Ocean Stone",
	tile_images = {"xblox_ocean_carved.png"},
	groups = {cracky=2},
})

minetest.register_craft({
	output = '"xblox:ocean_carved" 4',
	recipe = {
		{'xblox:ocean_stone', 'xblox:ocean_stone',},
		{'xblox:ocean_stone', 'xblox:ocean_stone',},
		},
})

minetest.register_node("xblox:ocean_brick", {
	description = "Ocean Brick",
	tile_images = {"xblox_ocean_brick.png"},
	groups = {cracky=3},
})
minetest.register_craft({
	output = '"xblox:ocean_brick" 4',
	recipe = {
		{'xblox:ocean_cobble', 'xblox:ocean_cobble',},
		{'xblox:ocean_cobble', 'xblox:ocean_cobble',},
		},
})

minetest.register_node("xblox:compacted_obsidian", {
	description = "Compacted Obsidian",
	tile_images = {"xblox_compacted_obsidian.png"},
	groups = {cracky=1},
})
minetest.register_craft({
	output = '"xblox:compacted_obsidian" 4',
	recipe = {
		{'', 'default:obsidian', '', },
		{'default:obsidian', 'default:cobble', 'default:obsidian', },
		{'', 'default:obsidian', '', },
		},
})

minetest.register_node("xblox:plaster", {
	description = "Plaster",
	tile_images = {"xblox_plaster.png"},
	groups = {cracky=3},
})
minetest.register_craft({
	output = '"xblox:plaster" 2',
	recipe = {
		{'', '', '', },
		{'default:clay_lump', 'default:aspen_wood', 'dye:white', },
		{'', '', '', },
		}
})

minetest.register_node("xblox:plaster2", {
	description = "Red Plaster",
	tile_images = {"xblox_plaster2.png"},
	groups = {cracky=3},
})
minetest.register_craft({
	output = '"xblox:plaster2" 2',
	recipe = {
		{'', '', '', },
		{'default:clay_lump', 'default:aspen_wood', 'dye:red', },
		{'', '', '', },
		}
})

minetest.register_node("xblox:plaster3", {
	description = "Green Plaster",
	tile_images = {"xblox_plaster3.png"},
	groups = {cracky=3},
})
minetest.register_craft({
	output = '"xblox:plaster3" 2',
	recipe = {
		{'', '', '', },
		{'default:clay_lump', 'default:aspen_wood', 'dye:green', },
		{'', '', '', },
		}
})

minetest.register_node("xblox:sea_lantern", {
    description = "Sea Lantern",
    drawtype = "glasslike",
	light_source = 30,
    tiles = {"xblox_lantern.png"},
    paramtype = "light",
    is_ground_content = true,
    sunlight_propagates = true,
    sounds = default.node_sound_glass_defaults(),
    groups = {cracky=3,oddly_breakable_by_hand=3},
})

minetest.register_craft({
	output = '"xblox:sea_lantern" 4',
	recipe = {
		{'default:torch', 'default:glass', 'default:torch', },
		{'default:glass', 'bucket:bucket_water', 'default:glass', },
		{'default:torch', 'default:glass', 'default:torch', },
		},
		replacements = {{ "bucket:bucket_water", "bucket:bucket_empty"}}
})

minetest.register_node("xblox:glass", {
    description = "Ocean Glass",
    drawtype = "glasslike_framed",

    tiles = {"xblox_glass_2.png", "xblox_glass_detail.png"},
    inventory_image = minetest.inventorycube("xblox_glass_2.png"),

    paramtype = "light",
    sunlight_propagates = true, 
    is_ground_content = false,

    groups = {cracky = 3, oddly_breakable_by_hand = 3},
    sounds = default.node_sound_glass_defaults()
})

minetest.register_craft({
	output = '"xblox:glass" 4',
	recipe = {
		{'', 'default:glass', '', },
		{'default:glass', 'bucket:bucket_water', 'default:glass', },
		{'', 'default:glass', '', },
		},
		replacements = {{ "bucket:bucket_water", "bucket:bucket_empty"}}
})

minetest.register_node("xblox:sand_cobble", {
	description = "Sandy Cobblestone",
	tile_images = {"xblox_sandcobble.png"},
	groups = {cracky=1},
})

minetest.register_craft({
	output = '"xblox:sand_cobble" 4',
	recipe = {
		{'default:sandstone', 'default:cobble', '', },
		{'default:cobble', 'default:sandstone', '', },
		{'', '', '', },
		}
})

minetest.register_node("xblox:dirt", {
	description = "Ground",
	tile_images = {"xblox_dirt.png"},
	groups = {cracky=1},
})

minetest.register_craft({
	output = '"xblox:dirt" 4',
	recipe = {
		{'default:dirt', 'default:cobble', '', },
		{'default:cobble', 'default:dirt', '', },
		{'', '', '', },
		}
})

minetest.register_node("xblox:brick", {
	description = "Brick",
	tile_images = {"xblox_brick.png"},
	groups = {cracky=1},
})

minetest.register_craft({
	output = '"xblox:brick" 4',
	recipe = {
		{'xblox:dirt', 'xblox:dirt', '', },
		{'xblox:dirt', 'xblox:dirt', '', },
		{'', '', '', },
		}
})

minetest.register_node("xblox:castle_stone", {
	description = "Castle Brick",
	tile_images = {"xblox_castle_stone.png"},
	groups = {cracky=1},
})

minetest.register_craft({
	output = '"xblox:castle_stone" 4',
	recipe = {
		{'default:brick', 'default:cobble', '', },
		{'default:cobble', 'default:brick', '', },
		{'', '', '', },
		}
})
