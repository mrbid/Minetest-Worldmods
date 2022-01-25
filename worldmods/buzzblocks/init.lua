-- Minetest 0.4.16: buzzblocks  18/3/2020

--data tables definitions
buzzblocks={}

modpath=minetest.get_modpath("buzzblocks")

-- Load support for intllib.
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

local step = 1.1

local enable_built_in = true


if enable_built_in then --this is the first open IF


--decorative nodes (copied and modded from Vehicles mod)

if minetest.settings:get("buzzblocks_nodes") == nil then
minetest.settings:set("buzzblocks_nodes", "true")
end



if minetest.settings:get("buzzblocks_nodes") then --this is the second open IF


function buzzblocks.register_simplenode(name, desc, texture, light)
minetest.register_node("buzzblocks:"..name, {
	description = desc,
	tiles = {texture},
	groups = {cracky=1},
	paramtype2 = "facedir",
	light_source = light,
	-- sound = default.node_sound_stone_defaults(), -- FIX THIS AT A LATER DATE
})
end--function buzzblocks.register_simplenode(name, desc, texture, light)


--
-- single colour blocks with slight darker edges
--
buzzblocks.register_simplenode("block_blue", S("block_blue"), "block_blue.png", 0)
buzzblocks.register_simplenode("block_green", S("block_green"), "block_green.png", 0)
buzzblocks.register_simplenode("block_magenta", S("block_magenta"), "block_magenta.png", 0)
buzzblocks.register_simplenode("block_orange", S("block_orange"), "block_orange.png", 0)
buzzblocks.register_simplenode("block_purple", S("block_purple"), "block_purple.png", 0)
buzzblocks.register_simplenode("block_red", S("block_red"), "block_red.png", 0)
buzzblocks.register_simplenode("block_yellow", S("block_yellow"), "block_yellow.png", 0)
buzzblocks.register_simplenode("block_grey", S("block_grey"), "block_grey.png", 0)
buzzblocks.register_simplenode("block_darkgrey", S("block_darkgrey"), "block_darkgrey.png", 0)
buzzblocks.register_simplenode("block_uranium", S("block of uranium"), "block_uranium.png", 5) --slightly altered green with a bit of a glow
--
-- light speckled wallpapers / mad pattern carpets / decos 
--
buzzblocks.register_simplenode("wp_lightblue", S("wp light blue"), "wp_lightblue.png", 0)
buzzblocks.register_simplenode("wp_lightgreen", S("wp light green"), "wp_lightgreen.png", 0)
buzzblocks.register_simplenode("wp_peach", S("wp peach"), "wp_peach.png", 0)
buzzblocks.register_simplenode("wp_purple", S("wp purple"), "wp_purple.png", 0)
buzzblocks.register_simplenode("wp_red", S("wp red"), "wp_red.png", 0)
buzzblocks.register_simplenode("wp_trippy", S("wp trippy"), "wp_trippy.png", 0) -- so many colours
buzzblocks.register_simplenode("wp_yellow", S("wp yellow"), "wp_yellow.png", 0)
buzzblocks.register_simplenode("wp_dark", S("wp dark"), "wp_dark.png", 0) -- charcoal and black patterned
buzzblocks.register_simplenode("wp_green_red", S("wp green/red"), "wp_green_red.png", 0) -- weird patterns, rotate to make weirder
buzzblocks.register_simplenode("wp_purple_blue", S("wp purple/blue"), "wp_purple_blue.png", 0) -- like above
--
-- aspen wood from original game, stained/coloured variations
--
buzzblocks.register_simplenode("aspen_pink", S("aspen_pink"), "aspen_pink.png", 0)
buzzblocks.register_simplenode("aspen_blue", S("aspen_blue"), "aspen_blue.png", 0)
buzzblocks.register_simplenode("aspen_green", S("aspen_green"), "aspen_green.png", 0)
buzzblocks.register_simplenode("aspen_yellow", S("aspen_yellow"), "aspen_yellow.png", 0)
buzzblocks.register_simplenode("aspen_orange", S("aspen_orange"), "aspen_orange.png", 0)
buzzblocks.register_simplenode("aspen_plum", S("aspen_plum"), "aspen_plum.png", 0)
buzzblocks.register_simplenode("aspen_orange2", S("aspen_orange2"), "aspen_orange2.png", 0)
buzzblocks.register_simplenode("aspen_plum2", S("aspen_plum2"), "aspen_plum2.png", 0)
buzzblocks.register_simplenode("aspen_grey", S("aspen_grey"), "aspen_grey.png", 0)
buzzblocks.register_simplenode("aspen_darkgrey", S("aspen_darkgrey"), "aspen_darkgrey.png", 0)
buzzblocks.register_simplenode("aspen_plum3", S("aspen_plum3"), "aspen_plum3.png", 0) 
buzzblocks.register_simplenode("aspen_red", S("aspen_red"), "aspen_red.png", 0)
buzzblocks.register_simplenode("aspen_red2", S("aspen_red2"), "aspen_red2.png", 0)
--
-- random decorative blocks
--
buzzblocks.register_simplenode("star_red", S("star_red"), "star_red.png", 0)
buzzblocks.register_simplenode("star_green", S("star_green"), "star_green.png", 0)
buzzblocks.register_simplenode("radiation", S("radiation"), "radiation.png", 5) -- half light to make it stand out more in the dark
buzzblocks.register_simplenode("alien_blue", S("alien_blue"), "alien_blue.png", 0)
buzzblocks.register_simplenode("alien_green", S("alien_green"), "alien_green.png", 0)
buzzblocks.register_simplenode("alien_purple", S("alien_purple"), "alien_purple.png", 0)
buzzblocks.register_simplenode("alien_nyan", S("alien_nyan"), "alien_nyan.png", 0)
buzzblocks.register_simplenode("ace_aged", S("Ace block (aged)"), "ace_aged.png", 0) -- poster turned into simple nodes to see how they look
buzzblocks.register_simplenode("ace_gold", S("Ace block (gold)"), "ace_gold_yellow.png", 10) -- looks cooler with light
--
-- more random blocks (the first few blocks when i started this mod) THIS SECTION TO BE REDONE OR DELETED
--
buzzblocks.register_simplenode("smooth_grey", S("smooth grey wall"), "smooth_grey.png", 0)
buzzblocks.register_simplenode("smooth_grey_light", S("luminous grey wall"), "smooth_grey.png", 5)
buzzblocks.register_simplenode("dim_white_light", S("dim white light"), "white_grey_spot.png", 5)
buzzblocks.register_simplenode("bright_white_light", S("bright white light"), "white_grey_spot.png", 10)
buzzblocks.register_simplenode("red_orange_mix", S("red-orange mix"), "red_orange_mix.png", 0) -- very bright carpet
buzzblocks.register_simplenode("red_orange_mix2", S("red-orange mix2"), "red_orange_mix2.png", 0)
--
-- posters
--
minetest.register_node("buzzblocks:poster1", {
	description = S("Buzz"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"buzz48.png",},
	inventory_image = "buzz48.png",
	use_texture_alpha = true,
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,	
	--light_source = 14,
	walkable = false,
	is_ground_content = true,
    selection_box = {
		type = "wallmounted",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}
	},
	groups = {cracky=3,dig_immediate=3},
})

