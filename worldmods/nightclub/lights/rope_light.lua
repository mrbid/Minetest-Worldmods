
-- This file supplies Rope lights

-- on ceiling

minetest.register_node('nightclub:rope_lights', {
	description = ("Rope lights"),
	drawtype = "nodebox",
	tiles = {
		{name="dance_floor_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}}
	},
        node_box = {
                type = "fixed",
                fixed = {
			{ -0.5, 0.4, 0.05, -0.3, 0.5, -0.05 },  -- left
			{ -0.3, 0.4, 0.0, -0.1, 0.5, 0.1 },
			{ -0.1, 0.4, 0.05, 0.1, 0.5, -0.05 },  -- center
			{ 0.1, 0.4, 0.0, 0.3, 0.5, -0.1 },
			{ 0.3, 0.4, 0.05, 0.5, 0.5, -0.05 },  -- right
        	},
	},

        selection_box = {
                type = "fixed",
                fixed = {
			{ -0.4, 0.3, -0.4, 0.4, 0.5, 0.4 },
        	},
	},

	sunlight_propagates = false,
	paramtype = "light",
	light_source = 9,
	paramtype2 = "facedir",
	buildable_to = true,
	sounds = default.node_sound_glass_defaults(),
	groups = { snappy = 3 },
	on_place = function(itemstack, placer, pointed_thing)

		local node = minetest.env:get_node(pointed_thing.under)
		if not minetest.registered_nodes[node.name] or not minetest.registered_nodes[node.name].on_rightclick then

			local above = pointed_thing.above
			local under = pointed_thing.under
			local pitch = placer:get_look_pitch()
			local node = minetest.env:get_node(above)

			if node.name ~= "air" then return end

			if above.x ~= under.x or above.z ~= under.z then 
				local fdir = minetest.dir_to_facedir(placer:get_look_dir())
				minetest.env:add_node(above, {name = 'nightclub:rope_lights_wall', param2 = fdir})
			else
				local fdir = minetest.dir_to_facedir(placer:get_look_dir())
				minetest.env:add_node(above, {name = 'nightclub:rope_lights', param2 = fdir})
			end
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
			return minetest.item_place_node(itemstack, placer, pointed_thing)
		else
			minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, placer)
		end
	end
})

-- on wall

minetest.register_node('nightclub:rope_lights_wall', {
	description = ("Rope lights on wall"),
	drawtype = "nodebox",
	tiles = {
		{name="dance_floor_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}}
	},
        node_box = {
                type = "fixed",
                fixed = {
			{ -0.5, 0.05, 0.4, -0.3, -0.05, 0.5 },  -- left
			{ -0.3, 0, 0.4, -0.1, 0.1, 0.5 },
			{ -0.1, 0.05, 0.4, 0.1, -0.05, 0.5 },  -- center
			{ 0.1, 0, 0.4, 0.3, -0.1, 0.5 },
			{ 0.3, 0.05, 0.4, 0.5, -0.05, 0.5 },  -- right
        	},
	},
        selection_box = {
                type = "fixed",
                fixed = {
			{ -0.4, -0.4, 0.3, 0.4, 0.4, 0.5 },
        	},
	},
	sunlight_propagates = false,
	paramtype = "light",
	light_source = 9,
	paramtype2 = "facedir",
	buildable_to = true,
	sounds = default.node_sound_glass_defaults(),
	groups = { snappy = 3, not_in_creative_inventory=1 },
	on_place = function(itemstack, placer, pointed_thing)

		local node = minetest.env:get_node(pointed_thing.under)
		if not minetest.registered_nodes[node.name] or not minetest.registered_nodes[node.name].on_rightclick then

			local above = pointed_thing.above
			local under = pointed_thing.under
			local pitch = placer:get_look_pitch()
			local node = minetest.env:get_node(above)

			if node.name ~= "air" then return end

			if above.x ~= under.x or above.z ~= under.z then 
				local fdir = minetest.dir_to_facedir(placer:get_look_dir())
				minetest.env:add_node(above, {name = 'nightclub:rope_lights_wall', param2 = fdir})
			else
				local fdir = minetest.dir_to_facedir(placer:get_look_dir())
				minetest.env:add_node(above, {name = 'nightclub:rope_lights', param2 = fdir})
			end
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
			return minetest.item_place_node(itemstack, placer, pointed_thing)
		else
			minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, placer)
		end
	end,
	drop = 'nightclub:rope_lights'
})

