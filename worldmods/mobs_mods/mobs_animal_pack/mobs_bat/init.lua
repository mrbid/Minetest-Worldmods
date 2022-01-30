if not mobs.mod == "redo" then return end

-- local variables
local l_skins = {
	{"animal_bat.png"},
	{"animal_bat.png^[colorize:black:150"}
}

local mod_config = config.settings_model('mobs_bat', {
	bat = {
		spawn = {
			enabled = config.types.boolean(true),
			on = config.types.list({ "air" }),
			near = config.types.list({ "default:stone" }),
			interval = config.types.int(30, { min=1 }),
			chance = config.types.int(300000, { min=1 }),
			min_light = config.types.int(0, { min=0 }),
			max_light = config.types.int(6, { min=0 }),
			min_height = config.types.int(-25000, { min=-31000, max=31000 }),
			max_height = config.types.int(5000, { min=-31000, max=31000 }),
			active_object_count = config.types.int(2, { min=1 }),
		}
	}
})

mobs:register_mob("mobs_bat:bat", {
	type = "animal",
	damage = 1,
	reach = 1,
	attack_type = "dogfight",
	hp_min = 7,
	hp_max = 12,
	armor = 130,
	collisionbox = {-0.4,-0.4,-0.4, 0.4,0.4,0.4},
	visual = "mesh",
	mesh = "animal_bat.b3d",
	textures = l_skins,
	rotate = 270,
	walk_velocity = 10,
	run_velocity = 23,
	fall_speed = 0,
	stepheight = 3,
	sounds = {
		random = "animal_bat",
		war_cry = "animal_bat",
		damage = "animal_bat",
		attack = "animal_bat",
	},
	fly = true,
	water_damage = 2,
	lava_damage = 10,
	light_damage = 0,
	view_range = 10,
	animation = {
		speed_normal = 24,		speed_run = 24,
		stand_start = 30,		stand_end = 59,
		walk_start = 30,		walk_end = 59,
		run_start = 30,			run_end = 59,
		punch_start = 60,		punch_end = 89
	},
	on_rightclick = function(self, clicker)
		mobs:capture_mob(self, clicker, 5, 60, 0, true, "mobs_bat:bat")
	end,
	drops = {
		{name="mobs:meat_raw", chance=1, min=0, max=1},
	},
})

if mod_config.bat.spawn.enabled then
	--name, nodes, neighbors, min_light, max_light, interval, chance, active_object_count, min_height, max_height
	mobs:spawn_specific(
		"mobs_bat:bat",
		mod_config.bat.spawn.on,
		mod_config.bat.spawn.near,
		mod_config.bat.spawn.min_light,
		mod_config.bat.spawn.max_light,
		mod_config.bat.spawn.interval,
		mod_config.bat.spawn.chance,
		mod_config.bat.spawn.active_object_count,
		mod_config.bat.spawn.min_height,
		mod_config.bat.spawn.max_height
	)
end

mobs:register_egg("mobs_bat:bat", "Bat", "animal_bat_inv.png", 0)

dofile(minetest.get_modpath(minetest.get_current_modname())..'/test.lua')

