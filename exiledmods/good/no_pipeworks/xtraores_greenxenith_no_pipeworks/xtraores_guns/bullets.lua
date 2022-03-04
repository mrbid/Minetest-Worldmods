--Is Technic enabled?
if minetest.get_modpath("technic") then
	--Let's just copy the Technic stuff because the API is a pain
	local S = technic.getter

	local connect_default = {"bottom", "back", "left", "right"}

	local function round(v)
		return math.floor(v + 0.5)
	end

	--Modify it for our needs, of course
	local function register_base_machine(data)
		local typename = data.typename
		local input_size = 4--technic.recipes[typename].input_size
		local machine_name = data.machine_name
		local machine_desc = data.machine_desc
		local tier = data.tier
		local ltier = string.lower(tier)

		local groups = {cracky = 2, technic_machine = 1, ["technic_"..ltier] = 1}
		local active_groups = {not_in_creative_inventory = 1}
		for k, v in pairs(groups) do active_groups[k] = v end

		local formspec =
			"invsize[8,9;]"..
			"list[current_name;src;"..(4-input_size)..",1;4,1;]"..
			"list[current_name;dst;5,1;2,2;]"..
			"list[current_player;main;0,5;8,4;]"..
			"label[0,0;"..machine_desc:format(tier).."]"..
			"listring[current_name;dst]"..
			"listring[current_player;main]"..
			"listring[current_name;src]"..
			"listring[current_player;main]"..
			"image_button[0,2;0.5,0.5;info.png;info;]"..
			"tooltip[info;Input Required:\n• Gunpowder\n• Brass Ingot\n• Lead, Copper, or Silver Ingot\n• Bullet Mold;#5c5c5c;#FFFFFF]"
		if data.upgrade then
			formspec = formspec..
				"list[current_name;upgrade1;1,3;1,1;]"..
				"list[current_name;upgrade2;2,3;1,1;]"..
				"label[1,4;"..S("Upgrade Slots").."]"..
				"listring[current_name;upgrade1]"..
				"listring[current_player;main]"..
				"listring[current_name;upgrade2]"..
				"listring[current_player;main]"
		end

		local run = function(pos, node)
			local meta     = minetest.get_meta(pos)
			local inv      = meta:get_inventory()
			local eu_input = meta:get_int(tier.."_EU_input")

			local machine_desc_tier = machine_desc:format(tier)
			local machine_node      = "xtraores_guns:"..ltier.."_"..machine_name
			local machine_demand    = data.demand

			-- Setup meta data if it does not exist.
			if not eu_input then
				meta:set_int(tier.."_EU_demand", machine_demand[1])
				meta:set_int(tier.."_EU_input", 0)
				return
			end

			local EU_upgrade, tube_upgrade = 0, 0
			if data.upgrade then
				EU_upgrade, tube_upgrade = technic.handle_machine_upgrades(meta)
			end

			local powered = eu_input >= machine_demand[EU_upgrade+1]
			if powered then
				meta:set_int("src_time", meta:get_int("src_time") + round(data.speed*10))
			end
			while true do
				local result = technic.get_recipe(typename, inv:get_list("src"))
				if not result then
					technic.swap_node(pos, machine_node)
					meta:set_string("infotext", S("%s Idle"):format(machine_desc_tier))
					meta:set_int(tier.."_EU_demand", 0)
					meta:set_int("src_time", 0)
					return
				end
				meta:set_int(tier.."_EU_demand", machine_demand[EU_upgrade+1])
				technic.swap_node(pos, machine_node.."_active")
				meta:set_string("infotext", S("%s Active"):format(machine_desc_tier))
				if meta:get_int("src_time") < round(result.time*10) then
					if not powered then
						technic.swap_node(pos, machine_node)
						meta:set_string("infotext", S("%s Unpowered"):format(machine_desc_tier))
					end
					return
				end
				local output = result.output
				if type(output) ~= "table" then output = { output } end
				local output_stacks = {}
				for _, o in ipairs(output) do
					table.insert(output_stacks, ItemStack(o))
				end
				local room_for_output = true
				inv:set_size("dst_tmp", inv:get_size("dst"))
				inv:set_list("dst_tmp", inv:get_list("dst"))
				for _, o in ipairs(output_stacks) do
					if not inv:room_for_item("dst_tmp", o) then
						room_for_output = false
						break
					end
					inv:add_item("dst_tmp", o)
				end
				if not room_for_output then
					technic.swap_node(pos, machine_node)
					meta:set_string("infotext", S("%s Idle"):format(machine_desc_tier))
					meta:set_int(tier.."_EU_demand", 0)
					meta:set_int("src_time", round(result.time*10))
					return
				end
				meta:set_int("src_time", meta:get_int("src_time") - round(result.time*10))
				inv:set_list("src", result.new_input)
				inv:set_list("dst", inv:get_list("dst_tmp"))
			end
		end

		minetest.register_node("xtraores_guns:"..ltier.."_"..machine_name, {
			description = machine_desc:format(tier),
			tiles = {
				"technic_"..ltier.."_"..machine_name.."_top.png"..tentry, 
				"technic_"..ltier.."_"..machine_name.."_panel.png"..tentry,
				"technic_"..ltier.."_"..machine_name.."_side.png^[transformFX"..tentry,
				"technic_"..ltier.."_"..machine_name.."_side.png"..tentry,
				"technic_"..ltier.."_"..machine_name.."_panel.png"..tentry,
				"technic_"..ltier.."_"..machine_name.."_front.png"
			},
			paramtype2 = "facedir",
			groups = groups,
			connect_sides = data.connect_sides or connect_default,
			legacy_facedir_simple = true,
			sounds = default.node_sound_wood_defaults(),
			on_construct = function(pos)
				local node = minetest.get_node(pos)
				local meta = minetest.get_meta(pos)

				meta:set_string("infotext", machine_desc:format(tier))
				meta:set_string("formspec", formspec)
				local inv = meta:get_inventory()
				inv:set_size("src", input_size)
				inv:set_size("dst", 4)
				inv:set_size("upgrade1", 1)
				inv:set_size("upgrade2", 1)
			end,
			can_dig = technic.machine_can_dig,
			allow_metadata_inventory_put = technic.machine_inventory_put,
			allow_metadata_inventory_take = technic.machine_inventory_take,
			allow_metadata_inventory_move = technic.machine_inventory_move,
			technic_run = run,
			after_dig_node = technic.machine_after_dig_node,
		})

		minetest.register_node("xtraores_guns:"..ltier.."_"..machine_name.."_active",{
			description = machine_desc:format(tier),
			tiles = {
				"technic_"..ltier.."_"..machine_name.."_top_active.png"..tentry, 
				"technic_"..ltier.."_"..machine_name.."_panel.png"..tentry,
				"technic_"..ltier.."_"..machine_name.."_side_active.png^[transformFX"..tentry,
				"technic_"..ltier.."_"..machine_name.."_side_active.png"..tentry,
				"technic_"..ltier.."_"..machine_name.."_panel.png"..tentry,
				"technic_"..ltier.."_"..machine_name.."_front_active.png"
			},
			paramtype2 = "facedir",
			drop = "xtraores_guns:"..ltier.."_"..machine_name,
			groups = active_groups,
			connect_sides = data.connect_sides or connect_default,
			legacy_facedir_simple = true,
			sounds = default.node_sound_wood_defaults(),
			can_dig = technic.machine_can_dig,
			allow_metadata_inventory_put = technic.machine_inventory_put,
			allow_metadata_inventory_take = technic.machine_inventory_take,
			allow_metadata_inventory_move = technic.machine_inventory_move,
			technic_run = run,
			technic_disabled_machine_name = "xtraores_guns:"..ltier.."_"..machine_name,
		})

		--Looky! New machines!
		technic.register_machine(tier, "xtraores_guns:"..ltier.."_"..machine_name,            technic.receiver)
		technic.register_machine(tier, "xtraores_guns:"..ltier.."_"..machine_name.."_active", technic.receiver)

	end -- End registration

	function technic.register_bullet_press(data)	
		register_base_machine(data)
	end

	technic.register_recipe_type("press", {
		description = "Pressing",
		input_size = 4,
	})

	if minetest.get_modpath("unified_inventory") then
		--Unified_inventory doesn't like new crafting types
		unified_inventory.register_craft_type("press", {
			description = "Pressing",
			width = 4,
			height = 1,
		})
	end

	function technic.register_press_recipe(data)
		data.time = data.time or 20
		technic.register_recipe("press", data)
	end

	--Bullet crafts
	local metal = {"default:copper_ingot", "moreores:silver_ingot", "technic:lead_ingot"}

	for _, name in pairs(metal) do
		local recipes = {
			{"tnt:gunpowder 5", name.." 1", "technic:brass_ingot 1", "xtraores_guns:mold_308 1", "xtraores_guns:bullet_308 400"},
			{"tnt:gunpowder 5", name.." 1", "technic:brass_ingot 1", "xtraores_guns:mold_357 1", "xtraores_guns:bullet_357 400"}
		}
		for _, data in pairs(recipes) do
			technic.register_press_recipe({ input = { data[1], data[2], data[3], data[4] }, output = { data[5] } })
			local input = { data[1], data[2], data[3], data[4] }
			if minetest.get_modpath("unified_inventory") then
				unified_inventory.register_craft({
					type = "press",
					output = data[5],
					items = input,
					width = 0,
				})
			end
		end
	end

	-- This is needed for the motor
	if minetest.get_modpath("basic_materials") then
		minetest.register_craft({
			output = "xtraores_guns:mv_bullet_press",
			recipe = {
				{"mesecons_pistons:piston_normal_off", "basic_materials:motor", "mesecons_pistons:piston_normal_off"},
				{"", "technic:machine_casing", ""},
				{"technic:fine_copper_wire", "technic:mv_cable", "technic:fine_copper_wire"},
			}
		})
	end

	technic.register_bullet_press({
		typename = "press",
		machine_desc = "Bullet Press",
		machine_name = "bullet_press",
		tier = "MV",
		demand = { 3000, 2000, 1000 },
		speed = 1,
		upgrade = 1,
	})

	--This is going to be replaced
	minetest.clear_craft({
		type = "shapeless",
		recipe = {"default:coal_lump", "default:gravel"}
	})

	local coal

	--Do we have charcoal? If not, use normal coal dust
	if minetest.get_modpath("ethereal") then
		minetest.register_craftitem("xtraores_guns:charcoal_dust", {
			description = "Charcoal Dust",
			inventory_image = "charcoal_dust.png",
		})

		technic.register_grinder_recipe({
			input = {"ethereal:charcoal_lump"},
			output = "xtraores_guns:charcoal_dust 2",
			time = 5,
		})

		coal = "xtraores_guns:charcoal_dust"
	else
		coal = "technic:coal_dust"
	end

	--Do we have salt crystals? If not, register the coal recipe without saltpeter
	if minetest.get_modpath("caverealms") then
		minetest.register_craftitem("xtraores_guns:salt_dust", {
			description = "Saltpeter",
			inventory_image = "salt_dust.png",
		})

		local crystal_size = { 1, 2, 3, 4, 5 }

		for i in ipairs(crystal_size) do
			if i == 1 then
				nodename = "caverealms:salt_gem"
			else
				nodename = "caverealms:salt_gem_"..i
			end

			technic.register_grinder_recipe({
				input = {nodename},
				output = "xtraores_guns:salt_dust "..tostring((i * 3)),
				time = 4,
			})
		end

		minetest.register_craft({
			output = "tnt:gunpowder 3",
			type = "shapeless",
			recipe = {coal, "xtraores_guns:salt_dust", "technic:sulfur_dust"}
		})
	else
		minetest.register_craft({
			output = "tnt:gunpowder 2",
			type = "shapeless",
			recipe = {coal, "technic:sulfur_dust"}
		})
	end

	local power

	--Do we have a power crystal? Or shall we go vanilla?
	if minetest.get_modpath("homedecor") then
		power = "homedecor:power_crystal"
	else
		power = "default:mese_block"
	end

	minetest.register_craft({
		output = "xtraores_guns:bullet_laser 100",
		recipe = {
			{"technic:carbon_steel_ingot", power, "technic:carbon_steel_ingot"},
		}
	})
