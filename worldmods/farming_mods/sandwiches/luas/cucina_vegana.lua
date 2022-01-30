-- SANDWICHES --

minetest.register_craftitem("sandwiches:tasty_asparagus_sandwich", {
	description = "Tasty asparagus sandwich",
	on_use = minetest.item_eat(7, "sandwiches:bread_crumbs"),
	groups = {food_sandwich = 1,  food_vegan = 1},
	inventory_image = "tasty_asparagus_sandwich.png"
})

minetest.register_craftitem("sandwiches:ham_and_asparagus_sandwich", {
	description = "Ham and asparagus sandwich",
	on_use = minetest.item_eat(7, "sandwiches:bread_crumbs"),
	groups = {food_sandwich = 1},
	inventory_image = "ham_and_asparagus_sandwich.png"
})

minetest.register_craftitem("sandwiches:tasty_tofu_sandwich", {
	description = "Tasty tofu sandwich",
	on_use = minetest.item_eat(7, "sandwiches:bread_crumbs"),
	groups = {food_sandwich = 1},
	inventory_image = "tasty_tofu_sandwich.png"
})

minetest.register_craftitem("sandwiches:classic_sandwich", {
	description = "Classic sandwich",
	on_use = minetest.item_eat(7, "sandwiches:bread_crumbs"),
	groups = {food_sandwich = 1},
	inventory_image = "classic_sandwich.png"
})

minetest.register_craftitem("sandwiches:classic_vegan_sandwich", {
	description = "Classic vegan sandwich",
	on_use = minetest.item_eat(7, "sandwiches:bread_crumbs"),
	groups = {food_sandwich = 1,  food_vegan = 1},
	inventory_image = "classic_vegan_sandwich.png"
})

minetest.register_craftitem("sandwiches:tofu_sandwich", {
	description = "Tofu sandwich",
	on_use = minetest.item_eat(7, "sandwiches:bread_crumbs"),
	groups = {food_sandwich = 1,  food_vegan = 1},
	inventory_image = "tofu_sandwich.png"
})

minetest.register_craftitem("sandwiches:blueberry_jam_sandwich", {
	description = "Blueberry jam sandwich",
	on_use = minetest.item_eat(7, "sandwiches:bread_crumbs"),
	groups = {food_sandwich = 1},
	inventory_image = "blueberry_jam_sandwich.png"
})

minetest.register_craftitem("sandwiches:gourmet_meat_sandwich", {
	description = "Gourmet meat sandwich",
	on_use = minetest.item_eat(9, "sandwiches:bread_crumbs"),
	groups = {food_sandwich = 1},
	inventory_image = "gourmet_meat_sandwich.png"
})

minetest.register_craftitem("sandwiches:gourmet_vegan_sandwich", {
	description = "Gourmet vegan sandwich",
	on_use = minetest.item_eat(9, "sandwiches:bread_crumbs"),
	groups = {food_sandwich = 1,  food_vegan = 1},
	inventory_image = "gourmet_vegan_sandwich.png"
})

minetest.register_craftitem("sandwiches:tasty_veggie_sandwich", {
	description = "Tasty veggie sandwich",
	on_use = minetest.item_eat(9, "sandwiches:bread_crumbs"),
	groups = {food_sandwich = 1,  food_vegan = 1},
	inventory_image = "tasty_veggie_sandwich.png"
})

minetest.register_craftitem("sandwiches:club_sandwich", {
	description = "Club sandwich",
	on_use = minetest.item_eat(12, "sandwiches:bread_crumbs"),
	groups = {food_big_sandwich = 1, },
	inventory_image = "club_sandwich.png"
})

minetest.register_craftitem("sandwiches:blt_sandwich", {
	description = "BLT sandwich",
	on_use = minetest.item_eat(7, "sandwiches:bread_crumbs"),
	groups = {food_sandwich = 1, },
	inventory_image = "blt_sandwich.png"
})

-- NON SANDWICH ITEMS

minetest.register_craftitem("sandwiches:butter_carrots", {
	description = "Butter carrots",
	on_use = minetest.item_eat(2),
	inventory_image = "butter_carrots.png"
})

minetest.register_craftitem("sandwiches:roasted_potatoes", {
	description = "Roasted potatoes",
	on_use = minetest.item_eat(2),
	inventory_image = "roasted_potatoes.png"
})

-- CRAFT --

minetest.register_craft({
	output = "sandwiches:bread_slice 6",
	type = "shapeless",
	recipe = {"cucina_vegana:ciabatta_bread"},
})


minetest.register_craft({
	output = "sandwiches:butter_carrots 5",
	type = "shapeless",
	recipe = {
		"group:food_carrot", "group:food_carrot", "group:food_carrot",
		"group:food_skillet", "group:food_butter", "cucina_vegana:parsley",
	},
	replacements = {{"group:food_skillet", "farming:skillet"}}
})

minetest.register_craft({
	output = "sandwiches:roasted_potatoes 5",
	type = "shapeless",
	recipe = {
		"group:food_potato", "group:food_potato", "group:food_potato",
		"group:food_skillet", "group:food_oil", "cucina_vegana:rosemary",
	},
	replacements = {{"group:food_skillet", "farming:skillet"}}
})

-- SANDWICHES CRAFT --

minetest.register_craft({
	output = "sandwiches:hot_veggie_sandwich",
	recipe = {
		{"", "sandwiches:bread_slice", ""},
		{"cucina_vegana:asparagus", "group:food_hot", "cucina_vegana:lettuce"},
		{"", "sandwiches:bread_slice", ""},
	}
})

