minetest.register_entity("automobiles2:suv", {
	automobile_type = "suv",
	turn_speed = 2, -- turn speed per second
	acceler = 30, -- acceleration per second
	gravity = 10, -- gravity per second
	decell = 0.2, -- decelleration per second
	traction = 1.5, -- traction per second
	rider_pos = {x=-5, y=4, z=0},
	rider_eye_offset = {x=0, y=-4, z=0},

	visual = "mesh",
	mesh = "suv.b3d",
	get_staticdata = automobile_get_staticdata,
	on_activate = automobile_on_activate,
	textures = {
		"automobiles2_suv.png^[combine:256x256:0,0=automobiles2_suv_wheel.png"
	},
	stepheight = 1.1,
	hp_max = 20,
	physical = true,
	collisionbox = {-1, 0, -1, 1, 1.55, 1},
	on_rightclick = automobile_on_rightclick,
	on_punch = automobile_on_punch,
	on_step = automobile_on_step,
})

minetest.register_craftitem("automobiles2:suv_spawner", {
	description = "SUV",
	inventory_image = "automobiles2_suv_inv.png",
	on_place = function(item, placer, pointed_thing)
		local playerpos = placer:getpos();
		pointed_thing.above.y = pointed_thing.above.y - 0.5 -- no floating automobiles!
		local obj = minetest.env:add_entity(pointed_thing.above, "automobiles2:suv")
		local entity = obj:get_luaentity()
		obj:setyaw(placer:get_look_yaw() - math.pi / 2)
		entity.owner_name = placer:get_player_name()
		if not minetest.setting_getbool("creative_mode") then item:take_item() end
		return item
	end,
})

-- minetest.register_craft({
-- 	output = "automobiles2:suv_spawner",
-- 	recipe = {
-- 		{"default:glass", "default:glass", ""},
-- 		{"default:steelblock", "default:steelblock", "default:steelblock"}
-- 	},
-- })
