cores={"astonmaaton","nizzan","nizzan2","lambogoni","lambogoni2","masda","masda2","musting","musting2","fewawi","fewawi2"
,"pooshe","pooshe2"}

-- Load support for intllib.
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

vehicles = {}

dofile(minetest.get_modpath("vehicles").."/api.lua")

--very laggy and buggy flight
-- minetest.register_globalstep(function(dtime)
	-- for _, player in ipairs(minetest.get_connected_players()) do
		-- local dir = player:get_look_dir();
		-- local pos = player:getpos();
		-- local ctrl = player:get_player_control();
		-- local pos1 = {x=pos.x+dir.x*1,y=pos.y+dir.y*1,z=pos.z+dir.z*1}
		-- if ctrl.up == true then
		-- player:moveto(pos1, false)
		-- else
		-- end
	-- end
-- end)

local step = 1.1

minetest.register_entity("supercharger:astonmaaton_charged", {
	visual = "mesh",
	mesh = "astonmaaton.b3d",
	textures = {"vehicles_astonmaaton.png"},
	velocity = 23,
	acceleration = -2,
	stepheight = step,
	hp_max = 200,
	physical = true,
	collisionbox = {-1, 0, -1, 1.3, 1, 1},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		minetest.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		minetest.after(14, function()
		self.sound_ready = true
		end)
		end
	end,
	on_punch = vehicles.on_punch,
	on_activate = function(self)
	self.nitro = true
	end,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 23, 
			decell = 0.99,
			boost = true,
			boost_duration = 5,
			boost_effect = "vehicles_nitro.png",
			driving_sound = "engine_charged",
			sound_duration = 11,
			brakes = true,
		})
	end,
})

vehicles.register_spawner("supercharger:astonmaaton_charged", S("Supercharged Aston Maaton (white)"), "vehicles_astonmaaton_inv.png")

minetest.register_entity("supercharger:nizzan_charged", {
	visual = "mesh",
	mesh = "nizzan.b3d",
	textures = {"vehicles_nizzan.png"},
	velocity = 24,
	acceleration = -2,
	stepheight = step,
	hp_max = 200,
	physical = true,
	collisionbox = {-1, 0, -1, 1.3, 1, 1},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		minetest.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		minetest.after(14, function()
		self.sound_ready = true
		end)
		end
	end,
	on_punch = vehicles.on_punch,
	on_activate = function(self)
		self.nitro = true
	end,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 22, 
			decell = 0.99,
			boost = true,
			boost_duration = 5,
			boost_effect = "vehicles_nitro.png",
			driving_sound = "engine_charged",
			sound_duration = 11,
			brakes = true,
		},
		function()
			local pos = self.object:getpos()
			minetest.add_particlespawner(
				15, --amount
				1, --time
				{x=pos.x, y=pos.y, z=pos.z}, --minpos
				{x=pos.x, y=pos.y, z=pos.z}, --maxpos
				{x=0, y=0, z=0}, --minvel
				{x=0, y=0, z=0}, --maxvel
				{x=-0,y=-0,z=-0}, --minacc
				{x=0,y=0,z=0}, --maxacc
				0.5, --minexptime
				1, --maxexptime
				10, --minsize
				15, --maxsize
				false, --collisiondetection
				"vehicles_dust.png" --texture
			)
		end)
	end,
})

vehicles.register_spawner("supercharger:nizzan_charged", S("Supercharged Nizzan (brown)"), "vehicles_nizzan_inv.png")

