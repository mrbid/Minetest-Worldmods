
local S = rawget(_G, "intllib") and intllib.Getter() or function(s) return s end
--local S = minetest.get_translator("technic_chests")

local has_pipeworks = minetest.get_modpath("pipeworks")
local has_digilines = minetest.get_modpath("digilines")
local has_protector = minetest.get_modpath("protector")

local tube_entry = has_pipeworks and "^pipeworks_tube_connection_metallic.png" or ""
local protector_overlay = has_protector and "^protector_logo.png" or "^technic_protector_overlay.png"


local cid_data = {}
minetest.register_on_mods_loaded(function()
	for name, def in pairs(minetest.registered_nodes) do
		cid_data[minetest.get_content_id(name)] = {
			name = name,
			drops = def.drops,
			flammable = def.groups.flammable,
			on_blast = def.on_blast,
		}
	end
end)

local function rand_pos(center, pos, radius)
	local def
	local reg_nodes = minetest.registered_nodes
	local i = 0
	repeat
		-- Give up and use the center if this takes too long
		if i > 4 then
			pos.x, pos.z = center.x, center.z
			break
		end
		pos.x = center.x + math.random(-radius, radius)
		pos.z = center.z + math.random(-radius, radius)
		def = reg_nodes[minetest.get_node(pos).name]
		i = i + 1
	until def and not def.walkable
end

local function eject_drops(drops, pos, radius)
	local drop_pos = vector.new(pos)
	for _, item in pairs(drops) do
		local count = math.min(item:get_count(), item:get_stack_max())
		while count > 0 do
			local take = math.max(1,math.min(radius * radius,
					count,
					item:get_stack_max()))
			rand_pos(pos, drop_pos, radius)
			local dropitem = ItemStack(item)
			dropitem:set_count(take)
			local obj = minetest.add_item(drop_pos, dropitem)
			if obj then
				obj:get_luaentity().collect = true
				obj:set_acceleration({x = 0, y = -10, z = 0})
				obj:set_velocity({x = math.random(-3, 3),
						y = math.random(0, 10),
						z = math.random(-3, 3)})
			end
			count = count - take
		end
	end
end

local function add_drop(drops, item)
	item = ItemStack(item)
	local name = item:get_name()
	
	if name == "technic:amethyst_chest" then
		return;
	end

	local drop = drops[name]
	if drop == nil then
		drops[name] = item
	else
		drop:set_count(drop:get_count() + item:get_count())
	end
end

local basic_flame_on_construct -- cached value
local function destroy(drops, npos, cid, c_air, c_fire,
		on_blast_queue, on_construct_queue,
		ignore_protection, ignore_on_blast, owner)
	if not ignore_protection and minetest.is_protected(npos, owner) then
		return cid
	end

	local def = cid_data[cid]

	if not def then
		return c_air
	elseif not ignore_on_blast and def.on_blast then
		on_blast_queue[#on_blast_queue + 1] = {
			pos = vector.new(npos),
			on_blast = def.on_blast
		}
		return cid
	else
		local node_drops = minetest.get_node_drops(def.name, "")
		for _, item in pairs(node_drops) do
			add_drop(drops, item)
		end
		return c_air
	end
end

