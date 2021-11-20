if not mobs.mod == "redo" then return end

-- local variables
local l_skins_gull = {
	{"animal_gull_mesh.png"},
	{"gull_black.png"},
	{"gull_gray.png"},
	{"gull_grayblue.png"}
}
local l_skins_bird = {
	{"bird_blueish.png"},
	{"bird_brown.png"},
	{"bird_gray.png"},
	{"bird_grayblue.png"},
	{"bird_red.png"},
	{"bird_redish.png"}
}
local l_anims = {
	speed_normal = 24,	speed_run = 24,
	stand_start = 1,	stand_end = 95,
	walk_start = 1,		walk_end = 95,
	run_start = 1,		run_end = 95
}
local l_gull_model			= "mobs_birds_gull.b3d"
local l_thrush_model		= "mobs_birds_thrush.b3d"
local l_egg_texture			= "default_cloud.png"
local l_capture_chance_h	= 5
local l_capture_chance_n	= 60

local mod_config = config.settings_model('mobs_birds', {
	gull = {
		spawn = {
			enabled = config.types.boolean(true),
			on = config.types.list({ "air" }),
			near = config.types.list({"default:water_source", "default:water_flowing"}),
			interval = config.types.int(30, { min=1 }),
			chance = config.types.int(240000, { min=1 }),
			min_light = config.types.int(5, { min=0 }),
			max_light = config.types.int(20, { min=0 }),
			min_height = config.types.int(0, { min=-31000, max=31000 }),
			max_height = config.types.int(5000, { min=-31000, max=31000 }),
			active_object_count = config.types.int(1, { min=1 }),
		}
	},
	bird_lg = {
		spawn = {
			enabled = config.types.boolean(true),
			on = config.types.list({ "air" }),
			near = config.types.list({"default:leaves", "default:pine_needles", "default:jungleleaves", "default:cactus"}),
			interval = config.types.int(30, { min=1 }),
			chance = config.types.int(360000, { min=1 }),
			min_light = config.types.int(5, { min=0 }),
			max_light = config.types.int(20, { min=0 }),
			min_height = config.types.int(0, { min=-31000, max=31000 }),
			max_height = config.types.int(5000, { min=-31000, max=31000 }),
			active_object_count = config.types.int(1, { min=1 }),
		}
	},
	bird_sm = {
		spawn = {
			enabled = config.types.boolean(true),
			on = config.types.list({ "air" }),
			near = config.types.list({"default:leaves", "default:pine_needles", "default:jungleleaves", "default:cactus"}),
			interval = config.types.int(30, { min=1 }),
			chance = config.types.int(360000, { min=1 }),
			min_light = config.types.int(5, { min=0 }),
			max_light = config.types.int(20, { min=0 }),
			min_height = config.types.int(0, { min=-31000, max=31000 }),
			max_height = config.types.int(5000, { min=-31000, max=31000 }),
			active_object_count = config.types.int(1, { min=1 }),
		}
	}
})

-- gulls
mobs:register_mob("mobs_birds:gull", {
	type = "animal",
	passive = true,
	hp_min = 5,
	hp_max = 10,
	armor = 100,
	collisionbox = {-1, -0.3, -1, 1, 0.3, 1},
	visual = "mesh",
	mesh = l_gull_model,
	textures = l_skins_gull,
	rotate = 270,
	walk_velocity = 4,
	run_velocity = 6,
	fall_speed = 0,
	stepheight = 3,
	fly = true,
	water_damage = 0,
	lava_damage = 10,
	light_damage = 0,
	view_range = 14,
	animation = l_anims,
	on_rightclick = function(self, clicker)
		mobs:capture_mob(self, clicker, l_capture_chance_h, l_capture_chance_n, 0, true, "mobs_birds:gull")
	end,
	drops = {
		{name="mobs:meat_raw", chance=1, min=0, max=2},
		{name="mobs:chicken_feather", chance=1, min=0, max=2}
	},
})
if mod_config.gull.spawn.enabled then
	--name, nodes, neighbors, min_light, max_light, interval, chance, active_object_count, min_height, max_height
	mobs:spawn_specific(
		"mobs_birds:gull",
		mod_config.gull.spawn.on,
		mod_config.gull.spawn.near,
		mod_config.gull.spawn.min_light,
		mod_config.gull.spawn.max_light,
		mod_config.gull.spawn.interval,
		mod_config.gull.spawn.chance,
		mod_config.gull.spawn.active_object_count,
		mod_config.gull.spawn.min_height,
		mod_config.gull.spawn.max_height
	)
