--
-- Backwards compatibility stuff
--

minetest.register_alias("glowblocks:glowblockblue", "glowblocks:glowblockblue_on")
minetest.register_alias("glowblocks:glowblockpurple", "glowblocks:glowblockpurple_on")
minetest.register_alias("glowblocks:glowblockgreen", "glowblocks:glowblockgreen_on")
minetest.register_alias("glowblocks:glowblockyellow", "glowblocks:glowblockyellow_on")
minetest.register_alias("glowblocks:glowblockorange", "glowblocks:glowblockorange_on")
minetest.register_alias("glowblocks:glowblockred", "glowblocks:glowblockred_on")
minetest.register_alias("glowblocks:glowblockblack", "glowblocks:glowblockblack_on")
minetest.register_alias("glowblocks:glowblockwhite", "glowblocks:glowblockwhite_on")

-- --------- --
-- Blue----- --
-- --------- --

minetest.register_node("glowblocks:glowblockblue_on", {
tiles = {{
		name="glowblocks_glow_block_blue_animated.png",
		animation={type="vertical_frames", aspect_w=32, aspect_h=32, length=2},
	}},
description = "Glow Block Blue",
inventory_image = "glowblocks_glow_block_blue.png",
groups={snappy=2,choppy=2,oddly_breakable_by_hand=2},
light_source = 14,
drop = "glowblocks:glowblockblue_on",
mesecons = {conductor = {
    state = mesecon.state.off,
    onstate = "glowblocks:glowblockblue_off",
  }}
})

minetest.register_node("glowblocks:glowblockblue_off", {
tiles = {{
		name="glowblocks_glow_block_blue_animated.png",
		animation={type="vertical_frames", aspect_w=32, aspect_h=32, length=2},
	}},
description = "Glow Block Blue",
inventory_image = "glowblocks_glow_block_blue.png",
groups={snappy=2,choppy=2,oddly_breakable_by_hand=2,not_in_creative_inventory=1},
light_source = 0,
drop = "glowblocks:glowblockblue_on",
mesecons = {conductor = {
    state = mesecon.state.on,
    offstate = "glowblocks:glowblockblue_on",
  }}
})


minetest.register_craft({
output = '"glowblocks:glowblockblue_on" 1',
recipe = {
{'', 'default:stone', ''},
{'', 'default:torch', ''},
{'', 'dye:blue', ''},
}
})

-- --------- --
-- Purple--- --
-- --------- --

minetest.register_node("glowblocks:glowblockpurple_on", {
tiles = {{
name="glowblocks_glow_block_purple_animated.png",
animation={type="vertical_frames", aspect_w=32, aspect_h=32, length=2},
}},
description = "Glow Block Purple",
inventory_image = "glowblocks_glow_block_purple.png",
groups={snappy=2,choppy=2,oddly_breakable_by_hand=2},
light_source = 14,
drop = "glowblocks:glowblockpurple_on",
mesecons = {conductor = {
state = mesecon.state.off,
onstate = "glowblocks:glowblockpurple_off",
}}
})

minetest.register_node("glowblocks:glowblockpurple_off", {
tiles = {{
name="glowblocks_glow_block_purple_animated.png",
animation={type="vertical_frames", aspect_w=32, aspect_h=32, length=2},
}},
description = "Glow Block Purple",
inventory_image = "glowblocks_glow_block_purple.png",
groups={snappy=2,choppy=2,oddly_breakable_by_hand=2,not_in_creative_inventory=1},
light_source = 0,
drop = "glowblocks:glowblockpurple_on",
mesecons = {conductor = {
state = mesecon.state.on,
offstate = "glowblocks:glowblockpurple_on",
}}
})

minetest.register_craft({
output = '"glowblocks:glowblockpurple_on" 1',
recipe = {
{'', 'default:stone', ''},
{'', 'default:torch', ''},
{'', 'dye:violet', ''},
}
})

-- --------- --
-- Green---- --
-- --------- --

minetest.register_node("glowblocks:glowblockgreen_on", {
tiles = {{
name="glowblocks_glow_block_green_animated.png",
animation={type="vertical_frames", aspect_w=32, aspect_h=32, length=2},
}},
description = "Glow Block Green",
inventory_image = "glowblocks_glow_block_green.png",
groups={snappy=2,choppy=2,oddly_breakable_by_hand=2},
light_source = 14,
drop = "glowblocks:glowblockgreen_on",
mesecons = {conductor = {
state = mesecon.state.off,
onstate = "glowblocks:glowblockgreen_off",
}}
})

