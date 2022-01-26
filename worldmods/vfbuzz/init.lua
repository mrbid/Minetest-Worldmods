-- Buzzblocks 18th March 2020
--
-- Revamped, renamed VFBUZZ 25th January 2022
-- v1.0 - 26 Jan 2022 - 19 simple nodes. 48 posters, 1 commented out. 3 posters with transparency issues, to fix in later version.
--


--data tables definitions
vfbuzz={}

modpath=minetest.get_modpath("vfbuzz")

-- Load support for intllib.
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

local step = 1.1

local enable_built_in = true


if enable_built_in then --this is the first open IF statement


--decorative nodes [this little section copied from Vehicles mod]

if minetest.settings:get("vfbuzz_nodes") == nil then
minetest.settings:set("vfbuzz_nodes", "true")
end



if minetest.settings:get("vfbuzz_nodes") then --this is the second open IF statement


function vfbuzz.register_simplenode(name, desc, texture, light)
minetest.register_node("vfbuzz:"..name, {
	description = desc,
	tiles = {texture},
	groups = {cracky=1},
	paramtype2 = "facedir",
	light_source = light,
	-- sound = default.node_sound_stone_defaults(), -- FIX THIS AT A LATER DATE
})
end--function vfbuzz.register_simplenode(name, desc, texture, light)






--
-- light speckled wallpapers / mad pattern carpets / decos 
--
vfbuzz.register_simplenode("wp_lightblue", S("wp light blue"), "wp_lightblue.png", 0)
vfbuzz.register_simplenode("wp_lightgreen", S("wp light green"), "wp_lightgreen.png", 0)
vfbuzz.register_simplenode("wp_peach", S("wp peach"), "wp_peach.png", 0)
vfbuzz.register_simplenode("wp_purple", S("wp purple"), "wp_purple.png", 0)
vfbuzz.register_simplenode("wp_red", S("wp red"), "wp_red.png", 0)
vfbuzz.register_simplenode("wp_trippy", S("wp trippy"), "wp_trippy.png", 0) -- so many colours
vfbuzz.register_simplenode("wp_yellow", S("wp yellow"), "wp_yellow.png", 0)
vfbuzz.register_simplenode("wp_dark", S("wp dark"), "wp_dark.png", 0) -- charcoal and black patterned
vfbuzz.register_simplenode("wp_green_red", S("wp green/red"), "wp_green_red.png", 0) -- weird patterns, rotate to make weirder
vfbuzz.register_simplenode("wp_purple_blue", S("wp purple/blue"), "wp_purple_blue.png", 0) -- like above

--
-- random decorative blocks
--
vfbuzz.register_simplenode("star_red", S("star_red"), "star_red.png", 0)
vfbuzz.register_simplenode("star_green", S("star_green"), "star_green.png", 0)
vfbuzz.register_simplenode("radiation", S("radiation"), "radiation.png", 5) -- half light to make it stand out more in the dark
vfbuzz.register_simplenode("alien_blue", S("alien_blue"), "alien_blue.png", 0)
vfbuzz.register_simplenode("alien_green", S("alien_green"), "alien_green.png", 0)
vfbuzz.register_simplenode("alien_purple", S("alien_purple"), "alien_purple.png", 0)
vfbuzz.register_simplenode("alien_nyan", S("alien_nyan"), "alien_nyan.png", 0)
vfbuzz.register_simplenode("ace_aged", S("Ace block (aged)"), "ace_aged.png", 0) -- poster turned into simple nodes to see how they look
vfbuzz.register_simplenode("ace_gold", S("Ace block (gold)"), "ace_gold_yellow.png", 10) -- looks cooler with light






--
------------------- POSTERS SECTION ---------------------
--
--
-- 1xx random, 2xx music, 3xx HawkArt, 4xx VF, 5xx animal, 6xx cartoon, 7xx nature, 8xx movies, 9xx gamers/anime/manga
--
--
--


-------------------------------------------------------------------
------------------------------------------------------------------- random posters - vfbuzz:poster1xx
-------------------------------------------------------------------

