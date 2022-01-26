minetest.register_abm({
	label = "Transmute Lead to Gold",
	nodenames = {"technic:lead_block"},
	neighbors = {
		"technic:uranium35_block",
	},
	interval = 6,
	chance = 50,
	catch_up = false,
	action = function(pos, node)
		minetest.set_node(pos, {name = "default:goldblock"})
	end
})

