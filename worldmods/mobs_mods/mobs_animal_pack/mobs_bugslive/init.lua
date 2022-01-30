if not mobs.mod == "redo" then return end

local mod_config = config.settings_model('mobs_bugslive', {
	bug = {
		spawn = {
			enabled = config.types.boolean(true),
			on = config.types.list({
				"default:dirt",
				"default:dirt_with_grass",
				"default:dirt_with_coniferous_litter",
				"default:dirt_with_dry_grass",
				"default:dirt_with_rainforest_litter",
				"default:stone",
				"ethereal:green_dirt_top"
			}),
			near = config.types.list({ "air", "default:water_source", "default:water_flowing", "default:river_water_source", "default:river_water_flowing" }),
			interval = config.types.int(30, { min=1 }),
			chance = config.types.int(300000, { min=1 }),
			min_light = config.types.int(0, { min=0 }),
			max_light = config.types.int(15, { min=0 }),
			min_height = config.types.int(-25000, { min=-31000, max=31000 }),
			max_height = config.types.int(5000, { min=-31000, max=31000 }),
			active_object_count = config.types.int(2, { min=1 }),
		}
	}
})

mobs:register_mob("mobs_bugslive:bug", {
	type = "animal",
	visual = "mesh",
	visual_size = {x=0.5, y=0.5},
	mesh = "bug.x",
	collisionbox = {-0.1, -0.01, -0.1, 0.1, 0.1, 0.1},
	textures = {
		{"bug1.png"},
		{"bug2.png"},
		{"bug3.png"},
		{"bug4.png"},
		{"bug5.png"},
		{"bug6.png"},
		{"bug7.png"},
		{"bug8.png"}
	},
	stepheight = 1.1,
	runaway = true,
	jump_chance = 5,
	jump_height = 2,
	fly = false,
	walk_chance = 60,
	walk_velocity = 2,
	run_velocity = 4,
	fall_speed = -5,
	floats = 0,
	view_range = 3,
	passive = true,
	attack_type = "dogfight",
	damage = 1,
	reach = 1,
	pathfinding = false,
	group_attack = true,
	hp_min = 1,
	hp_max = 1,
	armor = 200,
	knock_back = 0,
	lava_damage = 1,
	fall_damage = 0,
	recovery_time = 0.25,
	blood_amount = 1,
	replace_what = {
		"farming:beanpole_5",
		"farming:cucumber_4",
		"farming:melon_8",
		"farming:pumpkin_8"
	},
	replace_with = "air",
	replace_rate = 10,
	do_custom = function(self, dtime)
			if math.random() > 0.5 then
				if self.floats == 0 then
					self.floats = 1
				else
					self.floats = 0
				end
			end
		end,
	on_rightclick = function(self, clicker)
		mobs:capture_mob(self, clicker, 50, 80, 0, true, "mobs_bugslive:bug")
	end
})

if mod_config.bug.spawn.enabled then
	--name, nodes, neighbors, min_light, max_light, interval, chance, active_object_count, min_height, max_height
	mobs:spawn_specific(
		"mobs_bugslive:bug",
		mod_config.bug.spawn.on,
		mod_config.bug.spawn.near,
		mod_config.bug.spawn.min_light,
		mod_config.bug.spawn.max_light,
		mod_config.bug.spawn.interval,
		mod_config.bug.spawn.chance,
		mod_config.bug.spawn.active_object_count,
		mod_config.bug.spawn.min_height,
		mod_config.bug.spawn.max_height
	)
end

mobs:register_egg("mobs_bugslive:bug", "Bug", "inv_bug.png", 0)

dofile(minetest.get_modpath(minetest.get_current_modname())..'/test.lua')

