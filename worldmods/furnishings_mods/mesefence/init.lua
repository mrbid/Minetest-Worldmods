default.register_fence("mesefence:fence_mese", {
	description = "Mese Fence",
	texture = "default_meselamp.png",
	inventory_image = "default_fence_overlay.png^default_meselamp.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	material = "default:meselamp",
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	light_source = default.LIGHT_MAX,
})

doors.register_fencegate("mesefence:gate_mese", {
	description = "Mese Gate",
	texture = "default_meselamp.png",
	material = "default:meselamp",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_glass_defaults(),
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	light_source = default.LIGHT_MAX,
})