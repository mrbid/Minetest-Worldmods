-- Approximate realm limits
local YMIN = otherworlds.settings.bacchus_asteroids.YMIN or 7000
local YMAX = otherworlds.settings.bacchus_asteroids.YMAX or 8000


-- Register on_generated function for this layer
minetest.register_on_generated(
		otherworlds.asteroids.create_on_generated(YMIN, YMAX, {

	c_air = minetest.get_content_id("air"),
	c_obsidian = minetest.get_content_id("space_travel:bacchus_stone_tin_ore"),
	c_stone = minetest.get_content_id("space_travel:bacchus_stone"),
	c_cobble = minetest.get_content_id("space_travel:bacchus_cobble"),
	c_gravel = minetest.get_content_id("space_travel:bacchus_dirt"),
	c_dust = minetest.get_content_id("space_travel:bacchus_sand"),
	c_ironore = minetest.get_content_id("space_travel:bacchus_stone_iron_ore"),
	c_copperore = minetest.get_content_id("space_travel:bacchus_stone_copper_ore"),
	c_goldore = minetest.get_content_id("space_travel:bacchus_stone_gold_ore"),
	c_diamondore = minetest.get_content_id("space_travel:bacchus_stone_diamond_ore"),
	c_meseore = minetest.get_content_id("space_travel:bacchus_stone_mese_ore"),
	c_waterice = minetest.get_content_id("space_travel:bacchus_tree"),
	c_atmos = minetest.get_content_id("asteroid:atmos"),
	c_snowblock = minetest.get_content_id("default:snowblock"),
}))


-- Deco code for grass and crystal

-- how often surface decoration appears on top of asteroid cobble
local TOPDECO = 500

local grass = {
	"space_travel:bacchus_grass_1", "space_travel:bacchus_grass_2", "space_travel:bacchus_grass_3",
	"space_travel:bacchus_grass_4", "space_travel:bacchus_grass_5"
}

local crystal = {
	"crystals:ghost_crystal_1", "crystals:ghost_crystal_2",
	"crystals:red_crystal_1", "crystals:red_crystal_2",
	"crystals:rose_quartz_1", "crystals:rose_quartz_2"
}

local random = math.random


-- Add surface decoration
minetest.register_on_generated(function(minp, maxp)

	if minp.y < YMIN or maxp.y > YMAX then
		return
	end

	local bpos, ran
	local coal = minetest.find_nodes_in_area_under_air(minp, maxp,
			{"space_travel:bacchus_dirt"})

	for n = 1, #coal do

		bpos = {x = coal[n].x, y = coal[n].y + 1, z = coal[n].z}

		ran = random(TOPDECO)

		if ran < 100 then -- grass

			minetest.swap_node(bpos, {name = grass[random(#grass)]})

		elseif ran == TOPDECO then -- crystals

			minetest.swap_node(bpos, {name = crystal[random(#crystal)]})
		end
	end
end)