local function tnt_explode(pos, radius, ignore_protection, ignore_on_blast, owner, explode_center)
	pos = vector.round(pos)
	-- scan for adjacent TNT nodes first, and enlarge the explosion
	local vm1 = VoxelManip()
	local p1 = vector.subtract(pos, 2)
	local p2 = vector.add(pos, 2)
	local minp, maxp = vm1:read_from_map(p1, p2)
	local a = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm1:get_data()
	local count = 0
	local c_tnt
	local c_tnt_burning = minetest.get_content_id("tnt:tnt_burning")
	local c_tnt_boom = minetest.get_content_id("tnt:boom")
	local c_air = minetest.get_content_id("air")
	c_tnt = c_tnt_burning -- tnt is not registered if disabled
	-- make sure we still have explosion even when centre node isnt tnt related
	if explode_center then
		count = 1
	end

	for z = pos.z - 2, pos.z + 2 do
	for y = pos.y - 2, pos.y + 2 do
		local vi = a:index(pos.x - 2, y, z)
		for x = pos.x - 2, pos.x + 2 do
			local cid = data[vi]
			if cid == c_tnt or cid == c_tnt_boom or cid == c_tnt_burning then
				count = count + 1
				data[vi] = c_air
			end
			vi = vi + 1
		end
	end
	end

	vm1:set_data(data)
	vm1:write_to_map()

	-- recalculate new radius
	radius = math.floor(radius * math.pow(count, 1/3))

	-- perform the explosion
	local vm = VoxelManip()
	local pr = PseudoRandom(os.time())
	p1 = vector.subtract(pos, radius)
	p2 = vector.add(pos, radius)
	minp, maxp = vm:read_from_map(p1, p2)
	a = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	data = vm:get_data()

	local drops = {}
	local on_blast_queue = {}
	local on_construct_queue = {}
	basic_flame_on_construct = minetest.registered_nodes["fire:basic_flame"].on_construct

	local c_fire = minetest.get_content_id("fire:basic_flame")
	for z = -radius, radius do
	for y = -radius, radius do
	local vi = a:index(pos.x + (-radius), pos.y + y, pos.z + z)
	for x = -radius, radius do
		local r = vector.length(vector.new(x, y, z))
		if (radius * radius) / (r * r) >= (pr:next(80, 125) / 100) then
			local cid = data[vi]
			local p = {x = pos.x + x, y = pos.y + y, z = pos.z + z}
			if cid ~= c_air then
				data[vi] = destroy(drops, p, cid, c_air, c_fire,
					on_blast_queue, on_construct_queue,
					ignore_protection, ignore_on_blast, owner)
			end
		end
		vi = vi + 1
	end
	end
	end

	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
	vm:update_liquids()

	-- call check_single_for_falling for everything within 1.5x blast radius
	for y = -radius * 1.5, radius * 1.5 do
	for z = -radius * 1.5, radius * 1.5 do
	for x = -radius * 1.5, radius * 1.5 do
		local rad = {x = x, y = y, z = z}
		local s = vector.add(pos, rad)
		local r = vector.length(rad)
		if r / radius < 1.4 then
			minetest.check_single_for_falling(s)
		end
	end
	end
	end

	for _, queued_data in pairs(on_blast_queue) do
		local dist = math.max(1, vector.distance(queued_data.pos, pos))
		local intensity = (radius * radius) / (dist * dist)
		local node_drops = queued_data.on_blast(queued_data.pos, intensity)
		if node_drops then
			for _, item in pairs(node_drops) do
				add_drop(drops, item)
			end
		end
	end

	for _, queued_data in pairs(on_construct_queue) do
		queued_data.fn(queued_data.pos)
	end

	minetest.log("action", "TNT owned by " .. owner .. " detonated at " ..
		minetest.pos_to_string(pos) .. " with radius " .. radius)

	return drops, radius
end

local node_groups = {
	snappy = 2,
	choppy = 2,
	oddly_breakable_by_hand = 2,
	tubedevice = 1,
	tubedevice_receiver = 1,
	technic_chest = 1,
}

local node_groups_t = {
	snappy = 2,
	choppy = 2,
	oddly_breakable_by_hand = 2,
	tubedevice = 1,
	tubedevice_receiver = 1,
	technic_chest = 1,
	falling_node = 1
}

local function getGroups(name)
	if name == "Titanium" or name == "Amethyst" then
		return node_groups_t;
	else
		return node_groups;
	end
end

local function getLight(name)
	if name == "Titanium" or name == "Amethyst" then
		return 14;
	else
		return 0;
	end
end

local function getLightP(name)
	if name == "Titanium" or name == "Amethyst" then
		return true;
	else
		return false;
	end
