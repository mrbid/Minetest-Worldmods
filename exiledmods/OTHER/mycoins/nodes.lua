home_boot = 60
home_miner = 500
game_boot = 45
game_miner = 400
alien_boot = 30
alien_miner = 300


local function computer_owner(meta, player)
	if player:get_player_name() ~= meta:get_string("owner") then
		return false
	end
	return true
end
 
function default.computer_formspec(pos)
	local spos = pos.x .. "," .. pos.y .. "," ..pos.z
	local formspec = "size[10,10]"..
	   "image[1,0.5;1.2,1.2;tux.png]"..
		"label[2,0.8;Initializing basic system settings	... OK]" ..
		"label[2,1.1;Mounting local filesystems			... OK]" ..
		"label[2,1.4;Enabling swap space						... OK]" ..
		"label[2,1.7;Setting up console						... OK]" ..
		"label[2,2;Operaing System Loaded					... OK]" ..
		"label[2,2.3;Starting cgminer 3.7.2 ]" ..
		"list[nodemeta:".. spos .. ";main;1,3;1,1;]"..
		"list[current_player;main;3,9.5;4,1;]"
	return formspec
end

function default.computer_off_formspec(pos)
	local spos = pos.x .. "," .. pos.y .. "," ..pos.z
	local formspec = "size[10,10]"..
		"label[2,2;Powered Off...]" ..
		"list[nodemeta:".. spos .. ";main;1,3;1,1;]"..
		"list[current_player;main;3,9.5;4,1;]"
	return formspec
end
 
function default.active_computer_formspec(pos)
	local spos = pos.x .. "," .. pos.y .. "," ..pos.z
	local formspec = "size[10,10]"..
		"background[1,2.5;8,7;mycoins_game_computer_motherboard.png]"..
		"label[2,0.0;cgminer version 3.7.2 - Started]" ..
		"label[2,0.2;----------------------------------------------------------------------------------]" ..
		"label[2,0.4;5s:468.9K avg:468.8Kh/s : A:2304 R:0 HW:0 WU:394.4/m]" ..
		"label[2,0.7;ST: 2  SS: 0  NB: 1909  LW: 34901  GF: 14  RF: 7]" ..
		"label[2,1;Connected to stratum.max.bitcoin.com diff 1.02k with stratum.]" ..
		"label[2,1.3;Block: 31dca6d... Diff:104 Started: 09:24:05 Best share: 618K.]" ..
		"label[2,1.5;----------------------------------------------------------------------------------]" ..
		"list[nodemeta:".. spos .. ";main;1,3;1,1;]"..
		"list[current_player;main;3,9.5;4,1;]"
	return formspec
end
 
function default.computer_wifi_formspec(pos)
	local spos = pos.x .. "," .. pos.y .. "," ..pos.z
	local formspec = "size[10,10]"..
		"label[2,2;No Internet Connection.]" ..
		"label[2,2.5;Contact Your Network Administrator For More Information.]" ..
		"list[nodemeta:".. spos .. ";main;1,3;1,1;]"..
		"list[current_player;main;3,9.5;4,1;]"
	return formspec
end

