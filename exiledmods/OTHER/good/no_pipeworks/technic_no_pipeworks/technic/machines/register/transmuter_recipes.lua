-- HV Transmuter
-- https://github.com/mrbid/Minetest-Worldmods

-- Dark Matter can only be mined in space
-- cheaper to convert blocks due to the autocrafting process to make them

local S = technic.getter

technic.register_recipe_type("transmuting", {
	description = S("Transmuting"),
	input_size = 2,
})

function technic.register_transmuting_recipe(data)
	data.time = data.time or 6
	technic.register_recipe("transmuting", data)
end

local recipes = {

-- technic / moreores / basic_materials / terumetal
--
	-- 3x chromium ingot to 1x mixed metal ingot
	{"technic:chromium_ingot 3", "space_travel:dark_matter_crystal 3", "technic:mixed_metal_ingot", 12},

	-- upgrade uranium ingots and blocks from 0.0% to 0.7% to 3.5%
	{"technic:uranium0_ingot", "space_travel:dark_matter_crystal 3", "technic:uranium_ingot", 6},
	{"technic:uranium_ingot", "space_travel:dark_matter_crystal 3", "technic:uranium35_ingot", 12},

	{"technic:uranium0_block", "space_travel:dark_matter_crystal_block", "technic:uranium_block", 6},
	{"technic:uranium_block", "space_travel:dark_matter_crystal_block", "technic:uranium35_block", 12},

	-- iron > cast iron > carbon steel > stainless steel
	{"default:steel_ingot", "space_travel:dark_matter_crystal 3", "technic:cast_iron_ingot", 2},
	{"default:steelblock", "space_travel:dark_matter_crystal_block", "technic:cast_iron_block", 4},

	{"technic:cast_iron_ingot", "space_travel:dark_matter_crystal 3", "technic:carbon_steel_ingot", 4},
	{"technic:cast_iron_block", "space_travel:dark_matter_crystal_block", "technic:carbon_steel_block", 8},

	{"technic:carbon_steel_ingot", "space_travel:dark_matter_crystal 3", "technic:stainless_steel_ingot", 6},
	{"technic:carbon_steel_block", "space_travel:dark_matter_crystal_block", "technic:stainless_steel_block", 12},

	-- tin > copper > bronze
	{"default:tin_ingot", "space_travel:dark_matter_crystal 3", "default:copper_ingot", 1},
	{"default:tinblock", "space_travel:dark_matter_crystal_block", "default:copperblock", 2},

	{"default:copper_ingot", "space_travel:dark_matter_crystal 3", "default:bronze_ingot", 3},
	{"default:copperblock", "space_travel:dark_matter_crystal_block", "default:bronzeblock", 6},

	-- nether to brass & vice-versa
	{"nether:nether_ingot", "space_travel:dark_matter_crystal 3", "basic_materials:brass_ingot", 3},
	{"basic_materials:brass_ingot", "space_travel:dark_matter_crystal 3", "nether:nether_ingot", 3},

	-- crystal to lava & vice-versa
	{"ethereal:crystal_ingot", "space_travel:dark_matter_crystal 3", "lavastuff:ingot", 6},
	{"ethereal:crystal_block", "space_travel:dark_matter_crystal_block", "lavastuff:block", 12},

	{"lavastuff:ingot", "space_travel:dark_matter_crystal 3", "ethereal:crystal_ingot", 6},
	{"lavastuff:block", "space_travel:dark_matter_crystal_block", "ethereal:crystal_block", 12},

	-- crystal spike to lava orb & vice-versa
	{"ethereal:crystal_spike", "space_travel:dark_matter_crystal_block", "lavastuff:orb", 6},
	{"lavastuff:orb", "space_travel:dark_matter_crystal_block", "ethereal:crystal_spike", 12},

	-- silver to gold & vice-versa
	{"moreores:silver_ingot", "space_travel:dark_matter_crystal 3", "default:gold_ingot", 6},
	{"moreores:silver_block", "space_travel:dark_matter_crystal_block", "default:goldblock", 12},

	{"default:gold_ingot", "space_travel:dark_matter_crystal 3", "moreores:silver_ingot", 6},
	{"default:goldblock", "space_travel:dark_matter_crystal_block", "moreores:silver_block", 12},

	-- silver lump to gold lump & vice-versa
	{"moreores:silver_lump", "space_travel:dark_matter_crystal", "default:gold_lump", 3},
	{"default:gold_lump", "space_travel:dark_matter_crystal", "moreores:silver_lump", 3},

	-- mithril to titanium & vice-versa
	{"moreores:mithril_ingot", "space_travel:dark_matter_crystal 3", "space_travel:titanium_ingot", 3},
	{"moreores:mithril_block", "space_travel:dark_matter_crystal_block", "space_travel:titanium_block", 6},

	{"space_travel:titanium_ingot", "space_travel:dark_matter_crystal 3", "moreores:mithril_ingot", 3},
	{"space_travel:titanium_block", "space_travel:dark_matter_crystal_block", "moreores:mithril_block", 6},

	-- mithril lump to titanium lump & vice-versa
	{"moreores:mithril_lump", "space_travel:dark_matter_crystal", "space_travel:titanium_lump", 1.5},
	{"space_travel:titanium_lump", "space_travel:dark_matter_crystal", "moreores:mithril_lump", 1.5},

	-- lead to zinc & vice-versa
	{"technic:lead_ingot", "space_travel:dark_matter_crystal 3", "technic:zinc_ingot", 2},
	{"technic:lead_block", "space_travel:dark_matter_crystal_block", "technic:zinc_block", 4},

	{"technic:zinc_ingot", "space_travel:dark_matter_crystal 3", "technic:lead_ingot", 2},
	{"technic:zinc_block", "space_travel:dark_matter_crystal_block", "technic:lead_block", 4},

	-- lead lump to zinc lump & vice-versa
	{"technic:lead_lump", "space_travel:dark_matter_crystal", "technic:zinc_lump", 1},
	{"technic:zinc_lump", "space_travel:dark_matter_crystal", "technic:lead_lump", 1},

	-- nyancat rainbow to rainbow ingot x9
	{"nyancat:nyancat_rainbow", "space_travel:dark_matter_crystal 3", "rainbow_ore:rainbow_ore_ingot 9", 3},

	-- clay lump to sulfur lump & vice-versa
	{"default:clay_lump", "space_travel:dark_matter_crystal", "technic:sulfur_lump", 0.5},
	{"technic:sulfur_lump", "space_travel:dark_matter_crystal", "default:clay_lump", 0.5},

	-- galena lump to nether lump & vice-versa
	{"space_travel:galena_lump", "space_travel:dark_matter_crystal", "nether:nether_lump", 2},
	{"nether:nether_lump", "space_travel:dark_matter_crystal", "space_travel:galena_lump", 2},

	--- tin lump to copper lump
	{"default:tin_lump", "space_travel:dark_matter_crystal", "default:copper_lump", 1},
	
	-- copper lump to iron lump & vice-versa
	{"default:copper_lump", "space_travel:dark_matter_crystal", "default:iron_lump", 1},
	{"default:iron_lump", "space_travel:dark_matter_crystal", "default:copper_lump", 1},

	-- quartz to diamond & vice-versa
	{"quartz:quartz_crystal", "space_travel:dark_matter_crystal", "default:diamond", 6},
	{"default:diamond", "space_travel:dark_matter_crystal", "quartz:quartz_crystal", 6},

	-- mese block to diamond block & vice-versa
	{"default:mese", "space_travel:dark_matter_crystal_block", "default:diamondblock", 12},
	{"default:diamondblock", "space_travel:dark_matter_crystal_block", "default:mese", 12},

	-- Brass Block to 9x Latex & vice-versa
	{"basic_materials:brass_block", "space_travel:dark_matter_crystal_block", "technic:raw_latex 9", 12},
	{"technic:raw_latex 9", "space_travel:dark_matter_crystal_block", "basic_materials:brass_block", 12},

	-- 99 biofuel to 1 superfuel
	{"biofuel:fuel_can 99", "space_travel:dark_matter_crystal_block", "biofuel:superfuel_can", 33},

-- Food
--
	{"default:apple", "space_travel:dark_matter_crystal", "ethereal:golden_apple", 1},
	{"farming:carrot", "space_travel:dark_matter_crystal", "farming:carrot_gold", 1},
	{"farming:donut", "space_travel:dark_matter_crystal", "foody:diamond_donut", 1},

-- space_travel nodes
--
	{"space_travel:martian_ice_crystal_block", "space_travel:dark_matter_crystal_block", "space_travel:lava_crystal", 10},
	{"space_travel:lava_crystal_block", "space_travel:dark_matter_crystal_block", "space_travel:bucket_space_lava", 10},
	{"space_travel:bacchus_sand 9", "space_travel:dark_matter_crystal_block", "space_travel:bucket_bacchus_water", 10},
	{"space_travel:solar_mese_block", "space_travel:dark_matter_crystal_block", "space_travel:bucket_liquid_hydrocarbon", 10},
	{"space_travel:minthe_stonebrick 9", "space_travel:dark_matter_crystal_block", "space_travel:bucket_sulfuric_acid", 10},
	{"space_travel:lava_crystal", "space_travel:dark_matter_crystal 3", "space_travel:bucket_minerva_water", 10},
	{"space_travel:lunar_spinel_gem", "space_travel:dark_matter_crystal 3", "space_travel:bucket_europa_water", 10},
	{"space_travel:martian_ice_crystal", "space_travel:dark_matter_crystal_block", "space_travel:bucket_cryolava", 10},
	{"space_travel:bacchus_tree", "space_travel:dark_matter_crystal 3", "space_travel:bacchus_sapling", 10},

}

for _, data in pairs(recipes) do
	technic.register_transmuting_recipe({input = {data[1], data[2]}, output = data[3], time = data[4]})
end
