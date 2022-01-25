-- cobble generator designed by ScarletDarknesz
-- January 2022

local S = technic.getter

local fs_helpers = pipeworks.fs_helpers
local tube_entry = "^pipeworks_tube_connection_metallic.png"

local function round(v)
	return math.floor(v + 0.5)
end

function firstToUpper(str)
	return (str:gsub("^%l", string.upper))
end

function register_gen(data)
	local machine_name = string.lower(data.name)
	local machine_desc = S("%s " .. firstToUpper(machine_name) .. " Cobble Generator")
	local tier = data.tier
	local ltier = string.lower(tier)
	local outamount = data.amount
	local slots = data.slots

	data.modname = minetest.get_current_modname()

	local groups = {cracky = 2, technic_machine = 1, ["technic_"..ltier] = 1}
	if data.tube then
		groups.tubedevice = 1
		groups.tubedevice_receiver = 1
	end
	local active_groups = {not_in_creative_inventory = 1}
	for k, v in pairs(groups) do active_groups[k] = v end

	local formspec =
		"size[8,9;]"..
		"list[context;dst;0,1;8,8;]"..
		"list[current_player;main;0,5;8,4;]"..
		"label[0,0;"..machine_desc:format(tier).."]"..
		"listring[context;dst]"..
		"listring[current_player;main]"..
		"listring[context;src]"..
		"listring[current_player;main]"
	if data.upgrade then
		formspec = formspec..
			"list[context;upgrade1;1,3;1,1;]"..
			"list[context;upgrade2;2,3;1,1;]"..
			"label[1,4;"..S("Upgrade Slots").."]"..
			"listring[context;upgrade1]"..
			"listring[current_player;main]"..
			"listring[context;upgrade2]"..
			"listring[current_player;main]"
	end

	local tube = technic.new_default_tube()
	if data.can_insert then
		tube.can_insert = data.can_insert
	end
	if data.insert_object then
		tube.insert_object = data.insert_object
	end

	local run = function(pos, node)
		local meta     = minetest.get_meta(pos)
		local inv      = meta:get_inventory()
		local eu_input = meta:get_int(tier.."_EU_input")

		local machine_desc_tier = machine_desc:format(tier)
		local machine_node      = data.modname..":"..ltier.."_"..machine_name
		local machine_demand    = data.demand

		-- Setup meta data if it does not exist.
		if not eu_input then
			meta:set_int(tier.."_EU_demand", machine_demand[1])
			meta:set_int(tier.."_EU_input", 0)
			return
		end

		local EU_upgrade, tube_upgrade = 0, 0
		if data.upgrade then
			EU_upgrade, tube_upgrade = technic.handle_machine_upgrades(meta)
		end
		if data.tube then
			technic.handle_machine_pipeworks(pos, tube_upgrade)
		end

		meta:set_int(tier.."_EU_demand", machine_demand[EU_upgrade+1])
		meta:set_int("src_time", meta:get_int("src_time") + 1)

		local powered = eu_input >= machine_demand[EU_upgrade+1]
		if powered then
			technic.swap_node(pos, machine_node.."_active")
			meta:set_string("infotext", S("%s Active"):format(machine_desc_tier))
		else
			technic.swap_node(pos, machine_node)
			meta:set_string("infotext", S("%s Unpowered"):format(machine_desc_tier))
			meta:set_int("src_time", 0)
		end

		if meta:get_int("src_time") >= data.speed then
			meta:set_int("src_time", 0)

			local output = 'default:cobble ' .. outamount
			if type(output) ~= "table" then output = { output } end
			local output_stacks = {}
			for _, o in ipairs(output) do
				table.insert(output_stacks, ItemStack(o))
			end
			local room_for_output = true
			inv:set_size("dst_tmp", inv:get_size("dst"))
			inv:set_list("dst_tmp", inv:get_list("dst"))
			for _, o in ipairs(output_stacks) do
				if not inv:room_for_item("dst_tmp", o) then
					room_for_output = false
					break
				end
				inv:add_item("dst_tmp", o)
			end
			if not room_for_output then
				technic.swap_node(pos, machine_node)
				meta:set_string("infotext", S("%s Finished"):format(machine_desc_tier))
				meta:set_int("src_time", 0)
				return
			end

			inv:set_list("dst", inv:get_list("dst_tmp"))
			
		end

	end

	local tentry = tube_entry
	if ltier == "lv" then
		tentry = ""
	end

	minetest.register_node(data.modname..":"..ltier.."_"..machine_name, {
		description = machine_desc:format(tier),
		tiles = {
			data.modname.."_"..ltier.."_"..machine_name.."_top.png"..tentry,
			data.modname.."_"..ltier.."_"..machine_name.."_bottom.png"..tentry,
			data.modname.."_"..ltier.."_"..machine_name.."_right.png"..tentry,
			data.modname.."_"..ltier.."_"..machine_name.."_left.png"..tentry,
			data.modname.."_"..ltier.."_"..machine_name.."_back.png"..tentry,
			data.modname.."_"..ltier.."_"..machine_name.."_front.png"
		},
		paramtype2 = "facedir",
		groups = groups,
		tube = data.tube and tube or nil,
		connect_sides = data.connect_sides or connect_default,
		legacy_facedir_simple = true,
		sounds = default.node_sound_wood_defaults(),
		on_construct = function(pos)
			local node = minetest.get_node(pos)
			local meta = minetest.get_meta(pos)

			local form_buttons = ""
			if not string.find(node.name, ":lv_") then
				form_buttons = fs_helpers.cycling_button(
					meta,
					pipeworks.button_base,
					"splitstacks",
					{
						pipeworks.button_off,
						pipeworks.button_on
					}
				)..pipeworks.button_label
			end

			meta:set_string("infotext", machine_desc:format(tier))
			meta:set_int("tube_time",  0)
			meta:set_string("formspec", formspec..form_buttons)
			local inv = meta:get_inventory()
			inv:set_size("dst", slots)
			inv:set_size("upgrade1", 1)
			inv:set_size("upgrade2", 1)
		end,
		can_dig = technic.machine_can_dig,
		allow_metadata_inventory_put = technic.machine_inventory_put,
		allow_metadata_inventory_take = technic.machine_inventory_take,
		allow_metadata_inventory_move = technic.machine_inventory_move,
		technic_run = run,
		after_place_node = data.tube and pipeworks.after_place,
		after_dig_node = technic.machine_after_dig_node,
		on_receive_fields = function(pos, formname, fields, sender)
			if fields.quit then return end
			if not pipeworks.may_configure(pos, sender) then return end
			fs_helpers.on_receive_fields(pos, fields)
			local node = minetest.get_node(pos)
			local meta = minetest.get_meta(pos)
			local form_buttons = ""
			if not string.find(node.name, ":lv_") then
				form_buttons = fs_helpers.cycling_button(
					meta,
					pipeworks.button_base,
					"splitstacks",
					{
						pipeworks.button_off,
						pipeworks.button_on
					}
				)..pipeworks.button_label
			end
			meta:set_string("formspec", formspec..form_buttons)
		end,
	})

	minetest.register_node(data.modname..":"..ltier.."_"..machine_name.."_active",{
		description = machine_desc:format(tier),
		tiles = {
			data.modname.."_"..ltier.."_"..machine_name.."_top.png"..tentry,
			data.modname.."_"..ltier.."_"..machine_name.."_bottom.png"..tentry,
			data.modname.."_"..ltier.."_"..machine_name.."_right.png"..tentry,
			data.modname.."_"..ltier.."_"..machine_name.."_left.png"..tentry,
			data.modname.."_"..ltier.."_"..machine_name.."_back.png"..tentry,
			data.modname.."_"..ltier.."_"..machine_name.."_front_active.png"
		},
		paramtype2 = "facedir",
		drop = data.modname..":"..ltier.."_"..machine_name,
		groups = active_groups,
		connect_sides = data.connect_sides or connect_default,
		legacy_facedir_simple = true,
		sounds = default.node_sound_wood_defaults(),
		tube = data.tube and tube or nil,
		can_dig = technic.machine_can_dig,
		allow_metadata_inventory_put = technic.machine_inventory_put,
		allow_metadata_inventory_take = technic.machine_inventory_take,
		allow_metadata_inventory_move = technic.machine_inventory_move,
		technic_run = run,
		technic_disabled_machine_name = data.modname..":"..ltier.."_"..machine_name,
		on_receive_fields = function(pos, formname, fields, sender)
			if fields.quit then return end
			if not pipeworks.may_configure(pos, sender) then return end
			fs_helpers.on_receive_fields(pos, fields)
			local node = minetest.get_node(pos)
			local meta = minetest.get_meta(pos)
			local form_buttons = ""
			if not string.find(node.name, ":lv_") then
				form_buttons = fs_helpers.cycling_button(
					meta,
					pipeworks.button_base,
					"splitstacks",
					{
						pipeworks.button_off,
						pipeworks.button_on
					}
				)..pipeworks.button_label
			end
			meta:set_string("formspec", formspec..form_buttons)
		end,
	})

	technic.register_machine(tier, data.modname..":"..ltier.."_"..machine_name,            technic.receiver)
	technic.register_machine(tier, data.modname..":"..ltier.."_"..machine_name.."_active", technic.receiver)

