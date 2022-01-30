


-- Supercharger
minetest.register_craftitem("supercharger:supercharger", {
	description = ("Ripple Supercharger"),
	inventory_image = "supercharger_supercharger.png",
})


minetest.register_craft({
	output = "supercharger:supercharger",
	recipe = {
		{"default:steelblock", "default:copper_ingot", "default:steelblock"},
		{"default:steelblock", "vehicles:propeller", "default:mese_crystal"},
		{"default:steelblock", "default:copper_ingot", "default:steelblock"},
	}
})