end

local node_groups_no_inv = {
	snappy = 2,
	choppy = 2,
	oddly_breakable_by_hand = 2,
	tubedevice = 1,
	tubedevice_receiver = 1,
	technic_chest = 1,
	not_in_creative_inventory = 1,
}

local function get_tiles(name, data, color)
	if name == "bones" or name == "bonesgold" or name == "bonesdiamond" or name == "bonespoop" or name == "bonespink" then
		local tiles = {
			"technic_"..name.."_chest_top.png",
			"technic_"..name.."_chest_top.png",
			"technic_"..name.."_chest_side.png",
			"technic_"..name.."_chest_side.png",
			"technic_"..name.."_chest_side.png",
			"technic_"..name.."_chest_front.png"
		}
		return tiles
	elseif name == "diamond" then
		local tiles = {
			"technic_"..name.."_chest_top.png",
			"technic_"..name.."_chest_top.png",
			"technic_"..name.."_chest_side.png",
			"technic_"..name.."_chest_side.png",
			"technic_"..name.."_chest_side.png",
			"technic_"..name.."_chest_front.png"
		}

		if data.color and color then
			tiles[6] = tiles[6].."^technic_chest_overlay_"..technic.chests.colors[color][1]..".png"
		end
		if data.locked then
			tiles[6] = tiles[6].."^technic_"..name.."_chest_lock_overlay.png"
		elseif data.protected then
			tiles[6] = tiles[6]..protector_overlay
		end

		return tiles
	else
		local tiles = {
			"technic_"..name.."_chest_top.png"..tube_entry,
			"technic_"..name.."_chest_top.png"..tube_entry,
			"technic_"..name.."_chest_side.png"..tube_entry,
			"technic_"..name.."_chest_side.png"..tube_entry,
			"technic_"..name.."_chest_side.png"..tube_entry,
			"technic_"..name.."_chest_front.png"
		}

		if data.color and color then
			tiles[6] = tiles[6].."^technic_chest_overlay_"..technic.chests.colors[color][1]..".png"
		end
		if data.locked then
			tiles[6] = tiles[6].."^technic_"..name.."_chest_lock_overlay.png"
		elseif data.protected then
			tiles[6] = tiles[6]..protector_overlay
		end

		return tiles
	end
end

