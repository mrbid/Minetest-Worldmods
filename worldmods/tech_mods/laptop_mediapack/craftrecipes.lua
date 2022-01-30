minetest.register_craft({
	output = 'laptop:floppy_525',
	recipe = {
	{'default:obsidian_shard', 'default:obsidian_shard', 'default:obsidian_shard', },
	{'default:obsidian_shard', 'default:steel_ingot', 'default:obsidian_shard', },
	{'default:obsidian_shard', 'default:obsidian_shard', 'default:obsidian_shard', },
	}
})

minetest.register_craft({
	output = 'laptop:disk_storage',
	recipe = {
	{'default:obsidian_shard', 'dye:dark_grey', 'default:obsidian_shard', },
	{'default:obsidian_shard', '', 'default:obsidian_shard', },
	{'default:obsidian_shard', 'dye:brown', 'default:obsidian_shard', },
	}
})

minetest.register_craft({
	output = 'laptop:punchcard',
	recipe = {
	{'', 'default:paper', 'default:paper', },
	{'', 'default:paper', 'default:paper', },
	{'', 'default:paper', 'default:paper', },
	}
})

minetest.register_craft({
	output = 'laptop:cassette',
	recipe = {
	{'', '', '', },
	{'default:obsidian_shard', '', 'default:obsidian_shard', },
	{'default:obsidian_shard', 'default:steel_ingot', 'default:obsidian_shard', },
	}
})

minetest.register_craft({
	output = 'laptop:cd',
	recipe = {
	{'', 'default:obsidian_shard', '', },
	{'default:obsidian_shard', 'default:tin_ingot', 'default:obsidian_shard', },
	{'', 'default:obsidian_shard', '', },
	}
})
