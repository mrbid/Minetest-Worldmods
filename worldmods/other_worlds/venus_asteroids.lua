-- Approximate realm limits
local YMIN = otherworlds.settings.venus_asteroids.YMIN or 15000
local YMAX = otherworlds.settings.venus_asteroids.YMAX or 16000


-- Register on_generated function for this layer
minetest.register_on_generated(
		otherworlds.asteroids.create_on_generated(YMIN, YMAX, {

	c_air = minetest.get_content_id("air"),
	c_obsidian = minetest.get_content_id("space_travel:venus_stone_tin_ore"),
	c_stone = minetest.get_content_id("space_travel:venus_stone"),
	c_cobble = minetest.get_content_id("space_travel:venus_cobble"),
	c_gravel = minetest.get_content_id("space_travel:venus_gravel"),
	c_dust = minetest.get_content_id("space_travel:venus_dust"),
	c_ironore = minetest.get_content_id("space_travel:venus_stone_iron_ore"),
	c_copperore = minetest.get_content_id("space_travel:venus_stone_copper_ore"),
	c_goldore = minetest.get_content_id("space_travel:venus_stone_gold_ore"),
	c_diamondore = minetest.get_content_id("space_travel:venus_stone_diamond_ore"),
	c_meseore = minetest.get_content_id("space_travel:venus_stone_mese_ore"),
	c_waterice = minetest.get_content_id("space_travel:venus_stone_galena_ore"),
	c_atmos = minetest.get_content_id("asteroid:atmos"),
	c_snowblock = minetest.get_content_id("space_travel:tholins"),
}))

