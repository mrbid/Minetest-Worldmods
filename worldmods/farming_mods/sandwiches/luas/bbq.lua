-- SANDWHICHES --

minetest.register_craftitem("sandwiches:caramelized_onion", {
	description = "Caramelized onion",
	on_use = minetest.item_eat(2),
	inventory_image = "caramelized_onion.png"
})

minetest.register_craftitem("sandwiches:tasty_chicken_sandwich", {
	description = "Tasty chicken sandwich",
	on_use = minetest.item_eat(8, "sandwiches:bread_crumbs"),
	groups = {food_sandwich = 1},
	inventory_image = "tasty_ham_sandwich.png"
})

minetest.register_craftitem("sandwiches:tasty_ham_sandwich", {
	description = "Tasty ham sandwich",
	on_use = minetest.item_eat(8, "sandwiches:bread_crumbs"),
	groups = {food_sandwich = 1},
	inventory_image = "tasty_ham_sandwich.png"
})

minetest.register_craftitem("sandwiches:tasty_bacon_sandwich", {
	description = "Tasty bacon sandwich",
	on_use = minetest.item_eat(8, "sandwiches:bread_crumbs"),
	groups = {food_sandwich = 1},
	inventory_image = "tasty_bacon_sandwich.png"
})

minetest.register_craftitem("sandwiches:hamwich", {
	description = "Hamwich",
	on_use = minetest.item_eat(9, "sandwiches:bread_crumbs"),
	groups = {food_sandwich = 1},
	inventory_image = "hamwich.png"
})

minetest.register_craftitem("sandwiches:jerky_sandwich", {
	description = "Jerky sandwich",
	on_use = minetest.item_eat(9, "sandwiches:bread_crumbs"),
	groups = {food_sandwich = 1},
	inventory_image = "jerky_sandwich.png"
})


-- CRAFT --

minetest.register_craft({
	output = "sandwiches:caramelized_onion 4", -- this is just an excuse to have a use for molasses
	type = "shapeless";
	recipe = {"group:food_onion", "bbq:molasses", "group:food_skillet"},
	replacements = {{"group:food_skillet", "farming:skillet"}}
})

minetest.register_craft({
	output = "sandwiches:tasty_chicken_sandwich",
	recipe = {
		{"", "sandwiches:bread_slice", ""},
		{"sandwiches:caramelized_onion", "sandwiches:chicken_strips", "sandwiches:caramelized_onion"},
		{"", "sandwiches:bread_slice", ""},
	}
})

minetest.register_craft({
	output = "sandwiches:tasty_ham_sandwich",
	recipe = {
		{"", "sandwiches:bread_slice", ""},
		{"sandwiches:caramelized_onion", "group:food_ham", "sandwiches:caramelized_onion"},
		{"", "sandwiches:bread_slice", ""},
	}
})

minetest.register_craft({
	output = "sandwiches:tasty_bacon_sandwich",
	recipe = {
		{"", "sandwiches:bread_slice", ""},
		{"sandwiches:caramelized_onion", "sandwiches:crispy_bacon", "sandwiches:caramelized_onion"},
		{"", "sandwiches:bread_slice", ""},
	}
})

minetest.register_craft({
	output = "sandwiches:hamwich",
	recipe = {
		{"", "sandwiches:bread_slice", ""},
		{"group:food_pepper", "bbq:hamburger_patty", "group:food_cheese"},
		{"", "sandwiches:bread_slice", ""},
	}
})

minetest.register_craft({
	output = "sandwiches:jerky_sandwich",
	recipe = {
		{"", "sandwiches:bread_slice", ""},
		{"group:food_hot", "bbq:beef_jerky", "group:food_cheese"},
		{"", "sandwiches:bread_slice", ""},
	}
})