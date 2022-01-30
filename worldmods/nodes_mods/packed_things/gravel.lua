-- -- -- the gravel SERIES

local colorGravel = "^[colorize:#1f1f9f:60"

minetest.register_node("packed_things:packed_gravel", {
	description = "Packed Gravel",
	tiles = {"gravel32.png^(packed1.png"..colorGravel..")"},
	groups = {cracky=3,stone=3},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_gravel_2x", {
	description = "2x Packed Gravel",
	tiles = {"gravel32.png^(packed2.png"..colorGravel..")"},
	groups = {cracky=3,stone=3},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_gravel_3x", {
	description = "3x Packed Gravel",
	tiles = {"gravel32.png^(packed3.png"..colorGravel..")"},
	groups = {cracky=2,stone=2},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_gravel_4x", {
	description = "4x Packed Gravel",
	tiles = {"gravel32.png^(packed4.png"..colorGravel..")"},
	groups = {cracky=2,stone=2},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_gravel_5x", {
	description = "5x Packed Gravel",
	tiles = {"gravel32.png^(packed5.png"..colorGravel..")"},
	groups = {cracky=2,stone=1},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_gravel_6x", {
	description = "6x Packed Gravel",
	tiles = {"gravel32.png^(packed6.png"..colorGravel..")"},
	groups = {cracky=1,stone=1},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_gravel_7x", {
	description = "7x Packed Gravel",
	tiles = {"gravel32.png^(packed7.png"..colorGravel..")"},
	groups = {cracky=1,stone=1},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_gravel_8x", {
	description = "Ultra Packed Gravel",
	tiles = {"gravel32.png^(packed8.png"..colorGravel..")"},
	groups = {cracky=1,stone=1},
--	sounds = default.node_sound_stone_defaults()
})

-- pack the sand series

local ingred="default:gravel";
minetest.register_craft({
	output = 'packed_things:packed_gravel',
	recipe = {
		{ingred, ingred, ingred}, {ingred, ingred, ingred}, {ingred, ingred, ingred}
	}
})
local ingred="packed_things:packed_gravel";
minetest.register_craft({
	output = 'packed_things:packed_gravel_2x',
	recipe = {
		{ingred, ingred, ingred}, {ingred, ingred, ingred}, {ingred, ingred, ingred}
	}
})
local nxt=0
for i=2,7,1 do
	nxt=i+1
	local ingred="packed_things:packed_gravel_"..i.."x";
	minetest.register_craft({
		output = 'packed_things:packed_gravel_'..nxt..'x',
		recipe = {
		{ingred, ingred, ingred}, {ingred, ingred, ingred}, {ingred, ingred, ingred}
		}
	})
end

-- unpack the sand items

minetest.register_craft({
	output = 'default:gravel 9',
	recipe = {
		{'packed_things:packed_gravel'}
	}
})

minetest.register_craft({
	output = 'packed_things:packed_gravel 9',
	recipe = {
		{'packed_things:packed_gravel_2x'}
	}
})

for i=2,7,1 do
	nxt=i+1

	minetest.register_craft({
		output = 'packed_things:packed_gravel_'..i..'x 9',
		recipe = {
			{'packed_things:packed_gravel_'..nxt..'x'}
		}
	})
end
minetest.log("info", "[packed_things] loaded gravel.")
