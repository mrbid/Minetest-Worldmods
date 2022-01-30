--
-- Backwards compatibility stuff
--

minetest.register_alias("glowblocks:lightblock", "glowblocks:lightblock_on")
minetest.register_alias("glowblocks:lightblockdirt", "glowblocks:lightblockdirt_on")
minetest.register_alias("glowblocks:lightblockstone", "glowblocks:lightblockstone_on")
minetest.register_alias("glowblocks:lightblockgrass", "glowblocks:lightblockgrass_on")

-- --------- --
-- Block---- --
-- --------- --

minetest.register_node("glowblocks:lightblock_on", {
tile_images = {"glowblocks_light.png"},
inventory_image = "glowblocks_light_icon.png",
drawtype = "raillike",
walkable = false,
description = "Light Block Panel",
groups={snappy=2,choppy=2,oddly_breakable_by_hand=2},
light_source = 14,
drop = "glowblocks:lightblock_on",
mesecons = {conductor = {
    state = mesecon.state.off,
    onstate = "glowblocks:lightblock_off",
  }}
})

minetest.register_node("glowblocks:lightblock_off", {
tile_images = {"glowblocks_light.png"},
drawtype = "raillike",
walkable = false,
description = "Light Block Panel",
groups={snappy=2,choppy=2,oddly_breakable_by_hand=2,not_in_creative_inventory=1},
light_source = 0,
drop = "glowblocks:lightblock_on",
mesecons = {conductor = {
    state = mesecon.state.on,
    offstate = "glowblocks:lightblock_on",
  }}
})

minetest.register_craft({
output = '"glowblocks:lightblock_on" 1',
recipe = {
{'', 'default:torch', ''},
{'', 'default:torch', ''},
{'', '', ''},
}
})

-- --------- --
-- Dirt----- --
-- --------- --

minetest.register_node("glowblocks:lightblockdirt_on", {
tile_images = {"default_dirt.png^glowblocks_light.png"},
description = "Light Block Dirt",
groups={snappy=2,choppy=2,oddly_breakable_by_hand=2},
light_source = 14,
drop = "glowblocks:lightblockdirt_on",
mesecons = {conductor = {
state = mesecon.state.off,
onstate = "glowblocks:lightblockdirt_off",
}}
})

minetest.register_node("glowblocks:lightblockdirt_off", {
tile_images = {"default_dirt.png^glowblocks_light.png"},
description = "Light Block Dirt",
groups={snappy=2,choppy=2,oddly_breakable_by_hand=2,not_in_creative_inventory=1},
light_source = 0,
drop = "glowblocks:lightblockdirt_on",
mesecons = {conductor = {
state = mesecon.state.on,
offstate = "glowblocks:lightblockdirt_on",
}}
})

minetest.register_craft({
output = '"glowblocks:lightblockdirt_on" 1',
recipe = {
{'', 'default:dirt', ''},
{'', 'default:torch', ''},
{'', '', ''},
}
})

-- --------- --
-- Stone---- --
-- --------- --

minetest.register_node("glowblocks:lightblockstone_on", {
tile_images = {"default_stone.png^glowblocks_light.png"},
description = "Light Block Stone",
groups={snappy=2,choppy=2,oddly_breakable_by_hand=2},
light_source = 14,
drop = "glowblocks:lightblockstone_on",
mesecons = {conductor = {
state = mesecon.state.off,
onstate = "glowblocks:lightblockstone_off",
}}
})

minetest.register_node("glowblocks:lightblockstone_off", {
tile_images = {"default_stone.png^glowblocks_light.png"},
description = "Light Block Stone",
groups={snappy=2,choppy=2,oddly_breakable_by_hand=2,not_in_creative_inventory=1},
light_source = 0,
drop = "glowblocks:lightblockstone_on",
mesecons = {conductor = {
state = mesecon.state.on,
offstate = "glowblocks:lightblockstone_on",
}}
})

minetest.register_craft({
output = '"glowblocks:lightblockstone_on" 1',
recipe = {
{'', 'default:stone', ''},
{'', 'default:torch', ''},
{'', '', ''},
}
})

-- --------- --
-- Grass---- --
-- --------- --

minetest.register_node("glowblocks:lightblockgrass_on", {
tiles = {"default_grass.png^glowblocks_light.png", "default_dirt.png^glowblocks_light.png", "default_dirt.png^default_grass_side.png^glowblocks_light.png"},
description = "Light Block Grass",
is_ground_content = true,
groups={snappy=2,choppy=2,oddly_breakable_by_hand=2},
light_source = 14,
drop = "glowblocks:lightblockgrass_on",
mesecons = {conductor = {
state = mesecon.state.off,
onstate = "glowblocks:lightblockgrass_off",
}}
})

minetest.register_node("glowblocks:lightblockgrass_off", {
tiles = {"default_grass.png^glowblocks_light.png", "default_dirt.png^glowblocks_light.png", "default_dirt.png^default_grass_side.png^glowblocks_light.png"},
description = "Light Block Grass",
is_ground_content = true,
groups={snappy=2,choppy=2,oddly_breakable_by_hand=2,not_in_creative_inventory=1},
light_source = 0,
drop = "glowblocks:lightblockgrass_on",
mesecons = {conductor = {
state = mesecon.state.on,
offstate = "glowblocks:lightblockgrass_on",
}}
})

minetest.register_craft({
output = '"glowblocks:lightblockgrass_on" 1',
recipe = {
{'', 'default:dirt', ''},
{'', 'default:torch', ''},
{'', 'default:torch', ''},
}
})