if not mobs.mod == "redo" then return end

local mod_config = config.settings_model('mobs_giraffe', {
	jeraf = {
		spawn = {
			enabled = config.types.boolean(true),
			on = config.types.list({"default:sand", "default:desert_sand", "default:dirt_with_dry_grass"}),
			near = config.types.list({ "air" }),
			interval = config.types.int(30, { min=1 }),
			chance = config.types.int(300000, { min=1 }),
			min_light = config.types.int(10, { min=0 }),
			max_light = config.types.int(15, { min=0 }),
			min_height = config.types.int(2, { min=-31000, max=31000 }),
			max_height = config.types.int(5000, { min=-31000, max=31000 }),
			active_object_count = config.types.int(1, { min=1 }),
		}
	}
})

mobs:register_mob("mobs_giraffe:jeraf", {
	type = "animal",
	visual = "mesh",
	mesh = "mobs_jeraf.x",
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1, 0.4},
	animation = {
		speed_normal = 15,	speed_run = 24,
		stand_start = 0,	stand_end = 30,
		walk_start = 70,	walk_end = 100,
		run_start = 70,		run_end = 100
	},
	textures = {
		{"mobs_jeraf.png"},
	},
	stepheight = 2.1,
	fear_height = 3,
	jump = false,
	jump_height = 4,
	fly = false,
	walk_chance = 75,
	walk_velocity = 2,
	run_velocity = 4,
	view_range = 16,
	passive = true,
	attack_type = "dogfight",
	damage = 10,
	reach = 3,
	runaway = true,
	pathfinding = false,
	hp_min = 8,
	hp_max = 12,
	armor = 200,
	knock_back = 1,
	lava_damage = 5,
	fall_damage = 10,
	water_damage = 1,
	makes_footstep_sound = true,
	knock_back = 1,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 3},
		{name = "mobs:leather", chance = 1, min = 1, max = 4}
	},
	replace_what = {
		"default:acacia_leaves",
		"default:acacia_sapling",
		"default:acacia_bush_leaves",
		"default:acacia_bush_sapling"
	},
	replace_with = "air",
	replace_rate = 20,
	follow = {
		"default:acacia_leaves",
		"default:acacia_sapling",
		"default:acacia_bush_leaves",
		"default:acacia_bush_sapling"
	},
	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 10, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 0, 80, false, nil) then return end
	end
})

if mod_config.jeraf.spawn.enabled then
	mobs:spawn_specific(
		"mobs_giraffe:jeraf",
		mod_config.jeraf.spawn.on,
		mod_config.jeraf.spawn.near,
		mod_config.jeraf.spawn.min_light,
		mod_config.jeraf.spawn.max_light,
		mod_config.jeraf.spawn.interval,
		mod_config.jeraf.spawn.chance,
		mod_config.jeraf.spawn.active_object_count,
		mod_config.jeraf.spawn.min_height,
		mod_config.jeraf.spawn.max_height,
		true
	)
end

mobs:register_egg("mobs_giraffe:jeraf", "Giraffe", "wool_yellow.png", 1)

dofile(minetest.get_modpath(minetest.get_current_modname())..'/test.lua')

