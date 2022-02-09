local modname = "pizza2"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")
local S = minetest.get_translator(minetest.get_current_modname())

-- Additional material for pizzas

minetest.register_craftitem("pizza2:cheddar", {
    description = S("Cheddar"),
	inventory_image = "Cheddar.png",
	on_use = minetest.item_eat(4),
	groups = {food_cheese = 1, flammable = 2},
})

minetest.register_craft({
    output = "pizza2:cheddar",
	recipe = {
	    {"wool:white","mobs:bucket_milk",""},
		{"farming:pot","farming:salt",""},
		{"","",""},
	},
	replacements = {
	    {"wool:white","wool:white"},
		{"mobs:bucket_milk","bucket:bucket_empty"},
	},
})

minetest.register_craftitem("pizza2:mozarella", {
    description = S("Mozarella Ball"),
	inventory_image = "Mozarella.png",
	on_use = minetest.item_eat(4),
	groups = {food_cheese = 1, flammable = 2},
})

minetest.register_craft({
    output = "pizza2:mozarella 3",
	recipe = {
	    {"mobs:bucket_milk","mobs:bucket_milk",""},
		{"bucket:bucket_river_water","farming:salt",""},
		{"","",""},
	},
	replacements = {
	    {"bucket:bucket_river_water", "bucket:bucket_empty"},
		{"mobs:bucket_milk","bucket:bucket_empty"},
	},
})

minetest.register_node("pizza2:marinara", {
    description = S("Marinara Jar"),
	drawtype = "plantlike",
	tiles = {"Marinara.png"},
	inventory_image = "Marinara.png",
	wield_image = "Marinara.png",
	paramtype = "light",
	sunlight_propagates = true,
    walkable = false,
	selection_box = {
	   type = "fixed",
	   fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16},
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
       	attached_node = 1},
	on_use = minetest.item_eat(2, "vessels:glass_bottle"),
	sounds = default.node_sound_glass_defaults()
})

minetest.register_craft({
    output = "pizza2:marinara",
	recipe = {
	    {"group:food_tomato","group:food_garlic_clove",""},
		{"farming:salt","farming:onion",""},
		{"vessels:glass_bottle","",""},
	},
})

minetest.register_craftitem("pizza2:pepperoni", {
    description = S("Pepperoni"),
	inventory_image = "Pepperonimeat.png",
	on_use = minetest.item_eat(2),
	groups = {food_meat_raw = 1, flammable = 2},
})

minetest.register_craft({
    output = "pizza2:pepperoni 3",
	recipe = {
	    {"farming:salt","mobs:meat_raw",""},
		{"","",""},
		{"","",""},
	},
})

-- Pizzas Finally

minetest.register_node("pizza2:margherita", {
    description = S("Margharita Pizza"),
	tiles = {"Margherite.png"},
	inventory_image = "Margherite.png",
	wield_image = "Margherite.png",
	sunlight_propagates = true,
	walkable = false,
	climbable = false,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
	legacy_wallmounted = true,
	use_texture_alpha = true,
	drawtype = "signlike",
	paramtype2 = "wallmounted",
	groups = {snappy = 3},
})

minetest.register_craft({
    output = "pizza2:margherita",
	recipe = {
	    {"group:food_flour","group:food_tomato",""},
		{"pizza2:marinara","",""},
		{"","",""},
	},
	replacements = {
	    {"pizza2:marinara","vessels:glass_bottle"},
	},
})

minetest.register_node("pizza2:pepperonipizza", {
    description = S("Pepperoni Pizza"),
	tiles = {"Pepperoni.png"},
	inventory_image = "Pepperoni.png",
	wield_image = "Pepperoni.png",
	sunlight_propagates = true,
	walkable = false,
	climbable = false,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
	legacy_wallmounted = true,
	use_texture_alpha = true,
	drawtype = "signlike",
	paramtype2 = "wallmounted",
	groups = {snappy = 3},
})

minetest.register_craft({
    output = "pizza2:pepperonipizza",
	recipe = {
	    {"group:food_flour","group:food_cheese",""},
		{"pizza2:marinara","pizza2:pepperoni",""},
		{"","",""},
	},
	replacements = {
	    {"pizza2:marinara","vessels:glass_bottle"},
	},
})

minetest.register_node("pizza2:hawaiian", {
    description = S("Pineapple Pizza"),
	tiles = {"Hawaiian.png"},
	inventory_image = "Hawaiian.png",
	wield_image = "Hawaiian.png",
	sunlight_propagates = true,
	walkable = false,
	climbable = false,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
	legacy_wallmounted = true,
	use_texture_alpha = true,
	drawtype = "signlike",
	paramtype2 = "wallmounted",
	groups = {snappy = 3},
})

minetest.register_craft({
    output = "pizza2:hawaiian",
	recipe = {
	    {"group:food_flour","farming:pineapple_ring",""},
		{"mobs:meat","group:food_cheese",""},
		{"","",""},
	},
	replacements = {
	    {"pizza2:marinara","vessels:glass_bottle"},
	},
})

