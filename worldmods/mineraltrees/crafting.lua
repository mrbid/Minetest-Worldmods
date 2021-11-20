--All mod recipes
minetest.register_craft({
	output = "default:copper_lump",
	recipe = {
		{"mineraltrees:copper_bloom", "mineraltrees:copper_bloom", "mineraltrees:copper_bloom"},
		{"mineraltrees:copper_bloom", "mineraltrees:copper_bloom", "mineraltrees:copper_bloom"},
		{"mineraltrees:copper_bloom", "mineraltrees:copper_bloom", "mineraltrees:copper_bloom"}
	}
})

minetest.register_craft({
	output = "default:iron_lump",
	recipe = {
		{"mineraltrees:iron_bloom", "mineraltrees:iron_bloom", "mineraltrees:iron_bloom"},
		{"mineraltrees:iron_bloom", "mineraltrees:iron_bloom", "mineraltrees:iron_bloom"},
		{"mineraltrees:iron_bloom", "mineraltrees:iron_bloom", "mineraltrees:iron_bloom"}
	}
})

minetest.register_craft({
	output = "default:mese_crystal",
	recipe = {
		{"mineraltrees:mese_bloom", "mineraltrees:mese_bloom", "mineraltrees:mese_bloom"},
		{"mineraltrees:mese_bloom", "mineraltrees:mese_bloom", "mineraltrees:mese_bloom"},
		{"mineraltrees:mese_bloom", "mineraltrees:mese_bloom", "mineraltrees:mese_bloom"}
	}
})

minetest.register_craft({
	output = "default:diamond",
	recipe = {
		{"mineraltrees:diamond_bloom", "mineraltrees:diamond_bloom", "mineraltrees:diamond_bloom"},
		{"mineraltrees:diamond_bloom", "mineraltrees:diamond_bloom", "mineraltrees:diamond_bloom"},
		{"mineraltrees:diamond_bloom", "mineraltrees:diamond_bloom", "mineraltrees:diamond_bloom"}
	}
})

minetest.register_craft({
	output = "default:gold_lump",
	recipe = {
		{"mineraltrees:gold_bloom", "mineraltrees:gold_bloom", "mineraltrees:gold_bloom"},
		{"mineraltrees:gold_bloom", "mineraltrees:gold_bloom", "mineraltrees:gold_bloom"},
		{"mineraltrees:gold_bloom", "mineraltrees:gold_bloom", "mineraltrees:gold_bloom"}
	}
})

minetest.register_craft({
	output = "mineraltrees:splitter",
	type = "shapeless",
	recipe = {"default:axe_steel"}
})