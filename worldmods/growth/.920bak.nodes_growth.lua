minetest.register_node("growth:orange", {
	description = "orange",
	drawtype = "plantlike",
	tiles = {"orange.png"},
	inventory_image = "orange.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:orange", param2 = 1})
		end
	end,
})
	
minetest.register_node("growth:orange_portion", {
	description = "orange_portion",
	drawtype = "plantlike",
	tiles = {"orange_portion.png"},
	inventory_image = "orange_portion.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:orange_portion", param2 = 1})
		end
	end,
})
	
			
minetest.register_node("growth:orange_seed", {
	description = "orange_seed",
	drawtype = "plantlike",
	tiles = {"orange_seed.png"},
	inventory_image = "orange_seed.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:orange_seed", param2 = 1})
		end
	end,
})
			
minetest.register_node("growth:bannana", {
	description = "bannana",
	drawtype = "plantlike",
	tiles = {"bannana.png"},
	inventory_image = "bannana.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:bannana", param2 = 1})
		end
	end,
})
	
minetest.register_node("growth:bannana_portion", {
	description = "bannana_portion",
	drawtype = "plantlike",
	tiles = {"bannana_portion.png"},
	inventory_image = "bannana_portion.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:bannana_portion", param2 = 1})
		end
	end,
})
	
			
minetest.register_node("growth:bannana_seed", {
	description = "bannana_seed",
	drawtype = "plantlike",
	tiles = {"bannana_seed.png"},
	inventory_image = "bannana_seed.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:bannana_seed", param2 = 1})
		end
	end,
})
			
minetest.register_node("growth:grapes", {
	description = "grapes",
	drawtype = "plantlike",
	tiles = {"grapes.png"},
	inventory_image = "grapes.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:grapes", param2 = 1})
		end
	end,
})
	
minetest.register_node("growth:grape_portion", {
	description = "grape_portion",
	drawtype = "plantlike",
	tiles = {"grape_portion.png"},
	inventory_image = "grape_portion.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:grape_portion", param2 = 1})
		end
	end,
})
	
			
minetest.register_node("growth:grape_seed", {
	description = "grape_seed",
	drawtype = "plantlike",
	tiles = {"grape_seed.png"},
	inventory_image = "grape_seed.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:grape_seed", param2 = 1})
		end
	end,
})
			
			
minetest.register_node("growth:grape_vines", {
	description = "grape_vines",
	drawtype = "plantlike",
	tiles = {"grape_vines.png"},
	inventory_image = "grape_vines.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 2.5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:grape_vines", param2 = 1})
		end
	end,
})

minetest.register_node("growth:melon", {
	description = "melon",
	drawtype = "plantlike",
	tiles = {"melon.png"},
	inventory_image = "melon.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:melon", param2 = 1})
		end
	end,
})
	
minetest.register_node("growth:melon_portion", {
	description = "melon_portion",
	drawtype = "plantlike",
	tiles = {"melon_portion.png"},
	inventory_image = "melon_portion.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:melon_portion", param2 = 1})
		end
	end,
})
	
			
minetest.register_node("growth:melon_seed", {
	description = "melon_seed",
	drawtype = "plantlike",
	tiles = {"melon_seed.png"},
	inventory_image = "melon_seed.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:melon_seed", param2 = 1})
		end
	end,
})
			
			
minetest.register_node("growth:melons", {
	description = "melons",
	drawtype = "plantlike",
	tiles = {"melons.png"},
	inventory_image = "melons.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 2.5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:melons", param2 = 1})
		end
	end,
})

			
minetest.register_node("growth:cantalope", {
	description = "cantalope",
	drawtype = "plantlike",
	tiles = {"cantalope.png"},
	inventory_image = "cantalope.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:cantalope", param2 = 1})
		end
	end,
})
	
minetest.register_node("growth:cantalope_portion", {
	description = "cantalope_portion",
	drawtype = "plantlike",
	tiles = {"cantalope_portion.png"},
	inventory_image = "cantalope_portion.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:cantalope_portion", param2 = 1})
		end
	end,
})
	
			
minetest.register_node("growth:cantalope_seed", {
	description = "cantalope_seed",
	drawtype = "plantlike",
	tiles = {"cantalope_seed.png"},
	inventory_image = "cantalope_seed.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:cantalope_seed", param2 = 1})
		end
	end,
})
			
			
minetest.register_node("growth:cantalopes", {
	description = "cantalopes",
	drawtype = "plantlike",
	tiles = {"cantalopes.png"},
	inventory_image = "cantalopes.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 2.5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:cantalopes", param2 = 1})
		end
	end,
})

			
minetest.register_node("growth:watermelon", {
	description = "watermelon",
	drawtype = "plantlike",
	tiles = {"watermelon.png"},
	inventory_image = "watermelon.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:watermelon", param2 = 1})
		end
	end,
})
	
