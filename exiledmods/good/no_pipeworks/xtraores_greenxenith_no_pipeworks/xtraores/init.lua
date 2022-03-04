minetest.log("action", "[MOD] Xtraores: Loading...")

dofile(minetest.get_modpath("xtraores").."/aliases.lua")

xtraores = {}

function xtraores.upper(str)
    return (str:gsub("^%l", string.upper))
end

function xtraores.register_stairs(subname, recipeitem, groups, images, desc, sounds)
	if minetest.global_exists("stairsplus") then
		-- Unregister stairs because moreblocks already provides them
		minetest.unregister_item("stairs:stair_"..subname)
		minetest.unregister_item("stairs:slab_"..subname)
	elseif stairs.mod and stairs.mod == "redo" then
		stairs.register_all(subname, recipeitem,
			groups,
			images,
			desc,
			sounds
		)
	else
		stairs.register_stair_and_slab(subname, recipeitem,
			groups,
			images,
			desc.." Stair",
			desc.." Slab",
			sounds
		)
	end	
end

--Registration function to register all items/blocks for specified ore
local function register_all(name, def)
	if def.ore then
		minetest.register_node("xtraores:stone_with_"..name, {
			description = xtraores.upper(name).." Ore",
			tiles = def.ore_tiles or {"default_stone.png^xtraores_mineral_"..name..".png"},
			is_ground_content = true,
			groups = def.ore[3],
			drop = "xtraores:"..name.."_lump",
			sounds = default.node_sound_stone_defaults(),
		})

		minetest.register_ore({
			ore_type       = "scatter",
			ore            = "xtraores:stone_with_"..name,
			wherein        = "default:stone",
			clust_scarcity = def.ore[1]*def.ore[1]*def.ore[1],
			clust_num_ores = 5,
			clust_size     = 3,
			y_min          = -31000,
			y_max		   = 100, --def.ore[2],
			flags          = "absheight",
		})
	end

	if def.brick ~= false then
		minetest.register_node("xtraores:"..name.."_brick", {
			description = xtraores.upper(name).." Bricks",
			tiles = def.brick_tiles or {"xtraores_"..name.."_brick.png"},
			is_ground_content = true,
			groups = def.ore[3],
			sounds = default.node_sound_stone_defaults(),
		})

		minetest.register_craft({
			output = "xtraores:"..name.."_brick",
			recipe = {
				{"xtraores:"..name.."_ingot", "xtraores:"..name.."_ingot"},
				{"xtraores:"..name.."_ingot", "xtraores:"..name.."_ingot"},
			}
		})

		minetest.register_craft({
			type = "shapeless",
			output = "xtraores:"..name.."_ingot 4",
			recipe = {"xtraores:"..name.."_brick"},
		})
	end

	if def.block ~= false then
		minetest.register_node("xtraores:"..name.."_block", {
			description = xtraores.upper(name).." Block",
			tiles = def.block_tiles or {"xtraores_"..name.."_block.png"},
			is_ground_content = true,
			groups = def.ore[3],
			sounds = default.node_sound_stone_defaults(),
		})

		minetest.register_craft({
			output = "xtraores:"..name.."_block",
			recipe = {
				{"xtraores:"..name.."_ingot", "xtraores:"..name.."_ingot", "xtraores:"..name.."_ingot"},
				{"xtraores:"..name.."_ingot", "xtraores:"..name.."_ingot", "xtraores:"..name.."_ingot"},
				{"xtraores:"..name.."_ingot", "xtraores:"..name.."_ingot", "xtraores:"..name.."_ingot"},
			}
		})

		minetest.register_craft({
			type = "shapeless",
			output = "xtraores:"..name.."_ingot 9",
			recipe = {"xtraores:"..name.."_block"},
		})
	end

	if def.compressed_block ~= false then
		minetest.register_node("xtraores:"..name.."_block_compressed", {
			description = "Compressed "..xtraores.upper(name).." Block",
			tiles = def.compressed_block_tiles or {"xtraores_"..name.."_block_compressed.png"},
			is_ground_content = true,
			groups = def.ore[3],
			sounds = default.node_sound_stone_defaults(),
		})

		if minetest.get_modpath("technic") then
			technic.register_compressor_recipe({
				input = {"xtraores:"..name.."_block 8"},
				output = "xtraores:"..name.."_block_compressed 1",
				time = 10,
			})

			minetest.register_craft({
				type = "shapeless",
				output = "xtraores:"..name.."_block 8",
				recipe = {"xtraores:"..name.."_block_compressed"},
			})
		else
			minetest.register_craft({
				output = "xtraores:"..name.."_block_compressed",
				recipe = {
					{"xtraores:"..name.."_block", "xtraores:"..name.."_block", "xtraores:"..name.."_block"},
					{"xtraores:"..name.."_block", "xtraores:"..name.."_block", "xtraores:"..name.."_block"},
					{"xtraores:"..name.."_block", "xtraores:"..name.."_block", "xtraores:"..name.."_block"},
				},
			})

			minetest.register_craft({
				type = "shapeless",
				output = "xtraores:"..name.."_block 9",
				recipe = {"xtraores:"..name.."_block_compressed"},
			})
		end
	end

	if def.chiseled_block ~= false then
		minetest.register_node("xtraores:"..name.."_block_chiseled", {
			description = "Chiseled "..xtraores.upper(name).." Block",
			tiles = def.chiseled_block_tiles or {"xtraores_"..name.."_block_chiseled.png"},
			is_ground_content = true,
			groups = def.ore[3],
			sounds = default.node_sound_stone_defaults(),
		})

		minetest.register_craft({
			output = "xtraores:"..name.."_block_chiseled 8",
			recipe = {
				{"xtraores:"..name.."_block", "xtraores:"..name.."_block", "xtraores:"..name.."_block"},
				{"xtraores:"..name.."_block", "screwdriver:screwdriver", "xtraores:"..name.."_block"},
				{"xtraores:"..name.."_block", "xtraores:"..name.."_block", "xtraores:"..name.."_block"},
			},
			replacements = {{"screwdriver:screwdriver", "screwdriver:screwdriver"}},
		})
	end

	if def.stair ~= false then
		if def.brick ~= false then
			xtraores.register_stairs(name.."_brick", "xtraores:"..name.."_brick",
				def.ore[3],
				def.brick_tiles or {"xtraores_"..name.."_brick.png"},
				xtraores.upper(name).." Brick",
				default.node_sound_stone_defaults()
			)
		end

		if def.block ~= false then
			xtraores.register_stairs(name.."_block", "xtraores:"..name.."_block",
				def.ore[3],
				def.block_tiles or {"xtraores_"..name.."_block.png"},
				xtraores.upper(name).." Block",
				default.node_sound_stone_defaults()
			)
		end

		if def.compressed_block ~= false then
			xtraores.register_stairs(name.."_block_compressed", "xtraores:"..name.."_block_compressed",
				def.ore[3],
				def.compressed_block_tiles or {"xtraores_"..name.."_block_compressed.png"},
				"Compressed "..xtraores.upper(name).." Block",
				default.node_sound_stone_defaults()
			)
		end

		if def.chiseled_block ~= false then
			xtraores.register_stairs(name.."_block_chiseled", "xtraores:"..name.."_block_chiseled",
				def.ore[3],
				def.chiseled_block_tiles or {"xtraores_"..name.."_block_chiseled.png"},
				"Chiseled "..xtraores.upper(name).." Block",
				default.node_sound_stone_defaults()
			)
		end

		if minetest.global_exists("stairsplus") then
			if def.brick ~= false then
				stairsplus:register_all("xtraores", name.."_block", "xtraores:"..name.."_block", {
					description = xtraores.upper(name).. " Block",
					tiles = def.block_tiles or {"xtraores_"..name.."_block.png"},
					groups = def.ore[3],
					sounds = default.node_sound_stone_defaults()
				})
			end

			if def.block ~= false then
				stairsplus:register_all("xtraores", name.."_brick", "xtraores:"..name.."_brick", {
					description = xtraores.upper(name).." Brick",
					tiles = def.brick_tiles or {"xtraores_"..name.."_brick.png"},
					groups = def.ore[3],
					sounds = default.node_sound_stone_defaults()
				})
			end

			if def.compressed_block ~= false then
				stairsplus:register_all("xtraores", name.."_block_compressed", "xtraores:"..name.."_block_compressed", {
					description = xtraores.upper(name).." Compressed Block",
					tiles = def.compressed_block_tiles or {"xtraores_"..name.."_block_compressed.png"},
					groups = def.ore[3],
					sounds = default.node_sound_stone_defaults()
				})
			end

			if def.chiseled_block ~= false then
				stairsplus:register_all("xtraores", name.."_block_chiseled", "xtraores:"..name.."_block_chiseled", {
					description = xtraores.upper(name).." Chiseled Block",
					tiles = def.chiseled_block_tiles or {"xtraores_"..name.."_block_chiseled.png"},
					groups = def.ore[3],
					sounds = default.node_sound_stone_defaults()
				})
			end
		end
	end

	minetest.register_craftitem("xtraores:"..name.."_lump", {
		description = def.lump or xtraores.upper(name).." Lump",
		inventory_image = "xtraores_"..name.."_lump.png",
	})

	minetest.register_craftitem("xtraores:"..name.."_ingot", {
		description = def.ingot or xtraores.upper(name).." Ingot",
		inventory_image = "xtraores_"..name.."_ingot.png",
	})

	minetest.register_craft({
		type = "cooking",
		cooktime = def.cooktime or nil,
		output = "xtraores:"..name.."_ingot",
		recipe = "xtraores:"..name.."_lump",
	})

	--Dust registration for Technic
	if def.dust ~= false then
		if minetest.get_modpath("technic") then
			minetest.register_craftitem("xtraores:"..name.."_dust", {
				description = xtraores.upper(name).." Dust",
				inventory_image = "xtraores_"..name.."_dust.png",
			})

			technic.register_grinder_recipe({
				input = {"xtraores:"..name.."_lump"},
				output = "xtraores:"..name.."_dust 2",
				time = 5,
			})

			minetest.register_craft({
				type = "cooking",
				recipe = "xtraores:"..name.."_dust",
				output = "xtraores:"..name.."_ingot",
			})
		end
	end

	if def.drill then
		minetest.register_tool("xtraores:drill_"..name, {
			description = xtraores.upper(name).." Drill",
			inventory_image = "xtraores_drill_"..name..".png",
			tool_capabilities = {
				full_punch_interval = 0.001,
				max_drop_level=3,
				groupcaps=def.drill[1],
				damage_groups = {fleshy=def.drill[2]},
			},
		})

		minetest.register_craft({
			output = "xtraores:drill_"..name,
			recipe = {
				{"xtraores:"..name.."_ingot", "xtraores:"..name.."_ingot", "xtraores:"..name.."_ingot"},
				{"", "xtraores:"..name.."_ingot", ""},
				{"", "default:diamond", ""},
			}
		})
	end

	if def.pick then
		minetest.register_tool("xtraores:pick_"..name, {
			description = xtraores.upper(name).." Pick",
			inventory_image = "xtraores_pick_"..name..".png",
			tool_capabilities = {
				full_punch_interval = 0.9,
				max_drop_level=3,
				groupcaps=def.pick[1],
				damage_groups = {fleshy=def.pick[2]},
			},
		})

		minetest.register_craft({
			output = "xtraores:pick_"..name,
			recipe = {
				{"xtraores:"..name.."_ingot", "xtraores:"..name.."_ingot", "xtraores:"..name.."_ingot"},
				{"", "group:stick", ""},
				{"", "group:stick", ""},
			}
		})
	end

	if def.shovel then
		minetest.register_tool("xtraores:shovel_"..name, {
			description = xtraores.upper(name).." Shovel",
			inventory_image = "xtraores_shovel_"..name..".png",
			wield_image = "xtraores_shovel_"..name..".png^[transformR90",
			tool_capabilities = {
				full_punch_interval = 1.0,
				max_drop_level=3,
				groupcaps=def.shovel[1],
				damage_groups = {fleshy=def.shovel[2]},
			},
		})

		minetest.register_craft({
			output = "xtraores:shovel_"..name,
			recipe = {
				{"xtraores:"..name.."_ingot"},
				{"group:stick"},
				{"group:stick"},
			}
		})
	end

	if def.axe then
		minetest.register_tool("xtraores:axe_"..name, {
			description = xtraores.upper(name).." Axe",
			inventory_image = "xtraores_axe_"..name..".png",
			tool_capabilities = {
				full_punch_interval = 0.9,
				max_drop_level=1,
				groupcaps=def.axe[1],
				damage_groups = {fleshy=def.axe[2]},
			},
		})

		minetest.register_craft({
			output = "xtraores:axe_"..name,
			recipe = {
				{"xtraores:"..name.."_ingot", "xtraores:"..name.."_ingot"},
				{"xtraores:"..name.."_ingot", "group:stick"},
				{"", "group:stick"},
			}
		})
	end

	if def.chainsaw then
		minetest.register_tool("xtraores:axe_"..name, {
			description = xtraores.upper(name).." Chainsaw",
			inventory_image = "xtraores_axe_"..name..".png",
			tool_capabilities = {
				full_punch_interval = 0.001,
				max_drop_level=1,
				groupcaps=def.chainsaw[1],
				damage_groups = {fleshy=def.chainsaw[2]},
			},
		})

		minetest.register_craft({
			output = "xtraores:axe_"..name,
			recipe = {
				{"default:steel_ingot", "xtraores:"..name.."_ingot"},
				{"default:steel_ingot", "xtraores:"..name.."_ingot"},
				{"", "xtraores:"..name.."_ingot"},
			}
		})
	end

	if def.sword then
		minetest.register_tool("xtraores:sword_"..name, {
			description = xtraores.upper(name).." Sword",
			inventory_image = "xtraores_sword_"..name..".png",
			tool_capabilities = {
				full_punch_interval = 0.7,
				max_drop_level=1,
				groupcaps=def.sword[1],
				damage_groups = {fleshy=def.sword[2]},
			}
		})

		minetest.register_craft({
			output = "xtraores:sword_"..name,
			recipe = {
				{"xtraores:"..name.."_ingot"},
				{"xtraores:"..name.."_ingot"},
				{"group:stick"},
			}
		})
	end

	if def.spear then
		minetest.register_tool("xtraores:spear_"..name, {
			description = xtraores.upper(name).." Spear",
			inventory_image = "xtraores_spear_"..name..".png",
			range = 12,
			tool_capabilities = {
				full_punch_interval = 0.7,
				max_drop_level=1,
				groupcaps=def.spear[1],
				damage_groups = {fleshy=def.spear[2]},
			}
		})

		minetest.register_craft({
			output = "xtraores:spear_"..name,
			recipe = {
				{"", "xtraores:"..name.."_ingot", ""},
				{"xtraores:"..name.."_ingot", "group:stick", "xtraores:"..name.."_ingot"},
				{"", "group:stick", ""},
			}
		})
	end