-- Home Computer
minetest.register_node("mycoins:home_computer",{
	drawtype = "nodebox",
	description = "Home Computer",
	tiles = {"mycoins_home_computer_tp.png","mycoins_home_computer_bt.png","mycoins_home_computer_rt.png","mycoins_home_computer_lt.png","mycoins_home_computer_bk.png","mycoins_home_computer_ft_off.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	drop = "mycoins:home_computer",
	groups = {cracky=2, oddly_breakable_by_hand=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.500000,0.03125,0.500000,0.500000,0.40625},
			{-0.40625,-0.40625,0.40625,0.40625,0.40625,0.50000},
			{-0.500000,-0.500000,-0.500000,0.500000,-0.375,-0.03125},
		},
	},
	sounds = default.node_sound_wood_defaults(),
	after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		local timer = minetest.get_node_timer(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", "Home Computer (owner "..
		meta:get_string("owner")..")")
		timer:start(home_boot)
		end,
	on_timer = function(pos)
		local isp = minetest.find_node_near(pos, 3, {"mycoins:isp_on"})
		if isp == nil then
			local wifi = minetest.find_node_near(pos, 30, {"mycoins:router_on"})
			if wifi == nil then
				local timer = minetest.get_node_timer(pos)
				local meta = minetest.get_meta(pos)
				local node = minetest.get_node(pos)
				minetest.swap_node(pos, {name = 'mycoins:home_computer', param2 = node.param2})
				meta:set_string("formspec", default.computer_wifi_formspec(pos))
				meta:set_string("infotext", "Home Computer (owner "..
				meta:get_string("owner")..")")
				local inv = meta:get_inventory()
				inv:set_size("main", 4*2)
				timer:stop()
			else
				local meta = minetest.get_meta(pos)
				if ( minetest.get_player_by_name(meta:get_string("owner")) == nil ) then
					local timer = minetest.get_node_timer(pos)
					local meta = minetest.get_meta(pos)
					local node = minetest.get_node(pos)
					minetest.swap_node(pos, {name = 'mycoins:home_computer', param2 = node.param2})
					meta:set_string("formspec", default.computer_off_formspec(pos))
					meta:set_string("infotext", "Home Computer (owner "..
					meta:get_string("owner")..")")
					local inv = meta:get_inventory()
					inv:set_size("main", 4*2)
					timer:stop()
				else
					local timer = minetest.get_node_timer(pos)
					local meta = minetest.get_meta(pos)
					local node = minetest.get_node(pos)
					minetest.swap_node(pos, {name = 'mycoins:home_computer_active', param2 = node.param2})
					meta:set_string("formspec", default.active_computer_formspec(pos))
					meta:set_string("infotext", "Home Computer (owner "..
					meta:get_string("owner")..")")
					local inv = meta:get_inventory()
					inv:set_size("main", 4*2)
					timer:start(home_miner)
				end
			end
		else
			local meta = minetest.get_meta(pos)
				if ( minetest.get_player_by_name(meta:get_string("owner")) == nil ) then
					local timer = minetest.get_node_timer(pos)
					local meta = minetest.get_meta(pos)
					local node = minetest.get_node(pos)
					minetest.swap_node(pos, {name = 'mycoins:home_computer', param2 = node.param2})
					meta:set_string("formspec", default.computer_off_formspec(pos))
					meta:set_string("infotext", "Home Computer (owner "..
					meta:get_string("owner")..")")
					local inv = meta:get_inventory()
					inv:set_size("main", 4*2)
					timer:stop()
				else
					local timer = minetest.get_node_timer(pos)
					local meta = minetest.get_meta(pos)
					local node = minetest.get_node(pos)
					minetest.swap_node(pos, {name = 'mycoins:home_computer_active', param2 = node.param2})
					meta:set_string("formspec", default.active_computer_formspec(pos))
					meta:set_string("infotext", "Home Computer (owner "..
					meta:get_string("owner")..")")
					local inv = meta:get_inventory()
					inv:set_size("main", 4*2)
					timer:start(home_miner)
				end

		end
	end,
	on_punch = function(pos)
		local isp = minetest.find_node_near(pos, 3, {"mycoins:isp_on"})
		if isp == nil then
			local wifi = minetest.find_node_near(pos, 30, {"mycoins:router_on"})
		if wifi == nil then
			local timer = minetest.get_node_timer(pos)
			local meta = minetest.get_meta(pos)
			local node = minetest.get_node(pos)
			minetest.swap_node(pos, {name = 'mycoins:home_computer', param2 = node.param2})
			meta:set_string("formspec", default.computer_wifi_formspec(pos))
			meta:set_string("infotext", "Home Computer (owner "..
			meta:get_string("owner")..")")
			local inv = meta:get_inventory()
			inv:set_size("main", 4*2)
			timer:stop()
		else
			local timer = minetest.get_node_timer(pos)
			local meta = minetest.get_meta(pos)
			local node = minetest.get_node(pos)
			meta:set_string("formspec", default.computer_formspec(pos))
			meta:set_string("infotext", "Home Computer (owner "..
			meta:get_string("owner")..")")
			local inv = meta:get_inventory()
			inv:set_size("main", 4*2)
			timer:start(home_boot)
		end
		else
			local timer = minetest.get_node_timer(pos)
			local meta = minetest.get_meta(pos)
			local node = minetest.get_node(pos)
			meta:set_string("formspec", default.computer_formspec(pos))
			meta:set_string("infotext", "Home Computer (owner "..
			meta:get_string("owner")..")")
			local inv = meta:get_inventory()
			inv:set_size("main", 4*2)
			timer:start(home_boot)
		end
	end,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", default.computer_formspec(pos))
		meta:set_string("infotext", "Computer")
		local inv = meta:get_inventory()
		inv:set_size("main", 4*2)
		end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main") and computer_owner(meta, player)
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		if not computer_owner(meta, player) then
			return 0
		end
		return count
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		return 0
	end,
    allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if not computer_owner(meta, player) then
			return 0
		end
		return stack:get_count()
	end,
})

