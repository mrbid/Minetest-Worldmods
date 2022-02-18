--Registers a gun \o/
local function register_gun(name, def)
	local udesc
	local bdef

	if def.desc then
		udesc = def.desc
	else
		udesc = xtraores.upper(name).." Gun"
	end

	if tonumber(def.bullet_type) ~= nil then
		bdef = "."..tostring(def.bullet_type)
	else
		bdef = tostring(def.bullet_type)
	end

	minetest.register_tool("xtraores_guns:"..name.."_gun", {
		description = udesc.." | "..tostring(def.damage).." dmg (requires "..bdef.." bullets)",
		inventory_image = "gun_"..name..".png",
		on_use = function(itemstack, user, pointed_thing)
			local inv = user:get_inventory()
			local stack = "xtraores_guns:bullet_"..tostring(def.bullet_type).." 1"
			local pos = user:getpos()
			local dir = user:get_look_dir()
			local yaw = user:get_look_horizontal()
			if inv:contains_item("main", stack) then
				if minetest.global_exists("awards") then
					awards.notify_shot(user)
				end
				inv:remove_item("main", stack)
				if pos and dir and yaw then
					pos.y = pos.y + 1.6
					local obj = minetest.add_entity(pos, "xtraores_guns:"..string.sub(name, 1, 1))
					if obj then
						minetest.sound_play("shot_"..def.sound, {object=obj, gain=0.2})
						obj:setvelocity({x=dir.x * def.speed, y=dir.y * def.speed, z=dir.z * def.speed})
						obj:setacceleration({x=dir.x * -0, y=-0, z=dir.z * -0})
						obj:setyaw(yaw + math.pi)
						local ent = obj:get_luaentity()
						if ent then
							ent.player = ent.player or user:get_player_name()
						end
					end
				end
			else
				minetest.sound_play("empty", {object=user, gain=0.5})
			end
			return itemstack
		end,
	})

	minetest.register_entity("xtraores_guns:"..string.sub(name, 1, 1), {
		physical = false,
		timer = 0,
		visual = "sprite",
		visual_size = {x=def.visual_size, y=def.visual_size,},
		textures = {"shot_"..def.visual_type..".png"},
		lastpos= {},
		collisionbox = {0, 0, 0, 0, 0, 0},
		on_step = function(self, dtime)
			self.timer = self.timer + dtime
			local pos = self.object:getpos()
			local node = minetest.get_node(pos)

			if self.timer > 0.06 then
				local objs = minetest.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 2)
				for k, obj in pairs(objs) do
					if not self.player or not minetest.get_player_by_name(self.player) then
						return
					end
					local player = minetest.get_player_by_name(self.player)
					if obj:get_luaentity() ~= nil then
						if obj:get_luaentity().name ~= "xtraores_guns:"..string.sub(name, 1, 1) and obj:get_luaentity().name ~= "__builtin:item" then
							local damage = def.damage
							obj:punch(player, 1.0, {
								full_punch_interval = 1.0,
								damage_groups= {fleshy = damage},
							}, nil)
							minetest.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
							self.object:remove()
						end
					else
						local damage = def.damage
						obj:punch(player, 1.0, {
							full_punch_interval = 1.0,
							damage_groups= {fleshy = damage},
						}, nil)
						minetest.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
						self.object:remove()
					end
				end
			end

			if self.lastpos.x ~= nil then
				if minetest.registered_nodes[node.name].walkable then
					if not minetest.settings:get_bool("creative_mode") then
						minetest.add_item(self.lastpos, "")
					end
					minetest.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				end
			end

			self.lastpos= {x = pos.x, y = pos.y, z = pos.z}

			if self.timer > 1000 then
				self.object:remove()
			end
		end
	})
end

--[[

How to register a gun:

register_gun("name", {
	description = "string" (optional)
	damage = damage inflicted (number),
	speed = speed of bullet (number),
	bullet_type = type of bullet needed (number or string),
	visual_size = size of bullet entity (number),
	visual_type = texture of bullet entity (string),
	sound = name of sound played on fire (string)
})

]]

--Register the guns
register_gun("titanium", {
	damage = 70,
	speed = 100,
	bullet_type = 308,
	visual_size = 0.075,
	visual_type = "normal",
	sound = "normal",
})

register_gun("precious", {
	damage = 95,
	speed = 100,
	bullet_type = 308,
	visual_size = 0.075,
	visual_type = "normal",
	sound = "normal",
})

register_gun("laser", {
	damage = 200,
	speed = 50,
	bullet_type = "laser",
	visual_size = 0.9,
	visual_type = "laser",
	sound = "laser",
})

register_gun("rainbow", {
	damage = 250,
	speed = 50,
	bullet_type = "laser",
	visual_size = 0.9,
	visual_type = "rainbow",
	sound = "laser",
})

register_gun("deagle", {
	desc = "Desert Eagle",
	damage = 45,
	speed = 100,
	bullet_type = 357,
	visual_size = 0.075,
	visual_type = "normal",
	sound = "normal",
})

--Move guns from xtraores to xtraores_guns
minetest.register_alias("xtraores:titanium_gun", "xtraores_guns:titanium_gun")
minetest.register_alias("xtraores:precious_gun", "xtraores_guns:precious_gun")
minetest.register_alias("xtraores:deagle", "xtraores_guns:deagle_gun")

minetest.register_alias("xtraores_mdwp:laser_riffle", "xtraores_guns:rainbow_gun")
minetest.register_alias("xtraores_mdwp:rainbowgun", "xtraores_guns:laser_gun")

--We don't need these any more
local parts = {
	"barrel",
	"top",
	"bottom",
	"handle",
	"mechanism",
}