end
mobs:register_egg("mobs_birds:gull", "Gull", l_egg_texture, 1)

-- large birds
mobs:register_mob("mobs_birds:bird_lg", {
	type = "animal",
	passive = true,
	hp_min = 5,
	hp_max = 10,
	armor = 100,
	collisionbox = {-0.5, -0.3, -0.5, 0.5, 0.3, 0.5},
	visual = "mesh",
	mesh = l_thrush_model,
	textures = l_skins_bird,
	visual_size = {x=.5, y=.5},
	rotate = 270,
	walk_velocity = 4,
	run_velocity = 6,
	fall_speed = 0,
	stepheight = 3,
	fly = true,
	water_damage = 0,
	lava_damage = 10,
	light_damage = 0,
	view_range = 12,
	animation = l_anims,
	on_rightclick = function(self, clicker)
		mobs:capture_mob(self, clicker, l_capture_chance_h, l_capture_chance_n, 0, true, "mobs_birds:bird_lg")
	end,
	drops = {
		{name="mobs:meat_raw", chance=1, min=0, max=2},
		{name="mobs:chicken_feather", chance=1, min=0, max=2}
	},
})
if mod_config.bird_lg.spawn.enabled then
	--name, nodes, neighbors, min_light, max_light, interval, chance, active_object_count, min_height, max_height
	mobs:spawn_specific(
		"mobs_birds:bird_lg",
		mod_config.bird_lg.spawn.on,
		mod_config.bird_lg.spawn.near,
		mod_config.bird_lg.spawn.min_light,
		mod_config.bird_lg.spawn.max_light,
		mod_config.bird_lg.spawn.interval,
		mod_config.bird_lg.spawn.chance,
		mod_config.bird_lg.spawn.active_object_count,
		mod_config.bird_lg.spawn.min_height,
		mod_config.bird_lg.spawn.max_height
	)
end
mobs:register_egg("mobs_birds:bird_lg", "Large bird", l_egg_texture, 1)

-- small birds
mobs:register_mob("mobs_birds:bird_sm", {
	type = "animal",
	passive = true,
	hp_min = 2,
	hp_max = 5,
	armor = 100,
	collisionbox = {-0.25, -0.3, -0.25, 0.25, 0.3, 0.25},
	visual = "mesh",
	mesh = l_thrush_model,
	textures = l_skins_bird,
	visual_size = {x=.25, y=.25},
	rotate = 270,
	walk_velocity = 4,
	run_velocity = 6,
	fall_speed = 0,
	stepheight = 3,
	fly = true,
	water_damage = 0,
	lava_damage = 10,
	light_damage = 0,
	view_range = 10,
	animation = l_anims,
	on_rightclick = function(self, clicker)
		mobs:capture_mob(self, clicker, l_capture_chance_h, l_capture_chance_n, 0, true, "mobs_birds:bird_sm")
	end,
	drops = {
		{name="mobs:meat_raw", chance=1, min=0, max=1},
		{name="mobs:chicken_feather", chance=1, min=0, max=1}
	},
})
if mod_config.bird_sm.spawn.enabled then
	--name, nodes, neighbors, min_light, max_light, interval, chance, active_object_count, min_height, max_height
	mobs:spawn_specific(
		"mobs_birds:bird_sm",
		mod_config.bird_sm.spawn.on,
		mod_config.bird_sm.spawn.near,
		mod_config.bird_sm.spawn.min_light,
		mod_config.bird_sm.spawn.max_light,
		mod_config.bird_sm.spawn.interval,
		mod_config.bird_sm.spawn.chance,
		mod_config.bird_sm.spawn.active_object_count,
		mod_config.bird_sm.spawn.min_height,
		mod_config.bird_sm.spawn.max_height
	)
end
mobs:register_egg("mobs_birds:bird_sm", "Small bird", l_egg_texture, 1)

dofile(minetest.get_modpath(minetest.get_current_modname())..'/test.lua')

