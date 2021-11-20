cc_colors = {
	{"white", "white", "unicolor_white"},
	{"yellow", "yellow", "unicolor_yellow"},
	{"orange", "orange", "unicolor_orange"},
	{"red", "red", "unicolor_red"},
	{"redviolet", "red-violet", "unicolor_red_violet"},
	{"magenta", "magenta", "unicolor_magenta"},
	{"violet", "violet", "unicolor_violet"},
	{"blue", "blue", "unicolor_blue"},
	{"skyblue", "skyblue", "unicolor_sky_blue"},
	{"cyan", "cyan", "unicolor_cyan"},
	{"aqua", "aqua", "unicolor_aqua"},
	{"green", "green", "unicolor_green"},
	{"lime", "lime", "unicolor_lime"},
	{"pink", "pink", "unicolor_light_red"},
	{"brown", "brown", "unicolor_dark_orange"},
	{"dark_green", "dark green", "unicolor_dark_green"},
	{"light_gray", "light gray", "unicolor_grey"},
	{"dark_gray", "dark gray", "unicolor_darkgrey"},
	{"black", "black", "unicolor_black"}
}

local light_level = 14
local paint_roller_mod = minetest.get_modpath("paint_roller")

for i = 1, #cc_colors do

	local c = cc_colors[i][1]
	local h = cc_colors[i][2]
	local d = cc_colors[i][3]

	-- Blocks with a simple square pattern
	minetest.register_node("colorcubes:"..c.."_single", {
		description = h.." basic color cube",
		tiles = {"colorcubes_1_"..c..".png"},
		groups = {dig_immediate = 2, cc_single = 1},
	})

	-- Recipe to dye colour cube blocks (and dye name fixes)
	local recipe1 = c
	local recipe2

	if recipe1 == "redviolet" then
		recipe1 = "group:dye,color_red"
		recipe2 = "group:dye,color_violet"
	elseif recipe1 == "skyblue" then
		recipe1 = "group:dye,color_blue"
		recipe2 = "group:dye,color_white"
	elseif recipe1 == "aqua" then
		recipe1 = "group:dye,color_green"
		recipe2 = "group:dye,color_cyan"
	elseif recipe1 == "lime" then
		recipe1 = "group:dye,color_green"
		recipe2 = "group:dye,color_white"
	elseif recipe1 == "dark_gray" then
		recipe1 = "group:dye,color_dark_grey"
	elseif recipe1 == "light_gray" then
		recipe1 = "group:dye,color_grey"
	else
		recipe1 = "group:dye,color_" .. c
		recipe2 = nil
	end

	minetest.register_craft({
		output = "colorcubes:" .. c .. "_single",
		recipe = {
			{"group:cc_single", recipe1, recipe2},
		},
	})

	-- Windows
	minetest.register_node("colorcubes:"..c.."_window", {
		description = h.." window color cube",
		tiles = {"colorcubes_window_"..c..".png"},
		inventory_image = minetest.inventorycube("colorcubes_window_"..c..".png"),
		groups = {dig_immediate = 2, cc_window = 1},
		use_texture_alpha = true,
		drawtype = "glasslike",
		sunlight_propagates = true,
		paramtype = "light",
	})

	-- Blocks with a tile pattern (4 tiles)
	minetest.register_node("colorcubes:"..c.."_tiled", {
		description = h.." tiled color cube",
		tiles = {"colorcubes_4_"..c..".png"},
		groups = {dig_immediate = 2, cc_tiled = 1},
	})

	-- Blocks with a concentric square pattern
	minetest.register_node("colorcubes:"..c.."_inward", {
		description = h.." concentric color cube",
		tiles = {"colorcubes_inward_"..c..".png"},
		groups = {dig_immediate = 2, cc_inward = 1},
	})

	-- Lamps in different brightness levels
	if light_level > 1 then

		minetest.register_node("colorcubes:"..c.."_light", {
			description = h.." light color cube",
			tiles = {"colorcubes_light_"..c..".png"},
			groups = {dig_immediate = 2, cc_light = 1},
			light_source = light_level,
		})

		if paint_roller_mod then
			paint_roller.register_one("colorcubes:"..c.."_light", d, "light color cubes")
		end

		light_level = light_level - 1
	end

	--[[ If the paint_roller mod is installed, register the nodes to it ]]
	if paint_roller_mod then
		paint_roller.register_one("colorcubes:"..c.."_single", d, "basic color cubes")
		paint_roller.register_one("colorcubes:"..c.."_tiled", d, "tiled color cubes")
		paint_roller.register_one("colorcubes:"..c.."_inward", d, "concentric color cubes")
		paint_roller.register_one("colorcubes:"..c.."_window", d, "window color cubes")
	end

	-- Register various crafting recipes for convenience
	minetest.register_craft({
		output = "colorcubes:"..c.."_tiled 4",
		recipe = {
			{"colorcubes:"..c.."_single", "colorcubes:"..c.."_single"},
			{"colorcubes:"..c.."_single", "colorcubes:"..c.."_single"},
		},
	})

	minetest.register_craft({
		output = "colorcubes:"..c.."_single",
		recipe = {
			{"colorcubes:"..c.."_tiled"}
		},
	})

	minetest.register_craft({
		output = "colorcubes:"..c.."_inward 8",
		recipe = {
			{"colorcubes:"..c.."_single", "colorcubes:"..c.."_single", "colorcubes:"..c.."_single"},
			{"colorcubes:"..c.."_single", "", "colorcubes:"..c.."_single"},
			{"colorcubes:"..c.."_single", "colorcubes:"..c.."_single", "colorcubes:"..c.."_single"},
		},
	})

	minetest.register_craft({
		output = "colorcubes:"..c.."_single",
		recipe = {
			{"colorcubes:"..c.."_inward"}
		},
	})