minetest.register_craft({
	output = "sandwiches:tasty_asparagus_sandwich",
	recipe = {
		{"", "sandwiches:bread_slice", ""},
		{"cucina_vegana:asparagus", "cucina_vegana:sauce_hollandaise", "cucina_vegana:asparagus"},
		{"", "sandwiches:bread_slice", ""},
	}
})

minetest.register_craft({
	output = "sandwiches:ham_and_asparagus_sandwich",
	recipe = {
		{"", "sandwiches:bread_slice", ""},
		{"cucina_vegana:asparagus", "sandwiches:ham" ,"cucina_vegana:asparagus"},
		{"", "sandwiches:bread_slice", ""},
	}
})

minetest.register_craft({
	output = "sandwiches:tasty_tofu_sandwich",
	recipe = {
		{"", "sandwiches:bread_slice", ""},
		{"cucina_vegana:asparagus", "cucina_vegana:tofu" ,"cucina_vegana:asparagus"},
		{"", "sandwiches:bread_slice", ""},
	}
})

minetest.register_craft({
	output = "sandwiches:classic_sandwich",
	recipe = {
		{"", "sandwiches:bread_slice", ""},
		{"cucina_vegana:lettuce", "sandwiches:ham" ,"farming:tomato" },
		{"", "sandwiches:bread_slice", ""},
	}
})


minetest.register_craft({
	output = "sandwiches:classic_vegan_sandwich",
	recipe = {
		{"", "sandwiches:bread_slice", ""},
		{"cucina_vegana:lettuce", "cucina_vegana:tofu" ,"farming:tomato" },
		{"", "sandwiches:bread_slice", ""},
	}
})

minetest.register_craft({
	output = "sandwiches:tofu_sandwich",
	recipe = {
		{"", "sandwiches:bread_slice", ""},
		{"cucina_vegana:chives","cucina_vegana:tofu", "cucina_vegana:rosemary"},
		{"", "sandwiches:bread_slice", ""},
	}
})

minetest.register_craft({
	output = "sandwiches:blueberry_jam_sandwich",
	recipe = {
		{"", "sandwiches:bread_slice", ""},
		{"cucina_vegana:blueberry_jam", "cucina_vegana:blueberry_jam", "cucina_vegana:blueberry_jam"},
		{"", "sandwiches:bread_slice", ""},
	}
})

minetest.register_craft({
	output = "sandwiches:gourmet_meat_sandwich",
	recipe = {
		{"", "sandwiches:bread_slice", ""},
		{"cucina_vegana:chives", "sandwiches:ham" ,"cucina_vegana:sauce_hollandaise" },
		{"", "sandwiches:bread_slice", ""},
	}
})

minetest.register_craft({
	output = "sandwiches:gourmet_meat_sandwich",
	recipe = {
		{"", "sandwiches:bread_slice", ""},
		{"cucina_vegana:chives", "sandwiches:chiken_strips" ,"cucina_vegana:sauce_hollandaise" },
		{"", "sandwiches:bread_slice", ""},
	}
})

minetest.register_craft({
	output = "sandwiches:gourmet_vegan_sandwich",
	recipe = {
		{"", "sandwiches:bread_slice", ""},
		{"cucina_vegana:chives", "cucina_vegana:tofu" ,"cucina_vegana:sauce_hollandaise" },
		{"", "sandwiches:bread_slice", ""},
	}
})

minetest.register_craft({
	output = "sandwiches:gourmet_vegan_sandwich",
	recipe = {
		{"", "sandwiches:bread_slice", ""},
		{"cucina_vegana:chives", "cucina_vegana:imitation_meat" ,"cucina_vegana:sauce_hollandaise" },
		{"", "sandwiches:bread_slice", ""},
	}
})

minetest.register_craft({
	output = "sandwiches:gourmet_vegan_sandwich",
	recipe = {
		{"", "sandwiches:bread_slice", ""},
		{"cucina_vegana:chives", "cucina_vegana:imitation_poultry" ,"cucina_vegana:sauce_hollandaise" },
		{"", "sandwiches:bread_slice", ""},
	}
})

minetest.register_craft({
	output = "sandwiches:tasty_veggie_sandwich",
	recipe = {
		{"", "sandwiches:bread_slice", ""},
		{"sandwiches:caramelized_onion", "sandwiches:butter_carrots" ,"sandwiches:roasted_potatoes" },
		{"", "sandwiches:bread_slice", ""},
	}
})

minetest.register_craft({
	output = "sandwiches:club_sandwich",
	recipe = {
		{"sandwiches:bread_slice", "group:food_tomato" , "sandwiches:bread_slice"},
		{"sandwiches:chiken_strips", "cucina_vegana:sauce_hollandaise" ,"sandwiches:crispy_bacon" },
		{"sandwiches:bread_slice", "cucina_vegana:lettuce", "sandwiches:bread_slice"},
	}
})

minetest.register_craft({
	output = "sandwiches:blt_sandwich",
	recipe = {
		{"", "sandwiches:bread_slice", ""},
		{"sandwiches:crispy_bacon", "group:food_tomato" ,"cucina_vegana:lettuce" },
		{"", "sandwiches:bread_slice", ""},
	}
})

-- MOLASSES --

if minetest.registered_items["sandwiches:caramelized_onion"] then

	minetest.register_craft({
		output = "sandwiches:caramelized_onion 4",
		type = "shapeless";
		recipe = {"farming:onion", "cucina_vegana:molasses", "group:food_skillet"},
		replacements = {{"group:food_skillet", "farming:skillet"}}
	})
	
end