function technic.chests.register_chest(name, data)
	local lname = name:lower()
	name = S(name)
	if data.digilines and not has_digilines then
		data.digilines = nil
	end
	if data.locked then
		data.node_name = "technic:"..lname.."_locked_chest"
		data.description = S("%s Locked Chest"):format(name)
	elseif data.protected then
		data.node_name = "technic:"..lname.."_protected_chest"
		data.description = S("%s Protected Chest"):format(name)
	else
		data.node_name = "technic:"..lname.."_chest"
		data.description = S("%s Chest"):format(name)
	end
	data.formspec = technic.chests.get_formspec(data)
	local def = {
		description = data.description,
		tiles = get_tiles(lname, data),
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		groups = getGroups(name),
		light_source = getLight(name),
		sunlight_propagates = getLightP(name),
		sounds = default.node_sound_wood_defaults(),
		drop = data.node_name,
		after_place_node = function(pos, placer)
			local meta = minetest.get_meta(pos)
			if data.locked then
				local owner = placer:get_player_name() or ""
				meta:set_string("owner", owner)
				meta:set_string("infotext", S("%s Locked Chest (owned by %s)"):format(name, owner))
			else
				meta:set_string("infotext", data.description)
			end
			if has_pipeworks then
				pipeworks.after_place(pos)
			end
		end,
		after_dig_node = function(pos)
			if has_pipeworks then
				pipeworks.after_dig(pos)
			end
		end,
		tube = {
			insert_object = function(pos, node, stack)
				local meta = minetest.get_meta(pos)
				if data.digilines and meta:get_int("send_inject") == 1 then
					technic.chests.send_digiline_message(pos, "inject", nil, {stack:to_table()})
				end
				technic.chests.log_inv_change(pos, "pipeworks tube", "put", stack:get_name())
				return meta:get_inventory():add_item("main", stack)
			end,
			can_insert = function(pos, node, stack)
				local meta = minetest.get_meta(pos)
				if meta:get_int("splitstacks") == 1 then
					stack = stack:peek_item(1)
				end
				local can_insert = meta:get_inventory():room_for_item("main", stack)
				if not can_insert and data.digilines and meta:get_int("send_overflow") == 1 then
					technic.chests.send_digiline_message(pos, "overflow", nil, {stack:to_table()})
				end
				return can_insert
			end,
			remove_items = function(pos, node, stack, dir, count, list, index)
				local meta = minetest.get_meta(pos)
				local item = stack:take_item(count)
				meta:get_inventory():set_stack(list, index, stack)
				if data.digilines and meta:get_int("send_pull") == 1 then
					technic.chests.send_digiline_message(pos, "pull", nil, {item:to_table()})
				end
				technic.chests.log_inv_change(pos, "pipeworks tube", "take", item:get_name())
				return item
			end,
			input_inventory = "main",
			connect_sides = {left=1, right=1, front=1, back=1, top=1, bottom=1},
		},
		on_punch = function(pos, node, player, pointed_thing)
			if name == "Amethyst" then
				if not minetest.is_protected(pointed_thing.under, "23r89raH73bIsA3756t4") then
					local drops, radius = tnt_explode(pos, 9, false, false, player:get_player_name(), true)
					eject_drops(drops, pos, radius)
				else
					minetest.chat_send_player(player:get_player_name(), "Cannot explode, protected area.")
				end
			end
		end,
		on_rightclick = function(pos, node, clicker)

			if name == "Amethyst" then
				local meta = minetest.get_meta(pos)
				local inv = meta:get_inventory()

				local dc = 0;
				for _, object in pairs(minetest.get_objects_inside_radius(pos, 40)) do
					local lua_entity = object:get_luaentity()
					if not object:is_player() and lua_entity and lua_entity.name == "__builtin:item" then
						if lua_entity.itemstring ~= "" then
							if not string.find(lua_entity.itemstring, "cobble") and not string.find(lua_entity.itemstring, "sand") and not string.find(lua_entity.itemstring, "gravel") and not string.find(lua_entity.itemstring, "granite") and not string.find(lua_entity.itemstring, "dirt") and not string.find(lua_entity.itemstring, "marble") and not string.find(lua_entity.itemstring, "bakedclay") and not string.find(lua_entity.itemstring, "default:coal_lump") and not string.find(lua_entity.itemstring, "dry") and not string.find(lua_entity.itemstring, "shrub") and not string.find(lua_entity.itemstring, "grass") and not string.find(lua_entity.itemstring, "bone") then
								inv:add_item("main", lua_entity.itemstring)
								minetest.chat_send_player(clicker:get_player_name(), "Collected " .. lua_entity.itemstring)
								dc = 1;
							else
								minetest.chat_send_player(clicker:get_player_name(), "Destroied " .. lua_entity.itemstring)
							end
							lua_entity.itemstring = ""
						end
						object:remove()
					end
				end
				if dc ~= 0 then
					minetest.chat_send_player(clicker:get_player_name(), meta:get_string("infotext") .. " collection finished.")
				end
			end
			
			if name == "Titanium" then
				local meta = minetest.get_meta(pos)
				local inv = meta:get_inventory()

				local dc = 0;
				for _, object in pairs(minetest.get_objects_inside_radius(pos, 40)) do
					local lua_entity = object:get_luaentity()
					if not object:is_player() and lua_entity and lua_entity.name == "__builtin:item" then
						if lua_entity.itemstring ~= "" then
							if not string.find(lua_entity.itemstring, "default:cobble") and not string.find(lua_entity.itemstring, "default:silver_sand") and not string.find(lua_entity.itemstring, "default:gravel") then
								inv:add_item("main", lua_entity.itemstring)
								minetest.chat_send_player(clicker:get_player_name(), "Collected " .. lua_entity.itemstring)
								dc = 1;
							else
								minetest.chat_send_player(clicker:get_player_name(), "Destroied " .. lua_entity.itemstring)
							end
							lua_entity.itemstring = ""
						end
						object:remove()
					end
				end
				if dc ~= 0 then
					minetest.chat_send_player(clicker:get_player_name(), meta:get_string("infotext") .. " collection finished.")
				end
			end


		end,
		on_construct = function(pos)
			local inv = minetest.get_meta(pos):get_inventory()
			inv:set_size("main", data.width * data.height)
			if data.quickmove then
				inv:set_size("quickmove", 1)
			end
			technic.chests.update_formspec(pos, data)
			if name == "Titanium" then
				inv:add_item("main", "default:book_written 1 0 \"\\u0001page\\u00021\\u0003owner\\u0002Admin\\u0003text\\u0002The Titanium Chest has a few special properies:\n1. Indestructible (most of the time).\n2. Vacuums all surrounding items within 40 node radius.\n3. 24x8 storage capacity.\n4. Is a falling node.\n5. Destroys cobble, silver sand and gravel.\n\nIt\'s best to move your chest using the Wrench rather than relying on its falling_node property every time. Falling nodes can glitch out of the mineverse.\\u0003page_max\\u00021\\u0003title\\u0002Instructions\\u0003description\\u0002\\u001b(T@default)\\u001bFInstructions\\u001bE\\u001bE\\u001bE\\u0003\"")
			elseif name == "Amethyst" then
				inv:add_item("main", "default:book_written 1 0 \"\\u0001page\\u00021\\u0003owner\\u0002Admin\\u0003text\\u0002I will explode when you punch me in an unprotected area. I will destroy anything that is common. Pick me up by right clicking me with the wrench provided.\\u0003page_max\\u00021\\u0003title\\u0002Instructions\\u0003description\\u0002\\u001b(T@default)\\u001bFInstructions\\u001bE\\u001bE\\u001bE\\u0003\"")
				inv:add_item("main", "wrench:wrench")
			end
		end,
		can_dig = function(pos, player)
			if not technic.chests.change_allowed(pos, player, data.locked, data.protected) then
				return false
			end
			return minetest.get_meta(pos):get_inventory():is_empty("main")
		end,
		allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
			if not technic.chests.change_allowed(pos, player, data.locked, data.protected) then
				return 0
			end
			if data.quickmove and to_list == "quickmove" then
				local meta = minetest.get_meta(pos)
				local inv = meta:get_inventory()
				local stack = inv:get_stack("main", from_index)
				
				if leftover ~= nil then
					if not leftover:is_empty() then
						from_inv:set_stack("main", i, leftover)
						stack:set_count(stack:get_count() - leftover:get_count())
					else
						if stack:get_count() > 1 then
							from_inv:set_stack("main", i, "")
						end
					end
				end

				local moved_items = technic.chests.move_inv(inv, player:get_inventory(), stack:get_name())
				if data.digilines and meta:get_int("send_take") == 1 then
					technic.chests.send_digiline_message(pos, "take", player, moved_items)
				end
				technic.chests.log_inv_change(pos, player:get_player_name(), "take", "stuff")
				return 0
			end
			return count
		end,
		allow_metadata_inventory_put = function(pos, listname, index, stack, player)
			if not technic.chests.change_allowed(pos, player, data.locked, data.protected) then
				return 0
			end
			if data.quickmove and listname == "quickmove" then
				local meta = minetest.get_meta(pos)
				local inv = meta:get_inventory()
				local moved_items = technic.chests.move_inv(player:get_inventory(), inv, stack:get_name())
				if data.digilines and meta:get_int("send_put") == 1 then
					technic.chests.send_digiline_message(pos, "put", player, moved_items)
				end
				technic.chests.log_inv_change(pos, player:get_player_name(), "put", "stuff")
				return 0
			end
			return stack:get_count()
		end,
		allow_metadata_inventory_take = function(pos, listname, index, stack, player)
			if not technic.chests.change_allowed(pos, player, data.locked, data.protected) then
				return 0
			end
			return stack:get_count()
		end,
		on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
			technic.chests.log_inv_change(pos, player:get_player_name(), "move", "stuff")
		end,
		on_metadata_inventory_put = function(pos, listname, index, stack, player)

			-- duplicate items put into diamond chest if stack is 1
			if name == "Diamond" then
				if stack:get_count() == 1 then
					local meta = minetest.get_meta(pos)
					local inv = meta:get_inventory()
					inv:add_item("main", stack)
				end
			end
			
			if data.digilines and minetest.get_meta(pos):get_int("send_put") == 1 then
				technic.chests.send_digiline_message(pos, "put", player, {stack:to_table()})
			end
			technic.chests.log_inv_change(pos, player:get_player_name(), "put", stack:get_name())
		end,
		on_metadata_inventory_take = function(pos, listname, index, stack, player)
			if data.digilines and minetest.get_meta(pos):get_int("send_take") == 1 then
				technic.chests.send_digiline_message(pos, "take", player, {stack:to_table()})
			end
			technic.chests.log_inv_change(pos, player:get_player_name(), "take", stack:get_name())
		end,
		on_blast = function(pos)
			if data.locked or data.protected or name == "Titanium" then
				return
			end
			local drops = {}
			default.get_inventory_drops(pos, "main", drops)
			drops[#drops+1] = data.node_name
			minetest.remove_node(pos)
			return drops
		end,
		on_receive_fields = technic.chests.get_receive_fields(data),
	}
	if data.locked then
		def.on_skeleton_key_use = function(pos, player, newsecret)
			-- Copied from default chests.lua
			local meta = minetest.get_meta(pos)
			local owner = meta:get_string("owner")
			local player_name = player:get_player_name()
			if owner ~= player_name then
				minetest.record_protection_violation(pos, player_name)
				minetest.chat_send_player(player_name, "You do not own this chest.")
				return nil
			end
			local secret = meta:get_string("key_lock_secret")
			if secret == "" then
				secret = newsecret
				meta:set_string("key_lock_secret", secret)
			end
			return secret, "a locked chest", owner
		end
	end
	if data.digilines then
		def.digiline = {
			receptor = {},
			effector = {
				action = technic.chests.digiline_effector
			},
		}
	end
	if name == "Titanium" then
		def.mesecons = {effector = {
			action_on = function(pos,node)

				local meta = minetest.get_meta(pos)
				local inv = meta:get_inventory()

				local dc = 0;
				for _, object in pairs(minetest.get_objects_inside_radius(pos, 40)) do
					local lua_entity = object:get_luaentity()
					if not object:is_player() and lua_entity and lua_entity.name == "__builtin:item" then
						if lua_entity.itemstring ~= "" then
							if not string.find(lua_entity.itemstring, "default:cobble") and not string.find(lua_entity.itemstring, "default:silver_sand") and not string.find(lua_entity.itemstring, "default:gravel") then
								inv:add_item("main", lua_entity.itemstring)
							end
							lua_entity.itemstring = ""
						end
						object:remove()
					end
				end

			end
			}
		};
	end
	minetest.register_node(":"..data.node_name, def)
	if data.color then
		for i = 1, 15 do
			local colordef = {}
			for k, v in pairs(def) do
				colordef[k] = v
			end
			colordef.groups = node_groups_no_inv
			colordef.tiles = get_tiles(lname, data, i)
			minetest.register_node(":"..data.node_name.."_"..technic.chests.colors[i][1], colordef)
		end
	end
end