minetest.register_node("mycoins:home_computer_active",{
	drawtype = "nodebox",
	description = "Home Computer",
	tiles = {"mycoins_home_computer_tp.png","mycoins_home_computer_bt.png","mycoins_home_computer_rt.png","mycoins_home_computer_lt.png","mycoins_home_computer_bk.png","mycoins_home_computer_ft.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 8,
	drop = "mycoins:home_computer",
	groups = {cracky=2, not_in_creative_inventory=1, oddly_breakable_by_hand=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.500000,0.03125,0.500000,0.500000,0.40625},
			{-0.40625,-0.40625,0.40625,0.40625,0.40625,0.50000},
			{-0.500000,-0.500000,-0.500000,0.500000,-0.375,-0.03125},
		},
	},
	sounds = default.node_sound_wood_defaults(),
	on_timer = function(pos)
		local isp = minetest.find_node_near(pos, 3, {"mycoins:isp_on"})
		if isp == nil then
			local wifi = minetest.find_node_near(pos, 30, {"mycoins:router_on"})
			if wifi == nil then
				local timer = minetest.get_node_timer(pos)
				local meta = minetest.get_meta(pos)
				local node = minetest.get_node(pos)
				minetest.swap_node(pos, {name = 'mycoins:home_computer', param2 = node.param2})
				meta:set_string("formspec", default.computer_wifi_formspec(pos))
				meta:set_string("infotext", "Home Computer (owner "..
				meta:get_string("owner")..")")
				local inv = meta:get_inventory()
				inv:set_size("main", 4*2)
				timer:stop()
			else
				local meta = minetest.get_meta(pos)
				if ( minetest.get_player_by_name(meta:get_string("owner")) == nil ) then
					local timer = minetest.get_node_timer(pos)
					local meta = minetest.get_meta(pos)
					local node = minetest.get_node(pos)
					minetest.swap_node(pos, {name = 'mycoins:home_computer', param2 = node.param2})
					meta:set_string("formspec", default.computer_off_formspec(pos))
					meta:set_string("infotext", "Home Computer (owner "..
					meta:get_string("owner")..")")
					local inv = meta:get_inventory()
					inv:set_size("main", 4*2)
					timer:stop()
				else
					local timer = minetest.get_node_timer(pos)
					minetest.get_meta(pos):get_inventory():add_item("main", "mycoins:bitcent")
					timer:start(home_miner)
				end
			end
		else
			local meta = minetest.get_meta(pos)
			if ( minetest.get_player_by_name(meta:get_string("owner")) == nil ) then
				local timer = minetest.get_node_timer(pos)
				local meta = minetest.get_meta(pos)
				local node = minetest.get_node(pos)
				minetest.swap_node(pos, {name = 'mycoins:home_computer', param2 = node.param2})
				meta:set_string("formspec", default.computer_off_formspec(pos))
				meta:set_string("infotext", "Home Computer (owner "..
				meta:get_string("owner")..")")
				local inv = meta:get_inventory()
				inv:set_size("main", 4*2)
				timer:stop()
			else
				local timer = minetest.get_node_timer(pos)
				minetest.get_meta(pos):get_inventory():add_item("main", "mycoins:bitcent")
				timer:start(home_miner)
			end
		end
	end,
	on_punch = function(pos)
		local timer = minetest.get_node_timer(pos)
		local meta = minetest.get_meta(pos)
		local node = minetest.get_node(pos)
		minetest.swap_node(pos, {name = 'mycoins:home_computer', param2 = node.param2})
		meta:set_string("formspec", default.computer_off_formspec(pos))
		meta:set_string("infotext", "Home Computer (owner "..
		meta:get_string("owner")..")")
		local inv = meta:get_inventory()
		inv:set_size("main", 4*2)
		timer:stop()
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main") and computer_owner(meta, player)
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		if not computer_owner(meta, player) then
			return 0
		end
		return count
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		return 0
	end,
    allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if not computer_owner(meta, player) then
			return 0
		end
		return stack:get_count()
	end,
})