end

minetest.register_craft({
	output = 'technic_gen:mv_stone',
	recipe = {
		{'default:stone', 'bucket:bucket_water', 'default:stone'},
		{'default:stone', 'default:pick_stone', 'default:stone'},
		{'default:stone', 'bucket:bucket_lava', 'default:stone'},
	}
})

minetest.register_craft({
	output = 'technic_gen:mv_iron',
	recipe = {
		{'default:steelblock', 'technic_gen:mv_stone', 'default:steelblock'},
		{'technic_gen:mv_stone', 'default:pick_steel', 'technic_gen:mv_stone'},
		{'default:steelblock', 'technic_gen:mv_stone', 'default:steelblock'},
	}
})

minetest.register_craft({
	output = 'technic_gen:mv_diamond',
	recipe = {
		{'default:diamondblock', 'technic_gen:mv_iron', 'default:diamondblock'},
		{'technic_gen:mv_iron', 'default:pick_diamond', 'technic_gen:mv_iron'},
		{'default:diamondblock', 'technic_gen:mv_iron', 'default:diamondblock'},
	}
})

register_gen({name= "stone", tier = "LV", demand = {1000, 900, 800}, speed = 5.0, amount = 1, slots = 1, upgrade = 0, tube = 0})

register_gen({name= "iron", tier = "MV", demand = {2000, 1850, 1700}, speed = 1.0, amount = 1, slots = 4, upgrade = 1, tube = 1})
register_gen({name= "diamond", tier = "MV", demand = {7500, 7000, 6500}, speed = 1.0, amount = 10, slots = 16, upgrade = 1, tube = 1})

register_gen({name= "mithril", tier = "HV", demand = {25000, 24000, 23000}, speed = 1.0, amount = 50, slots = 16, upgrade = 1, tube = 1})
register_gen({name= "osmium", tier = "HV", demand = {100000, 95000, 90000}, speed = 1.0, amount = 250, slots = 16, upgrade = 1, tube = 1})