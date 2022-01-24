-- -- -- the ICE SERIES

local colorIce = "^[colorize:#44bbbb:60"

minetest.register_node("packed_things:packed_ice", {
	description = "Packed Ice",
	tiles = {"ice32.png^(packed1.png"..colorIce..")"},
	groups = {cracky=3,stone=3},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_ice_2x", {
	description = "2x Packed Ice",
	tiles = {"ice32.png^(packed2.png"..colorIce..")"},
	groups = {cracky=3,stone=3},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_ice_3x", {
	description = "3x Packed Ice",
	tiles = {"ice32.png^(packed3.png"..colorIce..")"},
	groups = {cracky=2,stone=2},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_ice_4x", {
	description = "4x Packed Ice",
	tiles = {"ice32.png^(packed4.png"..colorIce..")"},
	groups = {cracky=2,stone=2},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_ice_5x", {
	description = "5x Packed Ice",
	tiles = {"ice32.png^(packed5.png"..colorIce..")"},
	groups = {cracky=2,stone=1},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_ice_6x", {
	description = "6x Packed Ice",
	tiles = {"ice32.png^(packed6.png"..colorIce..")"},
	groups = {cracky=1,stone=1},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_ice_7x", {
	description = "7x Packed Ice",
	tiles = {"ice32.png^(packed7.png"..colorIce..")"},
	groups = {cracky=1,stone=1},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_ice_8x", {
	description = "Ultra Packed Ice",
	tiles = {"ice32.png^(packed8.png"..colorIce..")"},
	groups = {cracky=1,stone=1},
--	sounds = default.node_sound_stone_defaults()
})

--[[ tried to make em translucent, didn't work:
	
	drawtype="glasslike",
	paramtype = "light",
	sunlight_propagates=true,

]]--
	
-- pack the sand series

local ingred="default:ice";
minetest.register_craft({
	output = 'packed_things:packed_ice',
	recipe = {
		{ingred, ingred, ingred}, {ingred, ingred, ingred}, {ingred, ingred, ingred}
	}
})
local ingred="packed_things:packed_ice";
minetest.register_craft({
	output = 'packed_things:packed_ice_2x',
	recipe = {
		{ingred, ingred, ingred}, {ingred, ingred, ingred}, {ingred, ingred, ingred}
	}
})
local nxt=0
for i=2,7,1 do
	nxt=i+1
	local ingred="packed_things:packed_ice_"..i.."x";
	minetest.register_craft({
		output = 'packed_things:packed_ice_'..nxt..'x',
		recipe = {
		{ingred, ingred, ingred}, {ingred, ingred, ingred}, {ingred, ingred, ingred}
		}
	})
end

-- unpack the sand items

minetest.register_craft({
	output = 'default:ice 9',
	recipe = {
		{'packed_things:packed_ice'}
	}
})

minetest.register_craft({
	output = 'packed_things:packed_ice 9',
	recipe = {
		{'packed_things:packed_ice_2x'}
	}
})

for i=2,7,1 do
	nxt=i+1

	minetest.register_craft({
		output = 'packed_things:packed_ice_'..i..'x 9',
		recipe = {
			{'packed_things:packed_ice_'..nxt..'x'}
		}
	})
end
minetest.log("info", "[packed_things] loaded ice.")
