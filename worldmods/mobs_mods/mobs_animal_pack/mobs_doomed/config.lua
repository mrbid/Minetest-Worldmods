mobs_doomed.config = config.settings_model('mobs_doomed', {
	badger = {
		spawn = {
			enabled = config.types.boolean(true),
			on = config.types.list({
				"default:dirt_with_grass",
				"default:dirt",
				"default:dirt_with_coniferous_litter"
			}),
			near = config.types.list({ "air" }),
			interval = config.types.int(30, { min=1 }),
			chance = config.types.int(300000, { min=1 }),
			min_light = config.types.int(0, { min=0 }),
			max_light = config.types.int(14, { min=0 }),
			min_height = config.types.int(0, { min=-31000, max=31000 }),
			max_height = config.types.int(5000, { min=-31000, max=31000 }),
			active_object_count = config.types.int(2, { min=1 }),
		}
	},
	elephant = {
		spawn = {
			enabled = config.types.boolean(true),
			on = config.types.list({
				"default:dirt_with_dry_grass",
				"default:desert_sand"
			}),
			near = config.types.list({ "air" }),
			interval = config.types.int(30, { min=1 }),
			chance = config.types.int(300000, { min=1 }),
			min_light = config.types.int(10, { min=0 }),
			max_light = config.types.int(14, { min=0 }),
			min_height = config.types.int(0, { min=-31000, max=31000 }),
			max_height = config.types.int(5000, { min=-31000, max=31000 }),
			active_object_count = config.types.int(2, { min=1 }),
		}
	},
	fox = {
		spawn = {
			enabled = config.types.boolean(true),
			on = config.types.list({
				"default:dirt_with_grass",
				"default:dirt",
				"default:dirt_with_coniferous_litter",
				"default:dirt_with_snow"
			}),
			near = config.types.list({ "air" }),
			interval = config.types.int(30, { min=1 }),
			chance = config.types.int(300000, { min=1 }),
			min_light = config.types.int(0, { min=0 }),
			max_light = config.types.int(14, { min=0 }),
			min_height = config.types.int(0, { min=-31000, max=31000 }),
			max_height = config.types.int(5000, { min=-31000, max=31000 }),
			active_object_count = config.types.int(2, { min=1 }),
		}
	},
	hedgehog = {
		spawn = {
			enabled = config.types.boolean(true),
			on = config.types.list({
				"default:dirt_with_grass",
				"default:dirt_with_coniferous_litter"
			}),
			near = config.types.list({ "air" }),
			interval = config.types.int(30, { min=1 }),
			chance = config.types.int(300000, { min=1 }),
			min_light = config.types.int(0, { min=0 }),
			max_light = config.types.int(14, { min=0 }),
			min_height = config.types.int(0, { min=-31000, max=31000 }),
			max_height = config.types.int(5000, { min=-31000, max=31000 }),
			active_object_count = config.types.int(2, { min=1 }),
		}
	},
	owl = {
		spawn = {
			enabled = config.types.boolean(true),
			on = config.types.list({"group:leaves"}),
			near = config.types.list({ "air" }),
			interval = config.types.int(30, { min=1 }),
			chance = config.types.int(300000, { min=1 }),
			min_light = config.types.int(0, { min=0 }),
			max_light = config.types.int(14, { min=0 }),
			min_height = config.types.int(0, { min=-31000, max=31000 }),
			max_height = config.types.int(5000, { min=-31000, max=31000 }),
			active_object_count = config.types.int(2, { min=1 }),
		}
	},
	tortoise = {
		spawn = {
			enabled = config.types.boolean(true),
			on = config.types.list({"default:clay", "group:sand"}),
			near = config.types.list({ "air" }),
			interval = config.types.int(30, { min=1 }),
			chance = config.types.int(300000, { min=1 }),
			min_light = config.types.int(10, { min=0 }),
			max_light = config.types.int(14, { min=0 }),
			min_height = config.types.int(0, { min=-31000, max=31000 }),
			max_height = config.types.int(5000, { min=-31000, max=31000 }),
			active_object_count = config.types.int(2, { min=1 }),
		}
	},
	whale = {
		spawn = {
			enabled = config.types.boolean(true),
			on = config.types.list({"default:water_source"}),
			near = config.types.list({"default:water_source"}),
			interval = config.types.int(30, { min=1 }),
			chance = config.types.int(3000000, { min=1 }),
			min_light = config.types.int(0, { min=0 }),
			max_light = config.types.int(14, { min=0 }),
			min_height = config.types.int(-40, { min=-31000, max=31000 }),
			max_height = config.types.int(0, { min=-31000, max=31000 }),
			active_object_count = config.types.int(1, { min=1 }),
		}
	}
})