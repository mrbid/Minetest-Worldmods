if not mobs.mod == "redo" then return end

local mod_config = config.settings_model('mobs_fish', {
	clownfish = {
		spawn = {
			enabled = config.types.boolean(true),
			on = config.types.list({"default:water_source", "default:water_flowing", "default:river_water_source", "default:river_water_flowing"}),
			near = config.types.list({"default:sand","default:dirt","group:seaplants","group:seacoral"}),
			interval = config.types.int(30, { min=1 }),
			chance = config.types.int(100000, { min=1 }),
			min_light = config.types.int(5, { min=0 }),
			max_light = config.types.int(20, { min=0 }),
			min_height = config.types.int(-50, { min=-31000, max=31000 }),
			max_height = config.types.int(0, { min=-31000, max=31000 }),
			active_object_count = config.types.int(1, { min=1 }),
		}
	},
	tropical = {
		spawn = {
			enabled = config.types.boolean(true),
			on = config.types.list({"default:water_source", "default:water_flowing", "default:river_water_source", "default:river_water_flowing"}),
			near = config.types.list({"default:sand","default:dirt","group:seaplants","group:seacoral"}),
			interval = config.types.int(30, { min=1 }),
			chance = config.types.int(100000, { min=1 }),
			min_light = config.types.int(5, { min=0 }),
			max_light = config.types.int(20, { min=0 }),
			min_height = config.types.int(-50, { min=-31000, max=31000 }),
			max_height = config.types.int(0, { min=-31000, max=31000 }),
			active_object_count = config.types.int(1, { min=1 }),
		}
	}
})

-- local variables
local l_cc_hand           = 25
local l_cc_net            = 80
local l_anims             = {
	speed_normal = 24,		speed_run = 24,
	stand_start = 1,		stand_end = 80,
	walk_start = 81,		walk_end = 155,
	run_start = 81,			run_end = 155
}
local l_visual            = "mesh"
local l_clown_visual_size = { x = .5, y = .5}
local l_trop_visual_size  = { x = 1, y = 1}
local l_clown_mesh        = "animal_clownfish.b3d"
local l_trop_mesh         = "fish_blue_white.b3d"
local l_clown_textures    = {
	{"clownfish.png"},
	{"clownfish2.png"}
}
local l_trop_textures     = {
	{"fish.png"},
	{"fish2.png"},
	{"fish3.png"}
}

-- Clownfish
mobs:register_mob("mobs_fish:clownfish", {
	type = "animal",
	lifetimer = 0,  -- doesn't despawn
	passive = true,
	hp_min = 1,
	hp_max = 4,
	armor = 100,
	collisionbox = {-0.25, -0.25, -0.25, 0.25, 0.25, 0.25},
	rotate = 270,
	visual = l_visual,
	mesh = l_clown_mesh,
	textures = l_clown_textures,
	visual_size = l_clown_visual_size,
	makes_footstep_sound = false,
	stepheight = 0.1,
	fly = true,
	fly_in = "default:water_source",
	fall_speed = 0,
	view_range = 8,
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	animation = l_anims,
	on_rightclick = function(self, clicker)
		mobs:capture_mob(self, clicker, l_cc_hand, l_cc_net, 0, true, "mobs_fish:clownfish")
	end
})
if mod_config.clownfish.spawn.enabled then
	--name, nodes, neighbours, minlight, maxlight, interval, chance, active_object_count, min_height, max_height
	mobs:spawn_specific(
		"mobs_fish:clownfish",
		mod_config.clownfish.spawn.on,
		mod_config.clownfish.spawn.near,
		mod_config.clownfish.spawn.min_light,
		mod_config.clownfish.spawn.max_light,
		mod_config.clownfish.spawn.interval,
		mod_config.clownfish.spawn.chance,
		mod_config.clownfish.spawn.active_object_count,
		mod_config.clownfish.spawn.min_height,
		mod_config.clownfish.spawn.max_height
	)
end
mobs:register_egg("mobs_fish:clownfish", "Clownfish", "animal_clownfish_clownfish_item.png", 0)

-- Tropical fish
mobs:register_mob("mobs_fish:tropical", {
	type = "animal",
	lifetimer = 0,  -- doesn't despawn
	passive = true,
	hp_min = 1,
	hp_max = 4,
	armor = 100,
	collisionbox = {-0.25, -0.25, -0.25, 0.25, 0.25, 0.25},
	rotate = 270,
	visual = l_visual,
	mesh = l_trop_mesh,
	textures = l_trop_textures,
	visual_size = l_trop_visual_size,
	makes_footstep_sound = false,
	stepheight = 0.1,
	fly = true,
	fly_in = "default:water_source",
	fall_speed = 0,
	view_range = 8,
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	animation = l_anims,
	on_rightclick = function(self, clicker)
		mobs:capture_mob(self, clicker, l_cc_hand, l_cc_net, 0, true, "mobs_fish:tropical")
	end
})
if mod_config.tropical.spawn.enabled then
	--name, nodes, neighbours, minlight, maxlight, interval, chance, active_object_count, min_height, max_height
	mobs:spawn_specific(
		"mobs_fish:tropical",
		mod_config.tropical.spawn.on,
		mod_config.tropical.spawn.near,
		mod_config.tropical.spawn.min_light,
		mod_config.tropical.spawn.max_light,
		mod_config.tropical.spawn.interval,
		mod_config.tropical.spawn.chance,
		mod_config.tropical.spawn.active_object_count,
		mod_config.tropical.spawn.min_height,
		mod_config.tropical.spawn.max_height
	)
end
mobs:register_egg("mobs_fish:tropical", "Tropical fish", "animal_fish_blue_white_fish_blue_white_item.png", 0)

dofile(minetest.get_modpath(minetest.get_current_modname())..'/test.lua')

