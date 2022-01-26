-- welcome to the Sky Tools mod!

minetest.register_node("sky_tools:ore", {
	description = "Sky Ore",
	tiles = {"default_stone.png^sky_crystal_ore_raw.png"},
	groups = {cracky = 1, stone = 1},
	drop = 'sky_tools:rawcrystal',
	light_source = 7,
	paramtype = "light",

})

minetest.register_craftitem("sky_tools:rawcrystal", {
	description = "Unrefined Sky Crystal",
	inventory_image = "sky_crystal_ore_raw.png",


})

minetest.register_craftitem("sky_tools:crystal", {
	description = "Refined Sky Crystal",
	inventory_image = "sky_crystal_ore.png",


})

minetest.register_craft({
	type = "cooking",
	output = "sky_tools:crystal",
	recipe = "sky_tools:rawcrystal",
})


minetest.register_tool("sky_tools:sword", {
	description = "Sky Sword",
	inventory_image = "sky_sword.png",
	tool_capabilities = {
		full_punch_interval = 0.6,
		max_drop_level=2,
		groupcaps={
			snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=9},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("sky_tools:pickaxe", {
	description = "Sky Pickaxe",
	inventory_image = "sky_pickaxe.png",
	tool_capabilities = {
		full_punch_interval = 0.3,
		max_drop_level=7,
		groupcaps={
			cracky = {times={[1]=1.0, [2]=0.50, [3]=0.25}, uses=99, maxlevel=4},
		},
		damage_groups = {fleshy=9},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("sky_tools:shovel", {
	description = "Sky Shovel",
	inventory_image = "sky_shovel.png",
	wield_image = "sky_shovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=0.40, [2]=0.30, [3]=0.10}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("sky_tools:axe", {
	description = "Sky Axe",
	inventory_image = "sky_axe.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=1.5, [2]=0.70, [3]=0.20}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
})

-- minetest.register_ore({
-- 		ore_type       = "scatter",
-- 		ore            = "sky_tools:ore",
-- 		wherein        = "default:stone",
-- 		clust_scarcity = 9 * 9 * 9,
-- 		clust_num_ores = 2,
-- 		clust_size     = 1,
-- 		y_min          = -255,
-- 		y_max          = -128,

-- 	})

minetest.register_craft({
    type = "cooking",
	output = 'sky_tools:rawcrystal',
	recipe = "quartz:quartz_crystal_piece"
})

minetest.register_craft({
	output = 'sky_tools:sword',
	recipe = {
		{'', 'sky_tools:crystal', ''},
		{'', 'sky_tools:crystal', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'sky_tools:pickaxe',
	recipe = {
		{'sky_tools:crystal', 'sky_tools:crystal', 'sky_tools:crystal'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'sky_tools:axe',
	recipe = {
		{'sky_tools:crystal', 'sky_tools:crystal', ''},
		{'sky_tools:crystal', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'sky_tools:shovel',
	recipe = {
		{'', 'sky_tools:crystal', ''},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

-- repair recipes

minetest.register_craft({
	output = 'sky_tools:shovel',
	recipe = {
		{'sky_tools:shovel', 'sky_tools:crystal', ''},
		{'', '', ''},
		{'', '', ''},
	}
})

minetest.register_craft({
	output = 'sky_tools:sword',
	recipe = {
		{'sky_tools:sword', 'sky_tools:crystal', ''},
		{'', '', ''},
		{'', '', ''},
	}
})

minetest.register_craft({
	output = 'sky_tools:pickaxe',
	recipe = {
		{'sky_tools:pickaxe', 'sky_tools:crystal', ''},
		{'', '', ''},
		{'', '', ''},
	}
})

minetest.register_craft({
	output = 'sky_tools:axe',
	recipe = {
		{'sky_tools:axe', 'sky_tools:crystal', ''},
		{'', '', ''},
		{'', '', ''},
	}
})













