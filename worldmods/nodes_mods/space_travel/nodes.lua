--Nodes

--Space lava (lava in space that is immune to vacuum)
minetest.register_node("space_travel:space_lava_source", {
	description = "Space Lava Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "default_lava_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
		},
	},
	special_tiles = {
		-- New-style lava source material (mostly unused)
		{
			name = "default_lava_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
			backface_culling = false,
		},
	},
	paramtype = "light",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "space_travel:space_lava_flowing",
	liquid_alternative_source = "space_travel:space_lava_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 4 * 2,
	post_effect_color = {a = 191, r = 255, g = 64, b = 0},
	groups = {lava = 3, liquid = 2, igniter = 1},
})

minetest.register_node("space_travel:space_lava_flowing", {
	description = "Flowing Space Lava",
	drawtype = "flowingliquid",
	tiles = {"default_lava.png"},
	special_tiles = {
		{
			name = "default_lava_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
		{
			name = "default_lava_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
	},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "space_travel:space_lava_flowing",
	liquid_alternative_source = "space_travel:space_lava_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 4 * 2,
	post_effect_color = {a = 191, r = 255, g = 64, b = 0},
	groups = {lava = 3, liquid = 2, igniter = 1,
		not_in_creative_inventory = 1},
})

bucket.register_liquid(
	"space_travel:space_lava_source",
	"space_travel:space_lava_flowing",
	"space_travel:bucket_space_lava",
	"bucket_lava.png",
	"Space Lava Bucket"
)

minetest.register_craft({
	type = "fuel",
	recipe = "space_travel:bucket_space_lava",
	burntime = 60,
	replacements = {{"space_travel:bucket_space_lava", "bucket:bucket_empty"}},
})

--Cryolava
minetest.register_node("space_travel:cryolava_source", {
	description = "Cryolava Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "space_travel_cryolava_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
		},
	},
	special_tiles = {
		-- New-style lava source material (mostly unused)
		{
			name = "space_travel_cryolava_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
			backface_culling = false,
		},
	},
	paramtype = "light",
	--light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "space_travel:cryolava_flowing",
	liquid_alternative_source = "space_travel:cryolava_source",
	liquid_viscosity = 2, --7,
	liquid_renewable = false,
	damage_per_second = 2 * 2, --4 * 2,
	post_effect_color = {a = 191, r = 188, g = 246, b = 255},
	groups = {liquid = 2, puts_out_fire = 1, cools_lava = 1},
})

