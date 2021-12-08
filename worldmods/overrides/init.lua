

minetest.override_item("default:sand", {
        groups={crumbly = 3, falling_node = 0, sand = 1}
})

minetest.override_item("default:desert_sand", {
        groups={crumbly = 3, falling_node = 0, sand = 1}
})

minetest.override_item("default:silver_sand", {
        groups={crumbly = 3, falling_node = 0, sand = 1}
})

minetest.override_item("default:gravel", {
        groups={crumbly = 2, falling_node = 0}
})

minetest.override_item("default:lava_source", {
	groups = {igniter = 1},
	liquidtype = "none",
	liquid_alternative_flowing = "none",
	liquid_alternative_source = "none",
	pointable = true,
})

minetest.override_item("default:lava_flowing", {
	liquidtype = "none",
	liquid_alternative_flowing = "none",
	liquid_alternative_source = "none",
	groups = {igniter = 1},
	pointable = true,
})

minetest.override_item("default:stone", {
	light_source = 6
})


--[[
minetest.override_item("default:snow", {
        groups={falling_node=0}
})
--]]

minetest.override_item("ethereal:sandy", {
        groups={crumbly = 3, falling_node = 0, sand = 1, not_in_creative_inventory = 1}
})


minetest.register_craft({
	output = "ethereal:etherium_dust 4",
	recipe = {
		{"gems:sapphire_gem", "gems:emerald_gem", "gems:ruby_gem"},
		{"gems:amethyst_gem", "default:mese_crystal", "default:diamond"},
		{"technic:zinc_dust", "technic:gold_dust", "technic:silver_dust"},
	}
})

minetest.register_craft({
	output = "ethereal:fire_dust 4",
	recipe = {
                {"lavastuff:lava_in_a_bottle"},
		{"technic:silver_dust"},
	}
})

minetest.register_craft({
	output = "ethereal:fire_dust 4",
	recipe = {
                {"lavastuff:orb"},
		{"farming:bottle_ethanol"},
	}
})

minetest.register_craft({
	output = "ethereal:fire_dust 4",
	recipe = {
                {"bucket:bucket_lava"},
		{"technic:gold_dust"},
	}
})