for _, name in pairs(parts) do
	minetest.register_alias("xtraores:titanium_"..name, "xtraores:titanium_ingot")
end

minetest.register_alias("xtraores_ext:bullet", "xtraores_guns:bullet_308")
minetest.register_alias("xtraores_ext:riffle", "xtraores_guns:titanium_gun")
minetest.register_alias("xtraores_ext:riffleb", "xtraores_guns:titanium_gun")
minetest.register_alias("xtraores_mdwp:shuriken", "default:steel_ingot")
minetest.register_alias("xtraores:chunai", "default:steel_ingot")


--Let's add new stuff
minetest.register_craftitem("xtraores_guns:mechanism", {
	description = "Gun Mechanism",
	inventory_image = "mech.png",
})

minetest.register_craftitem("xtraores_guns:spring", {
	description = "Spring",
	inventory_image = "spring.png",
})

minetest.register_craftitem("xtraores_guns:latch", {
	description = "Latch",
	inventory_image = "latch.png",
})

minetest.register_craftitem("xtraores_guns:lense", {
	description = "Lense",
	inventory_image = "lense.png",
})

--What can we use for materials?
local metal
local laser_metal
local grip
local power
local sheeting

if minetest.get_modpath("technic") then
	metal = "technic:stainless_steel_ingot"
	grip = "technic:rubber"
	laser_metal = "technic:carbon_steel_ingot"
else
	metal = "default:steel_ingot"
	grip = "wool:black"
	laser_metal = "default:tin_ingot"
end

if minetest.get_modpath("homedecor") then
	power = "homedecor:power_crystal"
	sheeting = "homedecor:plastic_sheeting"
else
	power = "default:mese_block"
	sheeting = "default:steel_ingot"
end

--Register the crafts
minetest.register_craft({
	output = "xtraores_guns:spring 9",
	recipe = {
		{metal, "", metal},
		{"", metal, ""},
		{metal, "", metal},

	}
})

minetest.register_craft({
	output = "xtraores_guns:latch 9",
	recipe = {
		{metal, metal, metal},
		{"", "", metal},
		{"", "", metal},

	}
})

minetest.register_craft({
	output = "xtraores_guns:latch 9",
	recipe = {
		{metal, metal, metal},
		{metal, "", ""},
		{metal, "", ""},

	}
})

minetest.register_craft({
	output = "xtraores_guns:lense 3",
	recipe = {
		{"", "default:glass"},
		{"default:glass", ""},
		{"", "default:glass"},

	}
})

minetest.register_craft({
	output = "xtraores_guns:lense 3",
	recipe = {
		{"default:glass", ""},
		{"", "default:glass"},
		{"default:glass", ""},

	}
})

--Gun crafts because I didn't want to bother adding them to the function
minetest.register_craft({
	output = "xtraores_guns:mechanism",
	recipe = {
		{"xtraores_guns:spring", "xtraores_guns:latch", metal},
		{"", metal, "xtraores_guns:latch"},
		{"", "", "xtraores_guns:spring"},
	}
})

minetest.register_craft({
	output = "xtraores_guns:titanium_gun",
	recipe = {
		{"xtraores:titanium_ingot", "xtraores:titanium_ingot", "xtraores:titanium_ingot"},
		{"", "xtraores_guns:mechanism", grip},
		{"", "", grip},
	}
})

minetest.register_craft({
	output = "xtraores_guns:deagle_gun",
	recipe = {
		{metal, metal, metal},
		{"", "xtraores_guns:mechanism", grip},
		{"", "", grip},

	}
})

minetest.register_craft({
	output = "xtraores_guns:precious_gun",
	recipe = {
		{"xtraores:geminitinum_ingot", "xtraores:geminitinum_ingot", "xtraores:geminitinum_ingot"},
		{"", "xtraores_guns:mechanism", grip},
		{"", "", grip},

	}
})

minetest.register_craft({
	output = "xtraores_guns:laser_gun",
	recipe = {
		{"xtraores_guns:lense", power, laser_metal},
		{"", "xtraores_guns:mechanism", sheeting},
		{"", "", sheeting},

	}
})

minetest.register_craft({
	output = "xtraores_guns:rainbow_gun",
	recipe = {
		{"xtraores_guns:lense", power, "xtraores:geminitinum_ingot"},
		{"", "xtraores_guns:mechanism", sheeting},
		{"", "", sheeting},

	}
})

if minetest.global_exists("awards") then
	awards.register_trigger("shot", {
		type = "counted",
		progress = "@1/@2 shots fired",
		auto_description = { "Shoot a shot", "Shoot @1 times" },
	})

	awards.register_award("xtraores_guns:first_shot",{
		title = "First shot",
		description = "Shoot a shot.",
		icon = "bullet_308.png^awards_level1.png",
		trigger = {
			type = "shot",
			target = 1
		},
		difficulty = 1,
	})

	awards.register_award("xtraores_guns:quick_draw",{
		title = "Quickdraw",
		description = "Shoot 200 shots.",
		icon = "bullet_308.png^awards_level2.png",
		trigger = {
			type = "shot",
			target = 200
		},
		difficulty = 2,
	})

	awards.register_award("xtraores_guns:trigger_happy",{
		title = "Trigger-happy",
		description = "Shoot 500 shots.",
		icon = "bullet_308.png^awards_level3.png",
		trigger = {
			type = "shot",
			target = 500
		},
		difficulty = 3,
	})

	awards.register_award("xtraores_guns:precious",{
		title = "My precious",
		description = "Craft the precious gun.",
		icon = "gun_precious.png",
		trigger = {
			type = "craft",
			item = "xtraores_guns:precious_gun",
			target = 1
		},
	})
end

--Fire at Will!
--*Will ducks*
