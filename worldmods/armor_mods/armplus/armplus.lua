----- Bucket Helmet
minetest.register_tool("armplus:helmet_bucket", {
	description = "Bucket Helmet",
	inventory_image = "armplus_helmet_bucket_inv.png",
	groups = {armor_head=10, armor_heal=0, armor_use=500},
	wear = 0,
})

minetest.register_craft({
	output = "armplus:helmet_bucket",
	recipe = {
		{"","bucket:bucket_empty",""},
		{"default:steel_ingot","","default:steel_ingot"},
	},
})

minetest.register_craft({
	output = "armplus:helmet_bucket",
	recipe = {
		{"bucket:bucket_empty"},
		{"bucket:bucket_empty"},
	},
})

----- Wool Armor
minetest.register_tool("armplus:wool_armor", {
	description = "Wool Armor",
	inventory_image = "armplus_wool_armor_inv.png",
	groups = {armor_torso=10, armor_heal=5, armor_use=1000},
	wear = 0,
})

minetest.register_craft({
	output = "armplus:wool_armor",
	recipe = {
		{"group:wool","","group:wool"},
		{"group:wool","group:wool","group:wool"},
		{"group:wool","group:wool","group:wool"},
	},
})

----- Ear Muff
minetest.register_tool("armplus:earmuff", {
	description = "EarMuff",
	inventory_image = "armplus_earmuff_inv.png",
	groups = {armor_head=1, armor_heal=1, armor_use=100},
	wear = 0,
})

minetest.register_craft({
	output = "armplus:earmuff",
	recipe = {
		{"default:steel_ingot","default:steel_ingot","default:steel_ingot"},
		{"group:wool","","group:wool"},
	},
})

----- Pumpkin Helmet(s)
minetest.register_tool("armplus:pumpkinhelmet", {
	description = "Pumpkin Helmet",
	inventory_image = "armplus_pumpkinhelmet_inv.png",
	groups = {armor_head=10, armor_heal=30, armor_use=0, physics_speed=6, armor_water=250},
	armor_groups = {radiation=1000},
	wear = 0,
})
minetest.register_craft({
	output = "armplus:pumpkinhelmet",
	recipe = {
		{"group:tree","dye:orange","group:tree"},
		{"group:tree","3d_armor:helmet_wood","group:tree"},
	},
})

minetest.register_tool("armplus:pumpkinhelmet1", {
	description = "Pumpkin Helmet 1",
	inventory_image = "armplus_pumpkinhelmet1_inv.png",
	groups = {armor_head=10, armor_heal=30, armor_use=0, physics_speed=5, armor_water=250},
	armor_groups = {radiation=1000},
	wear = 0,
})
minetest.register_craft({
	output = "armplus:pumpkinhelmet1",
	recipe = {
		{"group:tree","dye:magenta","group:tree"},
		{"group:tree","3d_armor:helmet_wood","group:tree"},
	},
})

minetest.register_tool("armplus:pumpkinhelmet2", {
	description = "Pumpkin Helmet 2",
	inventory_image = "armplus_pumpkinhelmet2_inv.png",
	groups = {armor_head=10, armor_heal=30, armor_use=0, physics_speed=4, armor_water=250},
	armor_groups = {radiation=1000},
	wear = 0,
})
minetest.register_craft({
	output = "armplus:pumpkinhelmet2",
	recipe = {
		{"group:tree","dye:red","group:tree"},
		{"group:tree","3d_armor:helmet_wood","group:tree"},
	},
})

minetest.register_tool("armplus:pumpkinhelmet3", {
	description = "Pumpkin Helmet 3",
	inventory_image = "armplus_pumpkinhelmet3_inv.png",
	groups = {armor_head=10, armor_heal=30, armor_use=0, physics_speed=3, armor_water=250},
	armor_groups = {radiation=1000},
	wear = 0,
})
minetest.register_craft({
	output = "armplus:pumpkinhelmet3",
	recipe = {
		{"group:tree","dye:yellow","group:tree"},
		{"group:tree","3d_armor:helmet_wood","group:tree"},
	},
})

minetest.register_tool("armplus:pumpkinhelmet4", {
	description = "Pumpkin Helmet 4",
	inventory_image = "armplus_pumpkinhelmet4_inv.png",
	groups = {armor_head=10, armor_heal=30, armor_use=0, physics_speed=2, armor_water=250},
	armor_groups = {radiation=1000},
	wear = 0,
})
minetest.register_craft({
	output = "armplus:pumpkinhelmet4",
	recipe = {
		{"group:tree","dye:turquoise","group:tree"},
		{"group:tree","3d_armor:helmet_wood","group:tree"},
	},
})

