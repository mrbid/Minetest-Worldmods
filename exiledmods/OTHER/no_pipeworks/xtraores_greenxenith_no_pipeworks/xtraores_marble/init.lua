--Registration function to register all the marble things
local function register_marble(name, def)
	local desc
	if name ~= "" then
		desc = xtraores.upper(name).." "
	else
		desc = name
	end

	minetest.register_node("xtraores_marble:"..name.."marble", {
		description = desc.."Marble",
		tiles = {"xtraores_"..name.."marble.png"},
		is_ground_content = true,
		groups = {cracky=3},
		sounds = default.node_sound_stone_defaults(),
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "xtraores_marble:"..name.."marble",
		wherein        = "default:stone",
		clust_scarcity = 7*7*7,
		clust_num_ores = 5,
		clust_size     = 3,
		y_min          = -31000,
		y_max          = def.height,
		flags          = "absheight",
	})

	minetest.register_node("xtraores_marble:"..name.."marble_polished", {
		description = "Polished "..desc.."Marble",
		tiles = {"xtraores_"..name.."marble_polished.png"},
		is_ground_content = true,
		groups = {cracky=3},
		sounds = default.node_sound_stone_defaults(),
	})

	minetest.register_node("xtraores_marble:"..name.."marble_bricks", {
		description = desc.."Marble Bricks",
		tiles = {"xtraores_"..name.."marble_bricks.png"},
		is_ground_content = true,
		groups = {cracky=3},
		sounds = default.node_sound_stone_defaults(),
	})

	minetest.register_craft({
		output = "xtraores_marble:"..name.."marble_polished",
		recipe = {
			{"xtraores_marble:"..name.."marble"},
		}
	})

	minetest.register_craft({
		output = "xtraores_marble:"..name.."marble_bricks 4",
		recipe = {
			{"xtraores_marble:"..name.."marble", "xtraores_marble:"..name.."marble"},
			{"xtraores_marble:"..name.."marble", "xtraores_marble:"..name.."marble"},
		}
	})

	minetest.register_node("xtraores_marble:"..name.."marble_column", {
		description = desc.."Marble Column",
		drawtype = "nodebox",
				node_box = {
					type = "fixed",
					fixed = {
						{ -0.4, -0.50, -0.4, 0.4, 0.5, 0.4},
						{ -0.5, -0.50, -0.5, 0.5, -0.3125, 0.5},
						{ -0.5, 0.3125, -0.5, 0.5, 0.5, 0.5},
					},
				},
		tiles = {"xtraores_"..name.."marble_column_top.png", "xtraores_"..name.."marble_column_top.png",
			"xtraores_"..name.."marble_column_side.png", "xtraores_"..name.."marble_column_side.png",
			"xtraores_"..name.."marble_column_side.png", "xtraores_"..name.."marble_column_side.png"},
		is_ground_content = true,
		paramtype = "light",
		groups = {cracky=3},
		sounds = default.node_sound_stone_defaults(),
	})

	minetest.register_craft({
		output = "xtraores_marble:"..name.."marble_column 2",
		recipe = {
			{"xtraores_marble:"..name.."marble"},
			{"xtraores_marble:"..name.."marble"},
		}
	})

	xtraores.register_stairs(name.."marble", "xtraores_marble:"..name.."marble",
		{cracky = 3},
		{"xtraores_"..name.."marble.png"},
		desc.."Marble",
		default.node_sound_stone_defaults()
	)

	xtraores.register_stairs(name.."marble_polished", "xtraores_marble:"..name.."marble_polished",
		{cracky = 3},
		{"xtraores_"..name.."marble_polished.png"},
		"Polished "..desc.."Marble",

		default.node_sound_stone_defaults()
	)

	xtraores.register_stairs(name.."marble_bricks", "xtraores_marble:"..name.."marble_bricks",
		{cracky = 3},
		{"xtraores_"..name.."marble_bricks.png"},
		desc.."Marble Brick",
		default.node_sound_stone_defaults()
	)

	if minetest.global_exists("stairsplus") then
		stairsplus:register_all("xtraores_marble", name.."marble", "xtraores_marble:"..name.."marble", {
			description = desc.."Marble",
			tiles = {"xtraores_"..name.."marble.png"},
			groups ={cracky = 3},
			sounds = default.node_sound_stone_defaults()
		})

		stairsplus:register_all("xtraores_marble", name.."marble_polished", "xtraores_marble:"..name.."marble_polished", {
			description = "Polished "..desc.."Marble",
			tiles = {"xtraores_"..name.."marble_polished.png"},
			groups = {cracky = 3},
			sounds = default.node_sound_stone_defaults()
		})

		stairsplus:register_all("xtraores_marble", name.."marble_bricks", "xtraores_marble:"..name.."marble_bricks", {
			description = desc.."Marble Brick",
			tiles ={"xtraores_"..name.."marble_bricks.png"},
			groups = {cracky = 3},
			sounds = default.node_sound_stone_defaults()
		})
	end

	minetest.register_alias("xtraores:"..name.."marble", "xtraores_marble:"..name.."marble")
	minetest.register_alias("xtraores:"..name.."marble_polished", "xtraores_marble:"..name.."marble_polished")
	minetest.register_alias("xtraores:"..name.."marble_bricks", "xtraores_marble:"..name.."marble_bricks")
	minetest.register_alias("xtraores_mblox:"..name.."marble_column", "xtraores_marble:"..name.."marble_column")

	if minetest.get_modpath("technic_cnc") then
		technic_cnc.register_all("xtraores_marble:"..name.."marble",
			{cracky=3, not_in_creative_inventory=1},
			{"xtraores_"..name.."marble.png"},
		desc.."Marble")
		technic_cnc.register_all("xtraores_marble:"..name.."marble_polished",
			{cracky=3, not_in_creative_inventory=1},
			{"xtraores_"..name.."marble_polished.png"},
		"Polished "..desc.."Marble")
		technic_cnc.register_all("xtraores_marble:"..name.."marble_bricks",
			{cracky=3, not_in_creative_inventory=1},
			{"xtraores_"..name.."marble_bricks.png"},
		desc.."Marble Bricks")
	end
end

--Register the marble things
register_marble("red", {
	height = -8000
})

register_marble("blue", {
	height = -4000
})

register_marble("black", {
	height = -2000
})

register_marble("", {
	height = -1000
})

minetest.log("action", "[MOD] Xtraores: Module (marble) loaded!")


--Well that was fast
