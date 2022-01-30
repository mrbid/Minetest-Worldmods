
-- This file supplies rainbow bulbs

-- bulbs on ceiling

minetest.register_node('nightclub:rainbow_bulb', {
	description = ("Rainbow bulb"),
	drawtype = "nodebox",
	tiles = {
		{name="rainbow_bulb_animated_back.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
		{name="rainbow_bulb_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
	},
        node_box = {
                type = "fixed",
                fixed = {
			{ -0.062, 0.35, -0.062, 0.062, 0.5, 0.062 },
			{ -0.1, 0.35, -0.1, 0.1, 0.2, 0.1 },
			{ -0.15, 0.2, -0.15, 0.15, -0.1, 0.15 },
        	},
	},
        selection_box = {
                type = "fixed",
                fixed = {
			{ -0.3, -0.2, -0.3, 0.3, 0.5, 0.3 },
        	},
	},

	sunlight_propagates = false,
	paramtype = "light",
	light_source = 9,
	walkable = false,
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
				minetest.env:add_node(above, {name = 'nightclub:rainbow_bulb_wall', param2 = fdir})
			else
				minetest.env:add_node(above, {name = 'nightclub:rainbow_bulb'})
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

-- bulbs on wall

minetest.register_node('nightclub:rainbow_bulb_wall', {
	description = ("Rainbow bulb, on wall"),
	drawtype = "nodebox",
	tiles = {
		{name="rainbow_bulb_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
		{name="rainbow_bulb_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
		{name="rainbow_bulb_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
		{name="rainbow_bulb_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
		{name="rainbow_bulb_animated_back.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
		{name="rainbow_bulb_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
	},
        node_box = {
                type = "fixed",
                fixed = {
			{ -0.062, -0.062, 0.35, 0.062, 0.062, 0.5 },
			{ -0.1, -0.1, 0.35, 0.1, 0.1, 0.2 },
			{ -0.15, -0.15, 0.2, 0.15, 0.15, -0.1 },
        	},
	},
        selection_box = {
                type = "fixed",
                fixed = {
			{ -0.3, -0.3, -0.2, 0.3, 0.3, 0.5 },
        	},
	},
	sunlight_propagates = false,
	paramtype = "light",
	light_source = 9,
	paramtype2 = "facedir",
	walkable = false,
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
				minetest.env:add_node(above, {name = 'nightclub:rainbow_bulb_wall', param2 = fdir})
			else
				minetest.env:add_node(above, {name = 'nightclub:rainbow_bulb'})
			end
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
			return minetest.item_place_node(itemstack, placer, pointed_thing)
		else
			minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, placer)
		end
	end,
	drop = 'nightclub:rainbow_bulb'
})

