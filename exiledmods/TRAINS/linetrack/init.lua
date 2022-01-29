-- Default tracks for advtrains
-- (c) orwell96 and contributors

--flat

local function suitable_substrate(upos)
	return minetest.registered_nodes[minetest.get_node(upos).name] and (minetest.registered_nodes[minetest.get_node(upos).name].liquidtype == "source" or minetest.registered_nodes[minetest.get_node(upos).name].liquidtype == "flowing")
end

advtrains.register_tracks("waterline", {
	nodename_prefix="linetrack:watertrack",
	texture_prefix="advtrains_ltrack",
	models_prefix="advtrains_ltrack",
	models_suffix=".obj",
	shared_texture="linetrack_line.png",
	description=attrans("Water Line Track"),
	formats={},
	liquids_pointable=true,
	suitable_substrate=suitable_substrate,
	get_additional_definiton = function(def, preset, suffix, rotation)
		return {
			groups = {
				advtrains_track=1,
				advtrains_track_waterline=1,
				save_in_at_nodedb=1,
				dig_immediate=2,
				not_in_creative_inventory=1,
				not_blocking_trains=1,
			},
			use_texture_alpha = true,
		}
	end
}, advtrains.ap.t_30deg_flat)
--slopes
advtrains.register_tracks("waterline", {
	nodename_prefix="linetrack:watertrack",
	texture_prefix="advtrains_ltrack",
	models_prefix="advtrains_ltrack",
	models_suffix=".obj",
	shared_texture="linetrack_line.png",
	description=attrans("Line Track"),
	formats={vst1={true, false, true}, vst2={true, false, true}, vst31={true}, vst32={true}, vst33={true}},
	liquids_pointable=true,
	suitable_substrate=suitable_substrate,
	get_additional_definiton = function(def, preset, suffix, rotation)
		return {
			groups = {
				advtrains_track=1,
				advtrains_track_waterline=1,
				save_in_at_nodedb=1,
				dig_immediate=2,
				not_in_creative_inventory=1,
				not_blocking_trains=1,
			},
			use_texture_alpha = true,
		}
	end
}, advtrains.ap.t_30deg_slope)

advtrains.register_tracks("roadline", {
	nodename_prefix="linetrack:roadtrack",
	texture_prefix="advtrains_rtrack",
	models_prefix="advtrains_ltrack",
	models_suffix=".obj",
	shared_texture="linetrack_road_line.png",
	description=attrans("Road Line Track"),
	formats={},
	get_additional_definiton = function(def, preset, suffix, rotation)
		return {
			groups = {
				advtrains_track=1,
				advtrains_track_roadline=1,
				save_in_at_nodedb=1,
				dig_immediate=2,
				not_in_creative_inventory=1,
				not_blocking_trains=1,
			},
			use_texture_alpha = true,
		}
	end
}, advtrains.ap.t_30deg_flat)
--slopes
local function conns(c1, c2, r1, r2) return {{c=c1, y=r1}, {c=c2, y=r2}} end

local slab_preset={
	regstep=1,
	variant={
		st={
			conns = conns(0,8,0.5,0.5),
			rail_y = 0.5,
			desc = "straight (slab)",
			tpdouble = true,
			tpsingle = true,
			trackworker = "cr",
		},
		cr={
			conns = conns(0,7,0.5,0.5),
			rail_y = 0.5,
			desc = "curve (slab)",
			tpdouble = true,
			trackworker = "st",
		},
	},
	regtp=true,
	tpdefault="st",
	trackworker={},
	rotation={"", "_30", "_45", "_60"},
}

local slope1_preset={
	regstep=1,
	variant={
		vst1={
			conns = conns(8,0,0,0.5),
			rail_y = 0.25,
			desc = "slope (lower)",
			tpdouble = true,
			tpsingle = true,
			trackworker = "vst1",
		},
	},
	regtp=true,
	tpdefault="vst1",
	trackworker={},
	rotation={""},
}

