-- gave_initial_stuff/init.lua

local stuff_string = minetest.settings:get("initial_stuff") or
		"default:pick_steel,default:axe_steel,default:shovel_steel," ..
		"default:torch 99,default:cobble 99"

give_initial_stuff = {
	items = {}
}

function give_initial_stuff.give(player)
	minetest.log("action",
			"Giving initial stuff to player " .. player:get_player_name())
	local inv = player:get_inventory()
	for _, stack in ipairs(give_initial_stuff.items) do
		inv:add_item("main", stack)
	end

	inv:add_item("main", "default:book_written 1 0 \"\\u0001page\\u00021\\u0003owner\\u0002Admin\\u0003text\\u0002No Spamming\nNo Swearing\nNo Griefing\nNo Stealing\nNo Dating\nNo Bullying\nNo spawn killing\nNo killing other players mobs\n\nBe nice to others\\u0003page_max\\u00021\\u0003title\\u0002The Rule Book\\u0003description\\u0002\\u001b(T@default)\\u001bFThe Rule Book\\u001bE\\u001bE\\u001bE\\u0003\"");
end

function give_initial_stuff.add(stack)
	give_initial_stuff.items[#give_initial_stuff.items + 1] = ItemStack(stack)
end

function give_initial_stuff.clear()
	give_initial_stuff.items = {}
end

function give_initial_stuff.add_from_csv(str)
	local items = str:split(",")
	for _, itemname in ipairs(items) do
		give_initial_stuff.add(itemname)
	end
end

function give_initial_stuff.set_list(list)
	give_initial_stuff.items = list
end

function give_initial_stuff.get_list()
	return give_initial_stuff.items
end

give_initial_stuff.add_from_csv(stuff_string)
if minetest.settings:get_bool("give_initial_stuff") then
	minetest.register_on_newplayer(give_initial_stuff.give)
end
