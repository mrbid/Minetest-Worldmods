
local S = mobs.intllib

mobs.npc_drops = {
	"ethereal:sushi_kappamaki",
	"cucina_vegana:vegan_sushi",
	"farming:cookie",
	"hawk:sick_cookie",
	"hawk:mystery_cookie",
	"farming:jaffa_cake",
	"pumpkinspice:pumpkinspice_cookie",
	"foody:coffeecake_muffin",
	"foody:chocolate_muffin",
	"foody:orange_raspberry_muffin",
	"foody:strawberry_muffin",
	"foody:chocolate_banana_muffin",
	"foody:diamond_donut",
	"farming:donut_apple",
	"drinks:jcu_peach",
	"drinks:jcu_raspberries",
	"drinks:jcu_melon",
	"drinks:jcu_blueberries",
	"drinks:jcu_coconut",
	"drinks:jcu_banana",
	"drinks:jcu_rhubarb",
	"drinks:jcu_strawberry",
	"drinks:jcu_plum",
	"pumpkinspice:pumpkinspie_latte",
	"farming:donut_chocolate",
	"farming:chocolate_dark",
	"farming:muffin_blueberry",
	"petz:blueberry_muffin",
	"hawk:space_carrot",
	"hawk:chocolate_eclair",
	"petz:poop",
}