local slope2_preset={
	regstep=1,
	variant={
		vst2={
			conns = conns(8,0,0.5,1),
			rail_y = 0.75,
			desc = "slope (lower)",
			tpdouble = true,
			tpsingle = true,
			trackworker = "vst2",
		},
	},
	regtp=true,
	tpdefault="vst2",
	trackworker={},
	rotation={""},
}

advtrains.register_tracks("roadline", {
	nodename_prefix="linetrack:roadtrack_slope1",
	texture_prefix="linetrack_road_slope1",
	models_prefix="advtrains_rtrack",
	models_suffix=".obj",
	shared_texture="[combine:32x16:0,0=baked_clay_black.png:16,0=linetrack_road_line.png:",
	description=attrans("Road Line Track on Slope (lower)"),
	formats={},
	get_additional_definiton = function(def, preset, suffix, rotation)
		return {
			groups = {
				advtrains_track=1,
				advtrains_track_roadline=1,
				save_in_at_nodedb=1,
				dig_immediate=2,
				not_in_creative_inventory=1,
				not_blocking_trains=1,
			},
			node_box = {
				type = "fixed",
				fixed = {
					{-0.5, -0.5,   -0.5,  0.5, -0.375, 0.5},
					{-0.5, -0.375, -0.25, 0.5, -0.25,  0.5},
					{-0.5, -0.25,  0,    0.5, -0.125, 0.5},
					{-0.5, -0.125, 0.25, 0.5,  0,     0.5},
				}
			},
			use_texture_alpha = true,
			walkable = true,
		}
	end
}, slope1_preset)

advtrains.register_tracks("roadline", {
	nodename_prefix="linetrack:roadtrack_slope2",
	texture_prefix="linetrack_road_slope2",
	models_prefix="advtrains_rtrack",
	models_suffix=".obj",
	shared_texture="[combine:32x16:0,0=baked_clay_black.png:16,0=linetrack_road_line.png:",
	description=attrans("Road Line Track on Slope (upper)"),
	formats={},
	get_additional_definiton = function(def, preset, suffix, rotation)
		return {
			groups = {
				advtrains_track=1,
				advtrains_track_roadline=1,
				save_in_at_nodedb=1,
				dig_immediate=2,
				not_in_creative_inventory=1,
				not_blocking_trains=1,
			},
			node_box = {
				type = "fixed",
				fixed = {
					{-0.5, -0.5,   -0.5,  0.5, 0.125, 0.5},
					{-0.5, 0.125, -0.25, 0.5, 0.25,  0.5},
					{-0.5, 0.25,  0,    0.5, 0.375, 0.5},
					{-0.5, 0.375, 0.25, 0.5,  0.5,     0.5},
				}
			},
			use_texture_alpha = true,
			walkable = true,
		}
	end
}, slope2_preset)

advtrains.register_tracks("roadline", {
	nodename_prefix="linetrack:roadtrack_slab",
	texture_prefix="linetrack_road_slab",
	models_prefix="advtrains_rtracks",
	models_suffix=".obj",
	shared_texture="[combine:32x16:0,0=baked_clay_black.png:16,0=linetrack_road_line.png:",
	description=attrans("Road Line Track on Slab"),
	formats={},
	get_additional_definiton = function(def, preset, suffix, rotation)
		return {
			groups = {
				advtrains_track=1,
				advtrains_track_roadline=1,
				save_in_at_nodedb=1,
				dig_immediate=2,
				not_in_creative_inventory=1,
				not_blocking_trains=1,
			},
			node_box = {
				type = "fixed",
				fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			},
			use_texture_alpha = true,
			walkable = true,
		}
	end
}, slab_preset)

