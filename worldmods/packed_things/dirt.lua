--  -- --    DIRT sequence

minetest.register_node("packed_things:packed_dirt", {
	description = "Packed Dirt",
	tiles = {"dirt1.png"},
	groups = {cracky=3,stone=3},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_dirt_2x", {
	description = "2x Packed Dirt",
	tiles = {"dirt2.png"},
	groups = {cracky=3,stone=3},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_dirt_3x", {
	description = "3x Packed Dirt",
	tiles = {"dirt3.png"},
	groups = {cracky=2,stone=2},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_dirt_4x", {
	description = "4x Packed Dirt",
	tiles = {"dirt4.png"},
	groups = {cracky=2,stone=2},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_dirt_5x", {
	description = "5x Packed Dirt",
	tiles = {"dirt5.png"},
	groups = {cracky=2,stone=1},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_dirt_6x", {
	description = "6x Packed Dirt",
	tiles = {"dirt6.png"},
	groups = {cracky=1,stone=1},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_dirt_7x", {
	description = "7x Packed Dirt",
	tiles = {"dirt7.png"},
	groups = {cracky=1,stone=1},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_dirt_8x", {
	description = "Ultra Packed Dirt",
	tiles = {"dirt8.png"},
	groups = {cracky=1,stone=1},
--	sounds = default.node_sound_stone_defaults()
})

-- pack the dirt series

minetest.register_craft({
	output = 'packed_things:packed_dirt',
	recipe = {
		{'default:dirt', 'default:dirt', 'default:dirt'},
		{'default:dirt', 'default:dirt', 'default:dirt'},
		{'default:dirt', 'default:dirt', 'default:dirt'}
	}
})
minetest.register_craft({
	output = 'packed_things:packed_dirt_2x',
	recipe = {
		{'packed_things:packed_dirt', 'packed_things:packed_dirt', 'packed_things:packed_dirt'},
		{'packed_things:packed_dirt', 'packed_things:packed_dirt', 'packed_things:packed_dirt'},
		{'packed_things:packed_dirt', 'packed_things:packed_dirt', 'packed_things:packed_dirt'}
	}
})
local nxt=0
for i=2,7,1 do
	nxt=i+1
	minetest.register_craft({
		output = 'packed_things:packed_dirt_'..nxt..'x',
		recipe = {
			{'packed_things:packed_dirt_'..i..'x', 'packed_things:packed_dirt_'..i..'x', 'packed_things:packed_dirt_'..i..'x'},
			{'packed_things:packed_dirt_'..i..'x', 'packed_things:packed_dirt_'..i..'x', 'packed_things:packed_dirt_'..i..'x'},
			{'packed_things:packed_dirt_'..i..'x', 'packed_things:packed_dirt_'..i..'x', 'packed_things:packed_dirt_'..i..'x'}
		}
	})
end

-- unpack the dirt items

minetest.register_craft({
	output = 'default:dirt 9',
	recipe = {
		{'packed_things:packed_dirt'}
	}
})

minetest.register_craft({
	output = 'packed_things:packed_dirt 9',
	recipe = {
		{'packed_things:packed_dirt_2x'}
	}
})

for i=2,7,1 do
	nxt=i+1

	minetest.register_craft({
		output = 'packed_things:packed_dirt_'..i..'x 9',
		recipe = {
			{'packed_things:packed_dirt_'..nxt..'x'}
		}
	})
end
minetest.log("info", "[packed_things] loaded dirt.")