minetest.register_node("pizza2:cheese_pizza", {
    description = S("Cheese Pizza"),
	tiles = {"CheesePizza.png"},
	inventory_image = "CheesePizza.png",
	wield_image = "CheesePizza.png",
	sunlight_propagates = true,
	walkable = false,
	climbable = false,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
	legacy_wallmounted = true,
	use_texture_alpha = true,
	drawtype = "signlike",
	paramtype2 = "wallmounted",
	groups = {snappy = 3},
})

minetest.register_craft({
    output = "pizza2:cheese_pizza",
	recipe = {
	    {"group:food_flour","pizza2:mozarella",""},
		{"mobs:cheese","pizza2:cheddar",""},
		{"","",""},
	},
	replacements = {
	    {"pizza2:marinara","vessels:glass_bottle"},
	},
})

-- pizza slices

minetest.register_craftitem("pizza2:margherita_slice", {
    description = S("Margharita Pizza Slice"),
	inventory_image = "Marghariteslice.png",
	on_use = minetest.item_eat(7),
	groups = {pizza_slice = 1, flammable = 2},
})

minetest.register_craft({
    type = "shapeless",
    output = "pizza2:margherita_slice 8",
	recipe = {
	    "pizza2:margherita",
		"farming:cutting_board"
	},
	replacements = {
	    {"farming:cutting_board","farming:cutting_board"},
	},
})

minetest.register_craftitem("pizza2:pepperoni_slice", {
    description = S("Pepperoni Pizza Slice"),
	inventory_image = "Pepperonislice.png",
	on_use = minetest.item_eat(7),
	groups = {pizza_slice = 1, flammable = 2},
})

minetest.register_craft({
    type = "shapeless",
    output = "pizza2:pepperoni_slice 8",
	recipe = {
	    "pizza2:pepperonipizza",
		"farming:cutting_board"
	},
	replacements = {
	    {"farming:cutting_board","farming:cutting_board"},
	},
})

minetest.register_craftitem("pizza2:hawaiian_slice", {
    description = S("Pineapple Pizza Slice"),
	inventory_image = "Hawaiianslice.png",
	on_use = minetest.item_eat(7),
	groups = {pizza_slice = 1, flammable = 2},
})

minetest.register_craft({
    type = "shapeless",
    output = "pizza2:hawaiian_slice 8",
	recipe = {
	    "pizza2:hawaiian",
		"farming:cutting_board"
	},
	replacements = {
	    {"farming:cutting_board","farming:cutting_board"},
	},
})

minetest.register_craftitem("pizza2:cheesepizza_slice", {
    description = S("Cheese Pizza Slice"),
	inventory_image = "Cheesepizzaslice.png",
	on_use = minetest.item_eat(7),
	groups = {pizza_slice = 1, flammable = 2},
})

minetest.register_craft({
    type = "shapeless",
    output = "pizza2:cheesepizza_slice 8",
	recipe = {
	    "pizza2:cheese_pizza",
		"farming:cutting_board"
	},
	replacements = {
	    {"farming:cutting_board","farming:cutting_board"},
	},
})

-- Packing pizza slides

minetest.register_craft({
	type = "shapeless",
    output = "pizza2:margherita",
	recipe = {
	    "pizza2:margherita_slice",
		"pizza2:margherita_slice",
		"pizza2:margherita_slice",
		"pizza2:margherita_slice",
		"pizza2:margherita_slice",
		"pizza2:margherita_slice",
		"pizza2:margherita_slice",
		"pizza2:margherita_slice",
	},
})

minetest.register_craft({
    type = "shapeless",
	output = "pizza2:pepperonipizza",
	recipe = {
	    "pizza2:pepperoni_slice",
		"pizza2:pepperoni_slice",
		"pizza2:pepperoni_slice",
		"pizza2:pepperoni_slice",
		"pizza2:pepperoni_slice",
		"pizza2:pepperoni_slice",
		"pizza2:pepperoni_slice",
		"pizza2:pepperoni_slice",
	},
})

minetest.register_craft({
    type = "shapeless",
	output = "pizza2:hawaiian",
	recipe = {
	    "pizza2:hawaiian_slice",
		"pizza2:hawaiian_slice",
		"pizza2:hawaiian_slice",
		"pizza2:hawaiian_slice",
		"pizza2:hawaiian_slice",
		"pizza2:hawaiian_slice",
		"pizza2:hawaiian_slice",
		"pizza2:hawaiian_slice",
	},
})

minetest.register_craft({
    type = "shapeless",
	output = "pizza2:cheese_pizza",
	recipe = {
	    "pizza2:cheesepizza_slice",
		"pizza2:cheesepizza_slice",
		"pizza2:cheesepizza_slice",
		"pizza2:cheesepizza_slice",
		"pizza2:cheesepizza_slice",
		"pizza2:cheesepizza_slice",
		"pizza2:cheesepizza_slice",
		"pizza2:cheesepizza_slice",
	},
})