end

--[[

How to register a thing:

(all inputs are optional)
register_all("name", {
	ore_tiles = {tiles},
	brick_tiles = {tiles},
	block_tiles = {tiles},
	compressed_block_tiles = {tiles},
	chiseled_block_tiles = {tiles},
	block = false,
	compressed_block = false,
	chiseled_block = false,
	brick = false,
	stair = false,
	dust = false,
	lump = "lump description",
	ingot = "ingot description",
	pick = {group_caps, fleshy},
	shovel = {group_caps, fleshy},
	axe = {group_caps, fleshy},
	sword = {group_caps, fleshy},
	spear = {group_caps, fleshy},
	drill = {group_caps, fleshy},
	chainsaw = {group_caps, fleshy},
	ore = {rarity, y_max, {groups}},
})

]]

--Register the things
register_all("platinum", {
	pick = {{cracky = {times={[1]=2.4, [2]=1.2, [3]=0.60}, uses=15, maxlevel=3}}, 5},
	shovel = {{crumbly = {times={[1]=1.20, [2]=0.60, [3]=0.30}, uses=15, maxlevel=3}}, 4},
	axe = {{
			choppy={times={[1]=2.20, [2]=1.00, [3]=0.60}, uses=15, maxlevel=3},
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=15, maxlevel=3},
	}, 6},
	sword = {{snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=23, maxlevel=3}}, 7},
	spear = {{snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=23, maxlevel=3}}, 7},
	ore = {15, -100, {cracky=2}},
})