minetest.register_node("buzzblocks:poster2", {
	description = S("Buzzard"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"buzzard48.png",},
	inventory_image = "buzzard48.png",
	use_texture_alpha = true,
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,	
	--light_source = 14,
	walkable = false,
	is_ground_content = true,
    selection_box = {
		type = "wallmounted",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}
	},
	groups = {cracky=3,dig_immediate=3},
})

minetest.register_node("buzzblocks:poster3", {
	description = S("Ace Of Spades (gold)"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"ace_gold_yellow.png",},
	inventory_image = "ace_gold_yellow.png",
	use_texture_alpha = true,
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,	
	--light_source = 14,
	walkable = false,
	is_ground_content = true,
    selection_box = {
		type = "wallmounted",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}
	},
	groups = {cracky=3,dig_immediate=3},
})

minetest.register_node("buzzblocks:poster4", {
	description = S("Ace Of Spades (aged)"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"ace_aged.png",},
	inventory_image = "ace_aged.png",
	use_texture_alpha = true,
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,	
	--light_source = 14,
	walkable = false,
	is_ground_content = true,
    selection_box = {
		type = "wallmounted",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}
	},
	groups = {cracky=3,dig_immediate=3},
})


end--if minetest.setting_get("buzzblocks_nodes") then

end--if enable_built_in then

--core.register_node("craftguide:sign", {
--		description = S"Crafting Guide Sign",
--		drawtype = "nodebox",
--		tiles = {PNG.sign},
--		inventory_image = PNG.sign,
--		wield_image = PNG.sign,
--		paramtype = "light",
--		paramtype2 = "wallmounted",
--		sunlight_propagates = true,
--		groups = {oddly_breakable_by_hand = 1, flammable = 3},
--		node_box = {
--			type = "wallmounted",
--			wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
--			wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
--			wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5}
--		},
