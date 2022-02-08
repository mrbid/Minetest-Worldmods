-- HV Biomass Generator (hv_blood_box)
-- https://github.com/mrbid/Minetest-Worldmods

local digilines_path = minetest.get_modpath("digilines")

local S = technic.getter
local tube_entry = "^pipeworks_tube_connection_metallic.png"
local cable_entry = "^technic_cable_connection_overlay.png"

-- x+2 + (z+2)*2
local dirtab = {
	[4] = 2,
	[5] = 3,
	[7] = 1,
	[8] = 0
}

local tube = {
	insert_object = function(pos, node, stack, direction)
		if direction.y == 1
			or (direction.y == 0 and dirtab[direction.x+2+(direction.z+2)*2] == node.param2) then
			return stack
		end
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		if direction.y == 0 then
			return inv:add_item("src", stack)
		end
	end,
	can_insert = function(pos, node, stack, direction)
		if direction.y == 1
			or (direction.y == 0 and dirtab[direction.x+2+(direction.z+2)*2] == node.param2) then
			return false
		end
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		if direction.y == 0 then
			return inv:room_for_item("src", stack)
		end
	end,
	connect_sides = {left=1, right=1, back=1, top=1},
}

function technic.register_blood_box(data)
	local formspec =
		"size[8,9]"..
		"image[1,1;1,2;technic_power_meter_bg.png]"..
		"list[context;src;3,1;1,1;]"..
		"label[0,0;HV Biomass Generator]"..
		"label[3,0.6;"..S("Biomass (bones)").."]"..
		"label[1,3;"..S("Power level").."]"..
		"list[current_player;main;0,5;8,4;]"..
		"listring[context;src]"..
		"listring[current_player;main]"..
		(data.upgrade and
			"list[context;upgrade1;3.5,3;1,1;]"..
			"list[context;upgrade2;4.5,3;1,1;]"..
			"label[3.5,4;"..S("Upgrade Slots").."]"..
			"listring[context;upgrade1]"..
			"listring[current_player;main]"..
			"listring[context;upgrade2]"..
			"listring[current_player;main]"
		or "")

	--
	-- Generate formspec with power meter
	--
	local function get_formspec(charge_ratio, channel)
		return formspec .. "image[1,1;1,2;technic_power_meter_bg.png^[lowpart:" ..
			math.floor(charge_ratio * 100) .. ":technic_power_meter_fg.png]" ..
			(digilines_path and
				("field[0.3,4;2.2,1;channel;Digiline channel;%s]button[2,3.7;1,1;setchannel;Set]")
				:format(minetest.formspec_escape(channel))
			or "")

	end

	--
	-- Update fields not affecting internal network calculations and behavior in any way
	--
	local function update_node(pos, update_formspec)
		-- Read metadata and calculate actual values based on upgrades
		local meta = minetest.get_meta(pos)
		local current_charge = meta:get_int("internal_EU_charge")
		local EU_upgrade = 0
		if data.upgrade then
			EU_upgrade = technic.handle_machine_upgrades(meta)
		end
		local max_charge = data.max_charge * (1 + EU_upgrade / 10)
		-- Select node textures
		local charge_ratio = current_charge / max_charge
		local charge_count = math.ceil(charge_ratio * 8)
		charge_count = math.min(charge_count, 8)
		charge_count = math.max(charge_count, 0)
		local last_count = meta:get_float("last_side_shown")
		if charge_count ~= last_count then
			technic.swap_node(pos, "technic:hv_blood_box" .. charge_count)
			meta:set_float("last_side_shown", charge_count)
		end
		-- Update formspec and infotext
		local eu_input = meta:get_int("HV_EU_input")
		local infotext = S("@1 Biomass Generator: @2 / @3", "HV",
			technic.EU_string(current_charge), technic.EU_string(max_charge))
		if eu_input == 0 then
			infotext = S("%s Idle"):format(infotext)
		end
		meta:set_string("infotext", infotext)
		if update_formspec then
			local channel = meta:get_string("channel")
			meta:set_string("formspec", get_formspec(charge_ratio, channel))
		end
	end

	local function run(pos, node, run_state, network)
		local meta  = minetest.get_meta(pos)

		local eu_input       = meta:get_int("HV_EU_input")
		local current_charge = meta:get_int("internal_EU_charge")

		local EU_upgrade, tube_upgrade = 0, 0
		if data.upgrade then
			EU_upgrade, tube_upgrade = technic.handle_machine_upgrades(meta)
		end
		local max_charge = data.max_charge * (1 + EU_upgrade / 10)

		-- Charge/discharge the battery with the input EUs
		if eu_input >= 0 then
			current_charge = math.min(current_charge + eu_input, max_charge)
		else
			current_charge = math.max(current_charge + eu_input, 0)
		end

		-- consume bones
		local inventory = meta:get_inventory()
		if not inventory:is_empty("src") and current_charge <= max_charge-data.charge_step then
			local stack = inventory:get_stack("src", 1)
			local item_name = stack:get_name()
			if item_name == "bones:bones" then
				local sc = stack:get_count();
				local cct = max_charge - current_charge
				local cctu = cct / data.charge_step
				local ts = cctu
				if sc < cctu then
					ts = sc
				end
				current_charge = current_charge + data.charge_step * ts;
				stack:set_count(sc-ts)
				inventory:set_stack("src", 1, stack)
			elseif item_name == "bonemeal:bone" or item_name == "foody:bone" then
				local sc = stack:get_count();
				local cct = max_charge - current_charge
				local cctu = cct / data.charge_step
				local ts = cctu
				if sc < cctu then
					ts = sc
				end
				current_charge = current_charge + (data.charge_step/33) * ts;
				stack:set_count(sc-ts)
				inventory:set_stack("src", 1, stack)
			end
		end

		-- We allow batteries to charge on less than the demand
		local supply = math.min(data.discharge_rate, current_charge)
		local demand = math.min(data.charge_rate, max_charge - current_charge)
		network:update_battery(current_charge, max_charge, supply, demand)

		meta:set_int("HV_EU_demand", demand)
		meta:set_int("HV_EU_supply", supply)
		meta:set_int("internal_EU_charge", current_charge)
		meta:set_int("internal_EU_charge_max", max_charge)

		local timer = minetest.get_node_timer(pos)
		if not timer:is_started() then
			timer:start(2)
		end
	end

	local function on_timer(pos, elapsed)
		if not technic.pos2network(pos) then return end
		update_node(pos)
		return true
	end

	for i = 0, 8 do
		local groups = {snappy=2, choppy=2, oddly_breakable_by_hand=2,
				technic_machine=1, ["technic_hv"]=1}
		if i ~= 0 then
			groups.not_in_creative_inventory = 1
		end

		if data.tube then
			groups.tubedevice = 1
			groups.tubedevice_receiver = 1
		end

		local top_tex = "technic_hv_blood_box_top.png"..tube_entry
		local front_tex = "technic_hv_blood_box_front.png^technic_bpower_meter"..i..".png"
		local side_tex = "technic_hv_blood_box_side.png"..tube_entry
		local bottom_tex = "technic_hv_blood_box_bottom.png"..cable_entry

		minetest.register_node("technic:hv_blood_box"..i, {
			description = "HV Biomass Generator",
			tiles = {
				top_tex,
				bottom_tex,
				side_tex,
				side_tex,
				side_tex,
				front_tex},
			groups = groups,
			connect_sides = {"bottom"},
			tube = data.tube and tube or nil,
			paramtype2 = "facedir",
			sounds = default.node_sound_wood_defaults(),
			drop = "technic:hv_blood_box0",
			on_construct = function(pos)
				local meta = minetest.get_meta(pos)
				meta:set_string("infotext", "HV Biomass Generator")
				meta:set_int("HV_EU_demand", 0)
				meta:set_int("HV_EU_supply", 0)
				meta:set_int("HV_EU_input",  0)
				meta:set_float("internal_EU_charge", 0)
				local inv = meta:get_inventory()
				inv:set_size("src", 1)
				inv:set_size("upgrade1", 1)
				inv:set_size("upgrade2", 1)
				update_node(pos, true)
			end,
			can_dig = technic.machine_can_dig,
			allow_metadata_inventory_put = technic.machine_inventory_put,
			allow_metadata_inventory_take = technic.machine_inventory_take,
			allow_metadata_inventory_move = technic.machine_inventory_move,
			technic_run = run,
			on_timer = on_timer,
			on_rightclick = function(pos) update_node(pos, true) end,
			on_rotate = screwdriver.rotate_simple,
			after_place_node = data.tube and pipeworks.after_place,
			after_dig_node = technic.machine_after_dig_node,
			on_receive_fields = function(pos, formname, fields, player)
				local name = player:get_player_name()
				if minetest.is_protected(pos, name) then
					minetest.record_protection_violation(pos, name)
					return
				elseif fields.setchannel then
					local meta = minetest.get_meta(pos)
					meta:set_string("channel", fields.channel or "")
					update_node(pos, true)
				end
			end,
			digiline = {
				receptor = {
					rules = technic.digilines.rules,
					action = function() end
				},
				effector = {
					rules = technic.digilines.rules,
					action = function(pos, node, channel, msg)
						if msg ~= "GET" and msg ~= "get" then
							return
						end
						local meta = minetest.get_meta(pos)
						if channel ~= meta:get_string("channel") then
							return
						end
						local inv = meta:get_inventory()
						digilines.receptor_send(pos, technic.digilines.rules, channel, {
							demand = meta:get_int("HV_EU_demand"),
							supply = meta:get_int("HV_EU_supply"),
							input  = meta:get_int("HV_EU_input"),
							charge = meta:get_int("internal_EU_charge"),
							max_charge = data.max_charge * (1 + technic.handle_machine_upgrades(meta) / 10),
							src      = inv:get_stack("src", 1):to_table(),
							--dst      = inv:get_stack("dst", 1):to_table(),
							upgrade1 = inv:get_stack("upgrade1", 1):to_table(),
							upgrade2 = inv:get_stack("upgrade2", 1):to_table()
						})
					end
				},
			},
		})
	end

	-- Register as a battery type
	-- Battery type machines function as power reservoirs and can both receive and give back power
	for i = 0, 8 do
		technic.register_machine("HV", "technic:hv_blood_box"..i, technic.battery)
	end

end -- End registration