minetest.register_node("growth:watermelon_portion", {
	description = "watermelon_portion",
	drawtype = "plantlike",
	tiles = {"watermelon_portion.png"},
	inventory_image = "watermelon_portion.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:watermelon_portion", param2 = 1})
		end
	end,
})
	
			
minetest.register_node("growth:watermelon_seed", {
	description = "watermelon_seed",
	drawtype = "plantlike",
	tiles = {"watermelon_seed.png"},
	inventory_image = "watermelon_seed.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:watermelon_seed", param2 = 1})
		end
	end,
})
			
			
minetest.register_node("growth:watermelons", {
	description = "watermelons",
	drawtype = "plantlike",
	tiles = {"watermelons.png"},
	inventory_image = "watermelons.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 2.5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:watermelons", param2 = 1})
		end
	end,
})

			
minetest.register_node("growth:tomato", {
	description = "tomato",
	drawtype = "plantlike",
	tiles = {"tomato.png"},
	inventory_image = "tomato.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = .7,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:tomato", param2 = 1})
		end
	end,
})
	
minetest.register_node("growth:tomato_portion", {
	description = "tomato_portion",
	drawtype = "plantlike",
	tiles = {"tomato_portion.png"},
	inventory_image = "tomato_portion.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:tomato_portion", param2 = 1})
		end
	end,
})
	
			
minetest.register_node("growth:tomato_seed", {
	description = "tomato_seed",
	drawtype = "plantlike",
	tiles = {"tomato_seed.png"},
	inventory_image = "tomato_seed.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:tomato_seed", param2 = 1})
		end
	end,
})
			
			
minetest.register_node("growth:tomato_bush", {
	description = "tomato_bush",
	drawtype = "plantlike",
	tiles = {"tomato_bush.png"},
	inventory_image = "tomato_bush.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 2.5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:tomato_bush", param2 = 1})
		end
	end,
})

			
minetest.register_node("growth:green_beans", {
	description = "green_beans",
	drawtype = "plantlike",
	tiles = {"green_beans.png"},
	inventory_image = "green_beans.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = .5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:green_beans", param2 = 1})
		end
	end,
})
	
minetest.register_node("growth:green_bean_portion", {
	description = "green_bean_portion",
	drawtype = "plantlike",
	tiles = {"green_bean_portion.png"},
	inventory_image = "green_bean_portion.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:green_bean_portion", param2 = 1})
		end
	end,
})
	
			
minetest.register_node("growth:green_bean_seed", {
	description = "green_bean_seed",
	drawtype = "plantlike",
	tiles = {"green_bean_seed.png"},
	inventory_image = "green_bean_seed.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:green_bean_seed", param2 = 1})
		end
	end,
})
			
			
minetest.register_node("growth:green_bean_stalk", {
	description = "green_bean_stalk",
	drawtype = "plantlike",
	tiles = {"green_bean_stalk.png"},
	inventory_image = "green_bean_stalk.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 2.5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:green_bean_stalk", param2 = 1})
		end
	end,
})

	
			
minetest.register_node("growth:peas", {
	description = "peas",
	drawtype = "plantlike",
	tiles = {"peas.png"},
	inventory_image = "peas.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = .25,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:peas", param2 = 1})
		end
	end,
})
	
minetest.register_node("growth:pea_portion", {
	description = "pea_portion",
	drawtype = "plantlike",
	tiles = {"pea_portion.png"},
	inventory_image = "pea_portion.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:pea_portion", param2 = 1})
		end
	end,
})
	
			
minetest.register_node("growth:pea_seed", {
	description = "pea_seed",
	drawtype = "plantlike",
	tiles = {"pea_seed.png"},
	inventory_image = "pea_seed.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:pea_seed", param2 = 1})
		end
	end,
})
			
			
minetest.register_node("growth:peas_stalk", {
	description = "peas_stalk",
	drawtype = "plantlike",
	tiles = {"peas_stalk.png"},
	inventory_image = "peas_stalk.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 2.5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:peas_stalk", param2 = 1})
		end
	end,
})

			

minetest.register_node("growth:lettuce", {
	description = "lettuce",
	drawtype = "plantlike",
	tiles = {"lettuce.png"},
	inventory_image = "lettuce.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:lettuce", param2 = 1})
		end
	end,
})
	
minetest.register_node("growth:lettuce_portion", {
	description = "lettuce_portion",
	drawtype = "plantlike",
	tiles = {"lettuce_portion.png"},
	inventory_image = "lettuce_portion.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:lettuce_portion", param2 = 1})
		end
	end,
})
	
			
minetest.register_node("growth:lettuce_seed", {
	description = "lettuce_seed",
	drawtype = "plantlike",
	tiles = {"lettuce_seed.png"},
	inventory_image = "lettuce_seed.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:lettuce_seed", param2 = 1})
		end
	end,
})
			
			
minetest.register_node("growth:rice", {
	description = "rice",
	drawtype = "plantlike",
	tiles = {"rice.png"},
	inventory_image = "rice.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:rice", param2 = 1})
		end
	end,
})
	
minetest.register_node("growth:rice_portion", {
	description = "rice_portion",
	drawtype = "plantlike",
	tiles = {"rice_portion.png"},
	inventory_image = "rice_portion.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:rice_portion", param2 = 1})
		end
	end,
})
	
			
minetest.register_node("growth:rice_seed", {
	description = "rice_seed",
	drawtype = "plantlike",
	tiles = {"rice_seed.png"},
	inventory_image = "rice_seed.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:rice_seed", param2 = 1})
		end
	end,
})
			
			
minetest.register_node("growth:rice_plant", {
	description = "rice_plant",
	drawtype = "plantlike",
	tiles = {"rice_plant.png"},
	inventory_image = "rice_plant.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 2.5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:rice_plant", param2 = 1})
		end
	end,
})