minetest.register_node("glowblocks:glowblockgreen_off", {
tiles = {{
name="glowblocks_glow_block_green_animated.png",
animation={type="vertical_frames", aspect_w=32, aspect_h=32, length=2},
}},
description = "Glow Block Green",
inventory_image = "glowblocks_glow_block_green.png",
groups={snappy=2,choppy=2,oddly_breakable_by_hand=2,not_in_creative_inventory=1},
light_source = 0,
drop = "glowblocks:glowblockgreen_on",
mesecons = {conductor = {
state = mesecon.state.on,
offstate = "glowblocks:glowblockgreen_on",
}}
})

minetest.register_craft({
output = '"glowblocks:glowblockgreen_on" 1',
recipe = {
{'', 'default:stone', ''},
{'', 'default:torch', ''},
{'', 'dye:green', ''},
}
})

-- --------- --
-- Yellow--- --
-- --------- --

minetest.register_node("glowblocks:glowblockyellow_on", {
tiles = {{
name="glowblocks_glow_block_yellow_animated.png",
animation={type="vertical_frames", aspect_w=32, aspect_h=32, length=2},
}},
description = "Glow Block Yellow",
inventory_image = "glowblocks_glow_block_yellow.png",
groups={snappy=2,choppy=2,oddly_breakable_by_hand=2},
light_source = 14,
drop = "glowblocks:glowblockyellow_on",
mesecons = {conductor = {
state = mesecon.state.off,
onstate = "glowblocks:glowblockyellow_off",
}}
})

minetest.register_node("glowblocks:glowblockyellow_off", {
tiles = {{
name="glowblocks_glow_block_yellow_animated.png",
animation={type="vertical_frames", aspect_w=32, aspect_h=32, length=2},
}},
description = "Glow Block Yellow",
inventory_image = "glowblocks_glow_block_yellow.png",
groups={snappy=2,choppy=2,oddly_breakable_by_hand=2,not_in_creative_inventory=1},
light_source = 0,
drop = "glowblocks:glowblockyellow_on",
mesecons = {conductor = {
state = mesecon.state.on,
offstate = "glowblocks:glowblockyellow_on",
}}
})

minetest.register_craft({
output = '"glowblocks:glowblockyellow_on" 1',
recipe = {
{'', 'default:stone', ''},
{'', 'default:torch', ''},
{'', 'dye:yellow', ''},
}
})

-- --------- --
-- Red------ --
-- --------- --

minetest.register_node("glowblocks:glowblockred_on", {
tiles = {{
name="glowblocks_glow_block_red_animated.png",
animation={type="vertical_frames", aspect_w=32, aspect_h=32, length=2},
}},
description = "Glow Block Red",
inventory_image = "glowblocks_glow_block_red.png",
groups={snappy=2,choppy=2,oddly_breakable_by_hand=2},
light_source = 14,
drop = "glowblocks:glowblockred_on",
mesecons = {conductor = {
state = mesecon.state.off,
onstate = "glowblocks:glowblockred_off",
}}
})

minetest.register_node("glowblocks:glowblockred_off", {
tiles = {{
name="glowblocks_glow_block_red_animated.png",
animation={type="vertical_frames", aspect_w=32, aspect_h=32, length=2},
}},
description = "Glow Block Red",
inventory_image = "glowblocks_glow_block_red.png",
groups={snappy=2,choppy=2,oddly_breakable_by_hand=2,not_in_creative_inventory=1},
light_source = 0,
drop = "glowblocks:glowblockred_on",
mesecons = {conductor = {
state = mesecon.state.on,
offstate = "glowblocks:glowblockred_on",
}}
})

minetest.register_craft({
output = '"glowblocks:glowblockred_on" 1',
recipe = {
{'', 'default:stone', ''},
{'', 'default:torch', ''},
{'', 'dye:red', ''},
}
})

-- --------- --
-- Orange--- --
-- --------- --

