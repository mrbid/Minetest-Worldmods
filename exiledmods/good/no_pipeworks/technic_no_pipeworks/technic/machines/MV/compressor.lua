-- MV compressor

minetest.register_craft({
	output = 'technic:mv_compressor',
	recipe = {
		{'technic:stainless_steel_ingot', 'technic:lv_compressor',  'technic:stainless_steel_ingot'},
		{'',              'technic:mv_transformer', ''},
		{'technic:stainless_steel_ingot', 'technic:mv_cable',       'technic:stainless_steel_ingot'},
	}
})

technic.register_compressor({tier = "MV", demand = {800, 600, 400}, speed = 2, upgrade = 1, tube = 1})