minetest.register_entity("supercharger:nizzan2_charged", {
	visual = "mesh",
	mesh = "nizzan.b3d",
	textures = {"vehicles_nizzan2.png"},
	velocity = 24,
	acceleration = -2,
	stepheight = step,
	hp_max = 200,
	physical = true,
	collisionbox = {-1, 0, -1, 1.3, 1, 1},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		minetest.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		minetest.after(14, function()
		self.sound_ready = true
		end)
		end
	end,
	on_activate = function(self)
		self.nitro = true
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 22, 
			decell = 0.99,
			boost = true,
			boost_duration = 5,
			boost_effect = "vehicles_nitro.png",
			driving_sound = "engine_charged",
			sound_duration = 11,
			brakes = true,
		},
		function()
			local pos = self.object:getpos()
			minetest.add_particlespawner(
				15, --amount
				1, --time
				{x=pos.x, y=pos.y, z=pos.z}, --minpos
				{x=pos.x, y=pos.y, z=pos.z}, --maxpos
				{x=0, y=0, z=0}, --minvel
				{x=0, y=0, z=0}, --maxvel
				{x=-0,y=-0,z=-0}, --minacc
				{x=0,y=0,z=0}, --maxacc
				0.2, --minexptime
				0.5, --maxexptime
				20, --minsize
				25, --maxsize
				false, --collisiondetection
				"vehicles_dust.png" --texture
			)
		end)
	end,
})

vehicles.register_spawner("supercharger:nizzan2_charged", S("Supercharged Nizzan (green)"), "vehicles_nizzan_inv2.png")

minetest.register_entity("supercharger:lambogoni_charged", {
	visual = "mesh",
	mesh = "lambogoni.b3d",
	textures = {"vehicles_lambogoni.png"},
	velocity = 23,
	acceleration = -2,
	stepheight = step,
	hp_max = 200,
	physical = true,
	collisionbox = {-1, 0, -1, 1.3, 1, 1},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		minetest.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		minetest.after(14, function()
		self.sound_ready = true
		end)
		end
	end,
	on_punch = vehicles.on_punch,
	on_activate = function(self)
		self.nitro = true
	end,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 23, 
			decell = 0.99,
			boost = true,
			boost_duration = 4,
			boost_effect = "vehicles_nitro.png",
			driving_sound = "engine_charged",
			sound_duration = 11,
			brakes = true,
		})
	end,
})

vehicles.register_spawner("supercharger:lambogoni_charged", S("Supercharged Lambogoni (grey)"), "vehicles_lambogoni_inv.png")

minetest.register_entity("supercharger:lambogoni2_charged", {
	visual = "mesh",
	mesh = "lambogoni.b3d",
	textures = {"vehicles_lambogoni2.png"},
	velocity = 23,
	acceleration = -2,
	stepheight = step,
	hp_max = 200,
	physical = true,
	collisionbox = {-1, 0, -1, 1.3, 1, 1},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		minetest.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		minetest.after(14, function()
		self.sound_ready = true
		end)
		end
	end,
	on_punch = vehicles.on_punch,
	on_activate = function(self)
		self.nitro = true
	end,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 23, 
			decell = 0.99,
			boost = true,
			boost_duration = 4,
			boost_effect = "vehicles_nitro.png",
			driving_sound = "engine_charged",
			sound_duration = 11,
			brakes = true,
		})
	end,
})

vehicles.register_spawner("supercharger:lambogoni2_charged", S("Supercharged Lambogoni (yellow)"), "vehicles_lambogoni2_inv.png")

minetest.register_entity("supercharger:masda_charged", {
	visual = "mesh",
	mesh = "masda.b3d",
	textures = {"vehicles_masda.png"},
	velocity = 25,
	acceleration = -2,
	stepheight = step,
	hp_max = 200,
	physical = true,
	collisionbox = {-1, 0, -1, 1.3, 1, 1},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		minetest.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		minetest.after(14, function()
		self.sound_ready = true
		end)
		end
	end,
	on_punch = vehicles.on_punch,
	on_activate = function(self)
		self.nitro = true
	end,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 25, 
			decell = 0.99,
			boost = true,
			boost_duration = 4,
			boost_effect = "vehicles_nitro.png",
			driving_sound = "engine_charged",
			sound_duration = 11,
			brakes = true,
		})
	end,
})