if atlatc ~= nil then
	local function foo(track_type)
		return function(def, preset, suffix, rotation)
			return {
				after_place_node = atlatc.active.after_place_node,
				after_dig_node = atlatc.active.after_dig_node,
					on_receive_fields = function(pos, ...)
					atlatc.active.on_receive_fields(pos, ...)
					
					--set arrowconn (for ATC)
					local ph=minetest.pos_to_string(pos)
					local _, conns=advtrains.get_rail_info_at(pos, advtrains.all_tracktypes)
					atlatc.active.nodes[ph].arrowconn=conns[1].c
				end,

					advtrains = {
					on_train_enter = function(pos, train_id)
						--do async. Event is fired in train steps
						atlatc.interrupt.add(0, pos, {type="train", train=true, id=train_id})
					end,
				},
				luaautomation = {
					fire_event=atlatc.rail.fire_event
				},
				digiline = {
					receptor = {},
					effector = {
						action = atlatc.active.on_digiline_receive
					},
				},
				groups = {
					advtrains_track=1,
					[track_type]=1,
					save_in_at_nodedb=1,
					dig_immediate=2,
					not_in_creative_inventory=1,
					not_blocking_trains=1,
				},
				use_texture_alpha = true,
			}
		end
	end

	advtrains.register_tracks("waterline", {
		nodename_prefix="linetrack:watertrack_lua",
		texture_prefix="advtrains_ltrack_lua",
		models_prefix="advtrains_ltrack",
		models_suffix=".obj",
		shared_texture="linetrack_lua.png",
		description=atltrans("LuaAutomation ATC Line"),
		formats={},
		liquids_pointable=true,
		suitable_substrate=suitable_substrate,
		get_additional_definiton = foo("advtrains_track_waterline"),
	}, advtrains.trackpresets.t_30deg_straightonly)

	advtrains.register_tracks("roadline", {
		nodename_prefix="linetrack:roadtrack_lua",
		texture_prefix="advtrains_rtrack_lua",
		models_prefix="advtrains_ltrack",
		models_suffix=".obj",
		shared_texture="linetrack_road_lua.png",
		description=atltrans("LuaAutomation ATC Line"),
		formats={},
		liquids_pointable=true,
		get_additional_definiton = foo("advtrains_track_roadline"),
	}, advtrains.trackpresets.t_30deg_straightonly)
end

if minetest.get_modpath("advtrains_line_automation") ~= nil then
	local adef = minetest.registered_nodes["advtrains_line_automation:dtrack_stop_st"]
	local foo = function(ttype)
		return function(def, preset, suffix, rotation)
			return {
				after_place_node = adef.after_place_node,
				after_dig_node = adef.after_dig_node,
				on_rightclick = adef.on_rightclick,
				advtrains = adef.advtrains,
				groups = {
					advtrains_track=1,
					[ttype]=1,
					save_in_at_nodedb=1,
					dig_immediate=2,
					not_in_creative_inventory=1,
					not_blocking_trains=1,
				},
				use_texture_alpha = true,
			}
		end
	end
	
	advtrains.register_tracks("waterline", {
		nodename_prefix="linetrack:watertrack_stn",
		texture_prefix="advtrains_ltrack_stn",
		models_prefix="advtrains_ltrack",
		models_suffix=".obj",
		shared_texture="linetrack_stn.png",
		description="Station/Stop Line",
		formats={},
		liquids_pointable=true,
		suitable_substrate=suitable_substrate,
		get_additional_definiton = foo("advtrains_track_waterline"),
	}, advtrains.trackpresets.t_30deg_straightonly)
	
	advtrains.register_tracks("roadline", {
		nodename_prefix="linetrack:watertrack_road_stn",
		texture_prefix="advtrains_rtrack_stn",
		models_prefix="advtrains_ltrack",
		models_suffix=".obj",
		shared_texture="linetrack_road_stn.png",
		description="Station/Stop Line",
		formats={},
		liquids_pointable=true,
		get_additional_definiton = foo("advtrains_track_roadline"),
	}, advtrains.trackpresets.t_30deg_straightonly)
end