end

-- Main and missing crafts

minetest.register_craft({
	output = "colorcubes:white_single",
	recipe = {
		{"default:glass", "default:glass", "default:glass"},
		{"default:glass", "default:glass", "default:glass"},
		{"default:glass", "default:glass", "default:glass"},
	},
})

--[[ Tiled blocks with 2 different colors (usual complementary colors) ]]

local complementary = {
	{"yellow", "blue", "yellow/blue tiled color cube"},
	{"aqua", "redviolet", "aqua/red-violet tiled color cube"},
	{"red", "cyan", "red/cyan tiled color cube"},
	{"light_gray", "dark_gray", "light/dark gray tiled color cube"},
	{"green", "magenta", "green/magenta tiled color cube"},
	{"orange", "skyblue", "orange/skyblue tiled color cube"},
	{"lime", "violet", "lime/violet tiled color cube"},
	{"black", "white", "black/white tiled color cube"},
	{"orange", "brown", "orange/brown tiled color cube"}
}

for i = 1, #complementary do

	local c1 = complementary[i][1]
	local c2 = complementary[i][2]
	local nodeid = "colorcubes:"..c1.."_"..c2.."_tiled"
	local tex = "colorcubes_4c_"..c1.."_"..c2..".png"
	local texR90 = tex .. "^[transformR90"

	minetest.register_node(nodeid, {
		description = complementary[i][3],
		tiles = {tex, tex, tex, tex, texR90, texR90},
		groups = {dig_immediate = 2},
	})

	minetest.register_craft({
		output = nodeid,
		recipe = {
			{"colorcubes:"..c1.."_single", "colorcubes:"..c2.."_single"},
			{"colorcubes:"..c2.."_single", "colorcubes:"..c1.."_single"},
		},
	})

	minetest.register_craft({
		output = "colorcubes:white_single 4",
		recipe = {
			{nodeid},
		},
	})

	--[[ This register the block to the paint roller mod. Note that this block can
	only be painted, but it can not be reversed; it will not be possible to paint a
	tiled block so that it becomes a 2-color block. Thus, we use minor hack by using
	a fake dye group called “none” to make sure there is no dye to turn a tiled block
	into a 2-color tiled block. ]]
	if paint_roller_mod then
		paint_roller.register_one(nodeid, "none", "tiled color cubes")
	end
end
