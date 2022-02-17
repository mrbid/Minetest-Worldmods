minetest.register_craftitem("galaxium:unobtarium_ingot", {
	description = "Unobtarium Ingot",
	inventory_image = "unobtarium_ingot.png",
})

minetest.register_craftitem("galaxium:galaxium_ingot", {
	description = "Galaxium Ingot",
	inventory_image = "galaxium_ingot.png",
})

minetest.register_craftitem("galaxium:titanium_plate", {
	description = "Titanium Plate",
	inventory_image = "titanium_plate.png",
})

minetest.register_craftitem("galaxium:amethyst_emblem", {
	description = "Amethyst Emblem",
	inventory_image = "emblem.png",
})

minetest.register_craftitem("galaxium:stardust", {
	description = "Stardust",
	inventory_image = "stardust.png",
})

minetest.register_craftitem("galaxium:crystal_dust", {
	description = "Crystal Dust",
	inventory_image = "crystal_dust.png",
})

minetest.register_craft({
	output = "galaxium:amethyst_emblem",
	recipe = {
		{"","galaxium:titanium_plate",""},
		{"galaxium:titanium_plate","caverealms:glow_amethyst","galaxium:titanium_plate"},
		{"","galaxium:titanium_plate",""},
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "galaxium:stardust 2",
	recipe = {"galaxium:crystal_dust", "ethereal:fire_dust", "technic:mithril_dust"}
})

minetest.register_craft({
	output = "galaxium:shield_galaxium",
	recipe = {
		{"galaxium:galaxium_ingot", "galaxium:amethyst_emblem", "galaxium:galaxium_ingot"},
		{"galaxium:galaxium_ingot", "galaxium:stardust", "galaxium:galaxium_ingot"},
		{"", "galaxium:galaxium_ingot", ""},
	}
})

minetest.register_craft({
	output = "galaxium:boots_galaxium",
	recipe = {
		{"galaxium:galaxium_ingot", "", "galaxium:galaxium_ingot"},
		{"galaxium:galaxium_ingot", "galaxium:stardust", "galaxium:galaxium_ingot"},
	}
})

minetest.register_craft({
	output = "galaxium:boots_galaxium",
	recipe = {
		{"galaxium:galaxium_ingot", "galaxium:stardust", "galaxium:galaxium_ingot"},
		{"galaxium:galaxium_ingot", "", "galaxium:galaxium_ingot"},
	}
})

minetest.register_craft({
	output = "galaxium:chestplate_galaxium",
	recipe = {
		{"basic_materials:brass_ingot", "technic:lead_ingot", "basic_materials:brass_ingot"},
		{"space_travel:titanium_ingot", "galaxium:galaxium_ingot", "space_travel:titanium_ingot"},
	}
})

minetest.register_craft({
	output = "galaxium:stardust_orb",
	recipe = {
		{"galaxium:galaxium_ingot", "cr_plus:crystal_glass", "galaxium:galaxium_ingot"},
		{"cr_plus:crystal_glass", "galaxium:stardust", "cr_plus:crystal_glass"},
		{"galaxium:galaxium_ingot", "cr_plus:crystal_glass", "galaxium:galaxium_ingot"},
	}
})

technic.register_grinder_recipe({
	input = {"ethereal:crystal_spike"},
	output = "galaxium:crystal_dust",
	time = 32,
})

technic.register_alloy_recipe({
	input = {"xtraores:rarium_ingot", "xtraores:unobtanium_ingot"},
	output = "galaxium:unobtarium_ingot",
	time = 16,
})

technic.register_alloy_recipe({
	input = {"xtraores:geminitinum_ingot 3", "galaxium:unobtarium_ingot"},
	output = "galaxium:galaxium_ingot",
	time = 32,
})

technic.register_compressor_recipe({
	input = {"xtraores:titanium_ingot 4"},
	output = "galaxium:titanium_plate"
})

armor:register_armor("galaxium:shield_galaxium", {
	description = "Galaxium Shield",
	inventory_image = "galaxium_inv_shield_galaxium.png",
	armor_groups = {fleshy=110},
	groups = {armor_shield=100, armor_heal=90, armor_fire=1, armor_use=10},
})

armor:register_armor("galaxium:boots_galaxium", {
	description = "Galaxium Boots",
	inventory_image = "galaxium_inv_boots_galaxium.png",
	groups = {armor_feet=1, physics_speed=1.25, physics_jump=0.55, physics_gravity=-0.1, armor_use=10},
})

armor:register_armor("galaxium:chestplate_galaxium", {
	description = "Galaxium Pauldron",
	inventory_image = "galaxium_inv_chestplate_galaxium.png",
	armor_groups = {fleshy=10, radiation=100, physics_jump=-0.1, physics_speed=-0.2},
	groups = {armor_torso=1, armor_fire=1, armor_use=10},
})

table.insert(armor.elements, "orb")

armor:register_armor("galaxium:stardust_orb", {
	description = "Stardust Orb",
	inventory_image = "stardust_orb.png",
	groups = {armor_orb=1, physics_gravity=-0.65, armor_use=10},
})

minetest.register_alias("galaxium:chestplate_stardust", "galaxium:stardust_orb")

local materials = {
	"galaxium",
	"unobtarium",
}

for _, name in pairs(materials) do
	minetest.register_alias("galaxium:"..name.."_bar", "galaxium:"..name.."_ingot")
end
