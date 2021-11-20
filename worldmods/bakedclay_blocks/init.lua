
-- original code from Baked Clay mod by TenPlus1
---Licensed: MIT     Copyright (c) 2016 TenPlus1

local clay = {
	{"white", "White"},
	{"grey", "Grey"},
	{"black", "Black"},
	{"red", "Red"},
	{"yellow", "Yellow"},
	{"green", "Green"},
	{"cyan", "Cyan"},
	{"blue", "Blue"},
	{"magenta", "Magenta"},
	{"orange", "Orange"},
	{"violet", "Violet"},
	{"brown", "Brown"},
	{"pink", "Pink"},
	{"dark_grey", "Dark Grey"},
	{"dark_green", "Dark Green"},
}

for _, clay in pairs(clay) do

--baked clay blocks
	minetest.register_node("bakedclay_blocks:" .. clay[1] .. "block", {
		description = clay[2] .. " Baked Clay Block",
		tiles = {"baked_clay_" .. clay[1] ..".png^bakedclay_block.png"},
		is_ground_content = false,
		groups = {cracky = 3, oddly_breakable_by_hand = 2},
		sounds = default.node_sound_stone_defaults(),
	})

	minetest.register_craft({
		output = "bakedclay_blocks:" .. clay[1] .. "block",
		recipe = {
			{"bakedclay:" .. clay[1],"bakedclay:" .. clay[1], "bakedclay:" .. clay[1]},
			{"bakedclay:" .. clay[1],"bakedclay:" .. clay[1], "bakedclay:" .. clay[1]},
			{"bakedclay:" .. clay[1],"bakedclay:" .. clay[1], "bakedclay:" .. clay[1]},
		},
	})

--reverse recipe
	minetest.register_craft({
		output = "bakedclay:" .. clay[1] .. " 9",
		recipe = {
			{"bakedclay_blocks:" .. clay[1] .. "block",}
		},
	})

--baked clay stacked blockslabs
	minetest.register_node("bakedclay_blocks:" .. clay[1] .. "blockslab_stacked", {
		description = clay[2] .. " Baked Clay Block Slabs",
		tiles = {
		"baked_clay_" .. clay[1] ..".png^bakedclay_block.png",
		"baked_clay_" .. clay[1] ..".png^bakedclay_block.png",
		"baked_clay_" .. clay[1] ..".png^bakedclay_block_slab.png"},
		paramtype2 = "facedir",
		place_param2 = 0,
		is_ground_content = false,
		groups = {cracky = 3, oddly_breakable_by_hand = 2},
		sounds = default.node_sound_stone_defaults(),
	})

	minetest.register_craft({
		output = "bakedclay_blocks:" .. clay[1] .. "blockslab_stacked 2",
		recipe = {
			{"stairs:slab_bakedclay_blocks_".. clay[1] .. "block", "", "stairs:slab_bakedclay_blocks_".. clay[1] .. "block"},
			{"","", ""},
			{"stairs:slab_bakedclay_blocks_".. clay[1] .. "block", "", "stairs:slab_bakedclay_blocks_".. clay[1] .. "block"},
		},
	})

--reverse recipe
	minetest.register_craft({
		output = "stairs:slab_bakedclay_blocks_".. clay[1] .. "block 2",
		recipe = {
			{"bakedclay_blocks:" .. clay[1] .. "blockslab_stacked"},
		},
	})

--baked clay bricks
	minetest.register_node("bakedclay_blocks:" .. clay[1] .. "brick", {
		description = clay[2] .. " Baked Clay Brick",
		tiles = {"baked_clay_" .. clay[1] ..".png^bakedclay_block.png", 
		"baked_clay_" .. clay[1] ..".png^bakedclay_brick.png"},
		paramtype2 = "facedir",
		place_param2 = 0,
		is_ground_content = false,
		groups = {cracky = 3, oddly_breakable_by_hand = 2},
		sounds = default.node_sound_stone_defaults(),
	})

	minetest.register_craft({
		output = "bakedclay_blocks:" .. clay[1] .. "brick 4",
		recipe = {
			{"bakedclay:" .. clay[1], "bakedclay:" .. clay[1]},
			{"bakedclay:" .. clay[1], "bakedclay:" .. clay[1]},
		},
	})


-- register stairs
	if minetest.global_exists("stairs") then

		stairs.register_stair_and_slab("bakedclay_blocks_".. clay[1] .. "block", "bakedclay_blocks:".. clay[1] .."block",
		{cracky = 3, oddly_breakable_by_hand = 2},
		{"baked_clay_" .. clay[1] ..".png^bakedclay_block.png"},
		clay[2] .. " Baked Clay Block Stair",
		clay[2] .. " Baked Clay Block Slab",
		default.node_sound_stone_defaults())


		stairs.register_stair_and_slab("bakedclay_blocks_".. clay[1] .. "brick", "bakedclay_blocks:".. clay[1] .."brick",
		{cracky = 3, oddly_breakable_by_hand = 2},
		{"baked_clay_" .. clay[1] ..".png^bakedclay_brick.png"},
		clay[2] .. " Baked Clay Brick Stair",
		clay[2] .. " Baked Clay Brick Slab",
		default.node_sound_stone_defaults())
	end
end
