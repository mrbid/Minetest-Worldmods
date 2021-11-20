minetest.register_craft({
	output = 'laptop_pc1:4k_closed',
	recipe = {
	{'dye:cyan', 'laptop:lcd', 'dye:cyan', },
	{'laptop:HDD', 'laptop:motherboard', 'laptop:cpu_jetcore', },
	{'laptop:bat', 'laptop:case', 'laptop:gpu', },
	}
})

minetest.register_craft({
	output = 'laptop_pc1:4k_pink_closed',
	recipe = {
	{'dye:pink', 'laptop:lcd', 'dye:pink', },
	{'laptop:HDD', 'laptop:motherboard', 'laptop:cpu_jetcore', },
	{'laptop:bat', 'laptop:case', 'laptop:gpu', },
	}
})

minetest.register_craft({
	output = 'laptop_pc1:amstrum45_off',
	recipe = {
	{'', 'laptop:crt_green', '', },
	{'laptop:HDD', 'laptop:motherboard', 'laptop:cpu_c6', },
	{'dye:white', 'laptop:case', 'laptop:psu', },
	}
})

minetest.register_craft({
	output = 'laptop_pc1:os4_5_off',
	recipe = {
	{'dye:white', 'laptop:crt', 'dye:white', },
	{'laptop:HDD', 'laptop:motherboard', 'laptop:cpu_65536', },
	{'laptop:gpu', 'laptop:case', 'laptop:psu', },
	}
})

minetest.register_craft({
	output = 'laptop_pc1:war5000_off',
	recipe = {
	{'dye:dark_grey', 'laptop:crt_amber', 'dye:dark_grey', },
	{'laptop:case', '', 'laptop:psu', },
	{'laptop:HDD', 'laptop:motherboard', 'laptop:cpu_c6', },
	}
})

minetest.register_craft({
	output = 'laptop_pc1:minetu_closed',
	recipe = {
	{'dye:red', 'laptop:lcd', 'dye:dark_grey', },
	{'laptop:bat', 'laptop:case', 'laptop:gpu', },
	{'laptop:HDD', 'laptop:motherboard', 'laptop:cpu_jetcore', },
	}
})
