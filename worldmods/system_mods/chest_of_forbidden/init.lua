-- originally chest of everything
-- https://github.com/mrbid/Minetest-Worldmods
local F = minetest.formspec_escape

function firstToUpper(str)
	return (str:gsub("^%l", string.upper))
end

function fancy_string(name)
    name = name:gsub(".*:", "")
    name = name:gsub('%W', ' ')
    name = name:gsub("(%l)(%w*)", function(a,b) return string.upper(a)..b end)
    return name
end

local chest_name = "forbidden"
local chest_description = "Grants access to "..firstToUpper(chest_name).." nodes."
local icols = 14
local irows = 11

-- Create a detached inventory
local inv_everything = minetest.create_detached_inventory(chest_name.."_inv", {
	allow_move = function(inv, from_list, from_index, to_list, to_index, count, player)
		return 0
	end,
	allow_put = function(inv, listname, index, stack, player)
		return 0
	end,
	allow_take = function(inv, listname, index, stack, player)
		return -1
	end,
})
local inv_trash = minetest.create_detached_inventory("trash", {
	allow_take = function(inv, listname, index, stack, player)
		return 0
	end,
	allow_move = function(inv, from_list, from_index, to_list, to_index, count, player)
		return 0
	end,
	on_put = function(inv, listname, index, stack, player)
		inv:set_list("main", {})
	end,
})
inv_trash:set_size("main", 1)

local items_per_page = (icols*irows)
local max_page = 1

local function get_chest_formspec(page)
	local start = 0 + (page-1)*items_per_page
	return "size["..icols..","..(irows+5).."]"..
	"list[detached:"..chest_name.."_inv;main;0,0;"..icols..","..irows..";"..start.."]"..
	"list[current_player;main;0,"..(irows+1)..";8,4;]"..
	"label[6,"..irows..";Trash:]"..
	"list[detached:trash;main;7,"..irows..";1,1]"..
	"button[0,"..irows..";1,1;chest_of_"..chest_name.."_prev;"..F("<").."]"..
	"button[1,"..irows..";1,1;chest_of_"..chest_name.."_next;"..F(">").."]"..
	"label[2,"..irows..";"..F("Page: "..page).."]"..
	"listring[detached:"..chest_name.."_inv;main]"..
	"listring[current_player;main]"..
	"listring[detached:trash;main]"
end

minetest.register_node("chest_of_"..chest_name..":chest", {
	description = "Chest of " .. firstToUpper(chest_name) .. "\n" ..
		"Grants access to all items",
	tiles ={"chest_of_"..chest_name.."_chest.png^[sheet:2x2:0,0", "chest_of_"..chest_name.."_chest.png^[sheet:2x2:0,0",
		"chest_of_"..chest_name.."_chest.png^[sheet:2x2:1,0", "chest_of_"..chest_name.."_chest.png^[sheet:2x2:1,0",
		"chest_of_"..chest_name.."_chest.png^[sheet:2x2:1,0", "chest_of_"..chest_name.."_chest.png^[sheet:2x2:0,1"},
	paramtype2 = "facedir",
	groups = {dig_immediate=2,choppy=3,not_in_creative_inventory=1},
	is_ground_content = false,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", "Chest of "..firstToUpper(chest_name))
		meta:set_int("page", 1)
		meta:set_string("formspec", get_chest_formspec(1))
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		if formname == "" then
			local meta = minetest.get_meta(pos)
			local page = meta:get_int("page")
			if fields["chest_of_"..chest_name.."_prev"] then
				page = page - 1
			elseif fields["chest_of_"..chest_name.."_next"] then
				page = page + 1
			end
			if page < 1 then
				page = 1
			end
			if page > max_page then
				page = max_page
			end
			meta:set_int("page", page)
			meta:set_string("formspec", get_chest_formspec(page))
		end
	end,
})

minetest.register_on_mods_loaded(function()
	local items = {}
	for itemstring,_ in pairs(minetest.registered_items) do
		if itemstring ~= "" and itemstring ~= "unknown" and itemstring ~= "ignore" and itemstring ~= "chest_of_forbidden:chest" and minetest.get_item_group(itemstring, "not_in_creative_inventory") == 1 and minetest.get_item_group(itemstring, "cnc_node") == 0 then
			table.insert(items, itemstring)
		end
	end
	--[[ Sort items in this order:
	* Chest of Everything
	* Test tools
	* Other tools
	* Craftitems
	* Other items
	* Dummy items ]]
	local function compare(item1, item2)
		local def1 = minetest.registered_items[item1]
		local def2 = minetest.registered_items[item2]
		local tool1 = def1.type == "tool"
		local tool2 = def2.type == "tool"
		local testtool1 = minetest.get_item_group(item1, "testtool") == 1
		local testtool2 = minetest.get_item_group(item2, "testtool") == 1
		local dummy1 = minetest.get_item_group(item1, "dummy") == 1
		local dummy2 = minetest.get_item_group(item2, "dummy") == 1
		local craftitem1 = def1.type == "craft"
		local craftitem2 = def2.type == "craft"
		if item1 == "chest_of_"..chest_name..":chest" then
			return true
		elseif item2 == "chest_of_"..chest_name..":chest" then
			return false
		elseif dummy1 and not dummy2 then
			return false
		elseif not dummy1 and dummy2 then
			return true
		elseif testtool1 and not testtool2 then
			return true
		elseif not testtool1 and testtool2 then
			return false
		elseif tool1 and not tool2 then
			return true
		elseif not tool1 and tool2 then
			return false
		elseif craftitem1 and not craftitem2 then
			return true
		elseif not craftitem1 and craftitem2 then
			return false
		else
			return item1 < item2
		end
	end
	table.sort(items, compare)
	inv_everything:set_size("main", #items)
	max_page = math.ceil(#items / items_per_page)
	for i=1, #items do
		inv_everything:add_item("main", items[i])
	end
end)