register_all("cobalt", {
	pick = {{cracky = {times={[1]=1.5, [2]=0.85, [3]=0.40}, uses=60, maxlevel=3}, weryhard = {times={[3]=3.00}, uses=60, maxlevel=3}}, 8},
	shovel = {{crumbly = {times={[1]=0.90, [2]=0.40, [3]=0.20}, uses=60, maxlevel=3}}, 7},
	axe = {{
			choppy={times={[1]=1.80, [2]=0.70, [3]=0.30}, uses=60, maxlevel=3},
			snappy={times={[1]=1.50, [2]=0.70, [3]=0.20}, uses=50, maxlevel=3},
	}, 9},
	sword = {{snappy={times={[1]=1.50, [2]=0.70, [3]=0.20}, uses=70, maxlevel=3}}, 10},
	spear = {{snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=23, maxlevel=3}}, 10},
	ore = {20, -1000, {cracky=1}},
})

register_all("osmium", {
	lump = "Osmium Crystal",
	pick = {{cracky = {times={[1]=1.2, [2]=0.70, [3]=0.30}, uses=100, maxlevel=3}, weryhard = {times={[3]=2.00, [2]=3.00}, uses=100, maxlevel=3}}, 13},
	shovel = {{crumbly = {times={[1]=0.60, [2]=0.25, [3]=0.15}, uses=100, maxlevel=3}}, 12},
	axe = {{
		choppy={times={[1]=1.20, [2]=0.40, [3]=0.15}, uses=100, maxlevel=3},
		snappy={times={[1]=1.0, [2]=0.40, [3]=0.10}, uses=75, maxlevel=3},
	}, 14},
	sword = {{snappy={times={[1]=1.0, [2]=0.40, [3]=0.10}, uses=100, maxlevel=3}}, 15},
	spear = {{snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=23, maxlevel=3}}, 15},
	ore = {23, -2000, {weryhard=3}},
})

