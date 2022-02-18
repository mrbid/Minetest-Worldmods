-- HV Biomass Generator (hv_blood_box)
-- https://github.com/mrbid/Minetest-Worldmods

minetest.register_craft({
	output = 'technic:hv_blood_box0',
	recipe = {
		{'technic:hv_battery_box0', 'technic:hv_battery_box0', 'technic:hv_battery_box0'},
		{'technic:hv_battery_box0', 'technic:hv_transformer', 'technic:hv_battery_box0'},
		{'technic:bonesdiamond_chest', 'technic:hv_cable', 'technic:bonesdiamond_chest'},
	}
})

technic.register_blood_box({
	tier           = "HV",
	max_charge     = 100000000,
	charge_rate    = 10000000,
	discharge_rate = 40000000,
	charge_step    = 1000000,
	discharge_step = 4000000,
	upgrade        = 1,
	tube           = 1,
})

