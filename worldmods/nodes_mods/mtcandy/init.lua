--Candy by Ratmonkey--


------------------------
--register sugar block--
------------------------

minetest.register_node("mtcandy:sugar_block", {
	description = "Sugarblock",
	tiles = {"mtcandy_sugar_block.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

--------------------------
--recipe for sugar block--
--------------------------

minetest.register_craft({
	output = "mtcandy:sugar_block",
	recipe = {
		{"farming:sugar" ,"farming:sugar" ,"farming:sugar"}, 
		{"farming:sugar" ,"farming:sugar" ,"farming:sugar"}, 
		{"farming:sugar" ,"farming:sugar" ,"farming:sugar"}
	}
})


--------------------
--register caramel--
--------------------

minetest.register_node("mtcandy:caramel", {
	description = "Caramel",
	tiles = {"mtcandy_caramel.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

----------------------
--recipe for caramel--
----------------------

minetest.register_craft({
	type = "cooking",
	output = "mtcandy:caramel",
	recipe = "mtcandy:sugar_block",
})


-----------------------
--register crosscandy--
-----------------------

minetest.register_node("mtcandy:crosscandy", {
	description = "Crosscandy",
	tiles = {"mtcandy_crosscandy.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

-------------------------
--recipe for crosscandy--
-------------------------

minetest.register_craft({
	output = "mtcandy:crosscandy 2",
	recipe = {
		{"dye:magenta", "mtcandy:caramel", "dye:magenta"},
		{"", "mtcandy:caramel", ""},
		{"", "", ""},
	}
})


--------------------------------
--register rectangular candies--
--------------------------------


minetest.register_node("mtcandy:candyrec_bluecyan", {
	description = "Candyrec Blue",
	tiles = {"mtcandy_candyrec_bluecyan.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mtcandy:candyrec_magenta", {
	description = "Candyrec Magenta",
	tiles = {"mtcandy_candyrec_magenta.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mtcandy:candyrec_orange", {
	description = "Candyrec Orange",
	tiles = {"mtcandy_candyrec_orange.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mtcandy:candyrec_yellow", {
	description = "Candyrec Yellow",
	tiles = {"mtcandy_candyrec_yellow.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})



----------------------------------
--recipe for rectangular candies--
----------------------------------

minetest.register_craft({
	output = "mtcandy:candyrec_bluecyan 2",
	recipe = {
		{"mtcandy:caramel", "dye:cyan", ""},
		{"dye:blue", "mtcandy:caramel", ""},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mtcandy:candyrec_magenta 2",
	recipe = {
		{"mtcandy:caramel", "dye:magenta", ""},
		{"dye:red", "mtcandy:caramel", ""},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mtcandy:candyrec_orange 2",
	recipe = {
		{"mtcandy:caramel", "dye:orange", ""},
		{"dye:red", "mtcandy:caramel", ""},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mtcandy:candyrec_yellow 2",
	recipe = {
		{"mtcandy:caramel", "dye:yellow", ""},
		{"dye:white", "mtcandy:caramel", ""},
		{"", "", ""},
	}
})


---------------------------
--register dotted candies--
---------------------------

minetest.register_node("mtcandy:dotted_green", {
	description = "Dotted Green",
	tiles = {"mtcandy_dotted_green.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mtcandy:dotted_green", {
	description = "Dotted Green",
	tiles = {"mtcandy_dotted_green.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mtcandy:dotted_red", {
	description = "Dotted Red",
	tiles = {"mtcandy_dotted_red.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mtcandy:dotted_pink", {
	description = "Dotted Pink",
	tiles = {"mtcandy_dotted_pink.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mtcandy:dotted_orange", {
	description = "Dotted Orange",
	tiles = {"mtcandy_dotted_orange.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mtcandy:dotted_yellow", {
	description = "Dotted Yellow",
	tiles = {"mtcandy_dotted_yellow.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})


-----------------------------
--recipe for dotted candies--
-----------------------------

minetest.register_craft({
	output = "mtcandy:dotted_green 2",
	recipe = {
		{"", "dye:white", ""},
		{"mtcandy:caramel", "", "mtcandy:caramel"},
		{"", "dye:green", ""},
	}
})

minetest.register_craft({
	output = "mtcandy:dotted_red 2",
	recipe = {
		{"", "dye:white", ""},
		{"mtcandy:caramel", "", "mtcandy:caramel"},
		{"", "dye:red", ""},
	}
})

minetest.register_craft({
	output = "mtcandy:dotted_pink 2",
	recipe = {
		{"", "dye:white", ""},
		{"mtcandy:caramel", "", "mtcandy:caramel"},
		{"", "dye:pink", ""},
	}
})

minetest.register_craft({
	output = "mtcandy:dotted_orange 2",
	recipe = {
		{"", "dye:white", ""},
		{"mtcandy:caramel", "", "mtcandy:caramel"},
		{"", "dye:orange", ""},
	}
})

minetest.register_craft({
	output = "mtcandy:dotted_yellow 2",
	recipe = {
		{"", "dye:white", ""},
		{"mtcandy:caramel", "", "mtcandy:caramel"},
		{"", "dye:yellow", ""},
	}
})


------------------------
--register peppermints--
------------------------

minetest.register_node("mtcandy:peppermint", {
	description = "Peppermint",
	tiles = {"mtcandy_peppermint_top.png", "mtcandy_peppermint_top.png", "mtcandy_peppermint_side.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("mtcandy:peppermint_red", {
	description = "Peppermint Red",
	tiles = {"mtcandy_peppermint_red.png", "mtcandy_peppermint_red_bott.png", "mtcandy_peppermint_red_side.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mtcandy:peppermint_cyan_top", {
	description = "Peppermint Cyan",
	tiles = {"mtcandy_peppermint_cyan_top.png", "mtcandy_peppermint_cyan_bott.png", "mtcandy_peppermint_cyan_side.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mtcandy:peppermint_green_top", {
	description = "Peppermint Green",
	tiles = {"mtcandy_peppermint_green_top.png", "mtcandy_peppermint_green_bott.png", "mtcandy_peppermint_green_side.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mtcandy:peppermint_magenta_top", {
	description = "Peppermint Magenta",
	tiles = {"mtcandy_peppermint_magenta_top.png", "mtcandy_peppermint_magenta_bott.png", "mtcandy_peppermint_magenta_side.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mtcandy:peppermint_orange_top", {
	description = "Peppermint Orange",
	tiles = {"mtcandy_peppermint_orange_top.png", "mtcandy_peppermint_orange_bott.png", "mtcandy_peppermint_orange_side.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mtcandy:peppermint_yellow_top", {
	description = "Peppermint Yellow",
	tiles = {"mtcandy_peppermint_yellow_top.png", "mtcandy_peppermint_yellow_bott.png", "mtcandy_peppermint_yellow_side.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})


--------------------------
--recipe for peppermints--
--------------------------

minetest.register_craft({
	output = "mtcandy:peppermint 3",
	recipe = {
		{"", "dye:magenta", ""},
		{"mtcandy:caramel", "mtcandy:caramel", "mtcandy:caramel"},
		{"dye:white", "", "dye:white"},
	}
})

minetest.register_craft({
	output = "mtcandy:peppermint_red 3",
	recipe = {
		{"", "dye:white", ""},
		{"mtcandy:caramel", "mtcandy:caramel", "mtcandy:caramel"},
		{"dye:red", "", "dye:red"},
	}
})

minetest.register_craft({
	output = "mtcandy:peppermint_cyan_top 3",
	recipe = {
		{"", "dye:yellow", ""},
		{"mtcandy:caramel", "mtcandy:caramel", "mtcandy:caramel"},
		{"dye:cyan", "", "dye:cyan"},
	}
})

minetest.register_craft({
	output = "mtcandy:peppermint_green_top 3",
	recipe = {
		{"", "dye:magenta", ""},
		{"mtcandy:caramel", "mtcandy:caramel", "mtcandy:caramel"},
		{"dye:green", "", "dye:green"},
	}
})

minetest.register_craft({
	output = "mtcandy:peppermint_magenta_top 3",
	recipe = {
		{"", "dye:blue", ""},
		{"mtcandy:caramel", "mtcandy:caramel", "mtcandy:caramel"},
		{"dye:magenta", "", "dye:magenta"},
	}
})

minetest.register_craft({
	output = "mtcandy:peppermint_orange_top 3",
	recipe = {
		{"", "dye:violet", ""},
		{"mtcandy:caramel", "mtcandy:caramel", "mtcandy:caramel"},
		{"dye:orange", "", "dye:orange"},
	}
})

minetest.register_craft({
	output = "mtcandy:peppermint_yellow_top 3",
	recipe = {
		{"", "dye:magenta", ""},
		{"mtcandy:caramel", "mtcandy:caramel", "mtcandy:caramel"},
		{"dye:yellow", "", "dye:yellow"},
	}
})


---------------------------
--register spiral candies--
---------------------------

minetest.register_node("mtcandy:spiral_blue", {
	description = "Spiral Blue",
	tiles = {"mtcandy_spiral_blue.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mtcandy:spiral_purple", {
	description = "Spiral Purple",
	tiles = {"mtcandy_spiral_purple.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mtcandy:spiral_yellow", {
	description = "Spiral Yellow",
	tiles = {"mtcandy_spiral_yellow.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})


-----------------------------
--recipe for spiral candies--
-----------------------------

minetest.register_craft({
	output = "mtcandy:spiral_blue",
	recipe = {
		{"dye:cyan", "", "dye:blue 2"},
		{"", "mtcandy:caramel", ""},
		{"", "mtcandy:caramel", ""},
	}
})

minetest.register_craft({
	output = "mtcandy:spiral_purple 2",
	recipe = {
		{"dye:violet", "", "dye:pink"},
		{"", "mtcandy:caramel", ""},
		{"", "mtcandy:caramel", ""},
	}
})

minetest.register_craft({
	output = "mtcandy:spiral_yellow 2",
	recipe = {
		{"dye:yellow", "", "dye:green"},
		{"", "mtcandy:caramel", ""},
		{"", "mtcandy:caramel", ""},
	}
})


---------------------------
--register stiped candies--
---------------------------

minetest.register_node("mtcandy:striped_pink_brown", {
	description = "Striped Pink Brown",
	tiles = {"mtcandy_striped_pink_brown.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mtcandy:striped_pink_white", {
	description = "Striped Pink White",
	tiles = {"mtcandy_striped_pink_white.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mtcandy:striped_pink_yellow", {
	description = "Striped Pink Yellow",
	tiles = {"mtcandy_striped_pink_yellow.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mtcandy:striped_purple_green", {
	description = "Striped Purple Green",
	tiles = {"mtcandy_striped_purple_green.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mtcandy:striped_lime_green", {
	description = "Striped Lime Green",
	tiles = {"mtcandy_striped_lime_green.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})


-----------------------------
--recipe for stiped candies--
-----------------------------

minetest.register_craft({
	output = "mtcandy:striped_pink_brown 3",
	recipe = {
		{"dye:brown", "dye:pink", "dye:brown"},
		{"mtcandy:caramel", "mtcandy:caramel", "mtcandy:caramel"},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mtcandy:striped_pink_white 3",
	recipe = {
		{"dye:white", "dye:pink", "dye:white"},
		{"mtcandy:caramel", "mtcandy:caramel", "mtcandy:caramel"},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mtcandy:striped_pink_yellow 3",
	recipe = {
		{"dye:yellow", "dye:pink", "dye:yellow"},
		{"mtcandy:caramel", "mtcandy:caramel", "mtcandy:caramel"},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mtcandy:striped_purple_green 3",
	recipe = {
		{"dye:cyan", "dye:green", "dye:cyan"},
		{"mtcandy:caramel", "mtcandy:caramel", "mtcandy:caramel"},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mtcandy:striped_lime_green 3",
	recipe = {
		{"dye:green", "dye:white", "dye:green"},
		{"mtcandy:caramel", "mtcandy:caramel", "mtcandy:caramel"},
		{"", "", ""},
	}
})


------------------------------
--register chocolate candies--
------------------------------

minetest.register_node("mtcandy:milk_choco", {
	description = "Milk Chocolate",
	tiles = {"mtcandy_milk_choco.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mtcandy:white_choco", {
	description = "White Chocolate",
	tiles = {"mtcandy_white_choco.png"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})


--------------------------------
--recipe for chocolate candies--
--------------------------------

minetest.register_craft({
	output = "mtcandy:milk_choco 2",
	recipe = {
		{"farming:chocolate_dark", "farming:chocolate_dark", ""},
		{"mtcandy:caramel", "mtcandy:caramel", ""},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mtcandy:white_choco 2",
	recipe = {
		{"farming:sugar", "dye:white", ""},
		{"mtcandy:milk_choco", "mtcandy:milk_choco", ""},
		{"", "", ""},
	}
})


----------------------------
--register special candies--
----------------------------

minetest.register_node("mtcandy:orange", {
	description = "orange",
	tiles = {"mtcandy_orange.png"},
	light_source = 10,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mtcandy:pcorn_side", {
	description = "Popcorn Bucket",
	tiles = {"mtcandy_pcorn_top.png", "mtcandy_pcorn_bott.png", "mtcandy_pcorn_side.png"},
	light_source = 10,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mtcandy:daisy", {
	description = "daisy",
	tiles = {"mtcandy_daisy.png"},
	light_source = 10,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mtcandy:heart_candy", {
	description = "Heart Candy",
	tiles = {"mtcandy_heart_candy.png"},
	light_source = 10,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("mtcandy:emenems", {
	description = "m & m",
	tiles = {"mtcandy_emenems.png"},
	light_source = 10,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})


-------------------------------
--recipes for special candies--
-------------------------------

minetest.register_craft({
	output = "mtcandy:orange 3",
	recipe = {
		{"mtcandy:caramel", "default:torch", "dye:orange"},
		{"dye:yellow", "default:torch", "mtcandy:caramel"},
		{"mtcandy:caramel", "default:torch", "dye:orange"},
	}
})

minetest.register_craft({
	output = "mtcandy:pcorn_side 3",
	recipe = {
		{"mtcandy:caramel", "default:torch", "dye:red"},
		{"dye:yellow", "default:torch", "mtcandy:caramel"},
		{"mtcandy:caramel", "default:torch", "dye:white"},
	}
})

minetest.register_craft({
	output = "mtcandy:daisy 3",
	recipe = {
		{"mtcandy:caramel", "default:torch", "dye:yellow"},
		{"dye:violet", "default:torch", "mtcandy:caramel"},
		{"mtcandy:caramel", "default:torch", "dye:white"},
	}
})

minetest.register_craft({
	output = "mtcandy:heart_candy 3",
	recipe = {
		{"mtcandy:caramel", "default:torch", "dye:red"},
		{"dye:yellow", "default:torch", "mtcandy:caramel"},
		{"mtcandy:caramel", "default:torch", "dye:orange"},
	}
})

minetest.register_craft({
	output = "mtcandy:emenems 3",
	recipe = {
		{"mtcandy:caramel", "default:torch", "dye:yellow"},
		{"dye:brown", "default:torch", "mtcandy:caramel"},
		{"mtcandy:caramel", "default:torch", "dye:magenta"},
	}
})


