-- -- -- the GOLD SERIES

minetest.register_node("packed_things:packed_gold", {
	description = "Packed Gold",
	tiles = {"default_gold_block.png^packed1.png"},
	groups = {cracky=3,stone=3},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_gold_2x", {
	description = "2x Packed Gold",
	tiles = {"default_gold_block.png^packed2.png"},
	groups = {cracky=3,stone=3},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_gold_3x", {
	description = "3x Packed gold",
	tiles = {"default_gold_block.png^packed3.png"},
	groups = {cracky=2,stone=2},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_gold_4x", {
	description = "4x Packed gold",
	tiles = {"default_gold_block.png^packed4.png"},
	groups = {cracky=2,stone=2},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_gold_5x", {
	description = "5x Packed gold",
	tiles = {"default_gold_block.png^packed5.png"},
	groups = {cracky=2,stone=1},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_gold_6x", {
	description = "6x Packed gold",
	tiles = {"default_gold_block.png^packed6.png"},
	groups = {cracky=1,stone=1},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_gold_7x", {
	description = "7x Packed gold",
	tiles = {"default_gold_block.png^packed7.png"},
	groups = {cracky=1,stone=1},
--	sounds = default.node_sound_stone_defaults()
})
minetest.register_node("packed_things:packed_gold_8x", {
	description = "Ultra Packed gold",
	tiles = {"default_gold_block.png^packed8.png"},
	groups = {cracky=1,stone=1},
--	sounds = default.node_sound_stone_defaults()
})

-- pack the gold series

minetest.register_craft({
	output = 'packed_things:packed_gold',
	recipe = {
		{'default:goldblock', 'default:goldblock', 'default:goldblock'},
		{'default:goldblock', 'default:goldblock', 'default:goldblock'},
		{'default:goldblock', 'default:goldblock', 'default:goldblock'}
	}
})
minetest.register_craft({
	output = 'packed_things:packed_gold_2x',
	recipe = {
		{'packed_things:packed_gold', 'packed_things:packed_gold', 'packed_things:packed_gold'},
		{'packed_things:packed_gold', 'packed_things:packed_gold', 'packed_things:packed_gold'},
		{'packed_things:packed_gold', 'packed_things:packed_gold', 'packed_things:packed_gold'}
	}
})
local nxt=0
for i=2,7,1 do
	nxt=i+1
	minetest.register_craft({
		output = 'packed_things:packed_gold_'..nxt..'x',
		recipe = {
			{'packed_things:packed_gold_'..i..'x', 'packed_things:packed_gold_'..i..'x', 'packed_things:packed_gold_'..i..'x'},
			{'packed_things:packed_gold_'..i..'x', 'packed_things:packed_gold_'..i..'x', 'packed_things:packed_gold_'..i..'x'},
			{'packed_things:packed_gold_'..i..'x', 'packed_things:packed_gold_'..i..'x', 'packed_things:packed_gold_'..i..'x'}
		}
	})
end

-- unpack the gold items

minetest.register_craft({
	output = 'default:goldblock 9',
	recipe = {
		{'packed_things:packed_gold'}
	}
})

minetest.register_craft({
	output = 'packed_things:packed_gold 9',
	recipe = {
		{'packed_things:packed_gold_2x'}
	}
})

for i=2,7,1 do
	nxt=i+1

	minetest.register_craft({
		output = 'packed_things:packed_gold_'..i..'x 9',
		recipe = {
			{'packed_things:packed_gold_'..nxt..'x'}
		}
	})
end

minetest.log("info", "[packed_things] loaded gold.")
