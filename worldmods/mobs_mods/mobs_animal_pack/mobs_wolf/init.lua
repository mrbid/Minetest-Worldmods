if not mobs.mod == "redo" then return end

local mod_config = config.settings_model('mobs_wolf', {
	wolf = {
		spawn = {
			enabled = config.types.boolean(true),
			on = config.types.list({
				"default:dirt_with_grass",
				"default:dirt_with_snow",
				"default:dirt_with_coniferous_litter",
				"ethereal:green_dirt_top",
			}),
			near = config.types.list({ "air" }),
			interval = config.types.int(30, { min=1 }),
			chance = config.types.int(300000, { min=1 }),
			min_light = config.types.int(10, { min=0 }),
			max_light = config.types.int(15, { min=0 }),
			min_height = config.types.int(-4, { min=-31000, max=31000 }),
			max_height = config.types.int(5000, { min=-31000, max=31000 }),
			active_object_count = config.types.int(1, { min=1 }),
		}
	}
})

mobs:register_mob("mobs_wolf:wolf", {
	type = "animal",
	visual = "mesh",
	mesh = "mobs_wolf.x",
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1, 0.4},
	animation = {
		speed_normal = 20,	speed_run = 30,
		stand_start = 10,	stand_end = 20,
		walk_start = 75,	walk_end = 100,
		run_start = 100,	run_end = 130,
		punch_start = 135,	punch_end = 155,
	},
	textures = {
		{"mobs_wolf.png"},
	},
	fear_height = 2,
	runaway = false,
	jump = true,
	jump_height = 4,
	fly = false,
	walk_chance = 75,
	walk_velocity = 2,
	run_velocity = 3,
	view_range = 7,
	passive = false,
	attack_type = "dogfight",
	damage = 2,
	reach = 2,
	attacks_monsters = false,
	pathfinding = true,
	group_attack = true,
	hp_min = 4,
	hp_max = 6,
	armor = 200,
	knock_back = 2,
	lava_damage = 5,
	fall_damage = 4,
	makes_footstep_sound = true,
	sounds = {
		war_cry = "mobs_wolf_attack"
	},
	follow = {"mobs:meat_raw"},
	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 6, false, true) then
			if self.food == 0 then
				local mob = minetest.add_entity(self.object:getpos(), "mobs_wolf:dog")
				local ent = mob:get_luaentity()
				ent.owner = clicker:get_player_name()
				ent.following = clicker
				ent.order = "follow"
				self.object:remove()
			end
			return
		end
	end
})

if mod_config.wolf.spawn.enabled then
	mobs:spawn_specific(
		"mobs_wolf:wolf",
		mod_config.wolf.spawn.on,
		mod_config.wolf.spawn.near,
		mod_config.wolf.spawn.min_light,
		mod_config.wolf.spawn.max_light,
		mod_config.wolf.spawn.interval,
		mod_config.wolf.spawn.chance,
		mod_config.wolf.spawn.active_object_count,
		mod_config.wolf.spawn.min_height,
		mod_config.wolf.spawn.max_height,
		true
	)
end

mobs:register_egg("mobs_wolf:wolf", "Wolf", "wool_grey.png", 1)

-- Dog
mobs:register_mob("mobs_wolf:dog", {
	type = "animal",
	visual = "mesh",
	mesh = "mobs_wolf.x",
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1, 0.4},
	animation = {
		speed_normal = 20,	speed_run = 30,
		stand_start = 10,	stand_end = 20,
		walk_start = 75,	walk_end = 100,
		run_start = 100,	run_end = 130,
		punch_start = 135,	punch_end = 155,
	},
	textures = {
		{"mobs_dog.png"},
		{"mobs_medved.png"}
	},
	fear_height = 2,
	runaway = false,
	jump = true,
	jump_height = 4,
	fly = false,
	walk_chance = 75,
	walk_velocity = 2,
	run_velocity = 4,
	view_range = 15,
	passive = false,
	attack_type = "dogfight",
	damage = 2,
	reach = 2,
	attacks_monsters = true,
	pathfinding = true,
	group_attack = true,
	hp_min = 5,
	hp_max = 7,
	armor = 200,
	knock_back = 2,
	lava_damage = 5,
	fall_damage = 5,
	water_damage = 1,
	makes_footstep_sound = true,
	sounds = {
		war_cry = "mobs_wolf_attack"
	},
	follow = {"mobs:meat_raw"},
	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 6, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 0, 80, false, nil) then return end

		if clicker:get_wielded_item():is_empty() and clicker:get_player_name() == self.owner then
			if clicker:get_player_control().sneak then
				self.order = ""
				self.state = "walk"
				self.walk_velocity = 2
				self.stepheight = 0.6
			else
				if self.order == "follow" then
					self.order = "stand"
					self.state = "stand"
					self.walk_velocity = 2
					self.stepheight = 0.6
				else
					self.order = "follow"
					self.state = "walk"
					self.walk_velocity = 3
					self.stepheight = 1.1
				end
			end
			return
		end
	end
})

mobs:register_egg("mobs_wolf:dog", "Dog", "wool_brown.png", 1)

dofile(minetest.get_modpath(minetest.get_current_modname())..'/test.lua')

