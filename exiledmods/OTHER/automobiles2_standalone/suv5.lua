minetest.register_entity("automobiles2:suv5", {
	automobile2_name = "suv5",
	isflying = true,
	lift = 8, -- lift (anti-gravity) per second for flying
	gravity = 2, -- gravity per second
	turn_speed = 2, -- turn speed per second
	acceler = 30, -- acceleration per second
	decell = 0.01, -- decelleration per second
	traction = 0.1, -- traction per second

	rider_eye_offset = {x=0, y=-2, z=0},
	rider_pos = {x=-5, y=3, z=-0},
	passenger_pos = {x=5, y=3, z=0},
	passenger_pos1 = {x=-5, y=3, z=-16},
	passenger_pos2 = {x=5, y=3, z=-16},

	visual = "mesh",
	mesh = "suv.b3d",
	get_staticdata = automobile2_get_staticdata,
	on_activate = automobile2_on_activate,
	textures = {"automobiles2_suv5.png"},
	stepheight = 1.1,
	hp_max = 120,
	physical = true,
	collisionbox = {-1, 0, -1, 1, 1.55, 1},
	on_rightclick = automobile2_on_rightclick,
	on_punch = automobile2_on_punch,
	on_step = automobile2_on_step,
})

minetest.register_craftitem("automobiles2:suv5_spawner", {
	description = "Flying PsySUV2",
	inventory_image = "automobiles2_suv5_inv.png",
	on_place = function(item, placer, pointed_thing)
		local playerpos = placer:getpos();
		pointed_thing.above.y = pointed_thing.above.y - 0.5 -- no floating automobiles!
		local obj = minetest.env:add_entity(pointed_thing.above, "automobiles2:suv5")
		local entity = obj:get_luaentity()
		obj:setyaw(placer:get_look_yaw() - math.pi / 2)
		entity.owner_name = placer:get_player_name()
		item:take_item()
		return item
	end,
})

minetest.register_craft({
	output = "automobiles2:suv5_spawner",
	recipe = {
		{"default:obsidian_glass", "default:obsidian_glass", "default:obsidian_glass"},
		{"default:steelblock", "basic_materials:motor", "default:steelblock"},
		{"bbq:propane", "biofuel:superfuel_can", "bbq:propane"}
	},
})
