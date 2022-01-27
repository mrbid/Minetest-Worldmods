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

--  Xtraores
--
	-- prior level xtraore to upper level
	{"xtraores:nickel_ore", "space_travel:dark_matter_crystal", "xtraores:platinum_ore", 1},
	{"xtraores:nickel_bar", "space_travel:dark_matter_crystal 3", "xtraores:platinum_bar", 2},
	{"xtraores:block_nickel", "space_travel:dark_matter_crystal_block", "xtraores:block_platinum", 3},

	{"xtraores:platinum_ore", "space_travel:dark_matter_crystal", "xtraores:palladium_ore", 2},
	{"xtraores:platinum_bar", "space_travel:dark_matter_crystal 3", "xtraores:palladium_bar", 4},
	{"xtraores:block_platinum", "space_travel:dark_matter_crystal_block", "xtraores:block_palladium", 8},

	{"xtraores:palladium_ore", "space_travel:dark_matter_crystal", "xtraores:cobalt_ore", 3},
	{"xtraores:palladium_bar", "space_travel:dark_matter_crystal 3", "xtraores:cobalt_bar", 6},
	{"xtraores:block_palladium", "space_travel:dark_matter_crystal_block", "xtraores:block_cobalt", 9},

	{"xtraores:cobalt_ore", "space_travel:dark_matter_crystal", "xtraores:thorium_ore", 4},
	{"xtraores:cobalt_bar", "space_travel:dark_matter_crystal 3", "xtraores:thorium_bar", 8},
	{"xtraores:block_cobalt", "space_travel:dark_matter_crystal_block", "xtraores:block_thorium", 12},

	{"xtraores:thorium_ore", "space_travel:dark_matter_crystal", "xtraores:osmium_ore", 5},
	{"xtraores:thorium_bar", "space_travel:dark_matter_crystal 3", "xtraores:osmium_bar", 10},
	{"xtraores:block_thorium", "space_travel:dark_matter_crystal_block", "xtraores:block_osmium", 15},

	{"xtraores:osmium_ore", "space_travel:dark_matter_crystal", "xtraores:rhenium_ore", 6},
	{"xtraores:osmium_bar", "space_travel:dark_matter_crystal 3", "xtraores:rhenium_bar", 9},
	{"xtraores:block_osmium", "space_travel:dark_matter_crystal_block", "xtraores:block_rhenium", 15},

	{"xtraores:rhenium_ore", "space_travel:dark_matter_crystal", "xtraores:vanadium_ore", 7},
	{"xtraores:rhenium_bar", "space_travel:dark_matter_crystal 3", "xtraores:vanadium_bar", 14},
	{"xtraores:block_rhenium", "space_travel:dark_matter_crystal_block", "xtraores:block_vanadium", 21},

	{"xtraores:vanadium_ore", "space_travel:dark_matter_crystal", "xtraores:rarium_ore", 8},
	{"xtraores:vanadium_bar", "space_travel:dark_matter_crystal 3", "xtraores:rarium_bar", 14},
	{"xtraores:block_vanadium", "space_travel:dark_matter_crystal_block", "xtraores:block_rarium", 22},

	{"xtraores:rarium_ore", "space_travel:dark_matter_crystal", "xtraores:orichalcum_ore", 9},
	{"xtraores:rarium_bar", "space_travel:dark_matter_crystal 3", "xtraores:orichalcum_bar", 18},
	{"xtraores:block_rarium", "space_travel:dark_matter_crystal_block", "xtraores:block_orichalcum", 27},

	{"xtraores:orichalcum_ore", "space_travel:dark_matter_crystal", "xtraores:titanium_ore", 10},
	{"xtraores:orichalcum_bar", "space_travel:dark_matter_crystal 3", "xtraores:titanium_bar", 20},
	{"xtraores:block_orichalcum", "space_travel:dark_matter_crystal_block", "xtraores:block_titanium", 30},

	{"xtraores:titanium_ore", "space_travel:dark_matter_crystal", "xtraores:chromium_ore", 11},
	{"xtraores:titanium_bar", "space_travel:dark_matter_crystal 3", "xtraores:chromium_bar", 22},
	{"xtraores:block_titanium", "space_travel:dark_matter_crystal_block", "xtraores:block_chromium", 33},

	-- technic uranium to xtraores and vice-versa
	{"xtraores:uranium_ore", "space_travel:dark_matter_crystal", "technic:uranium_lump", 11},
	{"xtraores:uranium_bar", "space_travel:dark_matter_crystal 3", "technic:uranium35_ingot", 22},
	{"xtraores:block_uranium", "space_travel:dark_matter_crystal_block", "technic:uranium35_block", 33},

	{"technic:uranium_lump", "space_travel:dark_matter_crystal", "xtraores:uranium_ore", 11},
	{"technic:uranium35_ingot", "space_travel:dark_matter_crystal 3", "xtraores:uranium_bar", 22},
	{"technic:uranium35_block", "space_travel:dark_matter_crystal_block", "xtraores:block_uranium", 33},

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

	-- chromium lump to terumetal lump & vice-versa
	{"technic:chromium_lump", "space_travel:dark_matter_crystal", "terumet:lump_raw", 9},
	{"terumet:lump_raw", "space_travel:dark_matter_crystal", "technic:chromium_lump", 9},

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

	-- terumetals
	{"terumet:ingot_raw", "space_travel:dark_matter_crystal 3", "terumet:ingot_ttin", 0.5},
	{"terumet:block_raw", "space_travel:dark_matter_crystal_block", "terumet:block_ttin", 1},

	{"terumet:ingot_ttin", "space_travel:dark_matter_crystal 3", "terumet:ingot_tcop", 1},
	{"terumet:block_ttin", "space_travel:dark_matter_crystal_block", "terumet:block_tcop", 2},

	{"terumet:ingot_tcop", "space_travel:dark_matter_crystal 3", "terumet:ingot_tste", 2},
	{"terumet:block_tcop", "space_travel:dark_matter_crystal_block", "terumet:block_tste", 4},

	{"terumet:ingot_tste", "space_travel:dark_matter_crystal 3", "terumet:ingot_tgol", 3},
	{"terumet:block_tste", "space_travel:dark_matter_crystal_block", "terumet:block_tgol", 6},

	{"terumet:ingot_tgol", "space_travel:dark_matter_crystal 3", "terumet:ingot_tcha", 4},
	{"terumet:block_tgol", "space_travel:dark_matter_crystal_block", "terumet:block_tcha", 8},

	{"terumet:ingot_tcha", "space_travel:dark_matter_crystal 3", "terumet:ingot_cgls", 5},
	{"terumet:block_tcha", "space_travel:dark_matter_crystal_block", "terumet:block_cgls", 10},

-- Food
--
	{"default:apple", "space_travel:dark_matter_crystal", "ethereal:golden_apple", 1},
	{"farming:carrot", "space_travel:dark_matter_crystal", "farming:carrot_gold", 1},
	{"farming:donut", "space_travel:dark_matter_crystal", "foody:diamond_donut", 1},
}

for _, data in pairs(recipes) do
	technic.register_transmuting_recipe({input = {data[1], data[2]}, output = data[3], time = data[4]})
end