-- atc track
advtrains.register_tracks("waterline", {
	nodename_prefix="linetrack:watertrack_atc",
	texture_prefix="advtrains_ltrack_atc",
	models_prefix="advtrains_ltrack",
	models_suffix=".obj",
	shared_texture="linetrack_atc.png",
	description=attrans("Watertrack ATC controller"),
	formats={},
	get_additional_definiton = advtrains.atc_function
}, advtrains.trackpresets.t_30deg_straightonly)

advtrains.register_tracks("roadline", {
	nodename_prefix="linetrack:watertrack_road_atc",
	texture_prefix="advtrains_rtrack_atc",
	models_prefix="advtrains_ltrack",
	models_suffix=".obj",
	shared_texture="linetrack_road_atc.png",
	description=attrans("Roadtrack ATC controller"),
	formats={},
	get_additional_definiton = advtrains.atc_function
}, advtrains.trackpresets.t_30deg_straightonly)

if minetest.get_modpath("advtrains_interlocking") ~= nil then
	dofile(minetest.get_modpath("linetrack") .. "/interlocking.lua")
end

local exhaust_particle_spawner_base = {
	amount = 10,
	time = 0,
	minpos = {x=-1, y=2.8, z=-3.4},
	maxpos = {x=-1, y=2.8, z=-3.4},
	minvel = {x=-0.2, y=1.8, z=-0.2},
	maxvel = {x=0.2, y=2, z=0.2},
	minacc = {x=0, y=-0.1, z=0},
	maxacc = {x=0, y=-0.3, z=0},
	minexptime = 1,
	maxexptime = 3,
	minsize = 1,
	maxsize = 4,
	collisiondetection = true,
	vertical = false,
	texture = "smoke_puff.png",
}