minetest.register_node("vfbuzz:poster101", {
	description = S("Messy Lo-Fi Spiral 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"buzz_48.png",},
	inventory_image = "buzz_48.png",
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

minetest.register_node("vfbuzz:poster102", {
	description = S("Trollolol 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"troll_256.png",},
	inventory_image = "troll_256.png",
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

--103

minetest.register_node("vfbuzz:poster104", {
	description = S("Floppy Disk 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"floppy_256.png",},
	inventory_image = "floppy_256.png",
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

--105

minetest.register_node("vfbuzz:poster106", {
	description = S("Red Eye 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"eye1_256.png",},
	inventory_image = "eye1_256.png",
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

-------------------------------------------------------------------
------------------------------------------------------------------- music posters - vfbuzz:poster2xx
-------------------------------------------------------------------

minetest.register_node("vfbuzz:poster201", {
	description = S("Ace Of Spades Lo-Fi Gold 3x3"),
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

minetest.register_node("vfbuzz:poster202", {
	description = S("Ace Of Spades Lo-Fi Aged 3x3"),
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

minetest.register_node("vfbuzz:poster203", {
	description = S("Ace Of Spades Lo-Fi RedGold 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"ace_gold_48.png",},
	inventory_image = "ace_gold_48.png",
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

minetest.register_node("vfbuzz:poster204", {
	description = S("Tha Dogg 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"snoop_256.png",},
	inventory_image = "snoop_256.png",
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

minetest.register_node("vfbuzz:poster205", {
	description = S("Guitarist 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"guitarist_256.png",},
	inventory_image = "guitarist_256.png",
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

-------------------------------------------------------------------
------------------------------------------------------------------- HawkArt posters - vfbuzz:poster3xx
-------------------------------------------------------------------

minetest.register_node("vfbuzz:poster301", {
	description = S("Hawk Mountain 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"hm2.png",},
	inventory_image = "hm2.png",
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

minetest.register_node("vfbuzz:poster302", {
	description = S("Hawk Mountain 5x5"),
	drawtype = "signlike",
	visual_scale = 5.0,
	tiles = {"hm2.png",},
	inventory_image = "hm2.png",
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

minetest.register_node("vfbuzz:poster303", {
	description = S("Hawk Mountain 7x7"),
	drawtype = "signlike",
	visual_scale = 7.0,
	tiles = {"hm2.png",},
	inventory_image = "hm2.png",
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

-------------------------------------------------------------------
------------------------------------------------------------------- VF posters - vfbuzz:poster4xx
-------------------------------------------------------------------

minetest.register_node("vfbuzz:poster401", {
	description = S("VF Logo 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"vf_320.png",},
	inventory_image = "vf_320.png",
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

minetest.register_node("vfbuzz:poster402", {
	description = S("VF Logo 5x5"),
	drawtype = "signlike",
	visual_scale = 5.0,
	tiles = {"vf_320.png",},
	inventory_image = "vf_320.png",
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

-- minetest.register_node("vfbuzz:poster403", {
--	description = S("VF Logo 7x7"),
--	drawtype = "signlike",
--	visual_scale = 7.0,
--	tiles = {"vf_320.png",},
--	inventory_image = "vf_320.png",
--	use_texture_alpha = true,
--	paramtype = "light",
--	paramtype2 = "wallmounted",
--	sunlight_propagates = true,	
--	--light_source = 14,
--	walkable = false,
--	is_ground_content = true,
--	selection_box = {
--		type = "wallmounted",
--		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}
--	},
--	groups = {cracky=3,dig_immediate=3},
--})

minetest.register_node("vfbuzz:poster404", {
	description = S("VF Logo Transparent 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"vf_256.png",},
	inventory_image = "vf_256.png",
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

minetest.register_node("vfbuzz:poster405", {
	description = S("VF Logo Transparent 5x5"),
	drawtype = "signlike",
	visual_scale = 5.0,
	tiles = {"vf_256.png",},
	inventory_image = "vf_256.png",
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


-------------------------------------------------------------------
------------------------------------------------------------------- animal posters - vfbuzz:poster5xx
-------------------------------------------------------------------

minetest.register_node("vfbuzz:poster501", {
	description = S("Buzzard 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"buzzard_128.png",},
	inventory_image = "buzzard_128.png",
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

minetest.register_node("vfbuzz:poster502", {
	description = S("Lorikeets 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"lorikeets_256.png",},
	inventory_image = "lorikeets_256.png",
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

minetest.register_node("vfbuzz:poster503", {
	description = S("Lorikeets 5x5"),
	drawtype = "signlike",
	visual_scale = 5.0,
	tiles = {"lorikeets_256.png",},
	inventory_image = "lorikeets_256.png",
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

minetest.register_node("vfbuzz:poster504", {
	description = S("Kitty In B&W 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"kitty1_256.png",},
	inventory_image = "kitty1_256.png",
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

minetest.register_node("vfbuzz:poster505", {
	description = S("Kitty In B&W 5x5"),
	drawtype = "signlike",
	visual_scale = 5.0,
	tiles = {"kitty1_256.png",},
	inventory_image = "kitty1_256.png",
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

minetest.register_node("vfbuzz:poster506", {
	description = S("Kitty Circle 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"kitty2_256.png",},
	inventory_image = "kitty2_256.png",
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

minetest.register_node("vfbuzz:poster507", {
	description = S("Kitty Circle 5x5"),
	drawtype = "signlike",
	visual_scale = 5.0,
	tiles = {"kitty2_256.png",},
	inventory_image = "kitty2_256.png",
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

minetest.register_node("vfbuzz:poster508", {
	description = S("Kitty Hallow 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"kitty3_256.png",},
	inventory_image = "kitty3_256.png",
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

minetest.register_node("vfbuzz:poster509", {
	description = S("Kitty Hallow 5x5"),
	drawtype = "signlike",
	visual_scale = 5.0,
	tiles = {"kitty3_256.png",},
	inventory_image = "kitty3_256.png",
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

minetest.register_node("vfbuzz:poster510", {
	description = S("Kitty Serious 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"kitty4_256.png",},
	inventory_image = "kitty4_256.png",
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

minetest.register_node("vfbuzz:poster511", {
	description = S("Kitty Serious 5x5"),
	drawtype = "signlike",
	visual_scale = 5.0,
	tiles = {"kitty4_256.png",},
	inventory_image = "kitty4_256.png",
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

minetest.register_node("vfbuzz:poster512", {
	description = S("Doggy1 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"dog2_256.png",},
	inventory_image = "dog2_256.png",
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

minetest.register_node("vfbuzz:poster513", {
	description = S("Doggy2 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"dog3_256.png",},
	inventory_image = "dog3_256.png",
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


minetest.register_node("vfbuzz:poster514", {
	description = S("Dog Barking 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"dog4_256.png",},
	inventory_image = "dog4_256.png",
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


-------------------------------------------------------------------
-------------------------------------------------------------------  cartoon posters - vfbuzz:poster6xx
-------------------------------------------------------------------

minetest.register_node("vfbuzz:poster601", {
	description = S("Snoopy 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"dog1_256.png",},
	inventory_image = "dog1_256.png",
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

minetest.register_node("vfbuzz:poster602", {
	description = S("Zetsu 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"zetsu_256.png",},
	inventory_image = "zetsu_256.png",
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

minetest.register_node("vfbuzz:poster603", {
	description = S("Spongy Bob 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"spongebob_256.png",},
	inventory_image = "spongebob_256.png",
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

-------------------------------------------------------------------
-------------------------------------------------------------------  nature posters - vfbuzz:poster7xx
-------------------------------------------------------------------

minetest.register_node("vfbuzz:poster701", {
	description = S("Storm1 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"storm1_256.png",},
	inventory_image = "storm1_256.png",
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

minetest.register_node("vfbuzz:poster702", {
	description = S("Storm2 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"storm2_256.png",},
	inventory_image = "storm2_256.png",
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

minetest.register_node("vfbuzz:poster703", {
	description = S("Storm3 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"storm3_256.png",},
	inventory_image = "storm3_256.png",
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

minetest.register_node("vfbuzz:poster704", {
	description = S("Planet1 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"planet1_256.png",},
	inventory_image = "planet1_256.png",
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

minetest.register_node("vfbuzz:poster705", {
	description = S("Sunset 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"sunset_256.png",},
	inventory_image = "sunset_256.png",
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

-------------------------------------------------------------------
-------------------------------------------------------------------  movie posters - vfbuzz:poster8xx
-------------------------------------------------------------------

minetest.register_node("vfbuzz:poster801", {
	description = S("Matrix 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"matrix_256.png",},
	inventory_image = "matrix_256.png",
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

minetest.register_node("vfbuzz:poster802", {
	description = S("Bruce Lee 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"bruce_256.png",},
	inventory_image = "bruce_256.png",
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

minetest.register_node("vfbuzz:poster803", {
	description = S("Bruce Lee 5x5"),
	drawtype = "signlike",
	visual_scale = 5.0,
	tiles = {"bruce_256.png",},
	inventory_image = "bruce_256.png",
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

minetest.register_node("vfbuzz:poster804", {
	description = S("Vader 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"vader_256.png",},
	inventory_image = "vader_256.png",
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

-------------------------------------------------------------------
-------------------------------------------------------------------  gamer/anime/manga posters - vfbuzz:poster9xx
-------------------------------------------------------------------

minetest.register_node("vfbuzz:poster900", {
	description = S("BIO HAZARD 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"biohaz_256.png",},
	inventory_image = "biohaz_256.png",
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

minetest.register_node("vfbuzz:poster901", {
	description = S("MTG Firebrand 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"mtg1_256.png",},
	inventory_image = "mtg1_256.png",
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

minetest.register_node("vfbuzz:poster902", {
	description = S("MTG Hellkite 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"mtg2_256.png",},
	inventory_image = "mtg2_256.png",
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

minetest.register_node("vfbuzz:poster903", {
	description = S("MTG Val 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"mtg3_256.png",},
	inventory_image = "mtg3_256.png",
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

minetest.register_node("vfbuzz:poster904", {
	description = S("Trippy Manga 3x3"),
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"manga1_256.png",},
	inventory_image = "manga1_256.png",
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

------------------------------------------------------------------------------------------------------------------------

end--2nd IF statement

end--1st IF statement

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
