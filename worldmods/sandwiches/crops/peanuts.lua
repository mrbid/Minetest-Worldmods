-- peanut seeds
minetest.register_node("sandwiches:seed_peanuts", {
	description = "Peanuts Seed",
	tiles = {"seed_peanuts.png"},
	inventory_image = "seed_peanuts.png",
	wield_image = "seed_peanuts.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 4},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "sandwiches:peanut_1")
	end,
})



-- peanut plant definition

local crop_def = {
	drawtype = "plantlike",
	tiles = {"sandwiches_peanut_1.png"},
	paramtype = "light",
--	paramtype2 = "meshoptions",
--	place_param2 = 3,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = farming.select,
	groups = { snappy = 3, flammable = 4, plant = 1, flora = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing = 1 },
	sounds = default.node_sound_leaves_defaults()
}

-- stage 1
minetest.register_node("sandwiches:peanut_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"sandwiches_peanut_2.png"}
minetest.register_node("sandwiches:peanut_2", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"sandwiches_peanut_3.png"}
crop_def.drop = {
	items = {
		{items = {'sandwiches:peanuts 2'}, rarity = 1},
		{items = {'sandwiches:peanuts'}, rarity = 2},
	}
}
minetest.register_node("sandwiches:peanut_3", table.copy(crop_def))


-- stage 4
crop_def.tiles = {"sandwiches_peanut_4.png"}
crop_def.drop = {
	items = {
		{items = {'sandwiches:peanuts 4'}, rarity = 1},
		{items = {'sandwiches:peanuts 2'}, rarity = 2},
		{items = {'sandwiches:peanuts'}, rarity = 4},
		{items = {'sandwiches:seed_peanuts 2'}, rarity = 1},
		{items = {'sandwiches:seed_peanuts 2'}, rarity = 3},
	}
}
minetest.register_node("sandwiches:peanut_4", table.copy(crop_def))

-- stage 5 (spreading stage)
-- as the crop grows to the 5th stage, it has less seeds
-- because they are "used" when spreading
crop_def.tiles = {"sandwiches_peanut_5.png"}
crop_def.drop = {
	items = {
		{items = {'sandwiches:peanuts 3'}, rarity = 1},
		{items = {'sandwiches:peanuts 2'}, rarity = 2},
		{items = {'sandwiches:peanuts'}, rarity = 4},
		{items = {'sandwiches:seed_peanuts'}, rarity = 1},
		{items = {'sandwiches:seed_peanuts'}, rarity = 2},
	}
}
minetest.register_node("sandwiches:peanut_5", table.copy(crop_def))

-- stage 6 (final)
-- the plant is "exhausted" from the spreading 
crop_def.tiles = {"sandwiches_peanut_6.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'sandwiches:peanuts 3'}, rarity = 1},
		{items = {'sandwiches:peanuts 2'}, rarity = 2},
		{items = {'sandwiches:peanuts'}, rarity = 4},
		{items = {'sandwiches:seed_peanuts'}, rarity = 1},
		{items = {'sandwiches:seed_peanuts'}, rarity = 4},
	}
}
minetest.register_node("sandwiches:peanut_6", table.copy(crop_def))



minetest.register_abm({
   name = "sandwiches:peanut_spreading_abm",
   nodenames = {"sandwiches:peanut_5"},
   interval = 5,
   chance = 5,
   action = function(pos, node)
      -- Check 3x3x3 nodes around the currently triggered node
      local soil_positions = minetest.find_nodes_in_area_under_air(
         vector.add(pos, -1), vector.add(pos, 1),
         {"farming:soil_wet", "farming:soil"}
      )
      if(next(soil_positions) ~= null) then
        local found_soil_pos = soil_positions[math.random(#soil_positions)]
		found_soil_pos.y = found_soil_pos.y +1
		minetest.set_node(found_soil_pos, {name="sandwiches:peanut_1"})
		if(math.random(10) > 5) then
			minetest.set_node(pos,{name="sandwiches:peanut_6"})
		end
	  end
   end
 })