advtrains.register_wagon("boat", {
	mesh="linetrack_boat.b3d",
	textures = {
		"doors_door_steel.png",--y
		"linetrack_steel_tile_dark.png", --y(exhaust)
		"default_coal_block.png",
		"linetrack_steel_tile_light.png",--y
		"linetrack_steel_tile_dark.png",
		"linetrack_steel_tile_blue.png",--y
		"linetrack_diamond_plate_steel_blue.png",--y
		"linetrack_steel_tile_dark.png",--y(hull)
		"default_wood.png", --y
		"linetrack_lifering.png", --y
		"linetrack_boat_windows.png",
	},
	drives_on={waterline=true},
	max_speed=10,
	seats = {
		{
			name="Driver stand",
			attach_offset={x=6, y=2, z=10},
			view_offset={x=6, y=0, z=8},
			group="dstand",
		},
		{
			name="1",
			attach_offset={x=-4, y=0, z=-4},
			view_offset={x=0, y=0, z=0},
			group="pass",
		},
		{
			name="2",
			attach_offset={x=4, y=0, z=-4},
			view_offset={x=0, y=0, z=0},
			group="pass",
		},
		{
			name="3",
			attach_offset={x=-4, y=0, z=4},
			view_offset={x=0, y=0, z=0},
			group="pass",
		},
		{
			name="4",
			attach_offset={x=4, y=0, z=4},
			view_offset={x=0, y=0, z=0},
			group="pass",
		},
		{
			name="5",
			attach_offset={x=-4, y=0, z=-12},
			view_offset={x=0, y=0, z=0},
			group="pass",
		},
		{
			name="6",
			attach_offset={x=4, y=0, z=-12},
			view_offset={x=0, y=0, z=0},
			group="pass",
		},
		{
			name="7",
			attach_offset={x=-4, y=0, z=-20},
			view_offset={x=0, y=0, z=0},
			group="pass",
		},
		{
			name="8",
			attach_offset={x=4, y=0, z=-20},
			view_offset={x=0, y=0, z=0},
			group="pass",
		},
		{
			name="9",
			attach_offset={x=-4, y=0, z=-28},
			view_offset={x=0, y=0, z=0},
			group="pass",
		},
		{
			name="10",
			attach_offset={x=4, y=0, z=-28},
			view_offset={x=0, y=0, z=0},
			group="pass",
		},
	},
	seat_groups = {
		dstand={
			name = "Driver Stand",
			access_to = {"pass"},
			require_doors_open=true,
			driving_ctrl_access=true,
		},
		pass={
			name = "Passenger area",
			access_to = {"dstand"},
			require_doors_open=true,
		},
	},
	doors={
		open={
			[-1]={frames={x=0, y=1}, time=1},
			[1]={frames={x=0, y=1}, time=1},
			sound = "doors_steel_door_open",
		},
		close={
			[-1]={frames={x=2, y=3}, time=1},
			[1]={frames={x=2, y=3}, time=1},
			sound = "doors_steel_door_close",
		}
	},
	assign_to_seat_group = {"pass", "dstand"},
	door_entry={-1, 1},
	visual_size = {x=1, y=1},
	wagon_span=2,
	collisionbox = {-2.0,-3.0,-2.0, 2.0,4.0,2.0},
	is_locomotive=true,
	wagon_width=5,
	drops={"default:steelblock 4"},
	horn_sound = "linetrack_boat_horn",
	custom_on_destroy = function(self)
		if (self.sound_loop_handle) then
			minetest.sound_stop(self.sound_loop_handle) --don't loop forever D:
		end
		return true
	end,
	custom_on_velocity_change = function(self, velocity, old_velocity, dtime)
		if not velocity or not old_velocity then return end
		if old_velocity == 0 and velocity > 0 then
			self.particlespawners = {
				minetest.add_particlespawner(advtrains.merge_tables(exhaust_particle_spawner_base,
					{minpos = {x=1, y=2.8, z=-3.4}, maxpos = {x=1, y=2.9, z=-3.4}, attached = self.object})),
				minetest.add_particlespawner(advtrains.merge_tables(exhaust_particle_spawner_base,
					{minpos = {x=-1, y=2.8, z=-3.4}, minpos = {x=-1, y=2.8, z=-3.4}, attached = self.object})),
			}
			minetest.sound_play("linetrack_boat_start", {object = self.object})
			return
		end
		if velocity == 0 then
			if self.sound_loop_handle then
				minetest.sound_stop(self.sound_loop_handle)
				self.sound_loop_handle = nil
			end
			if self.particlespawners then
				for k,v in pairs(self.particlespawners) do
					minetest.delete_particlespawner(v)
				end
			end
			if old_velocity > 0 then
				minetest.sound_play("linetrack_boat_stop", {object = self.object})
			end
			return
		end
		if self.rev_tmr then
			delta = minetest.get_us_time()- self.rev_start
			if delta >= self.rev_tmr then
				self.rev_tmr = nil
				if self.rev_high then
					self.sound_loop_handle = minetest.sound_play({name="linetrack_boat_idle_high", gain=0.3}, {object = self.object, loop=true})
				else
					self.sound_loop_handle = minetest.sound_play({name="linetrack_boat_idle_low", gain=0.3}, {object = self.object, loop=true})
				end
			end
		elseif velocity > 0 then
			if self.sound_loop_handle == nil then
				if velocity > 5 then
				self.sound_loop_handle = minetest.sound_play({name="linetrack_boat_idle_high", gain=0.3}, {object = self.object, loop=true})
				else 
					self.sound_loop_handle = minetest.sound_play({name="linetrack_boat_idle_low", gain=0.3}, {object = self.object, loop=true})
				end
				return
			end
			if velocity ~= old_velocity then
				if old_velocity < 5 and velocity > 5 then
					minetest.sound_stop(self.sound_loop_handle)
					self.sound_loop_handle = nil
					minetest.sound_play({name="linetrack_boat_revup", gain=0.3}, {object = self.object})
					self.rev_start = minetest.get_us_time()
					self.rev_tmr = 2813000
					self.rev_high = true
				elseif old_velocity > 5 and velocity < 5 then
					minetest.sound_stop(self.sound_loop_handle)
					self.sound_loop_handle = nil
					minetest.sound_play({name="linetrack_boat_revdown", gain=0.3}, {object = self.object})
					self.rev_start = minetest.get_us_time()
					self.rev_tmr = 373000
					self.rev_high = false
					
				end
			end
		end
	end,
}, "Boat", "linetrack_boat_inv.png")