minetest.register_node("space_travel:cryolava_flowing", {
	description = "Flowing Cryolava",
	drawtype = "flowingliquid",
	tiles = {"space_travel_cryolava.png"},
	special_tiles = {
		{
			name = "space_travel_cryolava_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
		{
			name = "space_travel_cryolava_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
	},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	--light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "space_travel:cryolava_flowing",
	liquid_alternative_source = "space_travel:cryolava_source",
	liquid_viscosity = 2, --7,
	liquid_renewable = false,
	damage_per_second = 2 * 2, --4 * 2,
	post_effect_color = {a = 191, r = 188, g = 246, b = 255},
	groups = {liquid = 2, not_in_creative_inventory = 1, puts_out_fire = 1, cools_lava = 1},
})

bucket.register_liquid(
	"space_travel:cryolava_source",
	"space_travel:cryolava_flowing",
	"space_travel:bucket_cryolava",
	"space_travel_bucket_cryolava.png",
	"Cryolava Bucket"
)

--Europa Water
minetest.register_node("space_travel:europa_water_source", {
	description = "Europa Water Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "default_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{
			name = "default_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "space_travel:europa_water_flowing",
	liquid_alternative_source = "space_travel:europa_water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {liquid = 3, puts_out_fire = 1, cools_lava = 1}, --removed "water = 3, "
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("space_travel:europa_water_flowing", {
	description = "Flowing Europa Water",
	drawtype = "flowingliquid",
	tiles = {"default_water.png"},
	special_tiles = {
		{
			name = "default_water_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "default_water_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "space_travel:europa_water_flowing",
	liquid_alternative_source = "space_travel:europa_water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {liquid = 3, puts_out_fire = 1, --removed "water = 3,"
		not_in_creative_inventory = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

bucket.register_liquid(
	"space_travel:europa_water_source",
	"space_travel:europa_water_flowing",
	"space_travel:bucket_europa_water",
	"bucket_water.png",
	"Europa Water Bucket",
	{water_bucket = 1}
)

--Does not work: override vacuum texture
--minetest.override_item("vacuum:vacuum", {tiles = {"space_travel_new_vacuum.png"}})

--Generic space blocks
minetest.register_node("space_travel:space_stone", {
	description = "Space Stone",
	tiles = {"space_travel_space_stone.png"},
	is_ground_content = false,
	drop = 'space_travel:space_cobble',
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"space_stone",
	"space_travel:space_stone",
	{cracky = 3},
	{"space_travel_space_stone.png"},
	"Space Stone Stair",
	"Space Stone Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:space_cobble", {
	description = "Space Cobblestone",
	tiles = {"space_travel_space_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"space_cobble",
	"space_travel:space_cobble",
	{cracky = 3},
	{"space_travel_space_cobble.png"},
	"Space Cobblestone Stair",
	"Space Cobblestone Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:space_gravel", {
	description = "Space Gravel",
	tiles = {"space_travel_space_gravel.png"},
	is_ground_content = false,
	groups = {crumbly = 2},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_gravel_footstep", gain = 0.2},
	}),
})

minetest.register_node("space_travel:space_stonebrick", {
	description = "Space Stone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"space_travel_space_stone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"space_stonebrick",
	"space_travel:space_stonebrick",
	{cracky = 2},
	{"space_travel_space_stone_brick.png"},
	"Space Stone Brick Stair",
	"Space Stone Brick Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:space_stone_block", {
	description = "Space Stone Block",
	tiles = {"space_travel_space_stone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"space_stone_block",
	"space_travel:space_stone_block",
	{cracky = 2},
	{"space_travel_space_stone_block.png"},
	"Space Stone Block Stair",
	"Space Stone Block Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:space_dust", {
	description = "Space Dust",
	tiles = {"space_travel_space_dust.png"},
	is_ground_content = false,
	groups = {crumbly = 3},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_gravel_footstep", gain = 0.1},
	}),
})

minetest.register_node("space_travel:tholins", {
	description = "Tholins",
	tiles = {"space_travel_tholins.png"},
	is_ground_content = false,
	groups = {crumbly = 3},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_gravel_footstep", gain = 0.1},
	}),
})

minetest.register_node("space_travel:space_cryovolcano", {
	description = "Space Cryovolcano",
	tiles = {"space_travel_space_dust.png^space_travel_geyser_hole.png", "space_travel_space_cobble.png^space_travel_geyser_hole.png", "space_travel_space_dust.png", "space_travel_space_dust.png", "space_travel_space_dust.png"},
	is_ground_content = false,
	groups = {crumbly = 3, geyser = 1}, --, not_in_creative_inventory = 1
	drop = "space_travel:space_dust",
	sounds = default.node_sound_sand_defaults(),
	walkable = false,
	paramtype = "light",
	sunlight_propagates = true,
	--light_source = 15,
})

minetest.register_node("space_travel:europa_water_geyser", {
	description = "Europa Water Geyser",
	tiles = {"space_travel_space_dust.png^space_travel_geyser_hole.png", "space_travel_space_cobble.png^space_travel_geyser_hole.png", "space_travel_space_dust.png", "space_travel_space_dust.png", "space_travel_space_dust.png"},
	is_ground_content = false,
	groups = {crumbly = 3, geyser = 1}, --, not_in_creative_inventory = 1
	drop = "space_travel:space_dust",
	sounds = default.node_sound_sand_defaults(),
	walkable = false,
	paramtype = "light",
	sunlight_propagates = true,
	--light_source = 15,
})

minetest.register_node("space_travel:space_stone_iron_ore", {
	description = "Space Iron Ore",
	tiles = {"space_travel_space_stone.png^default_mineral_iron.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:iron_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:space_stone_copper_ore", {
	description = "Space Copper Ore",
	tiles = {"space_travel_space_stone.png^default_mineral_copper.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:copper_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:space_stone_tin_ore", {
	description = "Space Tin Ore",
	tiles = {"space_travel_space_stone.png^default_mineral_tin.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:tin_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:space_stone_gold_ore", {
	description = "Space Gold Ore",
	tiles = {"space_travel_space_stone.png^default_mineral_gold.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:gold_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:space_stone_diamond_ore", {
	description = "Space Diamond Ore",
	tiles = {"space_travel_space_stone.png^default_mineral_diamond.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	drop = "default:diamond",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:space_stone_mese_ore", {
	description = "Space Mese Ore",
	tiles = {"space_travel_space_stone.png^default_mineral_mese.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	drop = "default:mese_crystal",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:space_stone_lunar_spinel_ore", {
	description = "Lunar Spinel Ore",
	tiles = {"space_travel_space_stone.png^space_travel_mineral_lunar_spinel.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	drop = "space_travel:lunar_spinel_gem",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:space_stone_ilmenite_ore", {
	description = "Space Ilmenite Ore",
	tiles = {"space_travel_space_stone.png^space_travel_mineral_ilmenite.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "space_travel:titanium_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:space_stone_solar_mese_ore", {
	description = "Solar Mese Ore",
	tiles = {"space_travel_space_stone.png^space_travel_mineral_solar_mese.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "space_travel:solar_mese_crystal",
	sounds = default.node_sound_stone_defaults(),
	light_source = 6,
})

--Radioactive blocks

minetest.register_node("space_travel:irradiated_space_dust", {
	description = "Irradiated Space Dust",
	tiles = {"space_travel_space_dust.png"},
	is_ground_content = false,
	groups = {crumbly = 3, radioactive = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_gravel_footstep", gain = 0.1},
	}),
})

minetest.register_node("space_travel:irradiated_space_stone", {
	description = "Irradiated Space Stone",
	tiles = {"space_travel_space_stone.png"},
	is_ground_content = false,
	drop = 'space_travel:irradiated_space_cobble',
	groups = {cracky = 3, radioactive = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:irradiated_space_cobble", {
	description = "Irradiated Space Cobblestone",
	tiles = {"space_travel_space_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, radioactive = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:irradiated_ice", {
	description = "Irradiated Ice",
	tiles = {"default_ice.png"},
	is_ground_content = false,
	groups = {cracky = 3, radioactive = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:irradiated_io_sulfur_dust", {
	description = "Irradiated Io Sulfur Dust",
	tiles = {"space_travel_io_sulfur_dust.png"},
	is_ground_content = false,
	groups = {crumbly = 3, radioactive = 1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("space_travel:irradiated_io_stone", {
	description = "Irradiated Io Stone",
	tiles = {"space_travel_io_stone.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 1, radioactive = 1},
	drop = 'space_travel:io_cobble',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:irradiated_io_cobble", {
	description = "Irradiated Io Cobblestone",
	tiles = {"space_travel_io_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2, radioactive = 1},
	sounds = default.node_sound_stone_defaults(),
})

--Mars blocks

minetest.register_node("space_travel:mars_sand", {
	description = "Mars Sand",
	tiles = {"default_desert_sand.png^[colorize:#cf411b66"},
	is_ground_content = false,
	groups = {crumbly = 3, sand = 1},
	sounds = default.node_sound_sand_defaults(),
	drop = {
		max_items = 1,
		items = {
			{items = {'space_travel:mars_iron_powder'}, rarity = 16},
			{items = {'space_travel:mars_sand'}}
		}
	}
})

minetest.register_node("space_travel:mars_sandstone", {
	description = "Mars Sandstone",
	tiles = {"default_desert_sandstone.png^[colorize:#cf411b66"},
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"mars_sandstone",
	"space_travel:mars_sandstone",
	{cracky = 3},
	{"default_desert_sandstone.png^[colorize:#cf411b66"},
	"Mars Sandstone Stair",
	"Mars Sandstone Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:mars_sandstone_brick", {
	description = "Mars Sandstone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_desert_sandstone_brick.png^[colorize:#cf411b66"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"mars_sandstone_brick",
	"space_travel:mars_sandstone_brick",
	{cracky = 2},
	{"default_desert_sandstone_brick.png^[colorize:#cf411b66"},
	"Mars Sandstone Brick Stair",
	"Mars Sandstone Brick Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:mars_sandstone_block", {
	description = "Mars Sandstone Block",
	tiles = {"default_desert_sandstone_block.png^[colorize:#cf411b66"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"mars_sandstone_block",
	"space_travel:mars_sandstone_block",
	{cracky = 2},
	{"default_desert_sandstone_block.png^[colorize:#cf411b66"},
	"Mars Sandstone Block Stair",
	"Mars Sandstone Block Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:mars_stone", {
	description = "Mars Stone",
	tiles = {"default_desert_stone.png^[colorize:#cf7d6788"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 1},
	drop = 'space_travel:mars_cobble',
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"mars_stone",
	"space_travel:mars_stone",
	{cracky = 3},
	{"default_desert_stone.png^[colorize:#cf7d6788"},
	"Mars Stone Stair",
	"Mars Stone Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:mars_stonebrick", {
	description = "Mars Stone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_desert_stone_brick.png^[colorize:#cf7d6788"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"mars_stonebrick",
	"space_travel:mars_stonebrick",
	{cracky = 2},
	{"default_desert_stone_brick.png^[colorize:#cf7d6788"},
	"Mars Stone Brick Stair",
	"Mars Stone Brick Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:mars_stone_block", {
	description = "Mars Stone Block",
	tiles = {"default_desert_stone_block.png^[colorize:#cf7d6788"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"mars_stone_block",
	"space_travel:mars_stone_block",
	{cracky = 2},
	{"default_desert_stone_block.png^[colorize:#cf7d6788"},
	"Mars Stone Block Stair",
	"Mars Stone Block Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:mars_cobble", {
	description = "Mars Cobblestone",
	tiles = {"default_desert_cobble.png^[colorize:#cf7d6788"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"mars_cobble",
	"space_travel:mars_cobble",
	{cracky = 3},
	{"default_desert_cobble.png^[colorize:#cf7d6788"},
	"Mars Cobblestone Stair",
	"Mars Cobblestone Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:mars_stone_with_iron", {
	description = "Mars Iron Ore",
	tiles = {"default_desert_stone.png^default_mineral_iron.png^[colorize:#cf7d6788"},
	groups = {cracky = 2},
	drop = 'default:iron_lump',
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("space_travel:mars_stone_with_copper", {
	description = "Mars Copper Ore",
	tiles = {"default_desert_stone.png^default_mineral_copper.png^[colorize:#cf7d6788"},
	groups = {cracky = 2},
	drop = 'default:copper_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:mars_stone_with_tin", {
	description = "Mars Tin Ore",
	tiles = {"default_desert_stone.png^default_mineral_tin.png^[colorize:#cf7d6788"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:tin_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:mars_stone_with_mese", {
	description = "Mars Mese Ore",
	tiles = {"default_desert_stone.png^default_mineral_mese.png^[colorize:#cf7d6788"},
	groups = {cracky = 1},
	drop = "default:mese_crystal",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:mars_stone_with_gold", {
	description = "Mars Gold Ore",
	tiles = {"default_desert_stone.png^default_mineral_gold.png^[colorize:#cf7d6788"},
	groups = {cracky = 2},
	drop = "default:gold_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:mars_stone_with_diamond", {
	description = "Mars Diamond Ore",
	tiles = {"default_desert_stone.png^default_mineral_diamond.png^[colorize:#cf7d6788"},
	groups = {cracky = 1},
	drop = "default:diamond",
	sounds = default.node_sound_stone_defaults(),
})

--New ore: Martian ice crystal
minetest.register_node("space_travel:mars_stone_with_martian_ice_crystal", {
	description = "Martian Ice Crystal ore",
	tiles = {"default_desert_stone.png^space_travel_mineral_martian_ice_crystal.png^[colorize:#cf7d6788"},
	groups = {cracky = 1},
	drop = "space_travel:martian_ice_crystal",
	sounds = default.node_sound_stone_defaults(),
})

--Venus blocks

minetest.register_node("space_travel:venus_dust", {
	description = "Venus Dust",
	tiles = {"space_travel_venus_dust.png"},
	is_ground_content = false,
	groups = {crumbly = 3},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("space_travel:venus_stone", {
	description = "Venus Stone",
	tiles = {"space_travel_venus_stone.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 1},
	drop = 'space_travel:venus_cobble',
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"venus_stone",
	"space_travel:venus_stone",
	{cracky = 3},
	{"space_travel_venus_stone.png"},
	"Venus Stone Stair",
	"Venus Stone Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:venus_cobble", {
	description = "Venus Cobblestone",
	tiles = {"space_travel_venus_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"venus_cobble",
	"space_travel:venus_cobble",
	{cracky = 3},
	{"space_travel_venus_cobble.png"},
	"Venus Cobblestone Stair",
	"Venus Cobblestone Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:venus_stonebrick", {
	description = "Venus Stone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"space_travel_venus_stone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"venus_stonebrick",
	"space_travel:venus_stonebrick",
	{cracky = 2},
	{"space_travel_venus_stone_brick.png"},
	"Venus Stone Brick Stair",
	"Venus Stone Brick Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:venus_stone_block", {
	description = "Venus Stone Block",
	tiles = {"space_travel_venus_stone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"venus_stone_block",
	"space_travel:venus_stone_block",
	{cracky = 2},
	{"space_travel_venus_stone_block.png"},
	"Venus Stone Block Stair",
	"Venus Stone Block Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:venus_gravel", {
	description = "Venus Gravel",
	tiles = {"space_travel_venus_gravel.png"},
	is_ground_content = false,
	groups = {crumbly = 2},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_gravel_footstep", gain = 0.2},
	}),
})

minetest.register_node("space_travel:venus_vapor_spout", {
	description = "Venus Vapor Spout",
	tiles = {"space_travel_venus_dust.png^space_travel_geyser_hole.png", "space_travel_venus_cobble.png^space_travel_geyser_hole.png", "space_travel_venus_dust.png", "space_travel_venus_dust.png", "space_travel_venus_dust.png"},
	is_ground_content = false,
	groups = {crumbly = 3, geyser = 1}, --, not_in_creative_inventory = 1
	drop = "space_travel:venus_dust",
	sounds = default.node_sound_sand_defaults(),
	walkable = false,
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 15,
})

minetest.register_node("space_travel:venus_volcano", {
	description = "Venus Volcano",
	tiles = {"space_travel_venus_dust.png^space_travel_geyser_hole.png", "space_travel_venus_cobble.png^space_travel_geyser_hole.png", "space_travel_venus_dust.png", "space_travel_venus_dust.png", "space_travel_venus_dust.png"},
	is_ground_content = false,
	groups = {crumbly = 3, geyser = 1}, --, not_in_creative_inventory = 1
	drop = "space_travel:venus_dust",
	sounds = default.node_sound_sand_defaults(),
	walkable = false,
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 15,
})

minetest.register_node("space_travel:venus_stone_iron_ore", {
	description = "Venus Iron Ore",
	tiles = {"space_travel_venus_stone.png^default_mineral_iron.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:iron_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:venus_stone_copper_ore", {
	description = "Venus Copper Ore",
	tiles = {"space_travel_venus_stone.png^default_mineral_copper.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:copper_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:venus_stone_tin_ore", {
	description = "Venus Tin Ore",
	tiles = {"space_travel_venus_stone.png^default_mineral_tin.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:tin_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:venus_stone_gold_ore", {
	description = "Venus Gold Ore",
	tiles = {"space_travel_venus_stone.png^default_mineral_gold.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:gold_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:venus_stone_diamond_ore", {
	description = "Venus Diamond Ore",
	tiles = {"space_travel_venus_stone.png^default_mineral_diamond.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	drop = "default:diamond",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:venus_stone_mese_ore", {
	description = "Venus Mese Ore",
	tiles = {"space_travel_venus_stone.png^default_mineral_mese.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	drop = "default:mese_crystal",
	sounds = default.node_sound_stone_defaults(),
})

--New ore: Galena
minetest.register_node("space_travel:venus_stone_galena_ore", {
	description = "Venus Galena Ore",
	tiles = {"space_travel_venus_stone.png^space_travel_mineral_galena.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	drop = "space_travel:galena_lump",
	sounds = default.node_sound_stone_defaults(),
})

--New liquid: sulfuric acid
minetest.register_node("space_travel:sulfuric_acid_source", {
	description = "Sulfuric Acid Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "space_travel_sulfuric_acid_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{
			name = "space_travel_sulfuric_acid_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 160,
	paramtype = "light",
	light_source = 6,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "space_travel:sulfuric_acid_flowing",
	liquid_alternative_source = "space_travel:sulfuric_acid_source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	damage_per_second = 4 * 2,
	post_effect_color = {a = 103, r = 108, g = 244, b = 45}, --rgb(219,167,83)
	groups = {liquid = 3, puts_out_fire = 1, cools_lava = 1}, --removed "water = 3, "
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("space_travel:sulfuric_acid_flowing", {
	description = "Flowing Sulfuric Acid",
	drawtype = "flowingliquid",
	tiles = {"space_travel_liquid_hydrocarbon.png"},
	special_tiles = {
		{
			name = "space_travel_sulfuric_acid_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "space_travel_sulfuric_acid_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 160,
	paramtype = "light",
	light_source = 6,
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "space_travel:sulfuric_acid_flowing",
	liquid_alternative_source = "space_travel:sulfuric_acid_source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	damage_per_second = 4 * 2,
	post_effect_color = {a = 103, r = 108, g = 244, b = 45},
	groups = {liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1, cools_lava = 1}, --removed "water = 3, "
	sounds = default.node_sound_water_defaults(),
})

    bucket.register_liquid(
    	"space_travel:sulfuric_acid_source",
    	"space_travel:sulfuric_acid_flowing",
    	"space_travel:bucket_sulfuric_acid",
    	"space_travel_bucket_sulfuric_acid.png",
    	"Sulfuric Acid Bucket"
    )

--Io blocks

minetest.register_node("space_travel:io_sulfur_dust", {
	description = "Io Sulfur Dust",
	tiles = {"space_travel_io_sulfur_dust.png"},
	is_ground_content = false,
	groups = {crumbly = 3},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("space_travel:io_stone", {
	description = "Io Stone",
	tiles = {"space_travel_io_stone.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 1},
	drop = 'space_travel:io_cobble',
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"io_stone",
	"space_travel:io_stone",
	{cracky = 3},
	{"space_travel_io_stone.png"},
	"Io Stone Stair",
	"Io Stone Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:io_cobble", {
	description = "Io Cobblestone",
	tiles = {"space_travel_io_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"io_cobble",
	"space_travel:io_cobble",
	{cracky = 3},
	{"space_travel_io_cobble.png"},
	"Io Cobblestone Stair",
	"Io Cobblestone Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:io_stonebrick", {
	description = "Io Stone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"space_travel_io_stone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"io_stonebrick",
	"space_travel:io_stonebrick",
	{cracky = 2},
	{"space_travel_io_stone_brick.png"},
	"Io Stone Brick Stair",
	"Io Stone Brick Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:io_stone_block", {
	description = "Io Stone Block",
	tiles = {"space_travel_io_stone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"io_stone_block",
	"space_travel:io_stone_block",
	{cracky = 2},
	{"space_travel_io_stone_block.png"},
	"Io Stone Block Stair",
	"Io Stone Block Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:io_gravel", {
	description = "Io Gravel",
	tiles = {"space_travel_io_gravel.png"},
	is_ground_content = false,
	groups = {crumbly = 2},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_gravel_footstep", gain = 0.2},
	}),
})

minetest.register_node("space_travel:io_volcano", {
	description = "Io Volcano",
	tiles = {"space_travel_io_sulfur_dust.png^space_travel_geyser_hole.png", "space_travel_io_cobble.png^space_travel_geyser_hole.png", "space_travel_io_sulfur_dust.png", "space_travel_io_sulfur_dust.png", "space_travel_io_sulfur_dust.png"},
	is_ground_content = false,
	groups = {crumbly = 3, geyser = 1}, --, not_in_creative_inventory = 1
	drop = "space_travel:io_sulfur_dust",
	sounds = default.node_sound_sand_defaults(),
	walkable = false,
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 15,
})

minetest.register_node("space_travel:io_stone_iron_ore", {
	description = "Io Iron Ore",
	tiles = {"space_travel_io_stone.png^default_mineral_iron.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:iron_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:io_stone_copper_ore", {
	description = "Io Copper Ore",
	tiles = {"space_travel_io_stone.png^default_mineral_copper.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:copper_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:io_stone_tin_ore", {
	description = "Io Tin Ore",
	tiles = {"space_travel_io_stone.png^default_mineral_tin.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:tin_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:io_stone_gold_ore", {
	description = "Io Gold Ore",
	tiles = {"space_travel_io_stone.png^default_mineral_gold.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:gold_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:io_stone_diamond_ore", {
	description = "Io Diamond Ore",
	tiles = {"space_travel_io_stone.png^default_mineral_diamond.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	drop = "default:diamond",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:io_stone_mese_ore", {
	description = "Io Mese Ore",
	tiles = {"space_travel_io_stone.png^default_mineral_mese.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	drop = "default:mese_crystal",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:io_stone_lava_crystal_ore", {
	description = "Io Lava Crystal Ore",
	tiles = {"space_travel_io_stone.png^space_travel_mineral_lava_crystal.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {cracky = 1},
	drop = "space_travel:lava_crystal",
	sounds = default.node_sound_stone_defaults(),
	light_source = 6,
})

--Titan blocks

minetest.register_node("space_travel:titan_icestone", {
    description = "Titan Icestone",
    tiles = {"space_travel_titan_icestone.png"},
    --is_ground_content = true,
    groups = {cracky=3},
    sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:titan_hydrocarbon_sand", {
	description = "Hydrocarbon Sand",
	tiles = {"space_travel_titan_hydrocarbon_sand.png"},
	groups = {crumbly = 3}, --removed:", sand = 1"
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("space_travel:titan_cryovolcano", {
	description = "Titan Cryovolcano",
	tiles = {"space_travel_titan_hydrocarbon_sand.png^space_travel_geyser_hole.png", "space_travel_titan_icestone.png^space_travel_geyser_hole.png", "space_travel_titan_hydrocarbon_sand.png", "space_travel_titan_hydrocarbon_sand.png", "space_travel_titan_hydrocarbon_sand.png"},
	is_ground_content = false,
	groups = {crumbly = 3, geyser = 1}, --, not_in_creative_inventory = 1
	drop = "space_travel:titan_hydrocarbon_sand",
	sounds = default.node_sound_sand_defaults(),
	walkable = false,
	paramtype = "light",
	sunlight_propagates = true,
	--light_source = 15,
})

--New liquid: liquid hydrocarbon
minetest.register_node("space_travel:liquid_hydrocarbon_source", {
	description = "Liquid Hydrocarbon Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "space_travel_liquid_hydrocarbon_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{
			name = "space_travel_liquid_hydrocarbon_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "space_travel:liquid_hydrocarbon_flowing",
	liquid_alternative_source = "space_travel:liquid_hydrocarbon_source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	post_effect_color = {a = 103, r = 219, g = 167, b = 83}, --rgb(219,167,83)
	groups = {oil = 3, liquid = 1, flammable = 1}, --removed "water = 3, "
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("space_travel:liquid_hydrocarbon_flowing", {
	description = "Flowing Liquid Hydrocarbon",
	drawtype = "flowingliquid",
	tiles = {"space_travel_liquid_hydrocarbon.png"},
	special_tiles = {
		{
			name = "space_travel_liquid_hydrocarbon_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "space_travel_liquid_hydrocarbon_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "space_travel:liquid_hydrocarbon_flowing",
	liquid_alternative_source = "space_travel:liquid_hydrocarbon_source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	post_effect_color = {a = 103, r = 219, g = 167, b = 83},
	groups = {oil = 3, liquid = 1, flammable = 1, not_in_creative_inventory = 1}, --removed "water = 3, "
	sounds = default.node_sound_water_defaults(),
})

    bucket.register_liquid(
    	"space_travel:liquid_hydrocarbon_source",
    	"space_travel:liquid_hydrocarbon_flowing",
    	"space_travel:bucket_liquid_hydrocarbon",
    	"space_travel_bucket_liquid_hydrocarbon.png",
    	"Liquid Hydrocarbon Bucket"
    )

minetest.register_node("space_travel:titan_alien_crystal", {
	description = "Titan Alien Crystal",
	--tiles = {{
	--	name = "mapgen_crystal_anim.png",
	--	animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1.00},
	--}},
    tiles = {"space_travel_titan_alien_crystal.png"},
	inventory_image = "space_travel_titan_alien_crystal_item.png",
    --wield_image = "titan_moon_alien_crystal_item.png",
	use_texture_alpha = true,
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	--light_source = 7,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.875, 0.25}, -- NodeBox1
			{-0.1875, -0.5, -0.1875, 0.1875, 1.25, 0.1875}, -- NodeBox2
			{-0.625, -0.5, -0.1875, -0.3125, 0.5, 0.125}, -- NodeBox3
			{0.0625, -0.5, -0.625, 0.375, 0.3125, -0.3125}, -- NodeBox5
			{0.3125, -0.5, 0.3125, 0.5625, 0.5, 0.5625}, -- NodeBox7
			{-0.5625, -0.5, -0.125, -0.375, 0.4375, 0.0625}, -- NodeBox8
			{0.125, -0.5, -0.5625, 0.3125, 0.25, -0.375}, -- NodeBox9
			{0.375, -0.5, 0.375, 0.5, 0.4375, 0.5}, -- NodeBox10
		}
	},
	groups = {cracky=2, dig_immediate=3, flammable=1},
	sounds = default.node_sound_glass_defaults()
})

minetest.register_node("space_travel:titan_icestone_iron_ore", {
	description = "Titan Iron Ore",
	tiles = {"space_travel_titan_icestone.png^default_mineral_iron.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:iron_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:titan_icestone_copper_ore", {
	description = "Titan Copper Ore",
	tiles = {"space_travel_titan_icestone.png^default_mineral_copper.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:copper_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:titan_icestone_tin_ore", {
	description = "Titan Tin Ore",
	tiles = {"space_travel_titan_icestone.png^default_mineral_tin.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:tin_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:titan_icestone_gold_ore", {
	description = "Titan Gold Ore",
	tiles = {"space_travel_titan_icestone.png^default_mineral_gold.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:gold_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:titan_icestone_diamond_ore", {
	description = "Titan Diamond Ore",
	tiles = {"space_travel_titan_icestone.png^default_mineral_diamond.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	drop = "default:diamond",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:titan_icestone_mese_ore", {
	description = "Titan Mese Ore",
	tiles = {"space_travel_titan_icestone.png^default_mineral_mese.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	drop = "default:mese_crystal",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:titan_icestone_ilmenite_ore", {
	description = "Titan Ilmenite Ore",
	tiles = {"space_travel_titan_icestone.png^space_travel_mineral_ilmenite.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "space_travel:titanium_lump",
	sounds = default.node_sound_stone_defaults(),
})

--Sedna blocks

minetest.register_node("space_travel:sedna_stone", {
	description = "Sedna Stone",
	tiles = {"space_travel_sedna_stone.png"},
	is_ground_content = false,
	drop = 'space_travel:sedna_cobble',
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:sedna_cobble", {
	description = "Sedna Cobblestone",
	tiles = {"space_travel_sedna_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:sedna_gravel", {
	description = "Sedna Gravel",
	tiles = {"space_travel_sedna_gravel.png"},
	is_ground_content = false,
	groups = {crumbly = 2},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_gravel_footstep", gain = 0.2},
	}),
})

minetest.register_node("space_travel:sedna_dust", {
	description = "Sedna Dust",
	tiles = {"space_travel_sedna_dust.png"},
	is_ground_content = false,
	groups = {crumbly = 3},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_gravel_footstep", gain = 0.1},
	}),
})

minetest.register_node("space_travel:sedna_stone_iron_ore", {
	description = "Sedna Iron Ore",
	tiles = {"space_travel_sedna_stone.png^default_mineral_iron.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:iron_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:sedna_stone_copper_ore", {
	description = "Sedna Copper Ore",
	tiles = {"space_travel_sedna_stone.png^default_mineral_copper.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:copper_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:sedna_stone_tin_ore", {
	description = "Sedna Tin Ore",
	tiles = {"space_travel_sedna_stone.png^default_mineral_tin.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:tin_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:sedna_stone_gold_ore", {
	description = "Sedna Gold Ore",
	tiles = {"space_travel_sedna_stone.png^default_mineral_gold.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:gold_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:sedna_stone_diamond_ore", {
	description = "Sedna Diamond Ore",
	tiles = {"space_travel_sedna_stone.png^default_mineral_diamond.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	drop = "default:diamond",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:sedna_stone_mese_ore", {
	description = "Sedna Mese Ore",
	tiles = {"space_travel_sedna_stone.png^default_mineral_mese.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	drop = "default:mese_crystal",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:sedna_stone_dark_matter_crystal_ore", {
	description = "Sedna Dark Matter Crystal Ore",
	tiles = {"space_travel_sedna_stone.png^space_travel_mineral_dark_matter_crystal.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	drop = "space_travel:dark_matter_crystal",
	sounds = default.node_sound_stone_defaults(),
})

--Minerva blocks

--[[--It was too pink...
minetest.register_node("space_travel:minerva_sand", {
	description = "Minerva Sand",
	tiles = {"space_travel_minerva_sand.png"},
	groups = {crumbly = 3, sand = 1},
	sounds = default.node_sound_sand_defaults(),
})
]]

minetest.register_node("space_travel:minerva_stone", {
	description = "Minerva Stone",
	tiles = {"space_travel_minerva_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = "space_travel:minerva_cobble",
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"minerva_stone",
	"space_travel:minerva_stone",
	{cracky = 3},
	{"space_travel_minerva_stone.png"},
	"Minerva Stone Stair",
	"Minerva Stone Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:minerva_cobble", {
	description = "Minerva Cobblestone",
	tiles = {"space_travel_minerva_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"minerva_cobble",
	"space_travel:minerva_cobble",
	{cracky = 3},
	{"space_travel_minerva_cobble.png"},
	"Minerva Cobblestone Stair",
	"Minerva Cobblestone Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:minerva_stonebrick", {
	description = "Minerva Stone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"space_travel_minerva_stone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"minerva_stonebrick",
	"space_travel:minerva_stonebrick",
	{cracky = 2},
	{"space_travel_minerva_stone_brick.png"},
	"Minerva Stone Brick Stair",
	"Minerva Stone Brick Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:minerva_stone_block", {
	description = "Minerva Stone Block",
	tiles = {"space_travel_minerva_stone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"minerva_stone_block",
	"space_travel:minerva_stone_block",
	{cracky = 2},
	{"space_travel_minerva_stone_block.png"},
	"Minerva Stone Block Stair",
	"Minerva Stone Block Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:minerva_dirt", {
	description = "Minerva Dirt",
	tiles = {"space_travel_minerva_dirt.png"},
	groups = {crumbly = 3, soil = 1},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("space_travel:minerva_dirt_with_minerva_grass", {
	description = "Minerva Dirt with Minerva Grass",
	tiles = {
		"space_travel_minerva_grass_top.png",
		"space_travel_minerva_dirt.png",
		{name = "space_travel_minerva_dirt.png^space_travel_minerva_grass_side.png",
			tileable_vertical = false}
	},
	groups = {crumbly = 3, soil = 1},--, spreading_dirt_type = 1},
	drop = "space_travel:minerva_dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.4},
	}),
})

minetest.register_node("space_travel:minerva_pine_tree", {
	description = "Minerva Pine Tree",
	tiles = {"space_travel_minerva_pine_tree_top.png", "space_travel_minerva_pine_tree_top.png",
		"space_travel_minerva_pine_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("space_travel:minerva_pine_wood", {
	description = "Minerva Pine Wood Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"space_travel_minerva_pine_wood.png"},
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

stairs.register_stair_and_slab(
	"minerva_pine_wood",
	"space_travel:minerva_pine_wood",
	{choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	{"space_travel_minerva_pine_wood.png"},
	"Minerva Pine Wood Stair",
	"Minerva Pine Wood Slab",
	default.node_sound_wood_defaults()
)

minetest.register_node("space_travel:minerva_pine_needles",{
	description = "Minerva Pine Needles",
	drawtype = "allfaces_optional",
	tiles = {"space_travel_minerva_pine_needles.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"space_travel:minerva_pine_sapling"}, rarity = 20},
			{items = {"space_travel:minerva_pine_needles"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = after_place_leaves,
})

minetest.register_node("space_travel:minerva_fern_1", {
	description = "Minerva Fern",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"space_travel_minerva_fern_1.png"},
	inventory_image = "space_travel_minerva_fern_1.png",
	wield_image = "space_travel_minerva_fern_1.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -0.25, 6 / 16},
	},

	on_place = function(itemstack, placer, pointed_thing)
		-- place a random fern node
		local stack = ItemStack("space_travel:minerva_fern_" .. math.random(1, 3))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("space_travel:minerva_fern_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 3 do
	minetest.register_node("space_travel:minerva_fern_" .. i, {
		description = "Minerva Fern",
		drawtype = "plantlike",
		waving = 1,
		visual_scale = 2,
		tiles = {"space_travel_minerva_fern_" .. i .. ".png"},
		inventory_image = "space_travel_minerva_fern_" .. i .. ".png",
		wield_image = "space_travel_minerva_fern_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory=1},
		drop = "space_travel:minerva_fern_1",
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -0.25, 6 / 16},
		},
	})
end

minetest.register_node("space_travel:minerva_pine_sapling", {
	description = "Minerva Pine Tree Sapling",
	drawtype = "plantlike",
	tiles = {"space_travel_minerva_pine_sapling.png"},
	inventory_image = "space_travel_minerva_pine_sapling.png",
	wield_image = "space_travel_minerva_pine_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = function(pos)
		if not default.can_grow(pos) then
			-- try again 5 min later
			minetest.get_node_timer(pos):start(300)
			return
		end
		local mg_name = minetest.get_mapgen_setting("mg_name")
		local node = minetest.get_node(pos)
		minetest.log("action", "A Minerva pine tree sapling grows into a tree at ".. minetest.pos_to_string(pos))
		tree = minetest.get_modpath("space_travel") .. "/schematics/minerva_pine_tree.mts"
		minetest.place_schematic({x=pos.x-2,y=pos.y,z=pos.z-2}, tree, "random", {}, true)
	end,--grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 3,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
		--minetest.get_node_timer(pos):start(1)
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"space_travel:minerva_pine_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 14, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

minetest.register_node("space_travel:minerva_stone_iron_ore", {
	description = "Minerva Iron Ore",
	tiles = {"space_travel_minerva_stone.png^default_mineral_iron.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:iron_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:minerva_stone_copper_ore", {
	description = "Minerva Copper Ore",
	tiles = {"space_travel_minerva_stone.png^default_mineral_copper.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:copper_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:minerva_stone_tin_ore", {
	description = "Minerva Tin Ore",
	tiles = {"space_travel_minerva_stone.png^default_mineral_tin.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:tin_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:minerva_stone_gold_ore", {
	description = "Minerva Gold Ore",
	tiles = {"space_travel_minerva_stone.png^default_mineral_gold.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:gold_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:minerva_stone_diamond_ore", {
	description = "Minerva Diamond Ore",
	tiles = {"space_travel_minerva_stone.png^default_mineral_diamond.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	drop = "default:diamond",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:minerva_stone_mese_ore", {
	description = "Minerva Mese Ore",
	tiles = {"space_travel_minerva_stone.png^default_mineral_mese.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	drop = "default:mese_crystal",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:minerva_water_source", {
	description = "Minerva Water Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "space_travel_minerva_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{
			name = "space_travel_minerva_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "space_travel:minerva_water_flowing",
	liquid_alternative_source = "space_travel:minerva_water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 229, g = 46, b = 46},
	groups = {liquid = 3, puts_out_fire = 1, cools_lava = 1, water = 3},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("space_travel:minerva_water_flowing", {
	description = "Flowing Minerva Water",
	drawtype = "flowingliquid",
	tiles = {"space_travel_minerva_water.png"},
	special_tiles = {
		{
			name = "space_travel_minerva_water_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "space_travel_minerva_water_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "space_travel:minerva_water_flowing",
	liquid_alternative_source = "space_travel:minerva_water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 229, g = 46, b = 46},
	groups = {liquid = 3, puts_out_fire = 1, water = 3,
		not_in_creative_inventory = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

    bucket.register_liquid(
    	"space_travel:minerva_water_source",
    	"space_travel:minerva_water_flowing",
    	"space_travel:bucket_minerva_water",
    	"space_travel_bucket_minerva_water.png",
    	"Minerva Water Bucket"
    )

--Bacchus blocks

minetest.register_node("space_travel:bacchus_sand", {
	description = "Bacchus Sand",
	tiles = {"space_travel_bacchus_sand.png"},
	groups = {crumbly = 3, sand = 1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("space_travel:bacchus_stone", {
	description = "Bacchus Stone",
	tiles = {"space_travel_bacchus_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = "space_travel:bacchus_cobble",
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"bacchus_stone",
	"space_travel:bacchus_stone",
	{cracky = 3},
	{"space_travel_bacchus_stone.png"},
	"Bacchus Stone Stair",
	"Bacchus Stone Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:bacchus_cobble", {
	description = "Bacchus Cobblestone",
	tiles = {"space_travel_bacchus_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"bacchus_cobble",
	"space_travel:bacchus_cobble",
	{cracky = 3},
	{"space_travel_bacchus_cobble.png"},
	"Bacchus Cobblestone Stair",
	"Bacchus Cobblestone Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:bacchus_stonebrick", {
	description = "Bacchus Stone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"space_travel_bacchus_stone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"bacchus_stonebrick",
	"space_travel:bacchus_stonebrick",
	{cracky = 2},
	{"space_travel_bacchus_stone_brick.png"},
	"Bacchus Stone Brick Stair",
	"Bacchus Stone Brick Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:bacchus_stone_block", {
	description = "Bacchus Stone Block",
	tiles = {"space_travel_bacchus_stone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"bacchus_stone_block",
	"space_travel:bacchus_stone_block",
	{cracky = 2},
	{"space_travel_bacchus_stone_block.png"},
	"Bacchus Stone Block Stair",
	"Bacchus Stone Block Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:bacchus_dirt", {
	description = "Bacchus Dirt",
	tiles = {"space_travel_bacchus_dirt.png"},
	groups = {crumbly = 3, soil = 1},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("space_travel:bacchus_dirt_with_bacchus_grass", {
	description = "Bacchus Dirt with Bacchus Grass",
	tiles = {
		"space_travel_bacchus_grass_top.png",
		"space_travel_bacchus_dirt.png",
		{name = "space_travel_bacchus_dirt.png^space_travel_bacchus_grass_side.png",
			tileable_vertical = false}
	},
	groups = {crumbly = 3, soil = 1},--, spreading_dirt_type = 1},
	drop = "space_travel:bacchus_dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.4},
	}),
})

minetest.register_node("space_travel:bacchus_tree", {
	description = "bacchus Pine Tree",
	tiles = {"space_travel_bacchus_tree_top.png", "space_travel_bacchus_tree_top.png",
		"space_travel_bacchus_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("space_travel:bacchus_wood", {
	description = "Bacchus Wood Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"space_travel_bacchus_wood.png"},
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

stairs.register_stair_and_slab(
	"bacchus_wood",
	"space_travel:bacchus_wood",
	{choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	{"space_travel_bacchus_wood.png"},
	"Bacchus Pine Wood Stair",
	"Bacchus Pine Wood Slab",
	default.node_sound_wood_defaults()
)

minetest.register_node("space_travel:bacchus_leaves", {
	description = "Bacchus Tree Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"space_travel_bacchus_leaves.png"},
	--special_tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/20 chance
				items = {"space_travel:bacchus_sapling"},
				rarity = 20,
			},
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {"space_travel:bacchus_leaves"},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = after_place_leaves,
})

minetest.register_node("space_travel:bacchus_sapling", {
	description = "Bacchus Tree Sapling",
	drawtype = "plantlike",
	tiles = {"space_travel_bacchus_tree_sapling.png"},
	inventory_image = "space_travel_bacchus_tree_sapling.png",
	wield_image = "space_travel_bacchus_tree_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = function(pos)
		if not default.can_grow(pos) then
			-- try again 5 min later
			minetest.get_node_timer(pos):start(300)
			return
		end
		local mg_name = minetest.get_mapgen_setting("mg_name")
		local node = minetest.get_node(pos)
		minetest.log("action", "A Bacchus tree sapling grows into a tree at ".. minetest.pos_to_string(pos))
		tree = minetest.get_modpath("space_travel") .. "/schematics/bacchus_tree.mts"
		minetest.place_schematic({x=pos.x-2,y=pos.y,z=pos.z-2}, tree, "random", {}, true)
	end,--grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 3,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
		--minetest.get_node_timer(pos):start(1)
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"space_travel:bacchus_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 14, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

minetest.register_node("space_travel:bacchus_grass_1", {
	description = "Bacchus Grass",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"space_travel_bacchus_grass_1.png"},
	-- Use texture of a taller grass stage in inventory
	inventory_image = "space_travel_bacchus_grass_3.png",
	wield_image = "space_travel_bacchus_grass_3.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
	},

	on_place = function(itemstack, placer, pointed_thing)
		-- place a random grass node
		local stack = ItemStack("space_travel:bacchus_grass_" .. math.random(1,5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("space_travel:bacchus_grass_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 5 do
	minetest.register_node("space_travel:bacchus_grass_" .. i, {
		description = "Bacchus Grass",
		drawtype = "plantlike",
		waving = 1,
		tiles = {"space_travel_bacchus_grass_" .. i .. ".png"},
		inventory_image = "space_travel_bacchus_grass_" .. i .. ".png",
		wield_image = "space_travel_bacchus_grass_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		drop = "space_travel:bacchus_grass_1",
		groups = {snappy = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory = 1, grass = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},
	})
end

minetest.register_node("space_travel:bacchus_water_source", {
	description = "Bacchus Water Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "space_travel_bacchus_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{
			name = "space_travel_bacchus_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "space_travel:bacchus_water_flowing",
	liquid_alternative_source = "space_travel:bacchus_water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 117, g = 24, b = 222},
	groups = {liquid = 3, puts_out_fire = 1, cools_lava = 1, water = 3},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("space_travel:bacchus_water_flowing", {
	description = "Flowing Bacchus Water",
	drawtype = "flowingliquid",
	tiles = {"space_travel_bacchus_water.png"},
	special_tiles = {
		{
			name = "space_travel_bacchus_water_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "space_travel_bacchus_water_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "space_travel:bacchus_water_flowing",
	liquid_alternative_source = "space_travel:bacchus_water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 117, g = 24, b = 222},
	groups = {liquid = 3, puts_out_fire = 1, water = 3,
		not_in_creative_inventory = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

    bucket.register_liquid(
    	"space_travel:bacchus_water_source",
    	"space_travel:bacchus_water_flowing",
    	"space_travel:bucket_bacchus_water",
    	"space_travel_bucket_bacchus_water.png",
    	"Bacchus Water Bucket"
    )

minetest.register_node("space_travel:bacchus_stone_iron_ore", {
	description = "Bacchus Iron Ore",
	tiles = {"space_travel_bacchus_stone.png^default_mineral_iron.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:iron_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:bacchus_stone_copper_ore", {
	description = "Bacchus Copper Ore",
	tiles = {"space_travel_bacchus_stone.png^default_mineral_copper.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:copper_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:bacchus_stone_tin_ore", {
	description = "Bacchus Tin Ore",
	tiles = {"space_travel_bacchus_stone.png^default_mineral_tin.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:tin_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:bacchus_stone_gold_ore", {
	description = "Bacchus Gold Ore",
	tiles = {"space_travel_bacchus_stone.png^default_mineral_gold.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:gold_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:bacchus_stone_diamond_ore", {
	description = "Bacchus Diamond Ore",
	tiles = {"space_travel_bacchus_stone.png^default_mineral_diamond.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	drop = "default:diamond",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:bacchus_stone_mese_ore", {
	description = "Bacchus Mese Ore",
	tiles = {"space_travel_bacchus_stone.png^default_mineral_mese.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	drop = "default:mese_crystal",
	sounds = default.node_sound_stone_defaults(),
})

--Osiris

minetest.register_node("space_travel:osiris_iron_ore", {
	description = "Osiris Iron Ore",
	tiles = {"default_desert_stone.png^default_mineral_iron.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:iron_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:osiris_copper_ore", {
	description = "Osiris Copper Ore",
	tiles = {"default_desert_stone.png^default_mineral_copper.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:copper_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:osiris_tin_ore", {
	description = "Osiris Tin Ore",
	tiles = {"default_desert_stone.png^default_mineral_tin.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:tin_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:osiris_gold_ore", {
	description = "Osiris Gold Ore",
	tiles = {"default_desert_stone.png^default_mineral_gold.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:gold_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:osiris_diamond_ore", {
	description = "Osiris Diamond Ore",
	tiles = {"default_desert_stone.png^default_mineral_diamond.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	drop = "default:diamond",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:osiris_mese_ore", {
	description = "Osiris Mese Ore",
	tiles = {"default_desert_stone.png^default_mineral_mese.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	drop = "default:mese_crystal",
	sounds = default.node_sound_stone_defaults(),
})

--Minthe

minetest.register_node("space_travel:minthe_sand", {
	description = "Minthe Sand",
	tiles = {"space_travel_minthe_sand.png"},
	is_ground_content = false,
	groups = {crumbly = 3, sand = 1},
	sounds = default.node_sound_sand_defaults(),
	drop = {
		max_items = 1,
		items = {
			{items = {'space_travel:minthe_copper_powder'}, rarity = 16},
			{items = {'space_travel:minthe_sand'}}
		}
	}
})

minetest.register_node("space_travel:minthe_sandstone", {
	description = "Minthe Sandstone",
	tiles = {"space_travel_minthe_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"minthe_sandstone",
	"space_travel:minthe_sandstone",
	{cracky = 3},
	{"space_travel_minthe_sandstone.png"},
	"Minthe Sandstone Stair",
	"Minthe Sandstone Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:minthe_sandstone_brick", {
	description = "Minthe Sandstone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"space_travel_minthe_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"minthe_sandstone_brick",
	"space_travel:minthe_sandstone_brick",
	{cracky = 2},
	{"space_travel_minthe_sandstone_brick.png"},
	"Minthe Sandstone Brick Stair",
	"Minthe Sandstone Brick Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:minthe_sandstone_block", {
	description = "Minthe Sandstone Block",
	tiles = {"space_travel_minthe_sandstone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"minthe_sandstone_block",
	"space_travel:minthe_sandstone_block",
	{cracky = 2},
	{"space_travel_minthe_sandstone_block.png"},
	"Minthe Sandstone Block Stair",
	"Minthe Sandstone Block Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:minthe_stone", {
	description = "Minthe Stone",
	tiles = {"space_travel_minthe_stone.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 1},
	drop = 'space_travel:minthe_cobble',
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"minthe_stone",
	"space_travel:minthe_stone",
	{cracky = 3},
	{"space_travel_minthe_stone.png"},
	"Minthe Stone Stair",
	"Minthe Stone Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:minthe_stonebrick", {
	description = "Minthe Stone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"space_travel_minthe_stone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"minthe_stonebrick",
	"space_travel:minthe_stonebrick",
	{cracky = 2},
	{"space_travel_minthe_stone_brick.png"},
	"Minthe Stone Brick Stair",
	"Minthe Stone Brick Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:minthe_stone_block", {
	description = "Minthe Stone Block",
	tiles = {"space_travel_minthe_stone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"minthe_stone_block",
	"space_travel:minthe_stone_block",
	{cracky = 2},
	{"space_travel_minthe_stone_block.png"},
	"Minthe Stone Block Stair",
	"Minthe Stone Block Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:minthe_cobble", {
	description = "Minthe Cobblestone",
	tiles = {"space_travel_minthe_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"minthe_cobble",
	"space_travel:minthe_cobble",
	{cracky = 3},
	{"space_travel_minthe_cobble.png"},
	"Minthe Cobblestone Stair",
	"Minthe Cobblestone Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:minthe_stone_with_iron", {
	description = "Minthe Iron Ore",
	tiles = {"space_travel_minthe_stone.png^default_mineral_iron.png"},
	groups = {cracky = 2},
	drop = 'default:iron_lump',
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("space_travel:minthe_stone_with_copper", {
	description = "Minthe Copper Ore",
	tiles = {"space_travel_minthe_stone.png^default_mineral_copper.png"},
	groups = {cracky = 2},
	drop = 'default:copper_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:minthe_stone_with_tin", {
	description = "Minthe Tin Ore",
	tiles = {"space_travel_minthe_stone.png^default_mineral_tin.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:tin_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:minthe_stone_with_mese", {
	description = "Minthe Mese Ore",
	tiles = {"space_travel_minthe_stone.png^default_mineral_mese.png"},
	groups = {cracky = 1},
	drop = "default:mese_crystal",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:minthe_stone_with_gold", {
	description = "Minthe Gold Ore",
	tiles = {"space_travel_minthe_stone.png^default_mineral_gold.png"},
	groups = {cracky = 2},
	drop = "default:gold_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("space_travel:minthe_stone_with_diamond", {
	description = "Minthe Diamond Ore",
	tiles = {"space_travel_minthe_stone.png^default_mineral_diamond.png"},
	groups = {cracky = 1},
	drop = "default:diamond",
	sounds = default.node_sound_stone_defaults(),
})

--Metal blocks

stairs.register_stair_and_slab(
	"lead",
	"space_travel:lead_block",
	{cracky = 1, level = 2},
	{"space_travel_lead_block.png"},
	"Lead Block Stair",
	"Lead Block Slab",
	default.node_sound_metal_defaults()
)

minetest.register_node("space_travel:titanium_block", {
	description = "Titanium Block",
	tiles = {"space_travel_titanium_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})

stairs.register_stair_and_slab(
	"titanium",
	"space_travel:titanium_block",
	{cracky = 1, level = 2},
	{"space_travel_titanium_block.png"},
	"Titanium Block Stair",
	"Titanium Block Slab",
	default.node_sound_metal_defaults()
)

--Gem blocks

minetest.register_node("space_travel:lunar_spinel_block", {
	description = "Lunar Spinel Block",
	tiles = {"space_travel_lunar_spinel_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"lunar_spinel",
	"space_travel:lunar_spinel_block",
	{cracky = 1, level = 2},
	{"space_travel_lunar_spinel_block.png"},
	"Lunar Spinel Block Stair",
	"Lunar Spinel Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:martian_ice_crystal_block", {
	description = "Martian Ice Crystal Block",
	tiles = {"space_travel_martian_ice_crystal_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"martian_ice_crystal",
	"space_travel:martian_ice_crystal_block",
	{cracky = 1, level = 2},
	{"space_travel_martian_ice_crystal_block.png"},
	"Martian Ice Crystal Block Stair",
	"Martian Ice Crystal Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:solar_mese_block", {
	description = "Solar Mese Block",
	tiles = {"space_travel_solar_mese_block.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
	light_source = 15,
})

stairs.register_stair_and_slab(
	"solar_mese",
	"space_travel:solar_mese_block",
	{cracky = 1, level = 2},
	{"space_travel_solar_mese_block.png"},
	"Solar Mese Block Stair",
	"Solar Mese Block Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:lava_crystal_block", {
	description = "Lava Crystal Block",
	tiles = {"space_travel_lava_crystal_block.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
	light_source = 15,
})

stairs.register_stair_and_slab(
	"lava_crystal",
	"space_travel:lava_crystal_block",
	{cracky = 1, level = 2},
	{"space_travel_lava_crystal_block.png"},
	"Lava Crystal Block Stair",
	"Lava Crystal Block Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("space_travel:dark_matter_crystal_block", {
	description = "Dark Matter Crystal Block",
	tiles = {"space_travel_dark_matter_crystal_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"dark_matter_crystal",
	"space_travel:dark_matter_crystal_block",
	{cracky = 1, level = 2},
	{"space_travel_dark_matter_crystal_block.png"},
	"Dark Matter Crystal Block Stair",
	"Dark Matter Crystal Block Slab",
	default.node_sound_stone_defaults()
)

--LBMS

minetest.register_lbm({
	name = "space_travel:convert_saplings_to_node_timer",
	nodenames = {"space_travel:minerva_pine_sapling"},
	action = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end
})

--ABMS

minetest.register_abm({
	label = "Minerva grass spread",
	nodenames = {"space_travel:minerva_dirt"},
	neighbors = {
		"air",
		"space_travel:minerva_dirt_with_minerva_grass"
	},
	interval = 6,
	chance = 50,
	catch_up = false,
	action = function(pos, node)
		-- Check for darkness: night, shadow or under a light-blocking node
		-- Returns if ignore above
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		if (minetest.get_node_light(above) or 0) < 13 then
			return
		end

		-- Look for spreading dirt-type neighbours
		local p2 = minetest.find_node_near(pos, 1, "space_travel:minerva_dirt_with_minerva_grass")
		if p2 then
			local n3 = minetest.get_node(p2)
			minetest.set_node(pos, {name = n3.name})
			return
		end

		-- Else, any seeding nodes on top?
		local name = minetest.get_node(above).name
		minetest.set_node(pos, {name = "space_travel:minerva_dirt_with_minerva_grass"})
	end
})

minetest.register_abm({
	label = "Bacchus grass spread",
	nodenames = {"space_travel:bacchus_dirt"},
	neighbors = {
		"air",
		"space_travel:bacchus_dirt_with_bacchus_grass"
	},
	interval = 6,
	chance = 50,
	catch_up = false,
	action = function(pos, node)
		-- Check for darkness: night, shadow or under a light-blocking node
		-- Returns if ignore above
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		if (minetest.get_node_light(above) or 0) < 13 then
			return
		end

		-- Look for spreading dirt-type neighbours
		local p2 = minetest.find_node_near(pos, 1, "space_travel:bacchus_dirt_with_bacchus_grass")
		if p2 then
			local n3 = minetest.get_node(p2)
			minetest.set_node(pos, {name = n3.name})
			return
		end

		-- Else, any seeding nodes on top?
		local name = minetest.get_node(above).name
		minetest.set_node(pos, {name = "space_travel:bacchus_dirt_with_bacchus_grass"})
	end
})

minetest.register_abm({
	nodenames = {"group:water"}, --{"default:water_source", "default:water_flowing"},
	neighbors = {"space_travel:cryolava_source", "space_travel:cryolava_flowing"},
	interval = 1, --0.1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node(pos, {name = "default:ice"})
	end
})

minetest.register_abm({
	nodenames = {"space_travel:venus_vapor_spout"},
	neighbors = {"vacuum:vacuum"},
	interval = 0.1, --0.1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if minetest.get_node({x = pos.x, y = pos.y + 1, z = pos.z}).name == "vacuum:vacuum" or minetest.get_node({x = pos.x, y = pos.y + 1, z = pos.z}).name == "air" then
			--Spewing particlespawner (works best if interval of ABM = 0.1)
			minetest.add_particlespawner({
				amount = 500, --1,
				time = 1, --0.1,
				minpos = {x = pos.x + 0, y = pos.y + 0.5, z = pos.z + 0},
				maxpos = {x = pos.x + 0, y = pos.y + 5, z = pos.z + 0},
				minvel = {x = pos.x + -0.2, y = pos.y + 0, z = pos.z + -0.2},
				maxvel = {x = pos.x + 0.3, y = pos.y + 0.3, z = pos.z + 0.3},
				minacc = {x = pos.x + 0, y = pos.y + 0.1, z = pos.z + 0},
				maxacc = {x = pos.x + 0, y = pos.y + 0.3, z = pos.z + 0},
				minexptime = 1,
				maxexptime = 2,
				minsize = 4, --1,
				maxsize = 10, --4,
				--attached = self.object,
				texture = "tnt_smoke.png^[colorize:#FFFF0088",
			})
		end
	end
})

minetest.register_abm({
	nodenames = {"space_travel:venus_volcano", "space_travel:io_volcano"},
	neighbors = {"vacuum:vacuum"},
	interval = 0.1, --0.1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if minetest.get_node({x = pos.x, y = pos.y + 1, z = pos.z}).name == "vacuum:vacuum" or minetest.get_node({x = pos.x, y = pos.y + 1, z = pos.z}).name == "air" then
			--Spewing particlespawner (works best if interval of ABM = 0.1)
			minetest.add_particlespawner({
				amount = 500, --1,
				time = 1, --0.1,
				minpos = {x = pos.x + 0, y = pos.y + 0.5, z = pos.z + 0},
				maxpos = {x = pos.x + 0, y = pos.y + 5, z = pos.z + 0},
				minvel = {x = pos.x + -0.2, y = pos.y + 0, z = pos.z + -0.2},
				maxvel = {x = pos.x + 0.3, y = pos.y + 0.3, z = pos.z + 0.3},
				minacc = {x = pos.x + 0, y = pos.y + 0.1, z = pos.z + 0},
				maxacc = {x = pos.x + 0, y = pos.y + 0.3, z = pos.z + 0},
				minexptime = 1,
				maxexptime = 2,
				minsize = 4, --1,
				maxsize = 10, --4,
				--attached = self.object,
				texture = "tnt_smoke.png^[colorize:#00000099",
			})
		end
	end
})

minetest.register_abm({
	nodenames = {"space_travel:titan_cryovolcano", "space_travel:space_cryovolcano", "space_travel:europa_water_geyser"},
	neighbors = {"vacuum:vacuum"},
	interval = 0.1, --0.1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if minetest.get_node({x = pos.x, y = pos.y + 1, z = pos.z}).name == "vacuum:vacuum" or minetest.get_node({x = pos.x, y = pos.y + 1, z = pos.z}).name == "air" then
			--Spewing particlespawner (works best if interval of ABM = 0.1)
			minetest.add_particlespawner({
				amount = 500, --1,
				time = 1, --0.1,
				minpos = {x = pos.x + 0, y = pos.y + 0.5, z = pos.z + 0},
				maxpos = {x = pos.x + 0, y = pos.y + 5, z = pos.z + 0},
				minvel = {x = pos.x + -0.2, y = pos.y + 0, z = pos.z + -0.2},
				maxvel = {x = pos.x + 0.3, y = pos.y + 0.3, z = pos.z + 0.3},
				minacc = {x = pos.x + 0, y = pos.y + 0.1, z = pos.z + 0},
				maxacc = {x = pos.x + 0, y = pos.y + 0.3, z = pos.z + 0},
				minexptime = 1,
				maxexptime = 2,
				minsize = 4, --1,
				maxsize = 10, --4,
				--attached = self.object,
				texture = "tnt_smoke.png^[colorize:#BCF6FF88",
			})
		end
	end
})

--Unused

--[[
--Modified code from Marssurvive
minetest.register_node("space_travel:space_rock", {
	description = "Space Rock",
	drawtype = "mesh",
	mesh = "stone1.obj",
	visual_scale = {x = 0.1, y = 0.1, z = 0.1},
	tiles = {"space_travel_space_stone.png"}, --{"default_desert_stone.png^[colorize:#cf7d67ff"},
	groups = {dig_immediate = 3, stone = 1},
	paramtype = "light",
	paramtype2 = "facedir",
	sounds = default.node_sound_stone_defaults(),
	sunlight_propagates = true,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.-0.25, 0.3}
	},
	collision_box = {
		type = "fixed",
		fixed = {{-0.3, -0.5, -0.3, 0.3, 0.-0.25, 0.3},}
	},
})

--Does not work
minetest.register_node("space_travel:artificial_gravity_generator", {
	description = "Artificial Gravity Generator",
	tiles = {"default_steel_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
	on_timer = function (pos, elapsed)
		for _, ob in ipairs(minetest.get_objects_inside_radius(pos, 6)) do
			--if ob:get_breath() ~= 11 then
			--	ob:set_breath(10)
			--end
			--ob:set_physics_override(1, 1, 1)
		end
		--minetest.get_node_timer(pos):set(0.1, 0)
		return true
	end
})
]]
