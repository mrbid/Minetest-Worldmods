-- -- -- the SNOW SERIES

minetest.register_node("packed_things:packed_snow", {
	description = "Packed Snow",
	tiles = {"snow32.png^packed1.png"},
	groups = {cracky=3,stone=3},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_snow_2x", {
	description = "2x Packed Snow",
	tiles = {"snow32.png^packed2.png"},
	groups = {cracky=3,stone=3},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_snow_3x", {
	description = "3x Packed snow",
	tiles = {"snow32.png^packed3.png"},
	groups = {cracky=2,stone=2},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_snow_4x", {
	description = "4x Packed snow",
	tiles = {"snow32.png^packed4.png"},
	groups = {cracky=2,stone=2},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_snow_5x", {
	description = "5x Packed snow",
	tiles = {"snow32.png^packed5.png"},
	groups = {cracky=2,stone=1},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_snow_6x", {
	description = "6x Packed snow",
	tiles = {"snow32.png^packed6.png"},
	groups = {cracky=1,stone=1},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_snow_7x", {
	description = "7x Packed snow",
	tiles = {"snow32.png^packed7.png"},
	groups = {cracky=1,stone=1},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_snow_8x", {
	description = "Ultra Packed snow",
	tiles = {"snow32.png^packed8.png"},
	groups = {cracky=1,stone=1},
--	sounds = default.node_sound_stone_defaults()
})

-- pack the snow series

minetest.register_craft({
	output = 'packed_things:packed_snow',
	recipe = {
		{'default:snow', 'default:snow', 'default:snow'},
		{'default:snow', 'default:snow', 'default:snow'},
		{'default:snow', 'default:snow', 'default:snow'}
	}
})
minetest.register_craft({
	output = 'packed_things:packed_snow_2x',
	recipe = {
		{'packed_things:packed_snow', 'packed_things:packed_snow', 'packed_things:packed_snow'},
		{'packed_things:packed_snow', 'packed_things:packed_snow', 'packed_things:packed_snow'},
		{'packed_things:packed_snow', 'packed_things:packed_snow', 'packed_things:packed_snow'}
	}
})
local nxt=0
for i=2,7,1 do
	nxt=i+1
	minetest.register_craft({
		output = 'packed_things:packed_snow_'..nxt..'x',
		recipe = {
			{'packed_things:packed_snow_'..i..'x', 'packed_things:packed_snow_'..i..'x', 'packed_things:packed_snow_'..i..'x'},
			{'packed_things:packed_snow_'..i..'x', 'packed_things:packed_snow_'..i..'x', 'packed_things:packed_snow_'..i..'x'},
			{'packed_things:packed_snow_'..i..'x', 'packed_things:packed_snow_'..i..'x', 'packed_things:packed_snow_'..i..'x'}
		}
	})
end

-- unpack the snow items

minetest.register_craft({
	output = 'default:snow 9',
	recipe = {
		{'packed_things:packed_snow'}
	}
})

minetest.register_craft({
	output = 'packed_things:packed_snow 9',
	recipe = {
		{'packed_things:packed_snow_2x'}
	}
})

for i=2,7,1 do
	nxt=i+1

	minetest.register_craft({
		output = 'packed_things:packed_snow_'..i..'x 9',
		recipe = {
			{'packed_things:packed_snow_'..nxt..'x'}
		}
	})
end

minetest.log("info", "[packed_things] loaded snow.")