minetest.register_node("growth:corn", {
	description = "corn",
	drawtype = "plantlike",
	tiles = {"corn.png"},
	inventory_image = "corn.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:corn", param2 = 1})
		end
	end,
})
	
minetest.register_node("growth:corn_portion", {
	description = "corn_portion",
	drawtype = "plantlike",
	tiles = {"corn_portion.png"},
	inventory_image = "corn_portion.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:corn_portion", param2 = 1})
		end
	end,
})
	
			
minetest.register_node("growth:corn_seed", {
	description = "corn_seed",
	drawtype = "plantlike",
	tiles = {"corn_seed.png"},
	inventory_image = "corn_seed.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:corn_seed", param2 = 1})
		end
	end,
})
			
			
minetest.register_node("growth:corn_stalk", {
	description = "corn_stalk",
	drawtype = "plantlike",
	tiles = {"corn_stalk.png"},
	inventory_image = "corn_stalk.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 2.5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:corn_stalk", param2 = 1})
		end
	end,
})

minetest.register_node("growth:corn_shalk", {
	description = "corn_shalk",
	drawtype = "plantlike",
	tiles = {"corn_shalk.png"},
	inventory_image = "corn_shalk.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:corn_shalk", param2 = 1})
		end
	end,
})

minetest.register_node("growth:potatoe", {
	description = "potatoe",
	drawtype = "plantlike",
	tiles = {"potatoe.png"},
	inventory_image = "potatoe.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:potatoe", param2 = 1})
		end
	end,
})
	
minetest.register_node("growth:potatoe_portion", {
	description = "potatoe_portion",
	drawtype = "plantlike",
	tiles = {"potatoe_portion.png"},
	inventory_image = "potatoe_portion.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:potatoe_portion", param2 = 1})
		end
	end,
})
	
			
minetest.register_node("growth:potatoe_seed", {
	description = "potatoe_seed",
	drawtype = "plantlike",
	tiles = {"potatoe_seed.png"},
	inventory_image = "potatoe_seed.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:potatoe_seed", param2 = 1})
		end
	end,
})
			
			
minetest.register_node("growth:potatoe__plant_", {
	description = "potatoe__plant_",
	drawtype = "plantlike",
	tiles = {"potatoe__plant_.png"},
	inventory_image = "potatoe__plant_.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 1,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:potatoe__plant_", param2 = 1})
		end
	end,
})

minetest.register_node("growth:water__bottle_", {
	description = "water__bottle_",
	drawtype = "plantlike",
	tiles = {"water__bottle_.png"},
	inventory_image = "water__bottle_.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = .5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:water__bottle_", param2 = 1})
		end
	end,
})

minetest.register_node("growth:bottle", {
	description = "bottle",
	drawtype = "plantlike",
	tiles = {"bottle.png"},
	inventory_image = "bottle.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = .5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:bottle", param2 = 1})
		end
	end,
})

minetest.register_node("growth:blei__beer_", {
	description = "blei__beer_",
	drawtype = "plantlike",
	tiles = {"blei__beer_.png"},
	inventory_image = "blei__beer_.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = .5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:blei__beer_", param2 = 1})
		end
	end,
})


minetest.register_node("growth:blei__beer_water", {
	description = "blei__beer_water",
	drawtype = "plantlike",
	tiles = {"blei__beer_water.png"},
	inventory_image = "blei__beer_water.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = .5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:blei__beer_water", param2 = 1})
		end
	end,
})


minetest.register_node("growth:blei__beer_empty", {
	description = "blei__beer_empty",
	drawtype = "plantlike",
	tiles = {"blei__beer_empty.png"},
	inventory_image = "blei__beer_empty.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = .5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:blei__beer_empty", param2 = 1})
		end
	end,
})


minetest.register_node("growth:deco_plate", {
        description = "deco_plate",
        drawtype = 'nodebox',
	visual_scale = .7,
        tiles = { 'deco_plate.png' },
        wield_image = 'deco_plate.png',
        inventory_image = 'deco_plate.png',
        sunlight_propagates = true,
        paramtype = 'light',
        paramtype2 = "facedir",
        is_ground_content = true,
        walkable = false,
        groups = { snappy = 3 },
        sounds = default.node_sound_leaves_defaults(),
        selection_box = {
                        type = "wallmounted",
                        },
        node_box = {
                type = "fixed",
                fixed = {
                                        {-0.48, -0.5,-0.48,  0.48, -0.45, 0.48},
                        }
        },
        selection_box = {
                type = "fixed",
                fixed = {
                                        {-0.48, -0.5,-0.48,  0.48, -0.25, 0.48},
                        }
        }
})

minetest.register_node("growth:plant1", {
	description = "plant1",
	drawtype = "plantlike",
	tiles = {"plant1.png"},
	inventory_image = "plant1.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 1,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:plant1", param2 = 1})
		end
	end,
})

