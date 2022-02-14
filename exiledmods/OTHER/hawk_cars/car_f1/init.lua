--
-- Parameters
--

local MAX_SPEED_FORWARD = 130
local MAX_SPEED_REVERSE = 20
local ACCELERATION = 8
local BRAKING = 4
local TURN_SPEED = 2
local RETARDATION = 0.05

--
-- Helper functions and variables
--

local function get_sign(i)
	if i == 0 then
		return 0
	else
		return i/math.abs(i)
	end
end

local function get_velocity(v, yaw, y, r, f)
	local x = (math.cos(yaw) + math.abs(r)*math.cos(yaw+r*math.rad(105))*f)*v
	local z = (math.sin(yaw) + math.abs(r)*math.sin(yaw+r*math.rad(105))*f)*v
	return {x=x, y=y, z=z}
end

local function get_v(v)
	return math.sqrt(v.x^2+v.z^2)
end

local function round(number, decimal)
	local multiplier = 10^(decimal or 0)
	return math.floor(number*multiplier+0.5)/multiplier
end

local ml = 0

--
-- Car entity
--

local car_f1 = {
	physical = true,
	collisionbox = {-1/2, -1/2, -1/2, 1/2, 1/2, 1/2},
	visual = "mesh",
	visual_size = {x=2, y=2},
	mesh = "hawk_f1.x",
	textures = {"car_f11.png"},	
	driver = nil,
	v = 0,
	timer = 0,
	mouselook = 1
}

function car_f1:on_rightclick(clicker)
	if not clicker or not clicker:is_player() then
		return
	end
	if self.driver and clicker == self.driver then
		self.driver = nil
		clicker:set_detach()
		clicker:set_properties({
			visual_size = {x = 1, y = 1},
			makes_footstep_sound = true,
			collisionbox = {-0.3, 0.0, -0.3, 0.3, 1.7, 0.3}
		})
	elseif not self.driver then
		self.driver = clicker
		clicker:set_attach(self.object, "", {x=0,y=1,z=0}, {x=0,y=90,z=0})
		clicker:set_properties({
			visual_size = {x = 0, y = 0},
			makes_footstep_sound = false,
			collisionbox = {0}
		})
		self.object:setyaw(clicker:get_look_yaw())
	end
end

function car_f1:on_activate(staticdata, dtime_s)
	self.object:set_armor_groups({immortal = 1})
	if staticdata then
		self.v = tonumber(staticdata)
	end
end

function car_f1:get_staticdata()
	return tostring(v)
end

function car_f1:on_punch(puncher, time_from_last_punch, tool_capabilities, direction)
	self.object:remove()
	if puncher and puncher:is_player() then
		puncher:get_inventory():add_item("main", "car_f1:car_f1")
	end
end

function car_f1:on_step(dtime)

-- Acelerating, braking, rotating and skidding
	self.v = get_v(self.object:getvelocity())*get_sign(self.v)
	self.timer = self.timer + dtime
	if self.timer > 1 then
		self.timer = 0
		ml = 0
        end
	r = 0
	if self.driver then
		local ctrl = self.driver:get_player_control()
		if ctrl == nil then return end
		if ctrl.up then
			if get_sign(self.v) >= 0 then
				self.v = self.v+ACCELERATION/10
			else
				self.v = self.v+BRAKING/10
			end
		end
		if ctrl.down then
			if get_sign(self.v) < 0 then
				self.v = self.v-ACCELERATION/10
			else
				self.v = self.v-BRAKING/10
			end
		end
		if ctrl.left then
			self.object:setyaw(self.object:getyaw()+get_sign(self.v)*math.rad(1+dtime)*TURN_SPEED)
			r = -1
			f = f+0.01
		end
		if ctrl.right then
			self.object:setyaw(self.object:getyaw()-get_sign(self.v)*math.rad(1+dtime)*TURN_SPEED)
			r = 1
			f = f+0.01
		end
		if not (ctrl.up or ctrl.down) then
			f = f-0.02
		end
		if (ctrl.jump and ml == 0) then
			self.mouselook = -self.mouselook
			ml = 1
		end
		if self.mouselook == -1 then
			self.driver:set_look_yaw(self.object:getyaw()-math.pi/2)
		end
	end
	if f == nil or f < 0 then
		f = 0
	elseif f > 0.5 then
		f = 0.5
	end

-- Moving
	local p = self.object:getpos()
	local a = self.object:getyaw()
	local nx = p.x+math.cos(a)*get_sign(self.v)
	local nz = p.z+math.sin(a)*get_sign(self.v)
	local n1 = minetest.env:get_node({x=nx, y=p.y-1/2, z=nz})
	local n2 = minetest.env:get_node({x=nx, y=p.y+1/2, z=nz})

	if (string.find(n1.name, "_three_quarter") ~= nil) and n2.name == "air" then
		p.y = p.y + 1/2
	elseif ((string.find(n1.name, "slab_") ~= nil) and (string.find(n1.name, "_quarter") == nil)) and n2.name == "air" then
		p.y = p.y + 3/8
	elseif ((string.find(n1.name, "_quarter") ~= nil) and (string.find(n1.name, "_three_quarter") == nil)) and n2.name == "air" then
		p.y = p.y + 1/4
	elseif n1.name ~= "air" and minetest.registered_nodes[n1.name].walkable and n2.name == "air" then
		p.y = p.y + 5/8
	end

-- Retardation on different surfaces
	local nn = minetest.env:get_node({x=p.x, y=p.y-1, z=p.z}).name
	local s = get_sign(self.v)
	local m

	if minetest.get_item_group(nn, "cracky") ~= 0 then
		m = 1
	elseif minetest.get_item_group(nn, "crumbly") ~= 0 then
		m = 10
	else 
		m = 100
	end
	
	self.v = self.v - RETARDATION/10*s*m

-- Speed limit forward and reverse on different surfaces
	if get_sign(self.v) >= 0 then
		MAX_SPEED = MAX_SPEED_FORWARD/m
	else
		MAX_SPEED = MAX_SPEED_REVERSE/m
	end
	if math.abs(self.v) > MAX_SPEED then
		self.v = self.v-get_sign(self.v)
	end

-- Setting position, velocity and acceleration	
	self.object:setpos({x=p.x, y=p.y, z=p.z})
	self.object:setvelocity(get_velocity(self.v, self.object:getyaw(), self.object:getvelocity().y, r, f))
	self.object:setacceleration({x=0, y=-9.81, z=0})
	--local player:set_properties({visual_size = {x = 0, y = 0, z = 0}})

end

minetest.register_entity("car_f1:car_f1", car_f1)

minetest.register_craftitem("car_f1:car_f1", {
	description = "Car: F1",
	inventory_image = "car_f1_inventory.png",
	wield_image = "car_f1_inventory.png",
	wield_scale = {x=1, y=1, z=1},
	
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return
		end
		minetest.env:add_entity(pointed_thing.above, "car_f1:car_f1")
		itemstack:take_item()
		return itemstack
	end,
})