mobs:register_mob("mobs_maidroid:maidroid", {
	type = "maidroid",
	passive = false,
	damage = 9,
	attack_type = "dogfight",
	attacks_monsters = true,
	attack_npcs = false,
	owner_loyal = true,
	pathfinding = true,
	hp_min = 1,
	hp_max = 2,
	armor = 100,
	collisionbox = {-0.35,-0.5,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "maidroid.b3d",
	drawtype = "front",
	visual_size = {x=10, y=10},
	textures = {
		{"maidroid_maidroid_mk1.png"},
		{"maidroid_maidroid_mk2.png"},
		{"maidroid_maidroid_mk3.png"},
		{"maidroid_maidroid_mk4.png"},
		{"maidroid_maidroid_mk5.png"},
		{"maidroid_maidroid_mk6.png"},
		{"maidroid_maidroid_mk7.png"},
		{"maidroid_maidroid_mk8.png"},
		{"maidroid_maidroid_mk9.png"},
		{"maidroid_maidroid_mk10.png"},
		{"maidroid_maidroid_mk11.png"},
		{"maidroid_maidroid_mk12.png"},
		{"maidroid_maidroid_mk13.png"},
		{"maidroid_maidroid_mk14.png"},
		{"maidroid_maidroid_mk15.png"},
	},
	child_texture = {
		{"maidroid_maidroid_mk9.png"}
	},
	makes_footstep_sound = true,
	sounds = {},
	walk_velocity = 3,
	run_velocity = 4,
	jump = true,
	drops = {
		{name = "ethereal:sushi_kappamaki", chance = 1, min = 1, max = 3},
		{name = "maptools:silver_coin", chance = 1, min = 1, max = 3},
		{name = "farming:cookie", chance = 2, min = 1, max = 2},
		{name = "petz:poop", chance = 5, min = 1, max = 1},
		{name = "farming:cookie", chance = 2, min = 1, max = 2},
	},
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	follow = {
		"farming:bread",
		"mobs:meat",
		"default:diamond",
		"ethereal:sushi_kappamaki",
		"farming:cookie"
	},
	view_range = 15,
	owner = "",
	order = "follow",
	fear_height = 3,
	animation = {
		speed_normal = 30,
		speed_run = 30,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 200,
		punch_end = 219
	},

	on_rightclick = function(self, clicker)

		-- feed to heal npc
		if mobs:feed_tame(self, clicker, 8, true, true) then return end

		-- capture npc with net or lasso
		if mobs:capture_mob(self, clicker, nil, 5, 80, false, nil) then return end

		-- protect npc with mobs:protector
		if mobs:protect(self, clicker) then return end

		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()

		-- right clicking with gold lump drops random item from mobs.npc_drops
		if item:get_name() == "currency:minegeld_cent_5" then

			if not mobs.is_creative(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end

			local pos = self.object:get_pos()

			pos.y = pos.y + 0.5

			local drops = self.npc_drops or mobs.npc_drops
			local drop = drops[math.random(#drops)]
			local chance = 1

			if type(drop) == "table" then
				chance = drop[2]
				drop = drop[1]
			end

			minetest.add_item(pos, {name = drop})

			minetest.chat_send_player(name, S("Maidroid dropped you an item for 5 cent!"))

			return
		end

		-- by right-clicking owner can switch npc between follow and stand
		if self.owner and self.owner == name then

			if self.order == "follow" then

				self.attack = nil
				self.order = "stand"
				self.state = "stand"
				self:set_animation("stand")
				self:set_velocity(0)

				minetest.chat_send_player(name, S("Maidroid stands still."))
			else
				self.order = "follow"

				minetest.chat_send_player(name, S("Maidroid will follow you."))
			end
		end
	end,
})

if not mobs.custom_spawn_npc then
mobs:spawn({
	name = "mobs_maidroid:maidroid",
	nodes = {"default:tree"},
	neighbors = {"default:grass_3"},
	min_light = 10,
	chance = 10000,
	active_object_count = 1,
	min_height = 0,
	day_toggle = true
})
end

mobs:register_egg("mobs_maidroid:maidroid", S("Maidroid"), "maidroid_egg.png", 1)

-- compatibility
mobs:alias_mob("mobs:maidroid", "mobs_maidroid:maidroid")

--
--	MAIDROID_MINI
--

mobs:register_mob("mobs_maidroid:maidroid_mini", {
	type = "maidroid_mini",
	passive = false,
	damage = 9,
	attack_type = "dogfight",
	attacks_monsters = true,
	attack_npcs = false,
	owner_loyal = true,
	pathfinding = true,
	hp_min = 1,
	hp_max = 2,
	armor = 100,
	collisionbox = {-0.035,-.1,-0.035, 0.035,0.08,0.035},
	visual = "mesh",
	mesh = "maidroid.b3d",
	drawtype = "front",
	textures = {
		{"maidroid_maidroid_mk1.png"},
		{"maidroid_maidroid_mk2.png"},
		{"maidroid_maidroid_mk3.png"},
		{"maidroid_maidroid_mk4.png"},
		{"maidroid_maidroid_mk5.png"},
		{"maidroid_maidroid_mk6.png"},
		{"maidroid_maidroid_mk7.png"},
		{"maidroid_maidroid_mk8.png"},
		{"maidroid_maidroid_mk9.png"},
		{"maidroid_maidroid_mk10.png"},
		{"maidroid_maidroid_mk11.png"},
		{"maidroid_maidroid_mk12.png"},
		{"maidroid_maidroid_mk13.png"},
		{"maidroid_maidroid_mk14.png"},
		{"maidroid_maidroid_mk15.png"},
	},
	child_texture = {
		{"maidroid_maidroid_mk9.png"}
	},
	makes_footstep_sound = true,
	sounds = {},
	walk_velocity = 0.2,
	run_velocity = 0.3,
	jump = true,
	drops = {
		{name = "ethereal:sushi_kappamaki", chance = 1, min = 1, max = 3},
		{name = "maptools:silver_coin", chance = 1, min = 1, max = 3},
		{name = "farming:cookie", chance = 2, min = 1, max = 2},
		{name = "petz:poop", chance = 5, min = 1, max = 1},
		{name = "farming:cookie", chance = 2, min = 1, max = 2},
	},
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	follow = {
		"farming:bread",
		"mobs:meat",
		"default:diamond",
		"ethereal:sushi_kappamaki",
		"farming:cookie"
	},
	view_range = 15,
	owner = "",
	order = "follow",
	fear_height = 3,
	animation = {
		speed_normal = 30,
		speed_run = 30,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 200,
		punch_end = 219
	},

	on_rightclick = function(self, clicker)

		-- feed to heal npc
		if mobs:feed_tame(self, clicker, 8, true, true) then return end

		-- capture npc with net or lasso
		if mobs:capture_mob(self, clicker, nil, 5, 80, false, nil) then return end

		-- protect npc with mobs:protector
		if mobs:protect(self, clicker) then return end

		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()

		-- right clicking with gold lump drops random item from mobs.npc_drops
		if item:get_name() == "currency:minegeld_cent_5" then

			if not mobs.is_creative(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end

			local pos = self.object:get_pos()

			pos.y = pos.y + 0.5

			local drops = self.npc_drops or mobs.npc_drops
			local drop = drops[math.random(#drops)]
			local chance = 1

			if type(drop) == "table" then
				chance = drop[2]
				drop = drop[1]
			end

			minetest.add_item(pos, {name = drop})

			minetest.chat_send_player(name, S("Maidroid dropped you an item for 5 cent!"))

			return
		end

		-- by right-clicking owner can switch npc between follow and stand
		if self.owner and self.owner == name then

			if self.order == "follow" then

				self.attack = nil
				self.order = "stand"
				self.state = "stand"
				self:set_animation("stand")
				self:set_velocity(0)

				minetest.chat_send_player(name, S("Maidroid stands still."))
			else
				self.order = "follow"

				minetest.chat_send_player(name, S("Maidroid will follow you."))
			end
		end
	end,
})

if not mobs.custom_spawn_npc then
mobs:spawn({
	name = "mobs_maidroid:maidroid_mini",
	nodes = {"default:stone"},
	neighbors = {"default:grass_3"},
	min_light = 10,
	chance = 10000,
	active_object_count = 1,
	min_height = 0,
	day_toggle = true
})
end

mobs:register_egg("mobs_maidroid:maidroid_mini", S("Maidroid Mini"), "maidroidmini_egg.png", 1)

-- compatibility
mobs:alias_mob("mobs:maidroid_mini", "mobs_maidroid:maidroid_mini")
