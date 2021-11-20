-- Approximate realm limits
local YMIN = otherworlds.settings.osiris_asteroids.YMIN or 12000
local YMAX = otherworlds.settings.osiris_asteroids.YMAX or 13000


-- Register on_generated function for this layer
minetest.register_on_generated(
		otherworlds.asteroids.create_on_generated(YMIN, YMAX, {

	c_air = minetest.get_content_id("air"),
	c_obsidian = minetest.get_content_id("space_travel:osiris_tin_ore"),
	c_stone = minetest.get_content_id("space_travel:space_stone"),
	c_cobble = minetest.get_content_id("space_travel:space_cobble"),
	c_gravel = minetest.get_content_id("space_travel:space_gravel"),
	c_dust = minetest.get_content_id("space_travel:space_dust"),
	c_ironore = minetest.get_content_id("space_travel:osiris_iron_ore"),
	c_copperore = minetest.get_content_id("space_travel:osiris_copper_ore"),
	c_goldore = minetest.get_content_id("space_travel:osiris_gold_ore"),
	c_diamondore = minetest.get_content_id("space_travel:osiris_diamond_ore"),
	c_meseore = minetest.get_content_id("space_travel:osiris_mese_ore"),
	c_waterice = minetest.get_content_id("default:ice"),
	c_atmos = minetest.get_content_id("asteroid:atmos"),
	c_snowblock = minetest.get_content_id("default:snowblock"),
}))