-- Game Computer
minetest.register_node("mycoins:game_computer",{
	drawtype = "nodebox",
	description = "Gaming Computer",
	tiles = {"mycoins_game_computer_tp.png","mycoins_game_computer_bt.png","mycoins_game_computer_rt.png","mycoins_game_computer_lt.png","mycoins_game_computer_bk.png","mycoins_game_computer_ft_off.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	drop = "mycoins:game_computer",
	groups = {cracky=2, oddly_breakable_by_hand=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.500000,0.03125,0.500000,0.500000,0.40625},
			{-0.40625,-0.40625,0.40625,0.40625,0.40625,0.50000},
			{-0.500000,-0.500000,-0.500000,0.500000,-0.375,-0.03125},
		},
	},
	sounds = default.node_sound_wood_defaults(),
	after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		local timer = minetest.get_node_timer(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", "Gaming Computer (owner "..
		meta:get_string("owner")..")")
		timer:start(game_boot)
	end,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", default.computer_formspec(pos))
		meta:set_string("infotext", "Gaming Computer (owner "..
		meta:get_string("owner")..")")
		local inv = meta:get_inventory()
		inv:set_size("main", 4*2)
		end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main") and computer_owner(meta, player)
	end,
	on_timer = function(pos)
		local isp = minetest.find_node_near(pos, 3, {"mycoins:isp_on"})
		if isp == nil then
			local wifi = minetest.find_node_near(pos, 30, {"mycoins:router_on"})
			if wifi == nil then
				local timer = minetest.get_node_timer(pos)
				local meta = minetest.get_meta(pos)
				local node = minetest.get_node(pos)
				minetest.swap_node(pos, {name = 'mycoins:game_computer', param2 = node.param2})
				meta:set_string("formspec", default.computer_wifi_formspec(pos))
				meta:set_string("infotext", "Game Computer (owner "..
				meta:get_string("owner")..")")
				local inv = meta:get_inventory()
				inv:set_size("main", 4*2)
				timer:stop()
			else
				local meta = minetest.get_meta(pos)
				if ( minetest.get_player_by_name(meta:get_string("owner")) == nil ) then
					local timer = minetest.get_node_timer(pos)
					local meta = minetest.get_meta(pos)
					local node = minetest.get_node(pos)
					minetest.swap_node(pos, {name = 'mycoins:game_computer', param2 = node.param2})
					meta:set_string("formspec", default.computer_off_formspec(pos))
					meta:set_string("infotext", "Game Computer (owner "..
					meta:get_string("owner")..")")
					local inv = meta:get_inventory()
					inv:set_size("main", 4*2)
					timer:stop()
				else
					local timer = minetest.get_node_timer(pos)
					local meta = minetest.get_meta(pos)
					local node = minetest.get_node(pos)
					minetest.swap_node(pos, {name = 'mycoins:game_computer_active', param2 = node.param2})
					meta:set_string("formspec", default.active_computer_formspec(pos))
					meta:set_string("infotext", "Game Computer (owner "..
					meta:get_string("owner")..")")
					local inv = meta:get_inventory()
					inv:set_size("main", 4*2)
					timer:start(game_miner)
				end
			end
		else
			local meta = minetest.get_meta(pos)
			if ( minetest.get_player_by_name(meta:get_string("owner")) == nil ) then
				local timer = minetest.get_node_timer(pos)
				local meta = minetest.get_meta(pos)
				local node = minetest.get_node(pos)
				minetest.swap_node(pos, {name = 'mycoins:game_computer', param2 = node.param2})
				meta:set_string("formspec", default.computer_off_formspec(pos))
				meta:set_string("infotext", "Game Computer (owner "..
				meta:get_string("owner")..")")
				local inv = meta:get_inventory()
				inv:set_size("main", 4*2)
				timer:stop()
			else
				local timer = minetest.get_node_timer(pos)
				local meta = minetest.get_meta(pos)
				local node = minetest.get_node(pos)
				minetest.swap_node(pos, {name = 'mycoins:game_computer_active', param2 = node.param2})
				meta:set_string("formspec", default.active_computer_formspec(pos))
				meta:set_string("infotext", "Game Computer (owner "..
				meta:get_string("owner")..")")
				local inv = meta:get_inventory()
				inv:set_size("main", 4*2)
				timer:start(game_miner)
			end
		end
	end,
	on_punch = function(pos)
		local isp = minetest.find_node_near(pos, 3, {"mycoins:isp_on"})
		if isp == nil then
			local wifi = minetest.find_node_near(pos, 30, {"mycoins:router_on"})
			if wifi == nil then
				local timer = minetest.get_node_timer(pos)
				local meta = minetest.get_meta(pos)
				local node = minetest.get_node(pos)
				minetest.swap_node(pos, {name = 'mycoins:game_computer', param2 = node.param2})
				meta:set_string("formspec", default.computer_wifi_formspec(pos))
				meta:set_string("infotext", "Game Computer (owner "..
				meta:get_string("owner")..")")
				local inv = meta:get_inventory()
				inv:set_size("main", 4*2)
				timer:stop()
			else
				local timer = minetest.get_node_timer(pos)
				local meta = minetest.get_meta(pos)
				local node = minetest.get_node(pos)
				meta:set_string("formspec", default.computer_formspec(pos))
				meta:set_string("infotext", "Game Computer (owner "..
				meta:get_string("owner")..")")
				local inv = meta:get_inventory()
				inv:set_size("main", 4*2)
				timer:start(game_boot)
			end
		else
			local timer = minetest.get_node_timer(pos)
			local meta = minetest.get_meta(pos)
			local node = minetest.get_node(pos)
			meta:set_string("formspec", default.computer_formspec(pos))
			meta:set_string("infotext", "Game Computer (owner "..
			meta:get_string("owner")..")")
			local inv = meta:get_inventory()
			inv:set_size("main", 4*2)
			timer:start(game_boot)
		end
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		if not computer_owner(meta, player) then
			return 0
		end
		return count
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		return 0
	end,
    allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if not computer_owner(meta, player) then
			return 0
		end
		return stack:get_count()
	end,
})