vehicles.register_spawner("supercharger:masda_charged", S("Supercharged Masda (pink)"), "vehicles_masda_inv.png")

minetest.register_entity("supercharger:masda2_charged", {
	visual = "mesh",
	mesh = "masda.b3d",
	textures = {"vehicles_masda2.png"},
	velocity = 19,
	acceleration = -2,
	stepheight = step,
	hp_max = 200,
	physical = true,
	collisionbox = {-1, 0, -1, 1.3, 1, 1},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		minetest.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		minetest.after(14, function()
		self.sound_ready = true
		end)
		end
	end,
	on_activate = function(self)
		self.nitro = true
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 25, 
			decell = 0.99,
			boost = true,
			boost_duration = 4,
			boost_effect = "vehicles_nitro.png",
			driving_sound = "engine_charged",
			sound_duration = 11,
			brakes = true,
		})
	end,
})

vehicles.register_spawner("supercharger:masda2_charged", S("Supercharged Masda (orange)"), "vehicles_masda_inv2.png")

minetest.register_entity("supercharger:musting_charged", {
	visual = "mesh",
	mesh = "musting.b3d",
	textures = {"vehicles_musting.png"},
	velocity = 19,
	acceleration = -2,
	stepheight = step,
	hp_max = 200,
	physical = true,
	collisionbox = {-1, 0, -1, 1.3, 1, 1},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		minetest.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		minetest.after(14, function()
		self.sound_ready = true
		end)
		end
	end,
	on_activate = function(self)
		self.nitro = true
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 21, 
			decell = 0.99,
			boost = true,
			boost_duration = 4,
			boost_effect = "vehicles_nitro.png",
			driving_sound = "engine_charged",
			sound_duration = 11,
			brakes = true,
		})
	end,
})

vehicles.register_spawner("supercharger:musting_charged", S("Supercharged Musting (purple)"), "vehicles_musting_inv2.png")

minetest.register_entity("supercharger:musting2_charged", {
	visual = "mesh",
	mesh = "musting.b3d",
	textures = {"vehicles_musting2.png"},
	velocity = 19,
	acceleration = -2,
	stepheight = step,
	hp_max = 200,
	physical = true,
	collisionbox = {-1, 0, -1, 1.3, 1, 1},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		minetest.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		minetest.after(14, function()
		self.sound_ready = true
		end)
		end
	end,
	on_punch = vehicles.on_punch,
	on_activate = function(self)
		self.nitro = true
	end,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 21, 
			decell = 0.99,
			boost = true,
			boost_duration = 4,
			boost_effect = "vehicles_nitro.png",
			driving_sound = "engine_charged",
			sound_duration = 11,
			brakes = true,
		})
	end,
})

vehicles.register_spawner("supercharger:musting2_charged", S("Supercharged Musting (white)"), "vehicles_musting_inv.png")

minetest.register_entity("supercharger:fewawi_charged", {
	visual = "mesh",
	mesh = "fewawi.b3d",
	textures = {"vehicles_fewawi.png"},
	velocity = 19,
	acceleration = -2,
	stepheight = step,
	hp_max = 200,
	physical = true,
	collisionbox = {-1, 0, -1, 1.3, 1, 1},
	on_rightclick = function(self, clicker)
		local ctrl = clicker:get_player_control()
		if ctrl.sneak then
		if not self.lights then
		self.object:set_properties({textures = {"vehicles_fewawi_lights.png"},})
		self.lights = true
		else
		self.object:set_properties({textures = {"vehicles_fewawi.png"},})
		self.lights = false		
		end
		else
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		minetest.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		minetest.after(14, function()
		self.sound_ready = true
		end)
		end
		end
	end,
	on_punch = vehicles.on_punch,
	on_activate = function(self)
		self.nitro = true
	end,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 24, 
			decell = 0.99,
			boost = true,
			boost_duration = 4,
			boost_effect = "vehicles_nitro.png",
			driving_sound = "engine_charged",
			sound_duration = 11,
			brakes = true,
		})
	end,
})

