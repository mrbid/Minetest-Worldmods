-- HV grinder

minetest.register_craft({
	output = 'technic:hv_grinder',
	recipe = {
		{'technic:carbon_plate',          'technic:mv_grinder',   'technic:composite_plate'},
		{'',              'technic:hv_transformer', ''},
		{'technic:stainless_steel_ingot', 'technic:hv_cable',       'technic:stainless_steel_ingot'},
	}
})

technic.register_grinder({tier="HV", demand={1200, 900, 600}, speed=20, upgrade=1, tube=1})

