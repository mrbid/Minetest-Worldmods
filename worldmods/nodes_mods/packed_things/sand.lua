-- -- -- the SAND SERIES

minetest.register_node("packed_things:packed_sand", {
	description = "Packed Sand",
	tiles = {"sand32.png^packed1.png"},
	groups = {cracky=3,stone=3},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_sand_2x", {
	description = "2x Packed Sand",
	tiles = {"sand32.png^packed2.png"},
	groups = {cracky=3,stone=3},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_sand_3x", {
	description = "3x Packed Sand",
	tiles = {"sand32.png^packed3.png"},
	groups = {cracky=2,stone=2},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_sand_4x", {
	description = "4x Packed Sand",
	tiles = {"sand32.png^packed4.png"},
	groups = {cracky=2,stone=2},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_sand_5x", {
	description = "5x Packed Sand",
	tiles = {"sand32.png^packed5.png"},
	groups = {cracky=2,stone=1},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_sand_6x", {
	description = "6x Packed Sand",
	tiles = {"sand32.png^packed6.png"},
	groups = {cracky=1,stone=1},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_sand_7x", {
	description = "7x Packed Sand",
	tiles = {"sand32.png^packed7.png"},
	groups = {cracky=1,stone=1},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_sand_8x", {
	description = "Ultra Packed Sand",
	tiles = {"sand32.png^packed8.png"},
	groups = {cracky=1,stone=1},
--	sounds = default.node_sound_stone_defaults()
})

-- pack the sand series

minetest.register_craft({
	output = 'packed_things:packed_sand',
	recipe = {
		{'default:sand', 'default:sand', 'default:sand'},
		{'default:sand', 'default:sand', 'default:sand'},
		{'default:sand', 'default:sand', 'default:sand'}
	}
})
minetest.register_craft({
	output = 'packed_things:packed_sand_2x',
	recipe = {
		{'packed_things:packed_sand', 'packed_things:packed_sand', 'packed_things:packed_sand'},
		{'packed_things:packed_sand', 'packed_things:packed_sand', 'packed_things:packed_sand'},
		{'packed_things:packed_sand', 'packed_things:packed_sand', 'packed_things:packed_sand'}
	}
})
local nxt=0
for i=2,7,1 do
	nxt=i+1
	minetest.register_craft({
		output = 'packed_things:packed_sand_'..nxt..'x',
		recipe = {
			{'packed_things:packed_sand_'..i..'x', 'packed_things:packed_sand_'..i..'x', 'packed_things:packed_sand_'..i..'x'},
			{'packed_things:packed_sand_'..i..'x', 'packed_things:packed_sand_'..i..'x', 'packed_things:packed_sand_'..i..'x'},
			{'packed_things:packed_sand_'..i..'x', 'packed_things:packed_sand_'..i..'x', 'packed_things:packed_sand_'..i..'x'}
		}
	})
end

-- unpack the sand items

minetest.register_craft({
	output = 'default:sand 9',
	recipe = {
		{'packed_things:packed_sand'}
	}
})

minetest.register_craft({
	output = 'packed_things:packed_sand 9',
	recipe = {
		{'packed_things:packed_sand_2x'}
	}
})

for i=2,7,1 do
	nxt=i+1

	minetest.register_craft({
		output = 'packed_things:packed_sand_'..i..'x 9',
		recipe = {
			{'packed_things:packed_sand_'..nxt..'x'}
		}
	})
end
minetest.log("info", "[packed_things] loaded sand.")
