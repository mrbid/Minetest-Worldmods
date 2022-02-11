--[[
Coloured Glass by JBR
Code License: CC0
Texture License: CC BY-SA 3.0
--]]

dofile(minetest.get_modpath("colouredglass").."/craft.lua")

minetest.register_node("colouredglass:black", {
	description = "Black Glass",
	drawtype = "glasslike",
	tiles = {"blackglass.png"},
	paramtype = "light",
	use_texture_alpha = true,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky=3,oddly_breakable_by_hand=3},
})
minetest.register_node("colouredglass:blue", {
	description = "Blue Glass",
	drawtype = "glasslike",
	tiles = {"blueglass.png"},
	paramtype = "light",
	use_texture_alpha = true,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky=3,oddly_breakable_by_hand=3},
})
minetest.register_node("colouredglass:darkblue", {
	description = "Dark Blue Glass",
	drawtype = "glasslike",
	tiles = {"darkblueglass.png"},
	paramtype = "light",
	use_texture_alpha = true,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky=3,oddly_breakable_by_hand=3},
})
minetest.register_node("colouredglass:green", {
	description = "Green Glass",
	drawtype = "glasslike",
	tiles = {"greenglass.png"},
	paramtype = "light",
	use_texture_alpha = true,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky=3,oddly_breakable_by_hand=3},
})
minetest.register_node("colouredglass:orange", {
	description = "Orange Glass",
	drawtype = "glasslike",
	tiles = {"orangeglass.png"},
	paramtype = "light",
	use_texture_alpha = true,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky=3,oddly_breakable_by_hand=3},
})
minetest.register_node("colouredglass:pink", {
	description = "Pink Glass",
	drawtype = "glasslike",
	tiles = {"pinkglass.png"},
	paramtype = "light",
	use_texture_alpha = true,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky=3,oddly_breakable_by_hand=3},
})
minetest.register_node("colouredglass:purple", {
	description = "Purple Glass",
	drawtype = "glasslike",
	tiles = {"purpleglass.png"},
	paramtype = "light",
	use_texture_alpha = true,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky=3,oddly_breakable_by_hand=3},
})
minetest.register_node("colouredglass:red", {
	description = "Red Glass",
	drawtype = "glasslike",
	tiles = {"redglass.png"},
	paramtype = "light",
	use_texture_alpha = true,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky=3,oddly_breakable_by_hand=3},
})
minetest.register_node("colouredglass:white", {
	description = "White Glass",
	drawtype = "glasslike",
	tiles = {"whiteglass.png"},
	paramtype = "light",
	use_texture_alpha = true,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky=3,oddly_breakable_by_hand=3},
})
minetest.register_node("colouredglass:yellow", {
	description = "Yellow Glass",
	drawtype = "glasslike",
	tiles = {"yellowglass.png"},
	paramtype = "light",
	use_texture_alpha = true,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky=3,oddly_breakable_by_hand=3},
})