vehicles.register_spawner("supercharger:fewawi_charged", S("Supercharged Fewawi (red)"), "vehicles_fewawi_inv.png")

minetest.register_entity("supercharger:fewawi2_charged", {
	visual = "mesh",
	mesh = "fewawi.b3d",
	textures = {"vehicles_fewawi2.png"},
	velocity = 19,
	acceleration = -2,
	stepheight = step,
	hp_max = 200,
	physical = true,
	collisionbox = {-1, 0, -1, 1.3, 1, 1},
	on_rightclick = function(self, clicker)
		local ctrl = clicker:get_player_control()
		if ctrl.sneak then
		if not self.lights then
		self.object:set_properties({textures = {"vehicles_fewawi_lights2.png"},})
		self.lights = true
		else
		self.object:set_properties({textures = {"vehicles_fewawi2.png"},})
		self.lights = false
		end
		else
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		minetest.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		minetest.after(14, function()
		self.sound_ready = true
		end)
		end
		end
	end,
	on_punch = vehicles.on_punch,
	on_activate = function(self)
		self.nitro = true
	end,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 24, 
			decell = 0.99,
			boost = true,
			boost_duration = 4,
			boost_effect = "vehicles_nitro.png",
			driving_sound = "engine_charged",
			sound_duration = 11,
			brakes = true,
		})
	end,
})

vehicles.register_spawner("supercharger:fewawi2_charged", S("Supercharged Fewawi (blue)"), "vehicles_fewawi_inv2.png")

minetest.register_entity("supercharger:pooshe_charged", {
	visual = "mesh",
	mesh = "pooshe.b3d",
	textures = {"vehicles_pooshe.png"},
	velocity = 19,
	acceleration = -2,
	stepheight = step,
	hp_max = 200,
	physical = true,
	collisionbox = {-1, 0, -1, 1.3, 1, 1},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		minetest.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		minetest.after(14, function()
		self.sound_ready = true
		end)
		end
	end,
	on_activate = function(self)
		self.nitro = true
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 19, 
			decell = 0.99,
			boost = true,
			boost_duration = 4,
			boost_effect = "vehicles_nitro.png",
			driving_sound = "engine_charged",
			sound_duration = 11,
			brakes = true,
		})
	end,
})

vehicles.register_spawner("supercharger:pooshe_charged", S("Supercharged Pooshe (red)"), "vehicles_pooshe_inv.png")

minetest.register_entity("supercharger:pooshe2_charged", {
	visual = "mesh",
	mesh = "pooshe.b3d",
	textures = {"vehicles_pooshe2.png"},
	velocity = 19,
	acceleration = -2,
	stepheight = step,
	hp_max = 200,
	physical = true,
	collisionbox = {-1, 0, -1, 1.3, 1, 1},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		minetest.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		minetest.after(14, function()
		self.sound_ready = true
		end)
		end
	end,
	on_punch = vehicles.on_punch,
	on_activate = function(self)
		self.nitro = true
	end,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 24, 
			decell = 0.99,
			boost = true,
			boost_duration = 4,
			boost_effect = "vehicles_nitro.png",
			driving_sound = "engine_charged",
			sound_duration = 11,
			brakes = true,
		})
	end,
})

vehicles.register_spawner("supercharger:pooshe2_charged", S("Supercharged Pooshe (yellow)"), "vehicles_pooshe_inv2.png")

--crafting recipes and materials

for n,cor in ipairs(cores) do

minetest.register_craft({
	output = "supercharger:"..cor.."_charged_spawner",
	recipe = {
		{"", "", ""},
		{"", "vehicles:"..cor.."_spawner", ""},
		{"", "", "supercharger:supercharger"}
	}
})
end
