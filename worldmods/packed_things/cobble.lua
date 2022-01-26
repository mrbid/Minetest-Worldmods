-- packed_things mod: cobble series

minetest.register_node("packed_things:packed_cobble", {
	description = "Packed Cobble",
	tiles = {"cobble1.png"},
	groups = {cracky=3,stone=3},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_cobble_2x", {
	description = "2x Packed Cobble",
	tiles = {"cobble2.png"},
	groups = {cracky=3,stone=3},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_cobble_3x", {
	description = "3x Packed Cobble",
	tiles = {"cobble3.png"},
	groups = {cracky=2,stone=2},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_cobble_4x", {
	description = "4x Packed Cobble",
	tiles = {"cobble4.png"},
	groups = {cracky=2,stone=2},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_cobble_5x", {
	description = "5x Packed Cobble",
	tiles = {"cobble5.png"},
	groups = {cracky=2,stone=1},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_cobble_6x", {
	description = "6x Packed Cobble",
	tiles = {"cobble6.png"},
	groups = {cracky=1,stone=1},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_cobble_7x", {
	description = "7x Packed Cobble",
	tiles = {"cobble7.png"},
	groups = {cracky=1,stone=1},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_cobble_8x", {
	description = "Ultra Packed Cobble",
	tiles = {"cobble8.png"},
	groups = {cracky=1,stone=1},
--	sounds = default.node_sound_stone_defaults()
})

-- if moreblocks is installed, need to convert from cobble_compressed to my packed_cobble

if minetest.get_modpath("moreblocks") then
	minetest.register_craft({
		output = 'packed_things:packed_cobble 2',
		recipe = {
			{'moreblocks:cobble_compressed', 'moreblocks:cobble_compressed'}
		}
	})
	minetest.register_craft({
		output = 'moreblocks:cobble_compressed 2',
		recipe = {
			{'packed_things:packed_cobble', 'packed_things:packed_cobble'}
		}
	})
	else
	minetest.register_craft({
		output = 'packed_things:packed_cobble',
		recipe = {
			{'default:cobble', 'default:cobble', 'default:cobble'},
			{'default:cobble', 'default:cobble', 'default:cobble'},
			{'default:cobble', 'default:cobble', 'default:cobble'}
		}
	})
end
-- pack the cobble items

minetest.register_craft({
	output = 'packed_things:packed_cobble_2x',
	recipe = {
		{'packed_things:packed_cobble', 'packed_things:packed_cobble', 'packed_things:packed_cobble'},
		{'packed_things:packed_cobble', 'packed_things:packed_cobble', 'packed_things:packed_cobble'},
		{'packed_things:packed_cobble', 'packed_things:packed_cobble', 'packed_things:packed_cobble'}
	}
})
local nxt=0
for i=2,7,1 do
	nxt=i+1
	minetest.register_craft({
		output = 'packed_things:packed_cobble_'..nxt..'x',
		recipe = {
			{'packed_things:packed_cobble_'..i..'x', 'packed_things:packed_cobble_'..i..'x', 'packed_things:packed_cobble_'..i..'x'},
			{'packed_things:packed_cobble_'..i..'x', 'packed_things:packed_cobble_'..i..'x', 'packed_things:packed_cobble_'..i..'x'},
			{'packed_things:packed_cobble_'..i..'x', 'packed_things:packed_cobble_'..i..'x', 'packed_things:packed_cobble_'..i..'x'}
		}
	})
end

-- unpack the cobble items

minetest.register_craft({
	output = 'default:cobble 9',
	recipe = {
		{'packed_things:packed_cobble'}
	}
})

minetest.register_craft({
	output = 'packed_things:packed_cobble 9',
	recipe = {
		{'packed_things:packed_cobble_2x'}
	}
})

for i=2,7,1 do
	nxt=i+1

	minetest.register_craft({
		output = 'packed_things:packed_cobble_'..i..'x 9',
		recipe = {
			{'packed_things:packed_cobble_'..nxt..'x'}
		}
	})
end

minetest.log("info", "[packed_things] loaded cobble.")