else
	--Technic wasn't enabled :(
	local casing
	local laser_casing
	local metal
	local power

	--Homedecor registers technic:brass_ingot for whatever reason
	if minetest.get_modpath("homedecor") then
		casing = "technic:brass_ingot"
		power = "homedecor:power_crystal"
	else
		casing = "default:steel_ingot"
		power = "default:mese_block"
	end

	--Moreores has some nice things
	if minetest.get_modpath("moreores") then
		metal = "moreores:silver_ingot"
		laser_casing = "moreores:mithril_ingot"
	else
		metal = "default:copper_ingot"
		laser_casing = "default:tin_ingot"
	end

	--Register manual bullet crafts
	minetest.register_craft({
		type = "shapeless",
		output = "xtraores_guns:bullet_357 150",
		recipe = {"tnt:gunpowder", metal, casing, "xtraores_guns:mold_357"},
		replacements = {{"xtraores_guns:mold_357", "xtraores_guns:mold_357"}},
	})

	minetest.register_craft({
		type = "shapeless",
		output = "xtraores_guns:bullet_308 150",
		recipe = {"tnt:gunpowder", metal, casing, "xtraores_guns:mold_308"},
		replacements = {{"xtraores_guns:mold_308", "xtraores_guns:mold_308"}},
	})

	minetest.register_craft({
		output = "xtraores_guns:bullet_laser 75",
		recipe = {
			{laser_casing, power, laser_casing},
		}
	})