register_all("adamantite", {
	lump = "Adamantite Crystal",
	pick = {{cracky = {times={[1]=0.6, [2]=0.35, [3]=0.15}, uses=200, maxlevel=3}, weryhard = {times={[3]=1.00, [2]=2.00, [1]=3.00}, uses=200, maxlevel=3}}, 18},
	shovel = {{crumbly = {times={[1]=0.30, [2]=0.125, [3]=0.075}, uses=200, maxlevel=3}}, 17},
	chainsaw = {{
		choppy={times={[1]=0.40, [2]=0.10, [3]=0.03}, uses=200, maxlevel=3},
		snappy={times={[1]=0.5, [2]=0.20, [3]=0.05}, uses=130, maxlevel=3},
	}, 5},
	sword = {{snappy={times={[1]=0.5, [2]=0.20, [3]=0.05}, uses=200, maxlevel=3}}, 20},
	spear = {{snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=23, maxlevel=3}}, 20},
	ore = {28, -5000, {weryhard=2}},
})

register_all("rarium", {
	drill = {{cracky = {times={[1]=0.3, [2]=0.125, [3]=0.075}, uses=350, maxlevel=3}, weryhard = {times={[3]=0.50, [2]=1.00, [1]=1.50, [0]=2.00}, uses=350, maxlevel=3}, crumbly = {times={[1]=0.15, [2]=0.06, [3]=0.03}, uses=350, maxlevel=3}}, 8},
	chainsaw = {{
		choppy={times={[1]=0.20, [2]=0.05, [3]=0.015}, uses=350, maxlevel=3},
		snappy={times={[1]=0.25, [2]=0.10, [3]=0.025}, uses=260, maxlevel=3},
	}, 8},
	sword = {{snappy={times={[1]=0.25, [2]=0.10, [3]=0.025}, uses=350, maxlevel=3}}, 30},
	spear = {{snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=23, maxlevel=3}}, 30},
	ore = {30, -10000, {weryhard=1}},
})

