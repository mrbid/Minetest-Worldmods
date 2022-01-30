minetest.register_craftitem("foody:bone", {
	description = "Bone",
	inventory_image = "foody_bone.png",
})

minetest.register_craftitem("foody:carrotbatter", {
	description = "Carrot Cake Batter",
	inventory_image = "foody_carrotbatter.png",
})

minetest.register_craftitem("foody:creamcheese", {
	description = "Cream Cheese",
	inventory_image = "foody_creamcheese.png",
        on_use = minetest.item_eat(1),
})

minetest.register_craftitem("foody:strawberry_muffin", {
	description = "Strawberry Muffin",
	inventory_image = "foody_strawberry_muffin.png",
        on_use = minetest.item_eat(5),
})

minetest.register_craftitem("foody:chocolate_banana_muffin", {
	description = "Chocolate Banana Muffin",
	inventory_image = "foody_chocolate_banana_muffin.png",
        on_use = minetest.item_eat(8),
})

minetest.register_craftitem("foody:orange_raspberry_muffin", {
	description = "Orange Raspberry Muffin",
	inventory_image = "foody_orange_raspberry_muffin.png",
        on_use = minetest.item_eat(7),
})

minetest.register_craftitem("foody:chocolate_muffin", {
	description = "Chocolate Muffin",
	inventory_image = "foody_chocolate_muffin.png",
        on_use = minetest.item_eat(7),
})

minetest.register_craftitem("foody:coffeecake_muffin", {
	description = "Coffeecake Muffin",
	inventory_image = "foody_coffeecake_muffin.png",
        on_use = minetest.item_eat(5),
})

minetest.register_craftitem("foody:carrotcake", {
	description = "Carrot Cake",
	inventory_image = "foody_carrotcake.png",
        on_use = minetest.item_eat(12),
})

minetest.register_craftitem("foody:fries", {
	description = "Fries",
	inventory_image = "foody_fries.png",
        on_use = minetest.item_eat(4)
})

minetest.register_craftitem("foody:meat6", {
	description = "Meat On A Bone",
	inventory_image = "foody_meat6.png",
	on_use = minetest.item_eat(9, "foody:meat5"),
})

minetest.register_craftitem("foody:meat5", {
	description = "Meat On A Bone",
	inventory_image = "foody_meat5.png",
	on_use = minetest.item_eat(9, "foody:meat4"),
        groups = {not_in_creative_inventory=1},
})

minetest.register_craftitem("foody:meat4", {
	description = "Meat On A Bone",
	inventory_image = "foody_meat4.png",
	on_use = minetest.item_eat(9, "foody:meat3"),
        groups = {not_in_creative_inventory=1},
})

minetest.register_craftitem("foody:meat3", {
	description = "Meat On A Bone",
	inventory_image = "foody_meat3.png",
	on_use = minetest.item_eat(9, "foody:meat2"),
        groups = {not_in_creative_inventory=1},
})

minetest.register_craftitem("foody:meat2", {
	description = "Meat On A Bone",
	inventory_image = "foody_meat2.png",
	on_use = minetest.item_eat(9, "foody:meat1"),
        groups = {not_in_creative_inventory=1},
})

minetest.register_craftitem("foody:meat1", {
	description = "Meat On A Bone",
	inventory_image = "foody_meat1.png",
	on_use = minetest.item_eat(9, "foody:bone"),
        groups = {not_in_creative_inventory=1},
})

minetest.register_craftitem("foody:diamond_donut", {
	description = "Diamond Donut",
	inventory_image = "foody_diamond_donut.png",
	on_use = minetest.item_eat(30),
})

minetest.register_craft({
	output = "foody:bone",
	recipe = {
                 {'mobs:meat_raw'},
     }
})

minetest.register_craft({
	output = "foody:diamond_donut 20",
	recipe = {
                 {'default:diamond'},
                 {'farming:donut'},
     }
})

minetest.register_craft({
	output = "foody:meat6",
	recipe = {
                 {'mobs:pork_cooked', 'mobs:pork_cooked', 'mobs:pork_cooked'},
                 {'mobs:honey', 'mobs:honey', 'foody:bone'},
                 {'mobs:pork_cooked', 'mobs:pork_cooked', 'mobs:pork_cooked'},
     }
})

minetest.register_craft({
	output = "foody:carrotbatter",
        type = "shapeless",
	recipe = {'mobs:egg', 'foody:creamcheese', 'farming:sugar', 'farming:flour', 'farming:carrot', 'farming:carrot'},
})

minetest.register_craft({
        type = "shapeless",
	output = "foody:creamcheese 5",
	recipe = {'mobs:bucket_milk', 'mobs:honey', 'farming:sugar'},
replacements = {{"mobs:bucket_milk", "bucket:bucket_empty"}}
})

minetest.register_craft({
        type = "cooking",
        cooktime = 10,
        output = "foody:carrotcake",
	recipe = "foody:carrotbatter"
})

minetest.register_craft({
	output = "foody:fries 4",
	recipe = {
                 {'farming:baked_potato'},
                 {'farming:baked_potato'},
     }
})

minetest.register_craft({
	output = "foody:strawberry_muffin 2",
	recipe = {
                 {'ethereal:strawberry', 'farming:bread', 'ethereal:strawberry'},
     }
})

minetest.register_craft({
	output = "foody:chocolate_banana_muffin 2",
	recipe = {
                 {'ethereal:banana', 'farming:bread', 'farming:chocolate_dark'},
     }
})

minetest.register_craft({
	output = "foody:chocolate_banana_muffin 2",
	recipe = {
                 {'farming:chocolate_dark', 'farming:bread', 'ethereal:banana'},
     }
})

minetest.register_craft({
	output = "foody:orange_raspberry_muffin 2",
	recipe = {
                 {'ethereal:orange', 'farming:bread', 'farming:raspberries'},
     }
})

minetest.register_craft({
	output = "foody:orange_raspberry_muffin 2",
	recipe = {
                 {'farming:raspberries', 'farming:bread', 'ethereal:orange'},
     }
})

minetest.register_craft({
	output = "foody:chocolate_muffin 2",
	recipe = {
                 {'farming:chocolate_dark', 'farming:bread', 'farming:chocolate_dark'},
     }
})

minetest.register_craft({
	output = "foody:coffeecake_muffin 2",
	recipe = {
                 {'farming:coffee_beans', 'farming:bread', 'farming:coffee_beans'},
     }
})
