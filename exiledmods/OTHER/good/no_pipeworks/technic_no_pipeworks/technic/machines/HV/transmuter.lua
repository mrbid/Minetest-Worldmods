-- HV Transmuter
-- https://github.com/mrbid/Minetest-Worldmods

minetest.register_craft({
	output = 'technic:hv_transmuter',
	recipe = {
		{'space_travel:titanium_ingot', 'technic:mv_alloy_furnace', 'space_travel:titanium_ingot'},
		{'space_travel:dark_matter_crystal', 'technic:hv_transformer', 'space_travel:dark_matter_crystal'},
		{'space_travel:titanium_ingot', 'technic:hv_cable', 'space_travel:titanium_ingot'},
	}
})

technic.register_transmuter({tier="HV", upgrade=1, tube=1, demand={16000, 14000, 12000}, speed=3})

