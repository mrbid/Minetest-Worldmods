minetest.register_craft({
	output = 'laptop_pc2:bell_tower_off',
	recipe = {
	{'dye:grey', 'laptop:crt', 'dye:grey', },
	{'laptop:HDD', 'laptop:motherboard', 'laptop:cpu_d75a', },
	{'laptop:case', 'laptop:psu', 'laptop:gpu', },
	}
})

minetest.register_craft({
	output = 'laptop_pc2:benson_printer_off',
	recipe = {
	{'', 'laptop:motherboard', '', },
	{'dye:yellow', 'laptop:psu', 'dye:white', },
	{'', 'laptop:case', '', },
	}
})

minetest.register_craft({
	output = 'laptop_pc2:cube_c3_off',
	recipe = {
	{'dye:grey', 'laptop:crt_amber', 'dye:orange', },
	{'laptop:HDD', 'laptop:motherboard', 'laptop:cpu_c6', },
	{'', 'laptop:case', 'laptop:psu', },
	}
})

minetest.register_craft({
	output = 'laptop_pc2:fruit_spirit_off',
	recipe = {
	{'dye:white', 'laptop:lcd', 'laptop:psu', },
	{'laptop:HDD', 'laptop:motherboard', 'laptop:cpu_jetcore', },
	{'', 'laptop:case', 'dye:white', },
	}
})

minetest.register_craft({
	output = 'laptop_pc2:bell_prime_off',
	recipe = {
	{'', 'laptop:crt_green', 'laptop:psu', },
	{'laptop:HDD', 'laptop:motherboard', 'laptop:cpu_c6', },
	{'dye:orange', 'laptop:case', 'dye:brown', },
	}
})

minetest.register_craft({
	output = 'laptop_pc2:mbi_scholastic_closed',
	recipe = {
	{'laptop:case', 'laptop:crt_green', 'laptop:psu', },
	{'laptop:HDD', 'laptop:motherboard', 'laptop:cpu_c6', },
	{'', 'dye:grey', '', },
	}
})

minetest.register_craft({
	output = 'laptop_pc2:regal_writer_closed',
	recipe = {
	{'laptop:case', 'laptop:crt_amber', 'laptop:psu', },
	{'laptop:motherboard', '', 'laptop:cpu_c6', },
	{'', 'dye:dark_grey', '', },
	}
})