minetest.register_tool("armplus:pumpkinhelmet5", {
	description = "Pumpkin Helmet 5",
	inventory_image = "armplus_pumpkinhelmet5_inv.png",
	groups = {armor_head=10, armor_heal=30, armor_use=0, physics_speed=1, armor_water=250},
	armor_groups = {radiation=1000},
	wear = 0,
})
minetest.register_craft({
	output = "armplus:pumpkinhelmet5",
	recipe = {
		{"group:tree","dye:cyan","group:tree"},
		{"group:tree","3d_armor:helmet_wood","group:tree"},
	},
})


----- Belt
minetest.register_tool("armplus:belt", {
	description = "Armored Belt",
	inventory_image = "armplus_belt_inv.png",
	groups = {armor_legs=8, armor_heal=0, armor_use=750},
	wear = 0,
})

minetest.register_craft({
	output = "armplus:belt",
	recipe = {
		{"mobs:leather","default:steel_ingot","mobs:leather"},
	},
})

--Another recipe
minetest.register_craft({
	output = "armplus:belt",
	recipe = {
		{"farming:cotton","default:steel_ingot","farming:cotton"},
	},
})

----- Belt
minetest.register_tool("armplus:belt", {
	description = "Armored Belt",
	inventory_image = "armplus_belt_inv.png",
	groups = {armor_legs=8, armor_heal=0, armor_use=750},
	wear = 0,
})

minetest.register_craft({
	output = "armplus:belt",
	recipe = {
		{"mobs:leather","default:steel_ingot","mobs:leather"},
	},
})

--Another recipe
minetest.register_craft({
	output = "armplus:belt",
	recipe = {
		{"group:wool","default:steel_ingot","group:wool"},
	},
})

----- Champion Belt
minetest.register_tool("armplus:championbelt", {
	description = "Armored Belt",
	inventory_image = "armplus_championbelt_inv.png",
	groups = {armor_legs=12, armor_heal=10, armor_use=250},
	wear = 0,
})

minetest.register_craft({
	output = "armplus:championbelt",
	recipe = {
		{"mobs:leather","default:gold_ingot","mobs:leather"},
	},
})

--Another recipe
minetest.register_craft({
	output = "armplus:championbelt",
	recipe = {
		{"group:wool","default:gold_ingot","group:wool"},
	},
})


----- CatWalk Boots
minetest.register_tool("armplus:catwalkboots", {
	description = "CatWalk Boots",
	inventory_image = "armplus_catwalkboots_inv.png",
	groups = {armor_feet=5, armor_heal=0, armor_use=500,
		physics_speed=0, physics_jump=0, physics_gravity=-0.2},
	wear = 0,
})

minetest.register_craft({
	output = "armplus:catwalkboots",
	recipe = {
		{"","default:gold_ingot",""},
		{"group:wool","","group:wool"},
		{"group:wool","","group:wool"},
	},
})


----- Glasses
minetest.register_tool("armplus:glasses", {
	description = "Glasses",
	inventory_image = "armplus_glasses_inv.png",
	groups = {armor_head=2, armor_heal=0, armor_use=750,
		physics_speed=0.05, physics_jump=0, physics_gravity=0},
	wear = 0,
})

minetest.register_craft({
	output = "armplus:glasses",
	recipe = {
		{"default:glass","default:steel_ingot","default:glass"},
		{"default:steel_ingot","","default:steel_ingot"},
	},
})

----- Straw Hat
minetest.register_tool("armplus:strawhat", {
	description = "Straw Hat",
	inventory_image = "armplus_strawhat_inv.png",
	groups = {armor_head=3, armor_heal=0, armor_use=1500,
		physics_speed=0, physics_jump=0, physics_gravity=-0.05},
	wear = 0,
})

minetest.register_craft({
	output = "armplus:strawhat",
	recipe = {
		{"farming:straw","farming:straw","farming:straw"},
		{"farming:straw","","farming:straw"},
	},
})

----- Parka
minetest.register_tool("armplus:parka", {
	description = "Parka",
	inventory_image = "armplus_parka_inv.png",
	groups = {armor_torso=6, armor_heal=0, armor_use=9900},
	wear = 0,
})

minetest.register_craft({
	output = "armplus:parka",
	recipe = {
		{"group:wool","","group:wool"},
		{"group:wool","farming:cotton","group:wool"},
		{"group:wool","farming:cotton","group:wool"},
	},
})
