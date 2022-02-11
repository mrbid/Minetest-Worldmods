minetest.register_node("tronblocks:stone", {
  description = ("Tron Stone"),
  tiles = {"tronblocks_stone.png"},
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 5,
  sounds = default.node_sound_wood_defaults(),
  is_ground_content = true,
  drop = "tronblocks:stone 2",
})
minetest.register_node("tronblocks:stone_black", {
  description = ("Black Tron Stone"),
  tiles = {"tronblocks_stone_black.png"},
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 5,
  sounds = default.node_sound_wood_defaults(),
  drop = "tronblocks:stone 2",
})
minetest.register_node("tronblocks:glow_box", {
  description = ("Tron Glow Box"),
  tiles = {"tronblocks_glow_box.png"},
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 14,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:glow_box_orange", {
  description = ("Orange Tron Glow Box"),
  tiles = {"tronblocks_glow_box_orange.png"},
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 14,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:glow_box_blue", {
  description = ("Blue Tron Glow Box"),
  tiles = {"tronblocks_glow_box_blue.png"},
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 14,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:glow_box_green", {
  description = ("Green Tron Glow Box"),
  tiles = {"tronblocks_glow_box_green.png"},
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 14,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:arrow", {
  description = ("Tron Arrow"),
  tiles = {"tronblocks_arrow.png", "tronblocks_arrow.png", "tronblocks_arrowr.png", 
           "tronblocks_arrowl.png", "tronblocks_cross.png", "tronblocks_x.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:arrow_orange", {
  description = ("Orange Tron Arrow"),
  tiles = {"tronblocks_arrow_orange.png", "tronblocks_arrow_orange.png", "tronblocks_arrowr_orange.png", 
           "tronblocks_arrowl_orange.png", "tronblocks_cross_orange.png", "tronblocks_x_orange.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:arrow_blue", {
  description = ("Blue Tron Arrow"),
  tiles = {"tronblocks_arrow_blue.png", "tronblocks_arrow_blue.png", "tronblocks_arrowr_blue.png", 
           "tronblocks_arrowl_blue.png", "tronblocks_cross_blue.png", "tronblocks_x_blue.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:arrow_green", {
  description = ("Green Tron Arrow"),
  tiles = {"tronblocks_arrow_green.png", "tronblocks_arrow_green.png", "tronblocks_arrowr_green.png", 
           "tronblocks_arrowl_green.png", "tronblocks_cross_green.png", "tronblocks_x_green.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:arrowr", {
  description = ("Right Tron Arrow"),
  tiles = {"tronblocks_arrowr.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:arrowr_orange", {
  description = ("Right Orange Tron Arrow"),
  tiles = {"tronblocks_arrowr_orange.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:arrowr_blue", {
  description = ("Right Blue Tron Arrow"),
  tiles = {"tronblocks_arrowr_blue.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:arrowr_green", {
  description = ("Right Green Tron Arrow"),
  tiles = {"tronblocks_arrowr_green.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:arrowl", {
  description = ("Left Tron Arrow"),
  tiles = {"tronblocks_arrowl.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:arrowl_orange", {
  description = ("Left Orange Tron Arrow"),
  tiles = {"tronblocks_arrowl_orange.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:arrowl_blue", {
  description = ("Left Blue Tron Arrow"),
  tiles = {"tronblocks_arrowl_blue.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:arrowl_green", {
  description = ("Left Green Tron Arrow"),
  tiles = {"tronblocks_arrowl_green.png", },
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:cross", {
  description = ("Tron Cross"),
  tiles = {"tronblocks_cross.png"},
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:cross_orange", {
  description = ("Orange Tron Cross"),
  tiles = {"tronblocks_cross_orange.png"},
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:cross_blue", {
  description = ("Blue Tron Cross"),
  tiles = {"tronblocks_cross_blue.png"},
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:cross_green", {
  description = ("Green Tron Cross"),
  tiles = {"tronblocks_cross_green.png"},
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:x", {
  description = ("Tron X"),
  tiles = {"tronblocks_x.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:x_orange", {
  description = ("Orange Tron X"),
  tiles = {"tronblocks_x_orange.png"},
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:x_blue", {
  description = ("Blue Tron X"),
  tiles = {"tronblocks_x_blue.png"},
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:x_green", {
  description = ("Green Tron X"),
  tiles = {"tronblocks_x_green.png"},
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:y", {
  description = ("Tron Y"),
  tiles = {"tronblocks_fy.png", "tronblocks_fy.png", 
	   "tronblocks_diagonal.png", "tronblocks_diagonalr.png", 
	   "tronblocks_fy.png", "tronblocks_y.png", },
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:y_orange", {
  description = ("Orange Tron Y"),
  tiles = {"tronblocks_fy_orange.png", "tronblocks_fy_orange.png", 
	   "tronblocks_diagonal_orange.png", "tronblocks_diagonalr_orange.png", 
	   "tronblocks_fy_orange.png", "tronblocks_y_orange.png",},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:y_blue", {
  description = ("Blue Tron Y"),
  tiles = {"tronblocks_fy_blue.png", "tronblocks_fy_blue.png", 
	   "tronblocks_diagonal_blue.png", "tronblocks_diagonalr_blue.png", 
	   "tronblocks_fy_blue.png", "tronblocks_y_blue.png", },
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:y_green", {
  description = ("Green Tron Y"),
  tiles = {"tronblocks_fy_green.png", "tronblocks_fy_green.png", 
	   "tronblocks_diagonal_green.png", "tronblocks_diagonalr_green.png", 
	   "tronblocks_fy_green.png", "tronblocks_y_green.png", },
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:tile", {
  description = ("Tron Tile"),
  tiles = {"tronblocks_tile.png"},
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:tile_orange", {
  description = ("Orange Tron Tile"),
  tiles = {"tronblocks_tile_orange.png"},
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:tile_blue", {
  description = ("Blue Tron Tile"),
  tiles = {"tronblocks_tile_blue.png"},
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:tile_green", {
  description = ("Green Tron Tile"),
  tiles = {"tronblocks_tile_green.png"},
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:grid", {
  description = ("Tron Grid"),
  tiles = {"tronblocks_grid.png"},
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:grid_orange", {
  description = ("Orange Tron Grid"),
  tiles = {"tronblocks_grid_orange.png"},
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:grid_blue", {
  description = ("Blue Tron Grid"),
  tiles = {"tronblocks_grid_blue.png"},
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:grid_green", {
  description = ("Green Tron Grid"),
  tiles = {"tronblocks_grid_green.png"},
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:hyperbola", {
  description = ("Tron Hyperbola"),
  tiles = {"tronblocks_hyperbola.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:hyperbola_orange", {
  description = ("Orange Tron Hyperbola"),
  tiles = {"tronblocks_hyperbola_orange.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:hyperbola_blue", {
  description = ("Blue Tron Hyperbola"),
  tiles = {"tronblocks_hyperbola_blue.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:hyperbola_green", {
  description = ("Green Tron Hyperbola"),
  tiles = {"tronblocks_hyperbola_green.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:parallel", {
  description = ("Tron Parallel"),
  tiles = {"tronblocks_parallel.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:parallel_orange", {
  description = ("Orange Tron Parallel"),
  tiles = {"tronblocks_parallel_orange.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:parallel_blue", {
  description = ("Blue Tron Parallel"),
  tiles = {"tronblocks_parallel_blue.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:parallel_green", {
  description = ("Green Tron Parallel"),
  tiles = {"tronblocks_parallel_green.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:parallelr", {
  description = ("Tron Horizontal Parallel"),
  tiles = {"tronblocks_parallelr.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:parallelr_orange", {
  description = ("Orange Tron Horizontal Parallel"),
  tiles = {"tronblocks_parallelr_orange.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:parallelr_blue", {
  description = ("Blue Tron Horizontal Parallel"),
  tiles = {"tronblocks_parallelr_blue.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:parallelr_green", {
  description = ("Green Tron Horizontal Parallel"),
  tiles = {"tronblocks_parallelr_green.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:line", {
  description = ("Tron Line"),
  tiles = {"tronblocks_vline.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:line_orange", {
  description = ("Orange Tron Line"),
  tiles = {"tronblocks_vline_orange.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:line_blue", {
  description = ("Blue Tron Line"),
  tiles = {"tronblocks_vline_blue.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:line_green", {
  description = ("Green Tron Line"),
  tiles = {"tronblocks_vline_green.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:vline", {
  description = ("Tron Vertical Line"),
  tiles = {"tronblocks_line.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:vline_orange", {
  description = ("Orange Tron Vertical Line"),
  tiles = {"tronblocks_line_orange.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:vline_blue", {
  description = ("Blue Tron Vertical Line"),
  tiles = {"tronblocks_line_blue.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:vline_green", {
  description = ("Green Tron vertical Line"),
  tiles = {"tronblocks_line_green.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:diagonal", {
  description = ("Tron Diagonal"),
  tiles = {"tronblocks_diagonal.png", "tronblocks_diagonal.png", "tronblocks_diagonal.png", 
          "tronblocks_diagonal.png", "tronblocks_diagonalr.png", "tronblocks_diagonalr.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:diagonal_orange", {
  description = ("Orange Tron Diagonal"),
  tiles = {"tronblocks_diagonal_orange.png", "tronblocks_diagonal_orange.png", "tronblocks_diagonal_orange.png",
           "tronblocks_diagonal_orange.png", "tronblocks_diagonalr_orange.png", "tronblocks_diagonalr_orange.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:diagonal_blue", {
  description = ("Blue Tron Diagonal"),
  tiles = {"tronblocks_diagonal_blue.png", "tronblocks_diagonal_blue.png", "tronblocks_diagonal_blue.png",
           "tronblocks_diagonal_blue.png", "tronblocks_diagonalr_blue.png", "tronblocks_diagonalr_blue.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:diagonal_green", {
  description = ("Green Tron Diagonal"),
  tiles = {"tronblocks_diagonal_green.png", "tronblocks_diagonal_green.png", "tronblocks_diagonal_green.png",
           "tronblocks_diagonal_green.png", "tronblocks_diagonalr_green.png", "tronblocks_diagonalr_green.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
--numerals are the second craftable group. 
minetest.register_node("tronblocks:one", {
  description = ("Tron One"),
  tiles = {"tronblocks_one.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:one_orange", {
  description = ("Orange Tron One"),
  tiles = {"tronblocks_one_orange.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:one_blue", {
  description = ("Blue Tron One"),
  tiles = {"tronblocks_one_blue.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:one_green", {
  description = ("Green Tron One"),
  tiles = {"tronblocks_one_green.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:two", {
  description = ("Tron Two"),
  tiles = {"tronblocks_two.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:two_orange", {
  description = ("Orange Tron Two"),
  tiles = {"tronblocks_two_orange.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:two_blue", {
  description = ("Blue Tron Two"),
  tiles = {"tronblocks_two_blue.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:two_green", {
  description = ("Green Tron Two"),
  tiles = {"tronblocks_two_green.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:three", {
  description = ("Tron Three"),
  tiles = {"tronblocks_three.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:three_orange", {
  description = ("Orange Tron Three"),
  tiles = {"tronblocks_three_orange.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:three_blue", {
  description = ("Blue Tron Three"),
  tiles = {"tronblocks_three_blue.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:three_green", {
  description = ("Green Tron Three"),
  tiles = {"tronblocks_three_green.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:four", {
  description = ("Tron Four"),
  tiles = {"tronblocks_four.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:four_orange", {
  description = ("Orange Tron Four"),
  tiles = {"tronblocks_four_orange.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:four_blue", {
  description = ("Blue Tron Four"),
  tiles = {"tronblocks_four_blue.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:four_green", {
  description = ("Green Tron Four"),
  tiles = {"tronblocks_four_green.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:five", {
  description = ("Tron Five"),
  tiles = {"tronblocks_five.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:five_orange", {
  description = ("Orange Tron Five"),
  tiles = {"tronblocks_five_orange.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:five_blue", {
  description = ("Blue Tron Five"),
  tiles = {"tronblocks_five_blue.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:five_green", {
  description = ("Green Tron Five"),
  tiles = {"tronblocks_five_green.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:six", {
  description = ("Tron Six"),
  tiles = {"tronblocks_six.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:six_orange", {
  description = ("Orange Tron Six"),
  tiles = {"tronblocks_six_orange.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:six_blue", {
  description = ("Blue Tron Six"),
  tiles = {"tronblocks_six_blue.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:six_green", {
  description = ("Green Tron Six"),
  tiles = {"tronblocks_six_green.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:seven", {
  description = ("Tron Seven"),
  tiles = {"tronblocks_seven.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:seven_orange", {
  description = ("Orange Tron Seven"),
  tiles = {"tronblocks_seven_orange.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:seven_blue", {
  description = ("Blue Tron Seven"),
  tiles = {"tronblocks_seven_blue.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:seven_green", {
  description = ("Green Tron Seven"),
  tiles = {"tronblocks_seven_green.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:eight", {
  description = ("Tron Eight"),
  tiles = {"tronblocks_eight.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:eight_orange", {
  description = ("Orange Tron Eight"),
  tiles = {"tronblocks_eight_orange.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:eight_blue", {
  description = ("Blue Tron Eight"),
  tiles = {"tronblocks_eight_blue.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:eight_green", {
  description = ("Green Tron Eight"),
  tiles = {"tronblocks_eight_green.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:nine", {
  description = ("Tron Nine"),
  tiles = {"tronblocks_nine.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:nine_orange", {
  description = ("Orange Tron Nine"),
  tiles = {"tronblocks_nine_orange.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:nine_blue", {
  description = ("Blue Tron Nine"),
  tiles = {"tronblocks_nine_blue.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:nine_green", {
  description = ("Green Tron Nine"),
  tiles = {"tronblocks_nine_green.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:zero", {
  description = ("Tron Zero"),
  tiles = {"tronblocks_zero.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:zero_orange", {
  description = ("Orange Tron Zero"),
  tiles = {"tronblocks_zero_orange.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:zero_blue", {
  description = ("Blue Tron Zero"),
  tiles = {"tronblocks_zero_blue.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("tronblocks:zero_green", {
  description = ("Green Tron Zero"),
  tiles = {"tronblocks_zero_green.png"},
  paramtype2 = "facedir",
  groups = {cracky=3,oddly_breakable_by_hand=2},
  light_source = 10,
  sounds = default.node_sound_wood_defaults(),
})
--Tron glass
minetest.register_node("tronblocks:glass", {
	description = ("Tron Glass"),
	drawtype = "glasslike",
	tiles = {"tronblocks_glass.png"},
	inventory_image = minetest.inventorycube("tronblocks_glass.png"),
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 11,
	walkable = false,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})
minetest.register_node("tronblocks:glass_orange", {
	description = ("Orange Tron Glass"),
	drawtype = "glasslike",
	tiles = {"tronblocks_glass_orange.png"},
	inventory_image = minetest.inventorycube("tronblocks_glass_orange.png"),
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 11,
	walkable = false,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})
minetest.register_node("tronblocks:glass_blue", {
	description = ("Blue Tron Glass"),
	drawtype = "glasslike",
	tiles = {"tronblocks_glass_blue.png"},
	inventory_image = minetest.inventorycube("tronblocks_glass_blue.png"),
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 11,
	walkable = false,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})
minetest.register_node("tronblocks:glass_green", {
	description = ("Green Tron Glass"),
	drawtype = "glasslike",
	tiles = {"tronblocks_glass_green.png"},
	inventory_image = minetest.inventorycube("tronblocks_glass_green.png"),
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 11,
	walkable = false,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