register_all("unobtainium", {
	drill = {{cracky = {times={[1]=0.15, [2]=0.06, [3]=0.04}, uses=500, maxlevel=3}, weryhard = {times={[3]=0.25, [2]=0.50, [1]=0.75, [0]=1.00}, uses=500, maxlevel=3}, crumbly = {times={[1]=0.15, [2]=0.06, [3]=0.03}, uses=500, maxlevel=3}}, 12},
	chainsaw = {{
		choppy={times={[1]=0.10, [2]=0.025, [3]=0.0075}, uses=500, maxlevel=3},
		snappy={times={[1]=0.0125, [2]=0.05, [3]=0.006}, uses=320, maxlevel=3},
	}, 12},
	sword = {{snappy={times={[1]=0.0125, [2]=0.05, [3]=0.006}, uses=500, maxlevel=3}}, 35},
	spear = {{snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=23, maxlevel=3}}, 35},
	ore = {32, -15000, {weryhard=0}},
})

register_all("titanium", {
	drill = {{cracky = {times={[1]=0.10, [2]=0.04, [3]=0.02}, uses=650, maxlevel=3}, weryhard = {times={[3]=0.10, [2]=0.20, [1]=0.60, [0]=0.80}, uses=650, maxlevel=3}, crumbly = {times={[1]=0.10, [2]=0.04, [3]=0.02}, uses=650, maxlevel=3}}, 15},
	chainsaw = {{
		choppy={times={[1]=0.075, [2]=0.020, [3]=0.005}, uses=650, maxlevel=3},
		snappy={times={[1]=0.0125, [2]=0.05, [3]=0.006}, uses=500, maxlevel=3},
	}, 15},
	sword = {{snappy={times={[1]=0.0125, [2]=0.05, [3]=0.006}, uses=650, maxlevel=3}}, 40},
	spear = {{snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=23, maxlevel=3}}, 40},
	ore = {32, -25000, {weryhard=0}},
})

