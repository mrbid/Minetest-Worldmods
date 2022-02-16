--Is 3d_armor actually enabled?
if minetest.get_modpath("3d_armor") then
	--Armor registration function
	local function register_armor(name, def)
		local function get_groups(type, offset)
			if not offset then
				offset = 0
			end
			local groups = {
				["armor_"..type] = def.armor+offset,
				armor_use = def.use,
				armor_heal = def.heal or nil,
				armor_fire = def.fire or nil,
				physics_gravity = def.gravity or nil,
				physics_speed = def.speed or nil,
				physics_jump = def.jump or nil,
			}
			return groups
		end

		armor:register_armor("xtraores_armor:helmet_"..name, {
			description = xtraores.upper(name).." Helmet",
			inventory_image = "xtraores_armor_inv_helmet_"..name..".png",
			groups = get_groups("head"),
			wear = 0,
		})

		armor:register_armor("xtraores_armor:chestplate_"..name, {
			description = xtraores.upper(name).." Chestplate",
			inventory_image = "xtraores_armor_inv_chestplate_"..name..".png",
			groups = get_groups("torso", 5),
			wear = 0,
		})

		armor:register_armor("xtraores_armor:leggings_"..name, {
			description = xtraores.upper(name).." Leggings",
			inventory_image = "xtraores_armor_inv_leggings_"..name..".png",
			groups = get_groups("legs", 5),
			wear = 0,
		})

		armor:register_armor("xtraores_armor:boots_"..name, {
			description = xtraores.upper(name).." Boots",
			inventory_image = "xtraores_armor_inv_boots_"..name..".png",
			groups = get_groups("feet"),
			wear = 0,
		})

		armor:register_armor("xtraores_armor:shield_"..name, {
			description = xtraores.upper(name).." Shield",
			inventory_image = "xtraores_armor_inv_shield_"..name..".png",
			groups = get_groups("shield"),
			wear = 0,
		})

		local i = "xtraores:"..name.."_ingot"

		minetest.register_craft({
			output = "xtraores_armor:helmet_"..name,
			recipe = {
				{i, i, i},
				{i, "", i},
				{"", "", ""},
			},
		})
		minetest.register_craft({
			output = "xtraores_armor:chestplate_"..name,
			recipe = {
				{i, "", i},
				{i, i, i},
				{i, i, i},
			},
		})
		minetest.register_craft({
			output = "xtraores_armor:leggings_"..name,
			recipe = {
				{i, i, i},
				{i, "", i},
				{i, "", i},
			},
		})
		minetest.register_craft({
			output = "xtraores_armor:boots_"..name,
			recipe = {
				{i, "", i},
				{i, "", i},
			},
		})
		minetest.register_craft({
			output = "xtraores_armor:shield_"..name,
			recipe = {
				{i, i, i},
				{i, i, i},
				{"", i, ""},
			},
		})
	end

	--Register the armors
	register_armor("platinum", {
		armor = 12,
		heal = 7,
		use = 200,
	})

	register_armor("cobalt", {
		armor = 15,
		heal = 12,
		speed = 0.15,
		use = 75,
	})

	register_armor("osmium", {
		armor = 15.4,
		heal = 12,
		jump = 0.15,
		armor_use = 50,
	})

	register_armor("adamantite", {
		armor = 16,
		heal = 12,
		gravity = -0.15,
		armor_use = 30,
	})

	register_armor("rarium", {
		armor = 16.4,
		heal = 12,
		gravity = -0.15,
		speed = 0.15,
		jump = 0.15,
		use = 20,
	})

	register_armor("unobtainium", {
		armor = 17,
		heal = 12,
		gravity = -0.15,
		speed = 0.15,
		jump = 0.15,
		fire = 1,
		use = 20,
	})

	register_armor("titanium", {
		armor = 17.6,
		heal = 14,
		gravity = -0.18,
		speed = 0.25,
		jump = 0.16,
		fire = 1,
		use = 20,
	})

	minetest.log("action", "[MOD] Xtraores: Module (armor) loaded!")
end


--That's a lot of words. This file used to be ~300 lines though
