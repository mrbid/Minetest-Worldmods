minetest.register_craftitem("pizza:dought", {
	description = "Dought",
	inventory_image = "pizza_dought.png",
	groups = {flammable = 1},
})

minetest.register_craft({
	output = "pizza:dought",
	recipe = {
		{"farming:flour", "farming:flour", "farming:flour"},
		{"", "bucket:bucket_water", ""},
	},
	replacements = {
		{"bucket:bucket_water", "bucket:bucket_empty"},
	}
})

farming.register_plant("pizza:tomato", {
	description = "Tomato seed",
	inventory_image = "pizza_tomato_seed.png",
	steps = 8,
	minlight = 13,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {flammable = 4},
})

minetest.override_item("pizza:tomato", {
    on_use = minetest.item_eat(2),
})

minetest.register_node("pizza:tomato_sauce", {
	description = "Tomato sauce",
	drawtype = "plantlike",
	tiles = {"pizza_tomato_sauce.png"},
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	inventory_image = "pizza_tomato_sauce.png",
	wield_image = "pizza_tomato_sauce.png",
	stack_max = 1,
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
})

for i = 1, 5 do
	minetest.override_item("default:grass_"..i, {drop = {
		max_items = 1,
		items = {
			{items = {'farming:seed_wheat'},rarity = 5},
			{items = {'pizza:seed_tomato'},rarity = 5},
			{items = {'default:grass_1'}},
		}
	}})
end

minetest.register_craft({
	output = "pizza:tomato_sauce",
	recipe = {
		{"","","pizza:tomato"},
		{"","","pizza:tomato"},
		{"pizza:smasher","","vessels:glass_bottle"},
	},
	replacements = {
		{"pizza:smasher", "pizza:smasher"},
	}
})

minetest.register_craftitem("pizza:smasher", {
	description = "Hammer smasher",
	inventory_image = "pizza_smasher.png",
	stack_max = 1,
	groups = {flammable = 2},
})

minetest.register_craft({
	output = "pizza:smasher",
	recipe = {
		{"group:wood", "group:wood"},
		{"group:stick", "group:wood"},
	},
})

minetest.register_craftitem("pizza:cactus_cheese", {
	description = "Cactus cheese",
	inventory_image = "pizza_cactus_cheese.png",
	on_use = minetest.item_eat(1)
})

minetest.register_craft({
	output = "pizza:cactus_cheese",
	recipe = {
		{"", "default:cactus", "default:cactus"},
		{"", "default:cactus", "default:cactus"},
		{"pizza:smasher", "", ""},
	},
	replacements = {
		{"pizza:smasher", "pizza:smasher"},
	}
})

-- Effects

playereffects.register_effect_type("high_speed", "High speed", nil, {"speed"}, 
	function(player)
		player:set_physics_override(3,nil,nil)
	end,
	
	function(effect, player)
		player:set_physics_override(1,nil,nil)
	end
)

playereffects.register_effect_type("highjump", "Greater jump height", nil, {"jump"},
	function(player)
		player:set_physics_override(nil,2,nil)
	end,
	function(effect, player)
		player:set_physics_override(nil,1,nil)
	end
)

-- Pizza margherita

minetest.register_craftitem("pizza:uncooked_margherita", {
	description = "Uncooked pizza margherita",
	inventory_image = "pizza_margherita.png",
	stack_max = 1,
})

minetest.register_craft({
	output = "pizza:uncooked_margherita",
	recipe = {
		{"pizza:cactus_cheese"},
		{"pizza:tomato_sauce"},
		{"pizza:dought"}
	},
	replacements = {
		{"pizza:tomato_sauce", "vessels:glass_bottle"},
	}
})

minetest.register_craftitem("pizza:margherita", {
	description = "Pizza margherita slice",
	inventory_image = "pizza_margherita_slice.png",
	stack_max = 8,
	on_use = minetest.item_eat(10),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 30,
	output = "pizza:margherita 8",
	recipe = "pizza:uncooked_margherita",
})

if minetest.get_modpath("hbhunger") ~= nil then
	hbhunger.register_food("pizza:margherita", 3)
	hbhunger.register_food("pizza:tomato", 2)
end


-- Pizza brown mushroom

minetest.register_craftitem("pizza:uncooked_bmush", {
	description = "Uncooked pizza with brown mushrooms",
	inventory_image = "pizza_bmush.png",
	stack_max = 1,
})

minetest.register_craft({
	output = "pizza:uncooked_bmush",
	recipe = {
		{"flowers:mushroom_brown","pizza:cactus_cheese","flowers:mushroom_brown"},
		{"flowers:mushroom_brown","pizza:tomato_sauce","flowers:mushroom_brown"},
		{"flowers:mushroom_brown","pizza:dought","flowers:mushroom_brown"}
	},
	replacements = {
		{"pizza:tomato_sauce", "vessels:glass_bottle"},
	}
})

minetest.register_craftitem("pizza:bmush", {
	description = "Pizza b-mush slice",
	inventory_image = "pizza_bmush_slice.png",
	stack_max = 8,
	on_use = function(itemstack, user, pointed_thing)
		playereffects.apply_effect_type("high_speed", 30, user)
		itemstack:take_item()
		return itemstack
	end
})

minetest.register_craft({
	type = "cooking",
	cooktime = 30,
	output = "pizza:bmush 8",
	recipe = "pizza:uncooked_bmush",
})

-- Pizza red mushroom

minetest.register_craftitem("pizza:uncooked_rmush", {
	description = "Uncooked pizza with red mushrooms",
	inventory_image = "pizza_rmush.png",
	stack_max = 1,
})

minetest.register_craft({
	output = "pizza:uncooked_rmush",
	recipe = {
		{"flowers:mushroom_red","pizza:cactus_cheese","flowers:mushroom_red"},
		{"flowers:mushroom_red","pizza:tomato_sauce","flowers:mushroom_red"},
		{"flowers:mushroom_red","pizza:dought","flowers:mushroom_red"}
	},
	replacements = {
		{"pizza:tomato_sauce", "vessels:glass_bottle"},
	}
})

minetest.register_craftitem("pizza:rmush", {
	description = "Pizza r-mush slice",
	inventory_image = "pizza_rmush_slice.png",
	stack_max = 8,
	on_use = function(itemstack, user, pointed_thing)
		playereffects.apply_effect_type("highjump", 30, user)
		itemstack:take_item()
		return itemstack
	end
})

minetest.register_craft({
	type = "cooking",
	cooktime = 30,
	output = "pizza:rmush 8",
	recipe = "pizza:uncooked_rmush",
})