advtrains.register_wagon("bus", {
	mesh="linetrack_bus.b3d",
	textures = {"linetrack_bus.png", "linetrack_bus_body.png", "linetrack_bus_bumper.png", "linetrack_light_red.png", "linetrack_bus_light_white.png", "linetrack_bus_light_yellow.png", "linetrack_bus_windows.png"},
	drives_on={roadline=true},
	max_speed=15,
	seats = {
		{
			name="Driver stand",
			attach_offset={x=-5, y=0, z=19},
			view_offset={x=-5, y=0, z=19},
			group="dstand",
		},
		{
			name="1",
			attach_offset={x=-5, y=0, z=-4},
			view_offset={x=-5, y=0, z=-4},
			group="pass",
		},
		{
			name="2",
			attach_offset={x=5, y=0, z=-4},
			view_offset={x=5, y=0, z=-4},
			group="pass",
		},
		{
			name="3",
			attach_offset={x=-5, y=0, z=-14},
			view_offset={x=-5, y=0, z=-14},
			group="pass",
		},
		{
			name="4",
			attach_offset={x=5, y=0, z=-14},
			view_offset={x=5, y=0, z=-14},
			group="pass",
		},
		{
			name="5",
			attach_offset={x=-5, y=0, z=-24},
			view_offset={x=-5, y=0, z=-24},
			group="pass",
		},
		{
			name="6",
			attach_offset={x=5, y=0, z=-24},
			view_offset={x=5, y=0, z=-24},
			group="pass",
		},
	},
	seat_groups = {
		dstand={
			name = "Driver Stand",
			access_to = {"pass"},
			require_doors_open=true,
			driving_ctrl_access=true,
		},
		pass={
			name = "Passenger area",
			access_to = {"dstand"},
			require_doors_open=true,
		},
	},
	doors={
		open={
			[-1]={frames={x=2, y=20}, time=1},
			[1]={frames={x=2, y=20}, time=1},
			sound = "advtrains_subway_dopen",
		},
		close={
			[-1]={frames={x=20, y=38}, time=1},
			[1]={frames={x=20, y=38}, time=1},
			sound = "advtrains_subway_dclose",
		}
	},
	assign_to_seat_group = {"pass", "dstand"},
	door_entry={-1, 1},
	visual_size = {x=1, y=1, z=1},
	use_texture_alpha = true,
	backface_culling = false,
    	wagon_span=3,
	collisionbox = {-2.0,-3.0,-2.0, 2.0,4.0,2.0},
	is_locomotive=true,
	wagon_width=3,
	drops={"default:steelblock 4"},
	horn_sound = "linetrack_boat_horn",
}, "Bus", "linetrack_tcb.png")

minetest.register_node("linetrack:invisible_platform", {
	description = "Invisible Platform",
	groups = {cracky = 1, not_blocking_trains = 1, platform=1},
	drawtype = "airlike",
	inventory_image = "linetrack_invisible_platform.png",
	wield_image = "linetrack_invisible_platform.png",
	walkable = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.1, -0.1, 0.5,  0  , 0.5},
			{-0.5, -0.5,  0  , 0.5, -0.1, 0.5}
		},
	},
	paramtype2="facedir",
	paramtype = "light",
	sunlight_propagates = true,
})

minetest.register_node("linetrack:lane_platform", {
	description = "Lane Platform",
	groups = {cracky = 1, not_blocking_trains = 1, platform=1},
	drawtype = "nodebox",
	tiles = {"linetrack_lane_platform.png", "linetrack_transparent.png"},
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.49, 0.5}
	},
	wield_image = "linetrack_lane_platform.png",
	inventory_image = "linetrack_lane_platform.png",
	walkable = false,
	paramtype2="facedir",
	paramtype = "light",
	sunlight_propagates = true,
})

