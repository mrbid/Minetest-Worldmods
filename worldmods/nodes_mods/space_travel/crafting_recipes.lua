--Crafting recipes

--Lead recipes

minetest.register_craft({
    type = "cooking",
    output = "space_travel:lead_ingot",
    recipe = "space_travel:galena_lump",
--    cooktime = 5,
})

minetest.register_craft({
	output = 'space_travel:lead_block',
	recipe = {
		{'space_travel:lead_ingot', 'space_travel:lead_ingot', 'space_travel:lead_ingot'},
		{'space_travel:lead_ingot', 'space_travel:lead_ingot', 'space_travel:lead_ingot'},
		{'space_travel:lead_ingot', 'space_travel:lead_ingot', 'space_travel:lead_ingot'},
	}
})

minetest.register_craft({
    type = "shapeless",
	output = 'space_travel:lead_ingot 9',
	recipe = {
		"space_travel:lead_block",
	}
})

--Lunar Spinel recipes

minetest.register_craft({
	output = 'space_travel:lunar_spinel_block',
	recipe = {
		{'space_travel:lunar_spinel_gem', 'space_travel:lunar_spinel_gem', 'space_travel:lunar_spinel_gem'},
		{'space_travel:lunar_spinel_gem', 'space_travel:lunar_spinel_gem', 'space_travel:lunar_spinel_gem'},
		{'space_travel:lunar_spinel_gem', 'space_travel:lunar_spinel_gem', 'space_travel:lunar_spinel_gem'},
	}
})

minetest.register_craft({
    type = "shapeless",
	output = 'space_travel:lunar_spinel_gem 9',
	recipe = {
		"space_travel:lunar_spinel_block",
	}
})

--Titanium recipes

minetest.register_craft({
    type = "cooking",
    output = "space_travel:titanium_ingot",
    recipe = "space_travel:titanium_lump",
--    cooktime = 5,
})

minetest.register_craft({
	output = 'space_travel:titanium_block',
	recipe = {
		{'space_travel:titanium_ingot', 'space_travel:titanium_ingot', 'space_travel:titanium_ingot'},
		{'space_travel:titanium_ingot', 'space_travel:titanium_ingot', 'space_travel:titanium_ingot'},
		{'space_travel:titanium_ingot', 'space_travel:titanium_ingot', 'space_travel:titanium_ingot'},
	}
})

minetest.register_craft({
    type = "shapeless",
	output = 'space_travel:titanium_ingot 9',
	recipe = {
		"space_travel:titanium_block",
	}
})

--Mars recipes

minetest.register_craft({
    type = "cooking",
    output = "default:iron_lump",
    recipe = "space_travel:mars_iron_powder",
--    cooktime = 5,
})

minetest.register_craft({
	output = 'space_travel:mars_sand 9',
	recipe = {
		{'space_travel:mars_iron_powder', 'space_travel:mars_iron_powder', 'space_travel:mars_iron_powder'},
		{'space_travel:mars_iron_powder', 'space_travel:mars_iron_powder', 'space_travel:mars_iron_powder'},
		{'space_travel:mars_iron_powder', 'space_travel:mars_iron_powder', 'space_travel:mars_iron_powder'},
	}
})

--Minthe recipes

minetest.register_craft({
    type = "cooking",
    output = "default:copper_lump",
    recipe = "space_travel:minthe_copper_powder",
--    cooktime = 5,
})

minetest.register_craft({
	output = 'space_travel:minthe_sand 9',
	recipe = {
		{'space_travel:minthe_copper_powder', 'space_travel:minthe_copper_powder', 'space_travel:minthe_copper_powder'},
		{'space_travel:minthe_copper_powder', 'space_travel:minthe_copper_powder', 'space_travel:minthe_copper_powder'},
		{'space_travel:minthe_copper_powder', 'space_travel:minthe_copper_powder', 'space_travel:minthe_copper_powder'},
	}
})

--Titan recipes