minetest.register_node("growth:plant2", {
	description = "plant2",
	drawtype = "plantlike",
	tiles = {"plant2.png"},
	inventory_image = "plant2.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 1,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:plant2", param2 = 1})
		end
	end,
})

minetest.register_node("growth:plant3", {
	description = "plant3",
	drawtype = "plantlike",
	tiles = {"plant3.png"},
	inventory_image = "plant3.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 1,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:plant3", param2 = 1})
		end
	end,
})

minetest.register_node("growth:plant4", {
	description = "plant4",
	drawtype = "plantlike",
	tiles = {"plant4.png"},
	inventory_image = "plant4.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 1,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:plant4", param2 = 1})
		end
	end,
})

minetest.register_node("growth:planta", {
	description = "planta",
	drawtype = "plantlike",
	tiles = {"planta.png"},
	inventory_image = "planta.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = .5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:planta", param2 = 1})
		end
	end,
})

minetest.register_node("growth:plantb", {
	description = "plantb",
	drawtype = "plantlike",
	tiles = {"plantb.png"},
	inventory_image = "plantb.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = .5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:plantb", param2 = 1})
		end
	end,
})

minetest.register_node("growth:plantc", {
	description = "plantc",
	drawtype = "plantlike",
	tiles = {"plantc.png"},
	inventory_image = "plantc.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = .5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:plantc", param2 = 1})
		end
	end,
})

minetest.register_node("growth:plantd", {
	description = "plantd",
	drawtype = "plantlike",
	tiles = {"plantd.png"},
	inventory_image = "plantd.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = .5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:plantd", param2 = 1})
		end
	end,
})

minetest.register_node("growth:plante", {
	description = "plante",
	drawtype = "plantlike",
	tiles = {"plante.png"},
	inventory_image = "plante.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = .5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:plante", param2 = 1})
		end
	end,
})

minetest.register_node("growth:plantf", {
	description = "plantf",
	drawtype = "plantlike",
	tiles = {"plantf.png"},
	inventory_image = "plantf.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = .5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:plantf", param2 = 1})
		end
	end,
})

minetest.register_node("growth:plantg", {
	description = "plantg",
	drawtype = "plantlike",
	tiles = {"plantg.png"},
	inventory_image = "plantg.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = .5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:plantg", param2 = 1})
		end
	end,
})

minetest.register_node("growth:planth", {
	description = "planth",
	drawtype = "plantlike",
	tiles = {"planth.png"},
	inventory_image = "planth.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = .5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:planth", param2 = 1})
		end
	end,
})

minetest.register_node("growth:planti", {
	description = "planti",
	drawtype = "plantlike",
	tiles = {"planti.png"},
	inventory_image = "planti.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = .5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:planti", param2 = 1})
		end
	end,
})

minetest.register_node("growth:plantj", {
	description = "plantj",
	drawtype = "plantlike",
	tiles = {"plantj.png"},
	inventory_image = "plantj.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = .5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:plantj", param2 = 1})
		end
	end,
})

minetest.register_node("growth:plantk", {
	description = "plantk",
	drawtype = "plantlike",
	tiles = {"plantk.png"},
	inventory_image = "plantk.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = .5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:plantk", param2 = 1})
		end
	end,
})

minetest.register_node("growth:plantl", {
	description = "plantl",
	drawtype = "plantlike",
	tiles = {"plantl.png"},
	inventory_image = "plantl.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = .5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:plantl", param2 = 1})
		end
	end,
})

minetest.register_node("growth:default_marijuana", {
	description = "default_marijuana",
	drawtype = "plantlike",
	tiles = {"default_marijuana.png"},
	inventory_image = "default_marijuana.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 1.7,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:default_marijuana", param2 = 1})
		end
	end,
})
			
minetest.register_node("growth:default_pipe", {
	description = "default_pipe",
	drawtype = "plantlike",
	tiles = {"default_pipe.png"},
	inventory_image = "default_pipe.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:default_pipe", param2 = 1})
		end
	end,
})
			
minetest.register_node("growth:marijuana_portion", {
	description = "marijuana_portion",
	drawtype = "plantlike",
	tiles = {"marijuana_portion.png"},
	inventory_image = "marijuana_portion.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:marijuana_portion", param2 = 1})
		end
	end,
})
			
minetest.register_node("growth:marijuana_seed", {
	description = "marijuana_seed",
	drawtype = "plantlike",
	tiles = {"marijuana_seed.png"},
	inventory_image = "marijuana_seed.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:marijuana_seed", param2 = 1})
		end
	end,
})

minetest.register_node("growth:tobacco__machine_", {
        description = "tobacco__machine_",
        drawtype = 'nodebox',
	visual_scale = .7,
        tiles = { 'tobacco__machine_.png' },
        wield_image = 'tobacco__machine_.png',
        inventory_image = 'tobacco__machine_.png',
        sunlight_propagates = true,
        paramtype = 'light',
        paramtype2 = "facedir",
        is_ground_content = true,
        walkable = false,
        groups = { snappy = 3 },
        sounds = default.node_sound_leaves_defaults(),
        selection_box = {
                        type = "wallmounted",
                        },
        node_box = {
                type = "fixed",
                fixed = {
                                        {-0.48, -0.5,-0.48,  0.48, -0.45, 0.48},
                        }
        },
        selection_box = {
                type = "fixed",
                fixed = {
                                        {-0.48, -0.5,-0.48,  0.48, -0.25, 0.48},
                        }
        }
})