register_all("geminitinum", {
	lump = "Geminitinum Crystal",
	cooktime = 200,
	ore_tiles = {{name="xtraores_mineral_geminitinum.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=2.0}}},
	brick_tiles = {{name="xtraores_geminitinum_brick.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=1}}},
	block_tiles = {{name="xtraores_geminitinum_block.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=1}}},
	compressed_block = false,
	chiseled_block = false,
	dust = false,
	drill = {{cracky = {times={[1]=0.01, [2]=0.01, [3]=0.01}, uses=1000, maxlevel=3}, weryhard = {times={[3]=0.01, [2]=0.01, [1]=0.01, [0]=0.01}, uses=1000, maxlevel=3}, crumbly = {times={[1]=0.01, [2]=0.01, [3]=0.01}, uses=1000, maxlevel=3}}, 20},
	chainsaw = {{
		choppy={times={[1]=0.001, [2]=0.001, [3]=0.001}, uses=1000, maxlevel=3},
		snappy={times={[1]=0.01, [2]=0.03, [3]=0.002}, uses=750, maxlevel=3},
	}, 20},
	sword = {{snappy={times={[1]=0.01, [2]=0.03, [3]=0.002}, uses=1000, maxlevel=3}}, 20},
	spear = {{snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=23, maxlevel=3}}, 50},
	ore = {35, -32000, {weryhard=0}},
})

--Extras that don't fit register_all
minetest.register_tool("xtraores:sword_excalibur", {
	description = "Excalibur | 75 dmg",
	inventory_image = "xtraores_sword_excalibur.png",
	tool_capabilities = {
		full_punch_interval = 0.1,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.0125, [2]=0.05, [3]=0.006}, uses=500, maxlevel=3},
		},
		damage_groups = {fleshy=75},
	}
})

minetest.register_craft({
	output = "xtraores:sword_excalibur",
	recipe = {
		{"xtraores:sword_osmium", "xtraores:sword_adamantite", "xtraores:sword_rarium"},
		{"xtraores:sword_cobalt", "default:sword_diamond", "xtraores:sword_unobtainium"},
		{"default:diamondblock", "default:mese", "default:diamondblock"},
	}
})

minetest.register_tool("xtraores:spear_gungir", {
	description = "The Gungir (spear) | 160 dmg",
	inventory_image = "xtraores_spear_gungir.png",
	range = 12,
	tool_capabilities = {
		full_punch_interval = 0.3,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=200, maxlevel=3},
		},
		damage_groups = {fleshy=160},
	}
})

minetest.register_craft({
	output = "xtraores:spear_gungir",
	recipe = {
		{"xtraores:sword_excalibur", "xtraores:geminitinum_ingot", "xtraores:sword_excalibur"},
		{"xtraores:geminitinum_ingot", "xtraores:spear_geminitinum", "xtraores:geminitinum_ingot"},
		{"xtraores:sword_excalibur", "xtraores:geminitinum_ingot", "xtraores:sword_excalibur"},
	}
})

if minetest.global_exists("awards") then
	dofile(minetest.get_modpath("xtraores").."/awards.lua")
end

minetest.log("action", "[MOD] Xtraores: Module (main) loaded!")

--The original was 2000+ lines