minetest.register_node("glowblocks:glowblockorange_on", {
tiles = {{
name="glowblocks_glow_block_orange_animated.png",
animation={type="vertical_frames", aspect_w=32, aspect_h=32, length=2},
}},
description = "Glow Block Orange",
inventory_image = "glowblocks_glow_block_orange.png",
groups={snappy=2,choppy=2,oddly_breakable_by_hand=2},
light_source = 14,
drop = "glowblocks:glowblockorange_on",
mesecons = {conductor = {
state = mesecon.state.off,
onstate = "glowblocks:glowblockorange_off",
}}
})

minetest.register_node("glowblocks:glowblockorange_off", {
tiles = {{
name="glowblocks_glow_block_orange_animated.png",
animation={type="vertical_frames", aspect_w=32, aspect_h=32, length=2},
}},
description = "Glow Block Orange",
inventory_image = "glowblocks_glow_block_orange.png",
groups={snappy=2,choppy=2,oddly_breakable_by_hand=2,not_in_creative_inventory=1},
light_source = 0,
drop = "glowblocks:glowblockorange_on",
mesecons = {conductor = {
state = mesecon.state.on,
offstate = "glowblocks:glowblockorange_on",
}}
})

minetest.register_craft({
output = '"glowblocks:glowblockorange_on" 1',
recipe = {
{'', 'default:stone', ''},
{'', 'default:torch', ''},
{'', 'dye:orange', ''},
}
})

-- --------- --
-- White---- --
-- --------- --

minetest.register_node("glowblocks:glowblockwhite_on", {
tiles = {{
name="glowblocks_glow_block_white_animated.png",
animation={type="vertical_frames", aspect_w=32, aspect_h=32, length=2},
}},
description = "Glow Block White",
inventory_image = "glowblocks_glow_block_white.png",
groups={snappy=2,choppy=2,oddly_breakable_by_hand=2},
light_source = 14,
drop = "glowblocks:glowblockwhite_on",
mesecons = {conductor = {
state = mesecon.state.off,
onstate = "glowblocks:glowblockwhite_off",
}}
})

minetest.register_node("glowblocks:glowblockwhite_off", {
tiles = {{
name="glowblocks_glow_block_white_animated.png",
animation={type="vertical_frames", aspect_w=32, aspect_h=32, length=2},
}},
description = "Glow Block White",
inventory_image = "glowblocks_glow_block_white.png",
groups={snappy=2,choppy=2,oddly_breakable_by_hand=2,not_in_creative_inventory=1},
light_source = 0,
drop = "glowblocks:glowblockwhite_on",
mesecons = {conductor = {
state = mesecon.state.on,
offstate = "glowblocks:glowblockwhite_on",
}}
})

minetest.register_craft({
output = '"glowblocks:glowblockwhite_on" 1',
recipe = {
{'', 'default:stone', ''},
{'', 'default:torch', ''},
{'', 'dye:white', ''},
}
})

-- --------- --
-- Black---- --
-- --------- --

minetest.register_node("glowblocks:glowblockblack_on", {
tiles = {{
name="glowblocks_glow_block_black_animated.png",
animation={type="vertical_frames", aspect_w=32, aspect_h=32, length=2},
}},
description = "Glow Block Black",
inventory_image = "glowblocks_glow_block_black.png",
groups={snappy=2,choppy=2,oddly_breakable_by_hand=2},
light_source = 14,
drop = "glowblocks:glowblockblack_on",
mesecons = {conductor = {
state = mesecon.state.off,
onstate = "glowblocks:glowblockblack_off",
}}
})

minetest.register_node("glowblocks:glowblockblack_off", {
tiles = {{
name="glowblocks_glow_block_black_animated.png",
animation={type="vertical_frames", aspect_w=32, aspect_h=32, length=2},
}},
description = "Glow Block Black",
inventory_image = "glowblocks_glow_block_black.png",
groups={snappy=2,choppy=2,oddly_breakable_by_hand=2,not_in_creative_inventory=1},
light_source = 0,
drop = "glowblocks:glowblockblack_on",
mesecons = {conductor = {
state = mesecon.state.on,
offstate = "glowblocks:glowblockblack_on",
}}
})

minetest.register_craft({
output = '"glowblocks:glowblockblack_on" 1',
recipe = {
{'', 'default:stone', ''},
{'', 'default:torch', ''},
{'', 'dye:black', ''},
}
})