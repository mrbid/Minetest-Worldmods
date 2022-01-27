-- HawkFood
-- January 2022
-- https://github.com/mrbid/Minetest-Worldmods

-- Space Carrot
minetest.register_craftitem("hawkfood:space_carrot", {
	description = "Teleportation Carrot",
	inventory_image = "space_carrot.png",
	wield_image = "space_carrot.png",
	on_use = function(itemstack, user)
		user:set_hp(user:get_hp() + 5)
		user:set_pos({x = math.random(-30000, 30000), y = math.random(5000, 16000), z = math.random(-30000, 30000)})
		itemstack:take_item(1)
		return itemstack
	end,
})

minetest.register_craft({
	output = "hawkfood:space_carrot",
	recipe = {
		{"", "default:obsidian", ""},
		{"default:obsidian", "farming:carrot_gold", "default:obsidian"},
		{"", "default:obsidian", ""},
	}
})

-- Chocolate Coin
minetest.register_craftitem("hawkfood:chocolate_coin", {
	description = "Chocolate Minegeld",
	inventory_image = "minegeld_cent_25.png",
	wield_image = "minegeld_cent_25.png",
	on_use = function(itemstack, user)
		user:set_hp(user:get_hp() + 5)
		if math.random(1, 10) == 1 then
			minetest.add_item({x=user:get_pos().x, y=user:get_pos().y, z=user:get_pos().z}, "currency:minegeld_cent_10")
		end
		itemstack:take_item(1)
		return itemstack
	end,
})

minetest.register_craft({
	output = "hawkfood:chocolate_coin",
	recipe = {
		{"bbq:foil", "farming:chocolate_dark", "technic:gold_dust"},
	}
})

-- Chocolate Eclair
minetest.register_craftitem("hawkfood:chocolate_eclair", {
	description = "Chocolate Eclair",
	inventory_image = "chocolate_eclair.png",
	wield_image = "chocolate_eclair.png",
	on_use = function(itemstack, user)
		user:set_hp(user:get_hp() + 5)
		minetest.place_node(user:get_pos(), {name="petz:poop"})
		itemstack:take_item(1)
		return itemstack
	end,
})

minetest.register_craft({
	output = "hawkfood:chocolate_eclair 8",
	recipe = {
		{"farming:bread", "farming:chocolate_dark", ""},
	}
})

-- Mystery Cookie
minetest.register_craftitem("hawkfood:mystery_cookie", {
	description = "Mystery Cookie",
	inventory_image = "mystery_cookie.png",
	wield_image = "mystery_cookie.png",
	on_use = function(itemstack, user)
		user:set_hp(user:get_hp() + 5)

		local size = 0.1+math.random()*3.2
		local eye_height = 1.4700000286102*size
		local prop = {
			visual_size = {x = size, y = size, z = size},
			eye_height = eye_height,
			collisionbox = {-0.30000001192093*size, 0*size, -0.30000001192093*size, 0.30000001192093*size, 1.7000000476837*size, 0.30000001192093*size},
			selectionbox = {-0.30000001192093*size, 0*size, -0.30000001192093*size, 0.30000001192093*size, 1.7000000476837*size, 0.30000001192093*size},
		}
		user:set_properties(prop)

		itemstack:take_item(1)
		return itemstack
	end,
})

minetest.register_craft({
	output = "hawkfood:mystery_cookie",
	recipe = {
		{"farming:cookie", "dye:violet", ""},
	}
})

-- Sick Cookie
minetest.register_craftitem("hawkfood:sick_cookie", {
	description = "Sick Cookie",
	inventory_image = "sick_cookie.png",
	wield_image = "sick_cookie.png",
	on_use = function(itemstack, user)
		user:set_hp(user:get_hp() + 5)
		minetest.add_entity(user:get_pos(), "mobs_animal:kitten")
		minetest.add_entity(user:get_pos(), "mobs_animal:kitten")
		minetest.add_entity(user:get_pos(), "mobs_animal:kitten")
		minetest.add_entity(user:get_pos(), "mobs_animal:kitten")
		minetest.add_entity(user:get_pos(), "mobs_animal:kitten")
		minetest.add_entity(user:get_pos(), "mobs_animal:kitten")
		itemstack:take_item(1)
		return itemstack
	end,
})

minetest.register_craft({
	output = "hawkfood:sick_cookie",
	recipe = {
		{"farming:cookie", "dye:green", "currency:minegeld_100"},
	}
})

