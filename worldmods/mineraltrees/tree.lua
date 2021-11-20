--function for registering mineral trees--
function mineraltrees.register_mineral_tree(mineral, has_bloom, tree_rarity, enabled)
	if not enabled then
		return
	end
	
	--registers the log of the respective tree--
	minetest.register_node("mineraltrees:"..mineral.."tree", {
		description = mineral.."wood Tree",
		tiles = {"default_tree_top.png", "default_tree_top.png", "mineraltrees_"..mineral.."tree.png"},
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {tree=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
		on_place = minetest.rotate_node,
		sounds = default.node_sound_wood_defaults()
	})
	
	--registers the leaves of the respective tree--
	minetest.register_node("mineraltrees:"..mineral.."leaves", {
		description = mineral.."wood Leaves",
		drawtype = "allfaces_optional",
		visual_scale = 1.3,
		tiles ={"mineraltrees_"..mineral.."leaves.png"},
		paramtype = "light",
		is_ground_content = false,
		groups = {snappy=3, leafdecay=7, flammable=1},
		drop = {
			max_items = 1,
			items = {
				{
					-- player will get sapling with 1/200 chance
					items = {"mineraltrees:"..mineral.."sapling"},
					rarity = 200,
				},
				{
					-- player will get leaves only if he get no saplings,
					-- this is because max_items is 1
					items = {"mineraltrees:"..mineral.."leaves"},
				}
			}
		},
		sounds = default.node_sound_leaves_defaults(),
	})

	--registers the sapling of the respective tree
	minetest.register_node("mineraltrees:"..mineral.."sapling", {
		description = mineral.."wood Sapling",
		drawtype = "plantlike",
		visual_scale = 1.0,
		tiles ={"mineraltrees_"..mineral.."sapling.png"},
		inventory_image = "mineraltrees_"..mineral.."sapling.png",
		wield_image = "mineraltrees_"..mineral.."sapling.png",
		paramtype = "light",
		walkable = false,
		is_ground_content = true,
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
		},
		sounds = default.node_sound_leaves_defaults(),
		groups = {snappy=2,dig_immediate=3,flammable=2,attached_node=1,sapling=1}
	})
	
	local tree_def = {
		axiom ="FFFFFFFAFFFFF/A",
		rules_a = "[&&[F^TFDFFDFFDFF][--F^TFDFFDFFDFF][----F^TFDFFDFFDFF][++F^TFDFFDFFDFF]]",
		rules_b = "",
		rules_c = "F",
		rules_d = "&",
		trunk="mineraltrees:"..mineral.."tree",
		leaves="mineraltrees:"..mineral.."leaves",
		angle=mineraltrees.tree_angle,
		iterations=2,
		random_level=0,
		trunk_type="crossed",
		thin_branches=true,
		fruit_chance=0,
		fruit="default:apple"
	}
	
	local function grow_tree(pos)
		minetest.remove_node(pos)
		minetest.spawn_tree(pos, tree_def)
	end
	
	--registers plant growing with biome_lib
	biome_lib:grow_plants({
		grow_delay = 10,
		grow_chance = 1,
		grow_plant = "mineraltrees:"..mineral.."sapling",
		grow_nodes = "default:dirt_with_grass",
		grow_function = tree_def
	})
	
	--registers bark
	minetest.register_craftitem("mineraltrees:"..mineral.."bark", {
		description = mineral.."wood Bark",
		inventory_image = "mineraltrees_"..mineral.."tree.png",
		weild_image = "mineraltrees_"..mineral.."tree.png",
		weild_scale = 1,
		stack_max = 99,
		liquids_pointable = false
	})
	
	--registers bloom if applicable
	if (has_bloom)then
		minetest.register_craftitem("mineraltrees:"..mineral.."_bloom", {
			description = mineral.." Bloom",
			inventory_image = "mineraltrees_"..mineral.."_bloom.png",
			weild_image = "mineraltrees_"..mineral.."bloom.png",
			weild_scale = 1,
			stack_max = 99,
			liguids_pointable = false
		})
		
		minetest.register_craft({
			type = "cooking",
			output = "mineraltrees:"..mineral.."_bloom",
			recipe = "mineraltrees:"..mineral.."bark"
		})
	else
		minetest.register_craft({
		type = "fuel",
		recipe = "mineraltrees:"..mineral.."bark",
		burntime = 5
	})
	end
	
	table.insert(mineraltrees.bark_array, "mineraltrees:"..mineral.."bark 4")
	table.insert(mineraltrees.bloom_array, "mineraltrees:"..mineral.."_bloom")
	table.insert(mineraltrees.tree_array, "mineraltrees:"..mineral.."tree")
	mineraltrees.seed_dif = mineraltrees.seed_dif+1
	
	--adds sapling to sapling array according to rarity
	for i = 0, tree_rarity do
		table.insert(mineraltrees.sapling_rarity_array, "mineraltrees:"..mineral.."sapling")
	end
end