minetest.register_node("mycoins:game_computer_active",{
	drawtype = "nodebox",
	description = "Game Computer",
	tiles = {"mycoins_game_computer_tp.png","mycoins_game_computer_bt.png","mycoins_game_computer_rt.png","mycoins_game_computer_lt.png","mycoins_game_computer_bk.png","mycoins_game_computer_ft.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 8,
	drop = "mycoins:game_computer",
	groups = {cracky=2, not_in_creative_inventory=1, oddly_breakable_by_hand=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.500000,0.03125,0.500000,0.500000,0.40625},
			{-0.40625,-0.40625,0.40625,0.40625,0.40625,0.50000},
			{-0.500000,-0.500000,-0.500000,0.500000,-0.375,-0.03125},
		},
	},
	sounds = default.node_sound_wood_defaults(),
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main") and computer_owner(meta, player)
	end,
	on_timer = function(pos)
		local isp = minetest.find_node_near(pos, 3, {"mycoins:isp_on"})
		if isp == nil then
			local wifi = minetest.find_node_near(pos, 30, {"mycoins:router_on"})
			if wifi == nil then
				local timer = minetest.get_node_timer(pos)
				local meta = minetest.get_meta(pos)
				local node = minetest.get_node(pos)
				minetest.swap_node(pos, {name = 'mycoins:game_computer', param2 = node.param2})
				meta:set_string("formspec", default.computer_wifi_formspec(pos))
				meta:set_string("infotext", "Game Computer (owner "..
				meta:get_string("owner")..")")
				local inv = meta:get_inventory()
				inv:set_size("main", 4*2)
				timer:stop()
			else
				local meta = minetest.get_meta(pos)
				if ( minetest.get_player_by_name(meta:get_string("owner")) == nil ) then
					local timer = minetest.get_node_timer(pos)
					local meta = minetest.get_meta(pos)
					local node = minetest.get_node(pos)
					minetest.swap_node(pos, {name = 'mycoins:game_computer', param2 = node.param2})
					meta:set_string("formspec", default.computer_off_formspec(pos))
					meta:set_string("infotext", "Game Computer (owner "..
					meta:get_string("owner")..")")
					local inv = meta:get_inventory()
					inv:set_size("main", 4*2)
					timer:stop()
				else
					local timer = minetest.get_node_timer(pos)
					minetest.get_meta(pos):get_inventory():add_item("main", "mycoins:bitcent")
					timer:start(game_miner)
				end
			end
		else
			local meta = minetest.get_meta(pos)
			if ( minetest.get_player_by_name(meta:get_string("owner")) == nil ) then
				local timer = minetest.get_node_timer(pos)
				local meta = minetest.get_meta(pos)
				local node = minetest.get_node(pos)
				minetest.swap_node(pos, {name = 'mycoins:game_computer', param2 = node.param2})
				meta:set_string("formspec", default.computer_off_formspec(pos))
				meta:set_string("infotext", "Game Computer (owner "..
				meta:get_string("owner")..")")
				local inv = meta:get_inventory()
				inv:set_size("main", 4*2)
				timer:stop()
			else
				local timer = minetest.get_node_timer(pos)
				minetest.get_meta(pos):get_inventory():add_item("main", "mycoins:bitcent")
				timer:start(game_miner)
			end
		end
	end,	
	on_punch = function(pos)
	local timer = minetest.get_node_timer(pos)
		local meta = minetest.get_meta(pos)
		local node = minetest.get_node(pos)
		minetest.swap_node(pos, {name = 'mycoins:game_computer', param2 = node.param2})
		meta:set_string("formspec", default.computer_off_formspec(pos))
		meta:set_string("infotext", "Game Computer (owner "..
		meta:get_string("owner")..")")
		local inv = meta:get_inventory()
		inv:set_size("main", 4*2)
		timer:stop()
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		if not computer_owner(meta, player) then
			return 0
		end
		return count
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		return 0
	end,
    allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if not computer_owner(meta, player) then
			return 0
		end
		return stack:get_count()
	end,
})


