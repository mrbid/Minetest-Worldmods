minetest.register_tool("amcaw:gem_sword", {
	description = "Gem sword",
	inventory_image = "amcaw_gem_sword.png",
	wield_scale = {x=1.3, y=1.3, z=1},
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=8},
	}
})