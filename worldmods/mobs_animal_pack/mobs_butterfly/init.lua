if not mobs.mod == "redo" then return end

-- local variables
local l_skins = {
	{"bf1.png^bf2.png^bf3.png^bf4.png^bf5.png"},
	{"(bf1.png^[colorize:orange)^(bf2.png^[colorize:violet)^(bf3.png^[colorize:yellow)^(bf4.png^[colorize:cyan)^(bf5.png^[colorize:black)"},
	{"(bf1.png^[colorize:magenta)^(bf2.png^[colorize:green)^(bf3.png^[colorize:red)^(bf4.png^[colorize:blue)^(bf5.png^[colorize:white)"},
	{"(bf1.png^[colorize:yellow)^(bf2.png^[colorize:cyan)^(bf3.png^[colorize:green)^(bf4.png^[colorize:violet)^(bf5.png^[colorize:darkgray)"},
	{"(bf1.png^[colorize:pink)^(bf2.png^[colorize:white)^(bf3.png^[colorize:blue)^(bf4.png^[colorize:orange)^(bf5.png^[colorize:gray)"},
	{"(bf1.png^[colorize:darkgreen)^(bf2.png^[colorize:brown)^(bf3.png^[colorize:black)^(bf4.png^[colorize:darkgray)^(bf5.png^[colorize:red)"}
}

local mod_config = config.settings_model('mobs_butterfly', {
	butterfly = {
		spawn = {
			enabled = config.types.boolean(true),
			on = config.types.list({"air"}),
			near = config.types.list({"group:flower"}),
			interval = config.types.int(30, { min=1 }),
			chance = config.types.int(300000, { min=1 }),
			min_light = config.types.int(5, { min=0 }),
			max_light = config.types.int(20, { min=0 }),
			min_height = config.types.int(0, { min=-31000, max=31000 }),
			max_height = config.types.int(5000, { min=-31000, max=31000 }),
			active_object_count = config.types.int(1, { min=1 }),
		}
	}
})

-- Butterfly
mobs:register_mob("mobs_butterfly:butterfly", {
	type = "animal",
	passive = true,
	hp_min = 1,
	hp_max = 2,
	armor = 100,
	collisionbox = {-1, -0.3, -1, 1, 0.3, 1},
	visual = "mesh",
	mesh = "mobf_butterfly.x",
	textures = l_skins,
	walk_velocity = 2,
	fall_speed = 0,
	stepheight = 3,
	fly = true,
	water_damage = 1,
	lava_damage = 1,
	light_damage = 0,
	fall_damage = 0,
	view_range = 10,
	animation = {
		speed_normal = 15,	speed_run = 30,
		stand_start = 0,	stand_end = 90,
		walk_start = 0,		walk_end = 90,
	},
	on_rightclick = function(self, clicker)
		mobs:capture_mob(self, clicker, 10, 80, 0, true, "mobs_butterfly:butterfly")
	end
})

if mod_config.butterfly.spawn.enabled then
	--name, nodes, neighbors, min_light, max_light, interval, chance, active_object_count, min_height, max_height
	mobs:spawn_specific(
		"mobs_butterfly:butterfly",
		mod_config.butterfly.spawn.on,
		mod_config.butterfly.spawn.near,
		mod_config.butterfly.spawn.min_light,
		mod_config.butterfly.spawn.max_light,
		mod_config.butterfly.spawn.interval,
		mod_config.butterfly.spawn.chance,
		mod_config.butterfly.spawn.active_object_count,
		mod_config.butterfly.spawn.min_height,
		mod_config.butterfly.spawn.max_height
	)
end

mobs:register_egg("mobs_butterfly:butterfly", "Butterfly", "default_cloud.png", 1)

dofile(minetest.get_modpath(minetest.get_current_modname())..'/test.lua')

