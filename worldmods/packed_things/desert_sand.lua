-- -- -- the DESERT SAND SERIES

local colorDirt = "^[colorize:#880022:88"

minetest.register_node("packed_things:packed_desert_sand", {
	description = "Packed Desert Sand",
	tiles = {"desert_sand32.png^(packed1.png"..colorDirt..")"},
	groups = {cracky=3,stone=3},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_desert_sand_2x", {
	description = "2x Packed Desert Sand",
	tiles = {"desert_sand32.png^(packed2.png"..colorDirt..")"},
	groups = {cracky=3,stone=3},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_desert_sand_3x", {
	description = "3x Packed Desert Sand",
	tiles = {"desert_sand32.png^(packed3.png"..colorDirt..")"},
	groups = {cracky=2,stone=2},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_desert_sand_4x", {
	description = "4x Packed Desert Sand",
	tiles = {"desert_sand32.png^(packed4.png"..colorDirt..")"},
	groups = {cracky=2,stone=2},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_desert_sand_5x", {
	description = "5x Packed Desert Sand",
	tiles = {"desert_sand32.png^(packed5.png"..colorDirt..")"},
	groups = {cracky=2,stone=1},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_desert_sand_6x", {
	description = "6x Packed Desert Sand",
	tiles = {"desert_sand32.png^(packed6.png"..colorDirt..")"},
	groups = {cracky=1,stone=1},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_desert_sand_7x", {
	description = "7x Packed Desert Sand",
	tiles = {"desert_sand32.png^(packed7.png"..colorDirt..")"},
	groups = {cracky=1,stone=1},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_desert_sand_8x", {
	description = "Ultra Packed Desert Sand",
	tiles = {"desert_sand32.png^(packed8.png"..colorDirt..")"},
	groups = {cracky=1,stone=1},
--	sounds = default.node_sound_stone_defaults()
})

-- pack the sand series

local ingred="default:desert_sand";
minetest.register_craft({
	output = 'packed_things:packed_desert_sand',
	recipe = {
		{ingred, ingred, ingred}, {ingred, ingred, ingred}, {ingred, ingred, ingred}
	}
})
local ingred="packed_things:packed_desert_sand";
minetest.register_craft({
	output = 'packed_things:packed_desert_sand_2x',
	recipe = {
		{ingred, ingred, ingred}, {ingred, ingred, ingred}, {ingred, ingred, ingred}
	}
})
local nxt=0
for i=2,7,1 do
	nxt=i+1
	local ingred="packed_things:packed_desert_sand_"..i.."x";
	minetest.register_craft({
		output = 'packed_things:packed_desert_sand_'..nxt..'x',
		recipe = {
		{ingred, ingred, ingred}, {ingred, ingred, ingred}, {ingred, ingred, ingred}
		}
	})
end

-- unpack the sand items

minetest.register_craft({
	output = 'default:desert_sand 9',
	recipe = {
		{'packed_things:packed_desert_sand'}
	}
})

minetest.register_craft({
	output = 'packed_things:packed_desert_sand 9',
	recipe = {
		{'packed_things:packed_desert_sand_2x'}
	}
})

for i=2,7,1 do
	nxt=i+1

	minetest.register_craft({
		output = 'packed_things:packed_desert_sand_'..i..'x 9',
		recipe = {
			{'packed_things:packed_desert_sand_'..nxt..'x'}
		}
	})
end
minetest.log("info", "[packed_things] loaded desert sand.")