-- Alienware Computer
minetest.register_node("mycoins:alien_computer",{
	drawtype = "nodebox",
	description = "Alienware Computer",
	tiles = {"mycoins_alien_computer_tp.png","mycoins_alien_computer_bt.png","mycoins_alien_computer_rt.png","mycoins_alien_computer_lt.png","mycoins_alien_computer_bk.png","mycoins_alien_computer_ft_off.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	drop = "mycoins:alien_computer",
	groups = {cracky=2, oddly_breakable_by_hand=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.500000,0.03125,0.500000,0.500000,0.40625},
			{-0.40625,-0.40625,0.40625,0.40625,0.40625,0.50000},
			{-0.500000,-0.500000,-0.500000,0.500000,-0.375,-0.03125},
		},
	},
	sounds = default.node_sound_wood_defaults(),
	after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		local timer = minetest.get_node_timer(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", "Alienware Computer (owner "..
		meta:get_string("owner")..")")
		timer:start(alien_boot)
	end,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", default.computer_formspec(pos))
		meta:set_string("infotext", "Alienware Computer (owner "..
		meta:get_string("owner")..")")
		local inv = meta:get_inventory()
		inv:set_size("main", 4*2)
		end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main") and computer_owner(meta, player)
	end,
	on_timer = function(pos)
		local isp = minetest.find_node_near(pos, 3, {"mycoins:isp_on"})
		if isp == nil then
			local wifi = minetest.find_node_near(pos, 30, {"mycoins:router_on"})
			if wifi == nil then
				local timer = minetest.get_node_timer(pos)
				local meta = minetest.get_meta(pos)
				local node = minetest.get_node(pos)
				minetest.swap_node(pos, {name = 'mycoins:alien_computer', param2 = node.param2})
				meta:set_string("formspec", default.computer_wifi_formspec(pos))
				meta:set_string("infotext", "Alienware Computer (owner "..
				meta:get_string("owner")..")")
				local inv = meta:get_inventory()
				inv:set_size("main", 4*2)
				timer:stop()
			else
				local meta = minetest.get_meta(pos)
				if ( minetest.get_player_by_name(meta:get_string("owner")) == nil ) then
					local timer = minetest.get_node_timer(pos)
					local meta = minetest.get_meta(pos)
					local node = minetest.get_node(pos)
					minetest.swap_node(pos, {name = 'mycoins:alien_computer', param2 = node.param2})
					meta:set_string("formspec", default.computer_off_formspec(pos))
					meta:set_string("infotext", "Alienware Computer (owner "..
					meta:get_string("owner")..")")
					local inv = meta:get_inventory()
					inv:set_size("main", 4*2)
					timer:stop()
				else
					local timer = minetest.get_node_timer(pos)
					local meta = minetest.get_meta(pos)
					local node = minetest.get_node(pos)
					minetest.swap_node(pos, {name = 'mycoins:alien_computer_active', param2 = node.param2})
					meta:set_string("formspec", default.active_computer_formspec(pos))
					meta:set_string("infotext", "Alienware Computer (owner "..
					meta:get_string("owner")..")")
					local inv = meta:get_inventory()
					inv:set_size("main", 4*2)
					timer:start(alien_miner)
				end
			end
		else
			local meta = minetest.get_meta(pos)
			if ( minetest.get_player_by_name(meta:get_string("owner")) == nil ) then
				local timer = minetest.get_node_timer(pos)
				local meta = minetest.get_meta(pos)
				local node = minetest.get_node(pos)
				minetest.swap_node(pos, {name = 'mycoins:alien_computer', param2 = node.param2})
				meta:set_string("formspec", default.computer_off_formspec(pos))
				meta:set_string("infotext", "Alienware Computer (owner "..
				meta:get_string("owner")..")")
				local inv = meta:get_inventory()
				inv:set_size("main", 4*2)
				timer:stop()
			else
				local timer = minetest.get_node_timer(pos)
				local meta = minetest.get_meta(pos)
				local node = minetest.get_node(pos)
				minetest.swap_node(pos, {name = 'mycoins:alien_computer_active', param2 = node.param2})
				meta:set_string("formspec", default.active_computer_formspec(pos))
				meta:set_string("infotext", "Alienware Computer (owner "..
				meta:get_string("owner")..")")
				local inv = meta:get_inventory()
				inv:set_size("main", 4*2)
				timer:start(alien_miner)
			end
		end
	end,
	on_punch = function(pos)
		local isp = minetest.find_node_near(pos, 3, {"mycoins:isp_on"})
		if isp == nil then
			local wifi = minetest.find_node_near(pos, 30, {"mycoins:router_on"})
			if wifi == nil then
				local timer = minetest.get_node_timer(pos)
				local meta = minetest.get_meta(pos)
				local node = minetest.get_node(pos)
				minetest.swap_node(pos, {name = 'mycoins:alien_computer', param2 = node.param2})
				meta:set_string("formspec", default.computer_wifi_formspec(pos))
				meta:set_string("infotext", "Alienware Computer (owner "..
				meta:get_string("owner")..")")
				local inv = meta:get_inventory()
				inv:set_size("main", 4*2)
				timer:stop()
			else
				local timer = minetest.get_node_timer(pos)
				local meta = minetest.get_meta(pos)
				local node = minetest.get_node(pos)
				meta:set_string("formspec", default.computer_formspec(pos))
				meta:set_string("infotext", "Alienware Computer (owner "..
				meta:get_string("owner")..")")
				local inv = meta:get_inventory()
				inv:set_size("main", 4*2)
				timer:start(alien_boot)
			end
		else
			local timer = minetest.get_node_timer(pos)
			local meta = minetest.get_meta(pos)
			local node = minetest.get_node(pos)
			meta:set_string("formspec", default.computer_formspec(pos))
			meta:set_string("infotext", "Alienware Computer (owner "..
			meta:get_string("owner")..")")
			local inv = meta:get_inventory()
			inv:set_size("main", 4*2)
			timer:start(alien_boot)
		end
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		if not computer_owner(meta, player) then
			return 0
		end
		return count
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		return 0
	end,
    allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if not computer_owner(meta, player) then
			return 0
		end
		return stack:get_count()
	end,
})