minetest.register_node("growth:tobacco_plant", {
	description = "tobacco_plant",
	drawtype = "plantlike",
	visual_scale = 1.7,
	tiles = {"tobacco_plant.png"},
	inventory_image = "tobacco_plant.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:tobacco_plant", param2 = 1})
		end
	end,
})

minetest.register_node("growth:tobacco_portion", {
	description = "tobacco_portion",
	drawtype = "plantlike",
	tiles = {"tobacco_portion.png"},
	inventory_image = "tobacco_portion.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:tobacco_portion", param2 = 1})
		end
	end,
})

minetest.register_node("growth:cigarette", {
	description = "cigarette",
	drawtype = "plantlike",
	tiles = {"cigarette.png"},
	inventory_image = "cigarette.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:cigarette", param2 = 1})
		end
	end,
})






minetest.register_node("growth:towel", {
        description = "towel",
        drawtype = 'nodebox',
	visual_scale = .7,
        tiles = { 'towel.png' },
        wield_image = 'towel.png',
        inventory_image = 'towel.png',
        sunlight_propagates = true,
        paramtype = 'light',
        paramtype2 = "facedir",
        is_ground_content = true,
        walkable = false,
        groups = { snappy = 3 },
        sounds = default.node_sound_leaves_defaults(),
        selection_box = {
                        type = "wallmounted",
                        },
        node_box = {
                type = "fixed",
                fixed = {
                                        {-0.48, -0.5,-0.48,  0.48, -0.45, 0.48},
                        }
        },
        selection_box = {
                type = "fixed",
                fixed = {
                                        {-0.48, -0.5,-0.48,  0.48, -0.25, 0.48},
                        }
        }
})

minetest.register_node("growth:toilet_paper", {
        description = "toilet_paper",
        drawtype = 'nodebox',
	visual_scale = .7,
        tiles = { 'toilet_paper.png' },
        wield_image = 'toilet_paper.png',
        inventory_image = 'toilet_paper.png',
        sunlight_propagates = true,
        paramtype = 'light',
        paramtype2 = "facedir",
        is_ground_content = true,
        walkable = false,
        groups = { snappy = 3 },
        sounds = default.node_sound_leaves_defaults(),
        selection_box = {
                        type = "wallmounted",
                        },
        node_box = {
                type = "fixed",
                fixed = {
                                        {-0.48, -0.5,-0.48,  0.48, -0.45, 0.48},
                        }
        },
        selection_box = {
                type = "fixed",
                fixed = {
                                        {-0.48, -0.5,-0.48,  0.48, -0.25, 0.48},
                        }
        }
})

minetest.register_node("growth:overhang_plant", {
	description = "overhang_plant",
	drawtype = "plantlike",
	tiles = {"overhang_plant.png"},
	inventory_image = "overhang_plant.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:overhang_plant", param2 = 1})
		end
	end,
})

minetest.register_node("growth:overhang_sphere_on", {
	description = "overhang_sphere_on",
	drawtype = "plantlike",
	tiles = {"overhang_sphere_on.png"},
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = 12,
	groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1, torch=1},
	drop = "growth:overhang_sphere_on",
	selection_box = {
		type = "wallmounted",
		wall_top = {-1/8, -1/16, -5/16, 1/8, 1/2, 1/8},
	},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("growth:overhang_sphere_off", {
	description = "overhang_sphere_off",
	drawtype = "plantlike",
	tiles = {"overhang_sphere_off.png"},
	inventory_image = "overhang_sphere_off.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:overhang_sphere_off", param2 = 1})
		end
	end,
})

minetest.register_node("growth:tree1", {
	description = "tree1",
	drawtype = "plantlike",
	tiles = {"tree1.png"},
	inventory_image = "tree1.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 4.5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:tree1", param2 = 1})
		end
	end,
})

minetest.register_node("growth:tree2", {
	description = "tree2",
	drawtype = "plantlike",
	tiles = {"tree2.png"},
	inventory_image = "tree2.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 4.5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:tree2", param2 = 1})
		end
	end,
})

			
minetest.register_node("growth:tree3", {
	description = "tree3",
	drawtype = "plantlike",
	tiles = {"tree3.png"},
	inventory_image = "tree3.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 4.5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:tree3", param2 = 1})
		end
	end,
})

minetest.register_node("growth:tree4", {
	description = "tree4",
	drawtype = "plantlike",
	tiles = {"tree4.png"},
	inventory_image = "tree4.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 4.5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:tree4", param2 = 1})
		end
	end,
})

minetest.register_node("growth:tree5", {
	description = "tree5",
	drawtype = "plantlike",
	tiles = {"tree5.png"},
	inventory_image = "tree5.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 4.5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:tree5", param2 = 1})
		end
	end,
})