minetest.register_craft({
	type = "fuel",
	recipe = "space_travel:titan_hydrocarbon_sand",
	burntime = 60,
})

minetest.register_craft({
    type = "cooking",
    output = "rocket:bucket_rocket_fuel",
    recipe = "space_travel:bucket_liquid_hydrocarbon",
--    cooktime = 5,
})

--Solar mese recipes

minetest.register_craft({
	output = 'space_travel:solar_mese_block',
	recipe = {
		{'space_travel:solar_mese_crystal', 'space_travel:solar_mese_crystal', 'space_travel:solar_mese_crystal'},
		{'space_travel:solar_mese_crystal', 'space_travel:solar_mese_crystal', 'space_travel:solar_mese_crystal'},
		{'space_travel:solar_mese_crystal', 'space_travel:solar_mese_crystal', 'space_travel:solar_mese_crystal'},
	}
})

minetest.register_craft({
    type = "shapeless",
	output = 'space_travel:solar_mese_crystal 9',
	recipe = {
		"space_travel:solar_mese_block",
	}
})

-- Lava crystal recipes

minetest.register_craft({
	output = 'space_travel:lava_crystal_block',
	recipe = {
		{'space_travel:lava_crystal', 'space_travel:lava_crystal', 'space_travel:lava_crystal'},
		{'space_travel:lava_crystal', 'space_travel:lava_crystal', 'space_travel:lava_crystal'},
		{'space_travel:lava_crystal', 'space_travel:lava_crystal', 'space_travel:lava_crystal'},
	}
})

minetest.register_craft({
    type = "shapeless",
	output = 'space_travel:lava_crystal 9',
	recipe = {
		"space_travel:lava_crystal_block",
	}
})

--Dark matter crystal recipes

minetest.register_craft({
	output = 'space_travel:dark_matter_crystal_block',
	recipe = {
		{'space_travel:dark_matter_crystal', 'space_travel:dark_matter_crystal', 'space_travel:dark_matter_crystal'},
		{'space_travel:dark_matter_crystal', 'space_travel:dark_matter_crystal', 'space_travel:dark_matter_crystal'},
		{'space_travel:dark_matter_crystal', 'space_travel:dark_matter_crystal', 'space_travel:dark_matter_crystal'},
	}
})

minetest.register_craft({
    type = "shapeless",
	output = 'space_travel:dark_matter_crystal 9',
	recipe = {
		"space_travel:dark_matter_crystal_block",
	}
})

--Cryolava recipes

minetest.register_craft({
    type = "cooking",
    output = "bucket:bucket_water",
    recipe = "space_travel:bucket_cryolava",
--    cooktime = 5,
})

--Europa water recipes

minetest.register_craft({
    type = "cooking",
    output = "bucket:bucket_water",
    recipe = "space_travel:bucket_europa_water",
--    cooktime = 5,
})

--Space liquid to normal liquid recipes

--[[
minetest.register_craft({
    type = "shapeless",
	output = 'bucket:bucket_water',
	recipe = {
		"space_travel:bucket_europa_water",
	}
})
]]

minetest.register_craft({
    type = "shapeless",
	output = 'bucket:bucket_water',
	recipe = {
		"space_travel:bucket_minerva_water",
	}
})

minetest.register_craft({
    type = "shapeless",
	output = 'bucket:bucket_water',
	recipe = {
		"space_travel:bucket_bacchus_water",
	}
})

minetest.register_craft({
    type = "shapeless",
	output = 'bucket:bucket_lava',
	recipe = {
		"space_travel:bucket_space_lava",
	}
})

--Wood recipes

minetest.register_craft({
    type = "shapeless",
	output = 'space_travel:minerva_pine_wood 4',
	recipe = {
		"space_travel:minerva_pine_tree",
	}
})

minetest.register_craft({
    type = "shapeless",
	output = 'space_travel:bacchus_wood 4',
	recipe = {
		"space_travel:bacchus_tree",
	}
})

--Convert space stone to normal stone

