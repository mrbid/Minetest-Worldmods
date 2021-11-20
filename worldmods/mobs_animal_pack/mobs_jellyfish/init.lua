if not mobs.mod == "redo" then return end

local mod_config = config.settings_model('mobs_jellyfish', {
	jellyfish = {
		spawn = {
			enabled = config.types.boolean(true),
			on = config.types.list({"default:water_source"}),
			near = config.types.list({"default:water_flowing","default:water_source"}),
			interval = config.types.int(30, { min=1 }),
			chance = config.types.int(300000, { min=1 }),
			min_light = config.types.int(1, { min=0 }),
			max_light = config.types.int(14, { min=0 }),
			min_height = config.types.int(-50, { min=-31000, max=31000 }),
			max_height = config.types.int(-1, { min=-31000, max=31000 }),
			active_object_count = config.types.int(1, { min=1 }),
		}
	}
})

mobs:register_mob("mobs_jellyfish:jellyfish", {
	lifetimer = 0,  -- doesn't despawn
	type = "animal",
	attack_type = "dogfight",
	damage = 5,
	reach = 1,
	hp_min = 5,
	hp_max = 10,
	armor = 100,
	collisionbox = {-0.25, -0.25, -0.25, 0.25, 0.25, 0.25},
	visual = "mesh",
	mesh = "jellyfish.b3d",
	textures = {
		{"jellyfish.png"},
		{"jellyfish.png^[colorize:black:150"},
		{"jellyfish.png^[colorize:red:150"},
		{"jellyfish.png^[colorize:violet:150"},
	},
	makes_footstep_sound = false,
	walk_velocity = 0.1,
	run_velocity = 0.1,
	fly = true,
	fly_in = "default:water_source",
	fall_speed = 0,
	view_range = 10,
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	on_rightclick = function(self, clicker)
		mobs:capture_mob(self, clicker, 80, 100, 0, true, "mobs_jellyfish:jellyfish")
	end
})

if mod_config.jellyfish.spawn.enabled then
	--name, nodes, neighbours, minlight, maxlight, interval, chance, active_object_count, min_height, max_height
	mobs:spawn_specific(
		"mobs_jellyfish:jellyfish",
		mod_config.jellyfish.spawn.on,
		mod_config.jellyfish.spawn.near,
		mod_config.jellyfish.spawn.min_light,
		mod_config.jellyfish.spawn.max_light,
		mod_config.jellyfish.spawn.interval,
		mod_config.jellyfish.spawn.chance,
		mod_config.jellyfish.spawn.active_object_count,
		mod_config.jellyfish.spawn.min_height,
		mod_config.jellyfish.spawn.max_height
	)
end

mobs:register_egg("mobs_jellyfish:jellyfish", "Jellyfish", "jellyfish_inv.png", 0)

dofile(minetest.get_modpath(minetest.get_current_modname())..'/test.lua')