minetest.register_node("mycoins:alien_computer_active",{
	drawtype = "nodebox",
	description = "Alienware Computer",
	tiles = {"mycoins_alien_computer_tp.png","mycoins_alien_computer_bt.png","mycoins_alien_computer_rt.png","mycoins_alien_computer_lt.png","mycoins_alien_computer_bk.png","mycoins_alien_computer_ft.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 8,
	drop = "mycoins:alien_computer",
	groups = {cracky=2, not_in_creative_inventory=1, oddly_breakable_by_hand=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.500000,0.03125,0.500000,0.500000,0.40625},
			{-0.40625,-0.40625,0.40625,0.40625,0.40625,0.50000},
			{-0.500000,-0.500000,-0.500000,0.500000,-0.375,-0.03125},
		},
	},
	sounds = default.node_sound_wood_defaults(),
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main") and computer_owner(meta, player)
	end,
	on_timer = function(pos)
		local isp = minetest.find_node_near(pos, 3, {"mycoins:isp_on"})
		if isp == nil then
			local wifi = minetest.find_node_near(pos, 30, {"mycoins:router_on"})
			if wifi == nil then
				local timer = minetest.get_node_timer(pos)
				local meta = minetest.get_meta(pos)
				local node = minetest.get_node(pos)
				minetest.swap_node(pos, {name = 'mycoins:alien_computer', param2 = node.param2})
				meta:set_string("formspec", default.computer_wifi_formspec(pos))
				meta:set_string("infotext", "Alienware Computer (owner "..
				meta:get_string("owner")..")")
				local inv = meta:get_inventory()
				inv:set_size("main", 4*2)
				timer:stop()
			else
				local meta = minetest.get_meta(pos)
				if ( minetest.get_player_by_name(meta:get_string("owner")) == nil ) then
					local timer = minetest.get_node_timer(pos)
					local meta = minetest.get_meta(pos)
					local node = minetest.get_node(pos)
					minetest.swap_node(pos, {name = 'mycoins:alien_computer', param2 = node.param2})
					meta:set_string("formspec", default.computer_off_formspec(pos))
					meta:set_string("infotext", "Alienware Computer (owner "..
					meta:get_string("owner")..")")
					local inv = meta:get_inventory()
					inv:set_size("main", 4*2)
					timer:stop()
				else
					local timer = minetest.get_node_timer(pos)
					minetest.get_meta(pos):get_inventory():add_item("main", "mycoins:bitcent")
					timer:start(alien_miner)
				end
			end
		else
			local meta = minetest.get_meta(pos)
			if ( minetest.get_player_by_name(meta:get_string("owner")) == nil ) then
				local timer = minetest.get_node_timer(pos)
				local meta = minetest.get_meta(pos)
				local node = minetest.get_node(pos)
				minetest.swap_node(pos, {name = 'mycoins:alien_computer', param2 = node.param2})
				meta:set_string("formspec", default.computer_off_formspec(pos))
				meta:set_string("infotext", "Alienware Computer (owner "..
				meta:get_string("owner")..")")
				local inv = meta:get_inventory()
				inv:set_size("main", 4*2)
				timer:stop()
			else
				local timer = minetest.get_node_timer(pos)
				minetest.get_meta(pos):get_inventory():add_item("main", "mycoins:bitcent")
				timer:start(alien_miner)
			end
		end
	end,	
	on_punch = function(pos)
	local timer = minetest.get_node_timer(pos)
		local meta = minetest.get_meta(pos)
		local node = minetest.get_node(pos)
		minetest.swap_node(pos, {name = 'mycoins:alien_computer', param2 = node.param2})
		meta:set_string("formspec", default.computer_off_formspec(pos))
		meta:set_string("infotext", "Alienware Computer (owner "..
		meta:get_string("owner")..")")
		local inv = meta:get_inventory()
		inv:set_size("main", 4*2)
		timer:stop()
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		if not computer_owner(meta, player) then
			return 0
		end
		return count
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		return 0
	end,
    allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if not computer_owner(meta, player) then
			return 0
		end
		return stack:get_count()
	end,
})