minetest.register_craft({
    type = "shapeless",
	output = 'default:stone',
	recipe = {
		"space_travel:space_stone",
	}
})

--Stone recipes

minetest.register_craft({
	type = "cooking",
	output = "space_travel:space_stone",
	recipe = "space_travel:space_cobble",
})

minetest.register_craft({
	output = "space_travel:space_stonebrick 4",
	recipe = {
		{"space_travel:space_stone", "space_travel:space_stone"},
		{"space_travel:space_stone", "space_travel:space_stone"},
	}
})

minetest.register_craft({
	output = "space_travel:space_stone_block 9",
	recipe = {
		{"space_travel:space_stone", "space_travel:space_stone", "space_travel:space_stone"},
		{"space_travel:space_stone", "space_travel:space_stone", "space_travel:space_stone"},
		{"space_travel:space_stone", "space_travel:space_stone", "space_travel:space_stone"},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "space_travel:mars_stone",
	recipe = "space_travel:mars_cobble",
})

minetest.register_craft({
	output = "space_travel:mars_stonebrick 4",
	recipe = {
		{"space_travel:mars_stone", "space_travel:mars_stone"},
		{"space_travel:mars_stone", "space_travel:mars_stone"},
	}
})

minetest.register_craft({
	output = "space_travel:mars_stone_block 9",
	recipe = {
		{"space_travel:mars_stone", "space_travel:mars_stone", "space_travel:mars_stone"},
		{"space_travel:mars_stone", "space_travel:mars_stone", "space_travel:mars_stone"},
		{"space_travel:mars_stone", "space_travel:mars_stone", "space_travel:mars_stone"},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "space_travel:venus_stone",
	recipe = "space_travel:venus_cobble",
})

minetest.register_craft({
	output = "space_travel:venus_stonebrick 4",
	recipe = {
		{"space_travel:venus_stone", "space_travel:venus_stone"},
		{"space_travel:venus_stone", "space_travel:venus_stone"},
	}
})

minetest.register_craft({
	output = "space_travel:venus_stone_block 9",
	recipe = {
		{"space_travel:venus_stone", "space_travel:venus_stone", "space_travel:venus_stone"},
		{"space_travel:venus_stone", "space_travel:venus_stone", "space_travel:venus_stone"},
		{"space_travel:venus_stone", "space_travel:venus_stone", "space_travel:venus_stone"},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "space_travel:io_stone",
	recipe = "space_travel:io_cobble",
})

minetest.register_craft({
	output = "space_travel:io_stonebrick 4",
	recipe = {
		{"space_travel:io_stone", "space_travel:io_stone"},
		{"space_travel:io_stone", "space_travel:io_stone"},
	}
})

minetest.register_craft({
	output = "space_travel:venus_stone_block 9",
	recipe = {
		{"space_travel:io_stone", "space_travel:io_stone", "space_travel:io_stone"},
		{"space_travel:io_stone", "space_travel:io_stone", "space_travel:io_stone"},
		{"space_travel:io_stone", "space_travel:io_stone", "space_travel:io_stone"},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "space_travel:minerva_stone",
	recipe = "space_travel:minerva_cobble",
})

minetest.register_craft({
	output = "space_travel:minerva_stonebrick 4",
	recipe = {
		{"space_travel:minerva_stone", "space_travel:minerva_stone"},
		{"space_travel:minerva_stone", "space_travel:minerva_stone"},
	}
})

minetest.register_craft({
	output = "space_travel:minerva_stone_block 9",
	recipe = {
		{"space_travel:minerva_stone", "space_travel:minerva_stone", "space_travel:minerva_stone"},
		{"space_travel:minerva_stone", "space_travel:minerva_stone", "space_travel:minerva_stone"},
		{"space_travel:minerva_stone", "space_travel:minerva_stone", "space_travel:minerva_stone"},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "space_travel:bacchus_stone",
	recipe = "space_travel:bacchus_cobble",
})

minetest.register_craft({
	output = "space_travel:bacchus_stonebrick 4",
	recipe = {
		{"space_travel:bacchus_stone", "space_travel:bacchus_stone"},
		{"space_travel:bacchus_stone", "space_travel:bacchus_stone"},
	}
})

minetest.register_craft({
	output = "space_travel:bacchus_stone_block 9",
	recipe = {
		{"space_travel:bacchus_stone", "space_travel:bacchus_stone", "space_travel:bacchus_stone"},
		{"space_travel:bacchus_stone", "space_travel:bacchus_stone", "space_travel:bacchus_stone"},
		{"space_travel:bacchus_stone", "space_travel:bacchus_stone", "space_travel:bacchus_stone"},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "space_travel:minthe_stone",
	recipe = "space_travel:minthe_cobble",
})

minetest.register_craft({
	output = "space_travel:minthe_stonebrick 4",
	recipe = {
		{"space_travel:minthe_stone", "space_travel:minthe_stone"},
		{"space_travel:minthe_stone", "space_travel:minthe_stone"},
	}
})

minetest.register_craft({
	output = "space_travel:minthe_stone_block 9",
	recipe = {
		{"space_travel:minthe_stone", "space_travel:minthe_stone", "space_travel:minthe_stone"},
		{"space_travel:minthe_stone", "space_travel:minthe_stone", "space_travel:minthe_stone"},
		{"space_travel:minthe_stone", "space_travel:minthe_stone", "space_travel:minthe_stone"},
	}
})

--Sandstone recipes

minetest.register_craft({
	output = "space_travel:mars_sandstone 1",
	recipe = {
		{"space_travel:mars_sand", "space_travel:mars_sand"},
		{"space_travel:mars_sand", "space_travel:mars_sand"},
	}
})

minetest.register_craft({
    type = "shapeless",
	output = 'space_travel:mars_sand 4',
	recipe = {
		"space_travel:mars_sandstone",
	}
})

minetest.register_craft({
	output = "space_travel:mars_sandstone_brick 4",
	recipe = {
		{"space_travel:mars_sandstone", "space_travel:mars_sandstone"},
		{"space_travel:mars_sandstone", "space_travel:mars_sandstone"},
	}
})

minetest.register_craft({
	output = "space_travel:mars_sandstone_block 9",
	recipe = {
		{"space_travel:mars_sandstone", "space_travel:mars_sandstone", "space_travel:mars_sandstone"},
		{"space_travel:mars_sandstone", "space_travel:mars_sandstone", "space_travel:mars_sandstone"},
		{"space_travel:mars_sandstone", "space_travel:mars_sandstone", "space_travel:mars_sandstone"},
	}
})

minetest.register_craft({
	output = "space_travel:minthe_sandstone 1",
	recipe = {
		{"space_travel:minthe_sand", "space_travel:minthe_sand"},
		{"space_travel:minthe_sand", "space_travel:minthe_sand"},
	}
})

minetest.register_craft({
    type = "shapeless",
	output = 'space_travel:minthe_sand 4',
	recipe = {
		"space_travel:minthe_sandstone",
	}
})

minetest.register_craft({
	output = "space_travel:minthe_sandstone_brick 4",
	recipe = {
		{"space_travel:minthe_sandstone", "space_travel:minthe_sandstone"},
		{"space_travel:minthe_sandstone", "space_travel:minthe_sandstone"},
	}
})

minetest.register_craft({
	output = "space_travel:minthe_sandstone_block 9",
	recipe = {
		{"space_travel:minthe_sandstone", "space_travel:minthe_sandstone", "space_travel:minthe_sandstone"},
		{"space_travel:minthe_sandstone", "space_travel:minthe_sandstone", "space_travel:minthe_sandstone"},
		{"space_travel:minthe_sandstone", "space_travel:minthe_sandstone", "space_travel:minthe_sandstone"},
	}
})

--Space Drive recipes

minetest.register_craft({
	output = 'space_travel:space_drive_engine',
	recipe = {
		{'default:mese_crystal', 'default:steel_ingot', 'default:mese_crystal'},
		{'default:steel_ingot', 'default:mese', 'default:steel_ingot'},
		{'default:mese_crystal', 'rocket:rocket_thruster', 'default:mese_crystal'},
	}
})

minetest.register_craft({
	output = 'space_travel:warp_drive_engine',
	recipe = {
		{'space_travel:dark_matter_crystal', 'default:gold_ingot', 'space_travel:dark_matter_crystal'},
		{'default:gold_ingot', 'space_travel:dark_matter_crystal_block', 'default:gold_ingot'},
		{'space_travel:dark_matter_crystal', 'rocket:rocket_thruster', 'space_travel:dark_matter_crystal'},
	}
})

minetest.register_craft({
	output = 'space_travel:space_drive_1',
	recipe = {
		{'default:mese_crystal', 'default:steel_ingot', 'default:mese_crystal'},
		{'default:steel_ingot', 'space_travel:space_drive_engine', 'default:steel_ingot'},
		{'default:mese_crystal', 'default:steel_ingot', 'default:mese_crystal'},
	}
})

minetest.register_craft({
	output = 'space_travel:space_drive_2',
	recipe = {
		{'space_travel:lunar_spinel_gem', 'space_travel:titanium_ingot', 'space_travel:lunar_spinel_gem'},
		{'space_travel:titanium_ingot', 'space_travel:space_drive_engine', 'space_travel:titanium_ingot'},
		{'space_travel:lunar_spinel_gem', 'space_travel:titanium_ingot', 'space_travel:lunar_spinel_gem'},
	}
})

minetest.register_craft({
	output = 'space_travel:space_drive_3',
	recipe = {
		{'space_travel:martian_ice_crystal', 'space_travel:titanium_ingot', 'space_travel:martian_ice_crystal'},
		{'space_travel:titanium_ingot', 'space_travel:space_drive_engine', 'space_travel:titanium_ingot'},
		{'space_travel:martian_ice_crystal', 'space_travel:titanium_ingot', 'space_travel:martian_ice_crystal'},
	}
})

minetest.register_craft({
	output = 'space_travel:space_drive_4',
	recipe = {
		{'space_travel:solar_mese_crystal', 'space_travel:lead_ingot', 'space_travel:solar_mese_crystal'},
		{'space_travel:lead_ingot', 'space_travel:space_drive_engine', 'space_travel:lead_ingot'},
		{'space_travel:solar_mese_crystal', 'space_travel:lead_ingot', 'space_travel:solar_mese_crystal'},
	}
})

minetest.register_craft({
	output = 'space_travel:space_drive_5',
	recipe = {
		{'space_travel:lava_crystal', 'space_travel:lead_ingot', 'space_travel:lava_crystal'},
		{'space_travel:lead_ingot', 'space_travel:space_drive_engine', 'space_travel:lead_ingot'},
		{'space_travel:lava_crystal', 'space_travel:lead_ingot', 'space_travel:lava_crystal'},
	}
})

minetest.register_craft({
	output = 'space_travel:space_drive_6',
	recipe = {
		{'space_travel:titan_alien_crystal', 'space_travel:titanium_ingot', 'space_travel:titan_alien_crystal'},
		{'space_travel:titanium_ingot', 'space_travel:space_drive_engine', 'space_travel:titanium_ingot'},
		{'space_travel:titan_alien_crystal', 'space_travel:titanium_ingot', 'space_travel:titan_alien_crystal'},
	}
})

minetest.register_craft({
	output = 'space_travel:space_drive_7',
	recipe = {
		{'space_travel:dark_matter_crystal', 'default:gold_ingot', 'space_travel:dark_matter_crystal'},
		{'default:gold_ingot', 'space_travel:warp_drive_engine', 'default:gold_ingot'},
		{'space_travel:dark_matter_crystal', 'default:gold_ingot', 'space_travel:dark_matter_crystal'},
	}
})