minetest.register_node("growth:tree6", {
	description = "tree6",
	drawtype = "plantlike",
	tiles = {"tree6.png"},
	inventory_image = "tree6.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 4.5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:tree6", param2 = 1})
		end
	end,
})

minetest.register_node("growth:pepperoni__pizza_", {
        description = "pepperoni__pizza_",
        drawtype = 'nodebox',
	visual_scale = .7,
        tiles = { 'pepperoni__pizza_.png' },
        wield_image = 'pepperoni__pizza_.png',
        inventory_image = 'pepperoni__pizza_.png',
        sunlight_propagates = true,
        paramtype = 'light',
        paramtype2 = "facedir",
        is_ground_content = true,
        walkable = false,
        groups = { snappy = 3 },
	on_use = minetest.item_eat(8),
        sounds = default.node_sound_leaves_defaults(),
        selection_box = {
                        type = "wallmounted",
                        },
        node_box = {
                type = "fixed",
                fixed = {
                                        {-0.48, -0.5,-0.48,  0.48, -0.45, 0.48},
                        }
        },
        selection_box = {
                type = "fixed",
                fixed = {
                                        {-0.48, -0.5,-0.48,  0.48, -0.25, 0.48},
                        }
        }
})

minetest.register_node("growth:pepperoni__slice_", {
        description = "pepperoni__slice_",
        drawtype = 'nodebox',
	visual_scale = .7,
        tiles = { 'pepperoni__slice_.png' },
        wield_image = 'pepperoni__slice_.png',
        inventory_image = 'pepperoni__slice_.png',
        sunlight_propagates = true,
        paramtype = 'light',
        paramtype2 = "facedir",
        is_ground_content = true,
        walkable = false,
        groups = { snappy = 3 },
	on_use = minetest.item_eat(2),
        sounds = default.node_sound_leaves_defaults(),
        selection_box = {
                        type = "wallmounted",
                        },
        node_box = {
                type = "fixed",
                fixed = {
                                        {-0.48, -0.5,-0.48,  0.48, -0.45, 0.48},
                        }
        },
        selection_box = {
                type = "fixed",
                fixed = {
                                        {-0.48, -0.5,-0.48,  0.48, -0.25, 0.48},
                        }
        }
})

minetest.register_node("growth:pizza__cutter_", {
        description = "pizza__cutter_",
        drawtype = 'nodebox',
	visual_scale = .7,
        tiles = { 'pizza__cutter_.png' },
        wield_image = 'pizza__cutter_.png',
        inventory_image = 'pizza__cutter_.png',
        sunlight_propagates = true,
        paramtype = 'light',
        paramtype2 = "facedir",
        is_ground_content = true,
        walkable = false,
        groups = { snappy = 3 },
        sounds = default.node_sound_leaves_defaults(),
        selection_box = {
                        type = "wallmounted",
                        },
        node_box = {
                type = "fixed",
                fixed = {
                                        {-0.48, -0.5,-0.48,  0.48, -0.45, 0.48},
                        }
        },
        selection_box = {
                type = "fixed",
                fixed = {
                                        {-0.48, -0.5,-0.48,  0.48, -0.25, 0.48},
                        }
        }
})