end

--We will still utilize bullet molds
minetest.register_node("xtraores_guns:mold_308", {
	description = ".308 Bullet Mold",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
	},
	tiles = {"mold_308.png", "mold_308.png", "mold_side.png", "mold_side.png", "mold_side.png", "mold_side.png"},
	on_place = function(ItemStack)
		return ItemStack
	end
})

minetest.register_node("xtraores_guns:mold_357", {
	description = ".357 Bullet Mold",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
	},
	tiles = {"mold_357.png", "mold_357.png", "mold_side.png", "mold_side.png", "mold_side.png", "mold_side.png"},
	on_place = function(ItemStack)
		return ItemStack
	end
})

local sheeting

--Can we use plastic?
if minetest.get_modpath("homedecor") then
	sheeting = "homedecor:plastic_sheeting"
else
	sheeting = "default:paper"
end

--Make the molds
minetest.register_craft({
	output = "xtraores_guns:mold_357",
	recipe = {
		{sheeting, sheeting, sheeting},
		{"", "", sheeting},
		{sheeting, "", sheeting},

	}
})

minetest.register_craft({
	output = "xtraores_guns:mold_308",
	recipe = {
		{sheeting, "", sheeting},
		{"", "", sheeting},
		{sheeting, "", sheeting},

	}
})

--Bullets (they go in the guns)
minetest.register_craftitem("xtraores_guns:bullet_357", {
	description = ".357 Bullet",
	stack_max = 400,
	inventory_image = "bullet_357.png",
})

minetest.register_craftitem("xtraores_guns:bullet_308", {
	description = ".308 Bullet",
	stack_max = 400,
	inventory_image = "bullet_308.png",
})

minetest.register_craftitem("xtraores_guns:bullet_laser", {
	description = "Laser Charge",
	stack_max = 200,
	inventory_image = "bullet_laser.png",
})

--We don't need these any more, change them
minetest.register_alias("xtraores:titanium_bullet", "xtraores_guns:bullet_308")
minetest.register_alias("xtraores:375", "xtraores_guns:bullet_357")
minetest.register_alias("xtraores_mdwp:charge", "xtraores_guns:bullet_laser")

--New gunpowder texture (because why the barrel?..)
minetest.override_item("tnt:gunpowder", {
	inventory_image = "gunpowder.png",
	wield_image = "gunpowder.png",
})


--Pew pew
