--============Mineral Trees Mod for Minetest 0.4.12!=============--
--Notice: All material shown here is property of Gravelpunch <gravelpunch@gmail.com>, (C) 2015, licensed under GLPGL and the art under CC-BY-SA 3.0 unported. See readme.txt for more details.

mineraltrees = {}

function table.contains(table, element)
  for key, value in pairs(table) do
    if value == element then
      return key
    end
  end
  return
end

--sets up tables for mineral trees--
mineraltrees.bloom_array = {}
mineraltrees.bark_array = {}
mineraltrees.tree_array = {}

modpath = minetest.get_modpath("mineraltrees")
--loads config options
dofile(modpath.."/config.txt")
--loads mineraltrees.register_mineral_tree
dofile(modpath.."/tree.lua")

mineraltrees.mineraltree_defs = {
	coaltree = {
		name = "coal",
		has_bloom = false,
		rarity = mineraltrees.coal_rarity,
		enabled = mineraltrees.enable_coal_tree
	},
	irontree = {
		name = "iron",
		has_bloom = true,
		rarity = mineraltrees.iron_rarity,
		enabled = mineraltrees.enable_iron_tree
	},
	coppertree = {
		name = "copper",
		has_bloom = true,
		rarity = mineraltrees.copper_rarity,
		enabled = mineraltrees.enable_copper_tree
	},
	goldtree = {
		name = "gold",
		has_bloom = true,
		rarity = mineraltrees.gold_rarity,
		enabled = mineraltrees.enable_gold_tree
	},
	mesetree = {
		name = "mese",
		has_bloom = true,
		rarity = mineraltrees.mese_rarity,
		enabled = mineraltrees.enable_mese_tree
	},
	diamondtree = {
		name = "diamond",
		has_bloom = true,
		rarity = mineraltrees.diamond_rarity,
		enabled = mineraltrees.enable_diamond_tree
	}
}

mineraltrees.sapling_rarity_array = {}

--registers all mineraltrees
for _, mineraltree_def in pairs(mineraltrees.mineraltree_defs) do
	mineraltrees.register_mineral_tree(mineraltree_def.name, mineraltree_def.has_bloom, mineraltree_def.rarity, mineraltree_def.enabled)
end

mineraltrees.biome_def = {
		surface = "default:dirt_with_grass",
		avoid_nodes = mineraltrees.tree_array,
		avoid_radius = mineraltrees.dist_apart,
		seed_dif = mineraltrees.seed_dif,
		rarity = mineraltrees.base_rarity,
		max_count = mineraltrees.biome_max_count,
		min_elevation = mineraltrees.min_elevation,
		max_elevation = mineraltrees.max_elevation,
		temp_min = mineraltrees.temp_min,
		temp_max = mineraltrees.temp_max
	}

	--registers tree spawning with biome_lib
	biome_lib:register_generate_plant(mineraltrees.biome_def, mineraltrees.sapling_rarity_array)		

--Bark Splitter definition--
minetest.register_craftitem("mineraltrees:splitter", {
	description = "Bark Splitter",
	inventory_image = "mineraltrees_splitter.png",
	weild_image = "mineraltrees_splitter.png",
	weild_scale = 1.7,
	stack_max = 1,
	liquids_pointable = false,
	
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing.type == "node" then
			pointed_pos = pointed_thing.under
			pointed_node = minetest.get_node(pointed_pos)
			print(pointed_node.name)
			
			node_index = table.contains(mineraltrees.tree_array, pointed_node.name)
			
			if (mineraltrees.tree_array[node_index] ~= nil) and (mineraltrees.bark_array[node_index] ~= nil) then
				user:get_inventory():add_item("main", mineraltrees.bark_array[node_index])
				minetest.set_node(pointed_pos, {name="mineraltrees:barelog"})
			end
		end
		return itemstack
	end		
})

--Bare Log definition
minetest.register_node("mineraltrees:barelog", {
	description = "Bare Log",
	tiles = {"mineraltrees_barelog.png", "mineraltrees_barelog.png", "mineraltrees_barelogside.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
	on_place = minetest.rotate_node
})

--loads crafting. All the way down here so all the ingredients are loaded already.
dofile(modpath.."/crafting.lua")
