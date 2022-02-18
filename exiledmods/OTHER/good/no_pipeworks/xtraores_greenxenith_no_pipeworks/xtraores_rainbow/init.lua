--Move to xtraores_rainbow
minetest.register_alias("xtraores:rainbow", "xtraores_rainbow:rainbow")

minetest.register_node("xtraores_rainbow:rainbow", {
	description = "Rainbow Block",
	tiles = {"xtraores_rainbow_block.png"},
	light_source = default.LIGHT_MAX - 1,
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "xtraores_rainbow:rainbow 8",
	recipe = {
		{"xtraores:adamantite_ingot", "xtraores:rarium_ingot", "xtraores:platinum_ingot"},
		{"xtraores:cobalt_ingot", "default:glass", "xtraores:osmium_ingot"},
		{"default:diamond", "default:mese_crystal", "default:copper_ingot"},
	}
})

minetest.register_node("xtraores_rainbow:glass", {
	description = "Rainbow Glass",
	drawtype = "glasslike",
	tiles = {"xtraores_window.png"},
	paramtype = "light",
	use_texture_alpha = true,
	sunlight_propagates = true,
	is_ground_content = false,
	light_source = default.LIGHT_MAX,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "xtraores_rainbow:glass 8",
	recipe = {
		{"", "default:glass", ""},
		{"default:glass", "xtraores_rainbow:rainbow", "default:glass"},
		{"", "default:glass", ""},
	}
})

minetest.register_node("xtraores_rainbow:wood", {
	description = "Rainbow Planks",
	tiles = {"xtraores_wood.png"},
	light_source = default.LIGHT_MAX - 1,
	is_ground_content = true,
	groups = {choppy=3, oddly_breakable_by_hand=2},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "xtraores_rainbow:wood 5",
	recipe = {
		{"", "default:wood", ""},
		{"default:wood", "xtraores_rainbow:rainbow", "default:wood"},
		{"", "default:wood", ""},
	}
})

if minetest.global_exists("awards") then
	awards.register_award("xtraores_rainbow:skittles",{
		title = "SKITTLES",
		description = "Place a rainbow block.",
		icon = minetest.inventorycube(
			"xtraores_rainbow_block.png",
			"xtraores_rainbow_block.png",
			"xtraores_rainbow_block.png"
		),
		trigger = {
			type = "place",
			node = "xtraores_rainbow:rainbow",
			target = 1
		},
	})

	awards.register_award("xtraores_rainbow:glass_skittles",{
		title = "See-through Skittles?",
		description = "Place a rainbow glass block.",
		icon = minetest.inventorycube(
			"xtraores_window.png",
			"xtraores_window.png",
			"xtraores_window.png"
		),
		trigger = {
			type = "place",
			node = "xtraores_rainbow:glass",
			target = 1
		},
	})
end

minetest.log("action", "[MOD] Xtraores: Module (rainbow) loaded!")


--Can you taste the rainbow yet?