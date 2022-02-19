default.register_fence("glowfence:fence_mese", {
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

doors.register_fencegate("glowfence:gate_mese", {
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

---

default.register_fence("glowfence:fence_crystal", {
	description = "Glow Sapphire Fence",
	texture = "caverealms_glow_crystal.png",
	inventory_image = "default_fence_overlay.png^caverealms_glow_crystal.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	material = "caverealms:glow_crystal",
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	light_source = default.LIGHT_MAX,
	use_texture_alpha = true,
})

doors.register_fencegate("glowfence:gate_crystal", {
	description = "Glow Sapphire Gate",
	texture = "caverealms_glow_crystal.png",
	material = "caverealms:glow_crystal",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_glass_defaults(),
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	light_source = default.LIGHT_MAX,
	use_texture_alpha = true,
})

---

default.register_fence("glowfence:fence_emerald", {
	description = "Glow Emerald Fence",
	texture = "caverealms_glow_emerald.png",
	inventory_image = "default_fence_overlay.png^caverealms_glow_emerald.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	material = "caverealms:glow_emerald",
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	light_source = default.LIGHT_MAX,
	use_texture_alpha = true,
})

doors.register_fencegate("glowfence:gate_emerald", {
	description = "Glow Emerald Gate",
	texture = "caverealms_glow_emerald.png",
	material = "caverealms:glow_emerald",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_glass_defaults(),
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	light_source = default.LIGHT_MAX,
	use_texture_alpha = true,
})

---

default.register_fence("glowfence:fence_glowmese", {
	description = "Glow Mese Fence",
	texture = "caverealms_glow_mese.png",
	inventory_image = "default_fence_overlay.png^caverealms_glow_mese.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	material = "caverealms:glow_mese",
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	light_source = default.LIGHT_MAX,
	use_texture_alpha = true,
})

doors.register_fencegate("glowfence:gate_glowmese", {
	description = "Glow Mese Gate",
	texture = "caverealms_glow_mese.png",
	material = "caverealms:glow_mese",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_glass_defaults(),
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	light_source = default.LIGHT_MAX,
	use_texture_alpha = true,
})

---

default.register_fence("glowfence:fence_glowmese", {
	description = "Glow Mese Fence",
	texture = "caverealms_glow_mese.png",
	inventory_image = "default_fence_overlay.png^caverealms_glow_mese.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	material = "caverealms:glow_mese",
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	light_source = default.LIGHT_MAX,
	use_texture_alpha = true,
})

doors.register_fencegate("glowfence:gate_glowmese", {
	description = "Glow Mese Gate",
	texture = "caverealms_glow_mese.png",
	material = "caverealms:glow_mese",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_glass_defaults(),
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	light_source = default.LIGHT_MAX,
	use_texture_alpha = true,
})

---

default.register_fence("glowfence:fence_ruby", {
	description = "Glow Ruby Fence",
	texture = "caverealms_glow_ruby.png",
	inventory_image = "default_fence_overlay.png^caverealms_glow_ruby.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	material = "caverealms:glow_ruby",
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	light_source = default.LIGHT_MAX,
	use_texture_alpha = true,
})

doors.register_fencegate("glowfence:gate_ruby", {
	description = "Glow Ruby Gate",
	texture = "caverealms_glow_ruby.png",
	material = "caverealms:glow_ruby",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_glass_defaults(),
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	light_source = default.LIGHT_MAX,
	use_texture_alpha = true,
})

---

default.register_fence("glowfence:fence_amethyst", {
	description = "Glow Amethyst Fence",
	texture = "caverealms_glow_amethyst.png",
	inventory_image = "default_fence_overlay.png^caverealms_glow_amethyst.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	material = "caverealms:glow_amethyst",
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	light_source = default.LIGHT_MAX,
	use_texture_alpha = true,
})

doors.register_fencegate("glowfence:gate_amethyst", {
	description = "Glow Amethyst Gate",
	texture = "caverealms_glow_amethyst.png",
	material = "caverealms:glow_amethyst",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_glass_defaults(),
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	light_source = default.LIGHT_MAX,
	use_texture_alpha = true,
})