minetest.register_node("growth:alcohol_juice_source", {
	description = "alcohol_juice Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "growth_alcohol_juice_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{
			name = "growth_alcohol_juice_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "growth:alcohol_juice_flowing",
	liquid_alternative_source = "growth:alcohol_juice_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("growth:alcohol_juice_flowing", {
	description = "Flowing alcohol_juice",
	drawtype = "flowingliquid",
	tiles = {"growth_alcohol_juice.png"},
	special_tiles = {
		{
			name = "growth_alcohol_juice_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "growth_alcohol_juice_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "growth:alcohol_juice_flowing",
	liquid_alternative_source = "growth:alcohol_juice_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("growth:apple_juice_source", {
	description = "apple_juice Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "growth_apple_juice_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{
			name = "growth_apple_juice_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "growth:apple_juice_flowing",
	liquid_alternative_source = "growth:apple_juice_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("growth:apple_juice_flowing", {
	description = "Flowing apple_juice",
	drawtype = "flowingliquid",
	tiles = {"growth_apple_juice.png"},
	special_tiles = {
		{
			name = "growth_apple_juice_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "growth_apple_juice_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "growth:apple_juice_flowing",
	liquid_alternative_source = "growth:apple_juice_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("growth:bannana_juice_source", {
	description = "bannana_juice Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "growth_bannana_juice_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{
			name = "growth_bannana_juice_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "growth:bannana_juice_flowing",
	liquid_alternative_source = "growth:bannana_juice_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("growth:bannana_juice_flowing", {
	description = "Flowing bannana_juice",
	drawtype = "flowingliquid",
	tiles = {"growth_bannana_juice.png"},
	special_tiles = {
		{
			name = "growth_bannana_juice_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "growth_bannana_juice_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "growth:bannana_juice_flowing",
	liquid_alternative_source = "growth:bannana_juice_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("growth:grape_juice_source", {
	description = "grape_juice Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "growth_grape_juice_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{
			name = "growth_grape_juice_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "growth:grape_juice_flowing",
	liquid_alternative_source = "growth:grape_juice_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("growth:grape_juice_flowing", {
	description = "Flowing grape_juice",
	drawtype = "flowingliquid",
	tiles = {"growth_grape_juice.png"},
	special_tiles = {
		{
			name = "growth_grape_juice_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "growth_grape_juice_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "growth:grape_juice_flowing",
	liquid_alternative_source = "growth:grape_juice_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("growth:tub_source", {
	description = "tub Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "growth_tub_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{
			name = "growth_tub_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "growth:tub_flowing",
	liquid_alternative_source = "growth:tub_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("growth:tub_flowing", {
	description = "Flowing tub",
	drawtype = "flowingliquid",
	tiles = {"growth_tub.png"},
	special_tiles = {
		{
			name = "growth_tub_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "growth_tub_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "growth:tub_flowing",
	liquid_alternative_source = "growth:tub_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("growth:milk_juice_source", {
	description = "milk_juice Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "growth_milk_juice_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{
			name = "growth_milk_juice_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "growth:milk_juice_flowing",
	liquid_alternative_source = "growth:milk_juice_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("growth:milk_juice_flowing", {
	description = "Flowing milk_juice",
	drawtype = "flowingliquid",
	tiles = {"growth_milk_juice.png"},
	special_tiles = {
		{
			name = "growth_milk_juice_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "growth_milk_juice_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "growth:milk_juice_flowing",
	liquid_alternative_source = "growth:milk_juice_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("growth:watermelon_juice_source", {
	description = "watermelon_juice Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "growth_watermelon_juice_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{
			name = "growth_watermelon_juice_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "growth:watermelon_juice_flowing",
	liquid_alternative_source = "growth:watermelon_juice_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("growth:watermelon_juice_flowing", {
	description = "Flowing watermelon_juice",
	drawtype = "flowingliquid",
	tiles = {"growth_watermelon_juice.png"},
	special_tiles = {
		{
			name = "growth_watermelon_juice_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "growth_watermelon_juice_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "growth:watermelon_juice_flowing",
	liquid_alternative_source = "growth:watermelon_juice_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("growth:robot_juice_source", {
	description = "robot_juice Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "growth_robot_juice_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{
			name = "growth_robot_juice_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "growth:robot_juice_flowing",
	liquid_alternative_source = "growth:robot_juice_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("growth:robot_juice_flowing", {
	description = "Flowing robot_juice",
	drawtype = "flowingliquid",
	tiles = {"growth_robot_juice.png"},
	special_tiles = {
		{
			name = "growth_robot_juice_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "growth_robot_juice_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "growth:robot_juice_flowing",
	liquid_alternative_source = "growth:robot_juice_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("growth:milk_potion", {
	description = "milk_potion",
	drawtype = "plantlike",
	tiles = {"milk_potion.png"},
	inventory_image = "milk_potion.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = .5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:milk_potion", param2 = 1})
		end
	end,
})
			
minetest.register_node("growth:orange_potion", {
	description = "orange_potion",
	drawtype = "plantlike",
	tiles = {"orange_potion.png"},
	inventory_image = "orange_potion.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = .5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:orange_potion", param2 = 1})
		end
	end,
})
			
minetest.register_node("growth:purple_potion", {
	description = "purple_potion",
	drawtype = "plantlike",
	tiles = {"purple_potion.png"},
	inventory_image = "purple_potion.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = .5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:purple_potion", param2 = 1})
		end
	end,
})

	
minetest.register_node("growth:tan_potion", {
	description = "tan_potion",
	drawtype = "plantlike",
	tiles = {"tan_potion.png"},
	inventory_image = "tan_potion.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = .5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:tan_potion", param2 = 1})
		end
	end,
})
	
minetest.register_node("growth:bulb_plant", {
	description = "bulb_plant",
	drawtype = "plantlike",
	tiles = {"bulb_plant.png"},
	inventory_image = "bulb_plant.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 2.8,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:bulb_plant", param2 = 1})
		end
	end,
})
	
minetest.register_node("growth:dead_treeA", {
	description = "dead_treeA",
	drawtype = "plantlike",
	tiles = {"dead_treeA.png"},
	inventory_image = "dead_treeA.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 4.5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:dead_treeA", param2 = 1})
		end
	end,
})

	
minetest.register_node("growth:dead_treeB", {
	description = "dead_treeB",
	drawtype = "plantlike",
	tiles = {"dead_treeB.png"},
	inventory_image = "dead_treeB.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 4.5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:dead_treeB", param2 = 1})
		end
	end,
})

minetest.register_node("growth:dead_treeC", {
	description = "dead_treeC",
	drawtype = "plantlike",
	tiles = {"dead_treeC.png"},
	inventory_image = "dead_treeC.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 4.5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:dead_treeC", param2 = 1})
		end
	end,
})

minetest.register_node("growth:dead_treeD", {
	description = "dead_treeD",
	drawtype = "plantlike",
	tiles = {"dead_treeD.png"},
	inventory_image = "dead_treeD.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 4.5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:dead_treeD", param2 = 1})
		end
	end,
})

minetest.register_node("growth:dead_treeE", {
	description = "dead_treeE",
	drawtype = "plantlike",
	tiles = {"dead_treeE.png"},
	inventory_image = "dead_treeE.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 4.5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:dead_treeE", param2 = 1})
		end
	end,
})

minetest.register_node("growth:sunflower", {
	description = "sunflower",
	drawtype = "plantlike",
	tiles = {"sunflower.png"},
	inventory_image = "sunflower.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 1.7,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:sunflower", param2 = 1})
		end
	end,
})

minetest.register_node("growth:sunflowerB", {
	description = "sunflowerB",
	drawtype = "plantlike",
	tiles = {"sunflowerB.png"},
	inventory_image = "sunflowerB.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 2.8,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:sunflowerB", param2 = 1})
		end
	end,
})

