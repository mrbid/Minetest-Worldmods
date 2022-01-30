-- Approximate realm limits
local YMIN = otherworlds.settings.minthe_asteroids.YMIN or 11000
local YMAX = otherworlds.settings.minthe_asteroids.YMAX or 12000


-- Register on_generated function for this layer
minetest.register_on_generated(
		otherworlds.asteroids.create_on_generated(YMIN, YMAX, {

	c_air = minetest.get_content_id("air"),
	c_obsidian = minetest.get_content_id("space_travel:minthe_stone_with_tin"),
	c_stone = minetest.get_content_id("space_travel:minthe_stone"),
	c_cobble = minetest.get_content_id("space_travel:minthe_cobble"),
	c_gravel = minetest.get_content_id("space_travel:minthe_sandstone"),
	c_dust = minetest.get_content_id("space_travel:minthe_sand"),
	c_ironore = minetest.get_content_id("space_travel:minthe_stone_with_iron"),
	c_copperore = minetest.get_content_id("space_travel:minthe_stone_with_copper"),
	c_goldore = minetest.get_content_id("space_travel:minthe_stone_with_gold"),
	c_diamondore = minetest.get_content_id("space_travel:minthe_stone_with_diamond"),
	c_meseore = minetest.get_content_id("space_travel:minthe_stone_with_mese"),
	c_waterice = minetest.get_content_id("default:ice"),
	c_atmos = minetest.get_content_id("asteroid:atmos"),
	c_snowblock = minetest.get_content_id("default:snowblock"),
}))

