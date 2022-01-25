-- cobble generator designed by ScarletDarknesz
-- January 2022
-- https://github.com/mrbid/Minetest-Worldmods/tree/main/worldmods/technic_gen

local S = technic.getter

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

	local groups = {cracky = 2, tubedevice = 1, technic_machine = 1, ["technic_"..ltier] = 1}
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
			"list[context;upgrade1;1,4;1,1;]"..
			"list[context;upgrade2;2,4;1,1;]"..
			"label[1,3.5;"..S("Upgrade Slots").."]"..
			"listring[context;upgrade1]"..
			"listring[current_player;main]"..
			"listring[context;upgrade2]"..
			"listring[current_player;main]"
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

		local EU_upgrade = 0
		if data.upgrade then
			EU_upgrade = technic.handle_machine_upgrades(meta)
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

			local strout = 'default:cobble ' .. outamount
			local output = strout
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
				--meta:set_int("src_time", 0)
				--minetest.add_item({x=pos.x, y=pos.y+1, z=pos.z}, strout)
				technic.tube_inject_item(pos, pos, vector.new(0, 1, 0), strout)
				return
			end

			inv:set_list("dst", inv:get_list("dst_tmp"))
			
		end

	end

	minetest.register_node(data.modname..":"..ltier.."_"..machine_name, {
		description = machine_desc:format(tier),
		tiles = {
			data.modname.."_"..ltier.."_"..machine_name.."_top.png",
			data.modname.."_"..ltier.."_"..machine_name.."_bottom.png",
			data.modname.."_"..ltier.."_"..machine_name.."_right.png",
			data.modname.."_"..ltier.."_"..machine_name.."_left.png",
			data.modname.."_"..ltier.."_"..machine_name.."_back.png",
			data.modname.."_"..ltier.."_"..machine_name.."_front.png"
		},
		paramtype2 = "facedir",
		groups = groups,
		tube = {
			connect_sides = {top = 1},
		},
		--connect_sides = data.connect_sides or connect_default,
		legacy_facedir_simple = true,
		sounds = default.node_sound_wood_defaults(),
		on_construct = function(pos)
			local node = minetest.get_node(pos)
			local meta = minetest.get_meta(pos)

			local form_buttons = ""

			meta:set_string("infotext", machine_desc:format(tier))
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
		after_dig_node = technic.machine_after_dig_node,
	})

	minetest.register_node(data.modname..":"..ltier.."_"..machine_name.."_active",{
		description = machine_desc:format(tier),
		tiles = {
			data.modname.."_"..ltier.."_"..machine_name.."_top.png",
			data.modname.."_"..ltier.."_"..machine_name.."_bottom.png",
			data.modname.."_"..ltier.."_"..machine_name.."_right.png",
			data.modname.."_"..ltier.."_"..machine_name.."_left.png",
			data.modname.."_"..ltier.."_"..machine_name.."_back.png",
			data.modname.."_"..ltier.."_"..machine_name.."_front_active.png"
		},
		paramtype2 = "facedir",
		drop = data.modname..":"..ltier.."_"..machine_name,
		groups = active_groups,
		tube = {
			connect_sides = {top = 1},
		},
		--connect_sides = data.connect_sides or connect_default,
		legacy_facedir_simple = true,
		sounds = default.node_sound_wood_defaults(),
		can_dig = technic.machine_can_dig,
		allow_metadata_inventory_put = technic.machine_inventory_put,
		allow_metadata_inventory_take = technic.machine_inventory_take,
		allow_metadata_inventory_move = technic.machine_inventory_move,
		technic_run = run,
		technic_disabled_machine_name = data.modname..":"..ltier.."_"..machine_name,
	})

	technic.register_machine(tier, data.modname..":"..ltier.."_"..machine_name,            technic.receiver)
	technic.register_machine(tier, data.modname..":"..ltier.."_"..machine_name.."_active", technic.receiver)

end

minetest.register_craft({
	output = 'technic_gen:lv_stone',
	recipe = {
		{'default:stone', 'bucket:bucket_water', 'default:stone'},
		{'default:stone', 'default:pick_stone', 'default:stone'},
		{'default:stone', 'bucket:bucket_lava', 'default:stone'},
	}
})

minetest.register_craft({
	output = 'technic_gen:mv_iron',
	recipe = {
		{'default:steelblock', 'technic_gen:lv_stone', 'default:steelblock'},
		{'technic_gen:lv_stone', 'default:pick_steel', 'technic_gen:lv_stone'},
		{'default:steelblock', 'technic_gen:lv_stone', 'default:steelblock'},
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

minetest.register_craft({
	output = 'technic_gen:hv_mithril',
	recipe = {
		{'moreores:mithril_block', 'technic_gen:mv_diamond', 'moreores:mithril_block'},
		{'technic_gen:mv_diamond', 'moreores:pick_mithril', 'technic_gen:mv_diamond'},
		{'moreores:mithril_block', 'technic_gen:mv_diamond', 'moreores:mithril_block'},
	}
})

minetest.register_craft({
	output = 'technic_gen:hv_osmium',
	recipe = {
		{'xtraores:block_osmium', 'technic_gen:hv_mithril', 'xtraores:block_osmium'},
		{'technic_gen:hv_mithril', 'xtraores:pickaxe_osmium', 'technic_gen:hv_mithril'},
		{'xtraores:block_osmium', 'technic_gen:hv_mithril', 'xtraores:block_osmium'},
	}
})

register_gen({name= "stone", tier = "LV", demand = {1000, 900, 800}, speed = 5.0, amount = 1, slots = 1})

register_gen({name= "iron", tier = "MV", demand = {2000, 1850, 1700}, speed = 1.0, amount = 1, slots = 4, upgrade = 1})
register_gen({name= "diamond", tier = "MV", demand = {7500, 7000, 6500}, speed = 1.0, amount = 10, slots = 16, upgrade = 1})

register_gen({name= "mithril", tier = "HV", demand = {25000, 24000, 23000}, can_insert = "dst", speed = 1.0, amount = 50, slots = 16, upgrade = 1})
register_gen({name= "osmium", tier = "HV", demand = {100000, 95000, 90000}, speed = 1.0, amount = 250, slots = 16, upgrade = 1})