minetest.register_node("growth:spruce", {
	description = "spruce",
	drawtype = "plantlike",
	tiles = {"spruce.png"},
	inventory_image = "spruce.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 4.5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:spruce", param2 = 1})
		end
	end,
})
			
minetest.register_node("growth:spruceB", {
	description = "spruceB",
	drawtype = "plantlike",
	tiles = {"spruceB.png"},
	inventory_image = "spruceB.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 4.5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:spruceB", param2 = 1})
		end
	end,
})
			
minetest.register_node("growth:basic__tree_", {
	description = "basic__tree_",
	drawtype = "plantlike",
	tiles = {"basic__tree_.png"},
	inventory_image = "basic__tree_.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:basic__tree_", param2 = 1})
		end
	end,
})
			
minetest.register_node("growth:basic__tree_a", {
	description = "basic__tree_a",
	drawtype = "plantlike",
	tiles = {"basic__tree_a.png"},
	inventory_image = "basic__tree_a.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:basic__tree_a", param2 = 1})
		end
	end,
})
			
minetest.register_node("growth:basic__tree_b", {
	description = "basic__tree_b",
	drawtype = "plantlike",
	tiles = {"basic__tree_b.png"},
	inventory_image = "basic__tree_b.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:basic__tree_b", param2 = 1})
		end
	end,
})
			
minetest.register_node("growth:basic__tree_c", {
	description = "basic__tree_c",
	drawtype = "plantlike",
	tiles = {"basic__tree_c.png"},
	inventory_image = "basic__tree_c.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:basic__tree_c", param2 = 1})
		end
	end,
})
			
minetest.register_node("growth:basic__tree_d", {
	description = "basic__tree_d",
	drawtype = "plantlike",
	tiles = {"basic__tree_d.png"},
	inventory_image = "basic__tree_d.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:basic__tree_d", param2 = 1})
		end
	end,
})
			
minetest.register_node("growth:basic__tree_e", {
	description = "basic__tree_e",
	drawtype = "plantlike",
	tiles = {"basic__tree_e.png"},
	inventory_image = "basic__tree_e.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:basic__tree_e", param2 = 1})
		end
	end,
})
			
minetest.register_node("growth:basic__tree_f", {
	description = "basic__tree_f",
	drawtype = "plantlike",
	tiles = {"basic__tree_f.png"},
	inventory_image = "basic__tree_f.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:basic__tree_f", param2 = 1})
		end
	end,
})
			
minetest.register_node("growth:logs", {
	description = "logs",
	drawtype = "plantlike",
	tiles = {"logs.png"},
	inventory_image = "logs.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 4.2,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:logs", param2 = 1})
		end
	end,
})
			
minetest.register_node("growth:tree__plant_lb", {
	description = "tree__plant_lb",
	drawtype = "plantlike",
	tiles = {"tree__plant_lb.png"},
	inventory_image = "tree__plant_lb.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 1.5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:tree__plant_lb", param2 = 1})
		end
	end,
})

minetest.register_node("growth:tree__plant_8", {
	description = "tree__plant_8",
	drawtype = "plantlike",
	tiles = {"tree__plant_8.png"},
	inventory_image = "tree__plant_8.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 1.5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:tree__plant_8", param2 = 1})
		end
	end,
})

minetest.register_node("growth:tree__plant_l", {
	description = "tree__plant_l",
	drawtype = "plantlike",
	tiles = {"tree__plant_l.png"},
	inventory_image = "tree__plant_l.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 1.5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:tree__plant_l", param2 = 1})
		end
	end,
})

minetest.register_node("growth:tree__plant_m", {
	description = "tree__plant_m",
	drawtype = "plantlike",
	tiles = {"tree__plant_m.png"},
	inventory_image = "tree__plant_m.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 1.5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:tree__plant_m", param2 = 1})
		end
	end,
})

minetest.register_node("growth:pine", {
	description = "pine",
	drawtype = "plantlike",
	tiles = {"pine.png"},
	inventory_image = "pine.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	visual_scale = 5.5,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "growth:pine", param2 = 1})
		end
	end,
})

minetest.register_node("growth:blei__logo_", {
	description = "Blei",
	drawtype = "signlike",
	tiles = {"blei__logo_.png"},
	inventory_image = "blei__logo_.png",
	wield_image = "blei__logo_.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = = <default>
		--wall_bottom = = <default>
		--wall_side = = <default>
	},
	groups = {choppy=2,oddly_breakable_by_hand=3,flammable=2},
	legacy_wallmounted = true,
	sounds = default.node_sound_wood_defaults(),
})