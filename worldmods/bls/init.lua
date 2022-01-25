
minetest.register_privilege("invincible", "Makes a player invincible")

armor:register_armor("bls:shield", {
    description = "VF Shield",
    inventory_image = "vf_shield_vf_inv.png",
    texture = "vf_shield_vf.png",
    preview = "vf_shield_vf_preview.png",
    groups = {armor_shield=1, armor_heal=0, armor_use=0},
    armor_groups = {fleshy = 0},
    drop = {},
    on_drop = function(itemstack, dropper, pos) end
})

armor:register_armor("bls:flareshield", {
    description = "VF Flare Shield",
    inventory_image = "fireshield_inv.png",
    texture = "fireshield.png",
    preview = "fireshield_preview.png",
    groups = {armor_shield=1, armor_heal=12, armor_use=100, armor_fire=10, physics_jump=0.5, physics_speed=1},
    armor_groups = {fleshy = 0},
    drop = {},
    on_drop = function(itemstack, dropper, pos) end
})

armor:register_armor("bls:shield_staff", {
    -- staff shield: doesn't protect the player, but doesn't break either
    description = "[Admin] VF Shield",
    inventory_image = "vf_shield_vf_inv.png",
    texture = "vf_shield_vf.png",
    preview = "vf_shield_vf_preview.png",
    groups = {armor_shield=1, armor_heal=0, armor_use=0, not_in_creative_inventory=1},
    armor_groups = {fleshy = 0},
    drop = {},
    on_drop = function(itemstack, dropper, pos) end
})

armor:register_armor("bls:flareshield_staff", {
    -- staff shield: doesn't protect the player, but doesn't break either
    description = "[Admin] VF Flare Shield",
    inventory_image = "fireshield_inv.png",
    texture = "fireshield.png",
    preview = "fireshield_preview.png",
    groups = {armor_shield=1, armor_heal=0, armor_use=0, armor_fire=999999, physics_jump=0.5, physics_speed=3, not_in_creative_inventory=1},
    armor_groups = {fleshy = 0},
    drop = {},
    on_drop = function(itemstack, dropper, pos) end
})

armor:register_armor("bls:infinity_bracer", {
    description = "Infinity Bracer",
    inventory_image = "bls_infinity_bracer_inv.png",
    texture = "bls_infinity_bracer_armor.png",
    preview = "bls_infinity_bracer_preview.png",
    groups = {
        armor_terumet_brcr = 1,
        not_in_creative_inventory = 1,
        armor_use = 0,
        armor_heal = 10,
        armor_water = 1,
        armor_fire = 99,
        physics_speed = 0.8,
        physics_gravity = -0.5,
        physics_jump = 0.5,
    },
    armor_groups = {fleshy = 0},
    damage_groups = {cracky=3, snappy=3, choppy=3, crumbly=3, level=1}
})

armor:register_armor("bls:flux_bracer", {
    description = "Flux's Bracer",
    inventory_image = "bls_infinity_bracer_inv.png",
    texture = "bls_infinity_bracer_armor.png",
    preview = "bls_infinity_bracer_preview.png",
    groups = {
        armor_terumet_brcr = 1,
        not_in_creative_inventory = 1,
        armor_use = 0,
        armor_heal = 0,
        physics_speed = 0.5,
        physics_jump = 0.8,
        physics_gravity = 0.5,
    },
    armor_groups = {fleshy = 0},
})

local admin_armor_list = {
    ["3d_armor:helmet_admin"]=true,
    ["3d_armor:chestplate_admin"]=true,
    ["3d_armor:leggings_admin"]=true,
    ["3d_armor:boots_admin"]=true,
    ["shields:shield_admin"]=true,
    ["bls:shield_staff"]=true,
    ["bls:flareshield_staff"]=true,
    ["bls:infinity_bracer"]=true,
    ["bls:flux_bracer"]=true,
}

local function is_wearing_admin_armor(player)
    local name, armor_inv = armor:get_valid_player(player, "[bls_is_wearing_admin_armor]]")
    if not name or not armor_inv then
        return false
    end

    local privs = minetest.get_player_privs(name) or {}
    if privs.invincible then
        return true
    end

    for _, stack in pairs(armor_inv:get_list("armor")) do
        local stack_name = stack:get_name()
        if admin_armor_list[stack_name] then
            return true
        end
    end
    return false
end

-- prevent all damage if player is wearing admin armor
local old_registered_on_player_hpchange = minetest.registered_on_player_hpchange
function minetest.registered_on_player_hpchange(player, hp_change, reason)
    if is_wearing_admin_armor(player) then
        return 0
    else
        return old_registered_on_player_hpchange(player, hp_change, reason)
    end
end

-- don't damage other armor if player is wearing admin armor
local old_armor_punch = armor.punch
armor.punch = function(self, player, hitter, time_from_last_punch, tool_capabilities)
    if is_wearing_admin_armor(player) then
        return
    else
        return old_armor_punch(self, player, hitter, time_from_last_punch, tool_capabilities)
    end
end

-- keep admin armor from dropping if the player still somehow dies
local old_armor_drop = armor.drop_armor
function armor.drop_armor(pos, stack)
    local item_stack = ItemStack(stack)  -- ensure it's a proper ItemStack in case of string
    local stack_name = item_stack and item_stack:get_name()
    if stack_name and admin_armor_list[stack_name] then
        return
    else
        return old_armor_drop(pos, stack)
    end
end

-- make sure players w/out creative (or give) aren't wearing admin armor
local period = 10.3
local elapsed = 0
minetest.register_globalstep(function(dtime)
    elapsed = elapsed + dtime
    if elapsed >= period then
        elapsed = 0
        for _, player in ipairs(minetest.get_connected_players()) do
            local name, armor_inv = armor:get_valid_player(player, "[bls_armor_globalstep]]")
            if not name then name = player:get_player_name() end
            local privs = minetest.get_player_privs(name) or {}
            if armor_inv and not (privs.creative or privs.give) then
                for i=1, armor_inv:get_size("armor") do
                    local stack = armor_inv:get_stack("armor", i)
                    local stack_name = stack:get_name()
                    if admin_armor_list[stack_name] then
                        armor:run_callbacks("on_unequip", player, i, stack)
                        armor_inv:set_stack("armor", i, nil)
                    end
                end
            end
        end
    end
end)


if not minetest.get_modpath("tubelib_addons1") then return end
local tn = tubelib_addons1.register_tree_node  -- (name, drop, plant)
local fn = tubelib_addons1.register_farming_node  -- (name, drop, plant)

if minetest.get_modpath("baldcypress") then
    tn("baldcypress:trunk", "baldcypress:trunk", "baldcypress:sapling")
    fn("baldcypress:dry_branches")
    fn("baldcypress:leaves")
    fn("baldcypress:liana")
end

if minetest.get_modpath("bamboo") then
    tn("bamboo:trunk", "bamboo:trunk", "bamboo:sprout")
    fn("bamboo:leaves")
end

if minetest.get_modpath("birch") then
    tn("birch:trunk", "birch:trunk", "birch:sapling")
    fn("birch:leaves")
end

if minetest.get_modpath("cherrytree") then
    tn("cherrytree:trunk", "cherrytree:trunk", "cherrytree:sapling")
    fn("cherrytree:leaves")
    fn("cherrytree:blossom_leaves")
    fn("cherrytree:cherries")
end

if minetest.get_modpath("chestnuttree") then
    tn("chestnuttree:trunk", "chestnuttree:trunk", "chestnuttree:sapling")
    fn("chestnuttree:leaves")
    fn("chestnuttree:bur")
end

if minetest.get_modpath("clementinetree") then
    tn("clementinetree:trunk", "clementinetree:trunk", "clementinetree:sapling")
    fn("clementinetree:leaves")
    fn("clementinetree:clementine")
end

if minetest.get_modpath("cucina_vegana") then
    fn("cucina_vegana:parsley_5", "cucina_vegana:parsley 2", "cucina_vegana:parsley_1")
    fn("cucina_vegana:rosemary_6", "cucina_vegana:rosemary 2", "cucina_vegana:rosemary_1")
    fn("cucina_vegana:chives_5", "cucina_vegana:chives 2", "cucina_vegana:chives_1")
    fn("cucina_vegana:flax_6", "cucina_vegana:flax_raw 2", "cucina_vegana:flax_1")
    fn("cucina_vegana:kohlrabi_6", "cucina_vegana:kohlrabi 4", "cucina_vegana:kohlrabi_1")
    fn("cucina_vegana:asparagus_6", "cucina_vegana:asparagus 2", "cucina_vegana:asparagus_1")
    fn("cucina_vegana:lettuce_5", "cucina_vegana:lettuce 2", "cucina_vegana:lettuce_1")
    fn("cucina_vegana:soy_8", "cucina_vegana:soy 6", "cucina_vegana:soy_1")
    fn("cucina_vegana:peanut_7", "cucina_vegana:peanut_seed 6", "cucina_vegana:peanut_1")
    fn("cucina_vegana:rice_6", "cucina_vegana:rice 6", "cucina_vegana:rice_1")
    fn("cucina_vegana:sunflower_5", "cucina_vegana:sunflower 4", "cucina_vegana:sunflower_1")
end

if minetest.get_modpath("default") then
    tn("default:bush_stem", "default:bush_stem", "default:bush_sapling")
    tn("default:acacia_bush_stem", "default:acacia_bush_stem", "default:acacia_bush_sapling")
    tn("default:pine_bush_stem", "default:pine_bush_stem", "default:pine_bush_sapling")
    fn("default:pine_bush_needles")
end

if minetest.get_modpath("ebony") then
    tn("ebony:trunk", "ebony:trunk", "ebony:sapling")
    fn("ebony:leaves")
    fn("ebony:creeper")
    fn("ebony:creeper_leaves")
    fn("ebony:liana")
    fn("ebony:persimmon")
end

if minetest.get_modpath("farming") then
    fn("farming:cabbage_6", "farming:cabbage 2", "farming:cabbage_1")
    fn("farming:mint_4", "farming:mint_leaf 4", "farming:mint_1")
    fn("farming:vanilla_8", "farming:vanilla 4", "farming:vanilla_1")
end

if minetest.get_modpath("hollytree") then
    tn("hollytree:trunk", "hollytree:trunk", "hollytree:sapling")
    fn("hollytree:leaves")
end

if minetest.get_modpath("jacaranda") then
    tn("jacaranda:trunk", "jacaranda:trunk", "jacaranda:sapling")
    fn("jacaranda:leaves")
    fn("jacaranda:blossom_leaves")
end

if minetest.get_modpath("larch") then
    tn("larch:trunk", "larch:trunk", "larch:sapling")
    fn("larch:leaves")
    fn("larch:moss")
end

if minetest.get_modpath("lemontree") then
    tn("lemontree:trunk", "lemontree:trunk", "lemontree:sapling")
    fn("lemontree:leaves")
    fn("lemontree:lemon")
end

if minetest.get_modpath("mahogany") then
    tn("mahogany:trunk", "mahogany:trunk", "mahogany:sapling")
    fn("mahogany:leaves")
    fn("mahogany:creeper")
    fn("mahogany:flower_creeper")
    fn("mahogany:hanging_creeper")
end

if minetest.get_modpath("maple") then
    tn("maple:trunk", "maple:trunk", "maple:sapling")
    fn("maple:leaves")
end

if minetest.get_modpath("oak") then
    tn("oak:trunk", "oak:trunk", "oak:sapling")
    fn("oak:leaves")
    fn("oak:acorn")
end

if minetest.get_modpath("pomegranate") then
    tn("pomegranate:trunk", "pomegranate:trunk", "pomegranate:sapling")
    fn("pomegranate:leaves")
    fn("pomegranate:pomegranate")
end

if minetest.get_modpath("palm") then
    tn("palm:trunk", "palm:trunk", "palm:sapling")
    fn("palm:leaves")
    fn("palm:coconut")
end

if minetest.get_modpath("redtrees") then
    tn("redtrees:rtree", "redtrees:rtree", "redtrees:rsapling")
    fn("redtrees:rleaves")
end

if minetest.get_modpath("sakuragi") then
    tn("sakuragi:stree", "sakuragi:stree", "sakuragi:ssapling")
    fn("sakuragi:sleaves")
end

if minetest.get_modpath("willow") then
    tn("willow:trunk", "willow:trunk", "willow:sapling")
    fn("willow:leaves")
end

if minetest.get_modpath("plumtree") then
    tn("plumtree:trunk", "plumtree:trunk", "plumtree:sapling")
    fn("plumtree:leaves")
    fn("plumtree:plum")
end

if minetest.get_modpath("vines") then
    fn("vines:jungle_end", "vines:vines")
    fn("vines:jungle_middle", "vines:vines")
    fn("vines:root_end", "vines:vines")
    fn("vines:root_middle", "vines:vines")
    fn("vines:side_end", "vines:vines")
    fn("vines:side_middle", "vines:vines")
    fn("vines:vine_end", "vines:vines")
    fn("vines:vine_middle", "vines:vines")
    fn("vines:willow_end", "vines:vines")
    fn("vines:willow_middle", "vines:vines")
end


if not minetest.get_modpath("tubelib_addons1") then return end

local gn = tubelib_addons1.register_ground_node

gn("bls:marble")

-- This one line breaks the cobblegen > autosieve pathway completely
gn("default:stone","default:stone")

if minetest.get_modpath("building_blocks") then
    gn("building_blocks:Marble")
end

if minetest.get_modpath("default") then
    gn("default:silver_sandstone")
end

if minetest.get_modpath("moreores") then
    gn("moreores:mineral_mithril", "moreores:mithril_lump")
    gn("moreores:mineral_silver", "moreores:silver_lump")
end

if minetest.get_modpath("other_worlds") then
    gn("asteroid:cobble")
    gn("asteroid:copperore", "default:copper_lump")
    gn("asteroid:diamondore", "default:diamond")
    gn("asteroid:dust")
    gn("asteroid:goldore", "default:gold_lump")
    gn("asteroid:gravel")
    gn("asteroid:ironore", "default:iron_lump")
    gn("asteroid:meseore", "default:mese_crystal")
    gn("asteroid:redcobble")
    gn("asteroid:reddust")
    gn("asteroid:redgravel")
    gn("asteroid:redstone")
end

if minetest.get_modpath("quartz") then
    gn("quartz:quartz_ore", "quartz:quartz_crystal")
end

if minetest.get_modpath("technic_worldgen") then
    gn("technic:marble")
    gn("technic:granite")

    gn("technic:mineral_chromium", "technic:chromium_lump")
    gn("technic:mineral_lead", "technic:lead_lump")
    gn("technic:mineral_sulfur", "technic:sulfur_lump")
    gn("technic:mineral_uranium", "technic:uranium_lump")
    gn("technic:mineral_zinc", "technic:zinc_lump")
end

if minetest.get_modpath("terumet") then
    gn("terumet:ore_dense_raw", "terumet:lump_raw 5")
    gn("terumet:ore_raw", "terumet:lump_raw")
    gn("terumet:ore_raw_desert", "terumet:lump_raw 2")
    gn("terumet:ore_raw_desert_dense", "terumet:lump_raw 10")

    local sandcrete_blocks = {
        "terumet:block_con_black",
        "terumet:block_con_blue",
        "terumet:block_con_brown",
        "terumet:block_con_cyan",
        "terumet:block_con_dark_green",
        "terumet:block_con_dark_grey",
        "terumet:block_con_green",
        "terumet:block_con_grey",
        "terumet:block_con_magenta",
        "terumet:block_con_orange",
        "terumet:block_con_pink",
        "terumet:block_con_red",
        "terumet:block_con_violet",
        "terumet:block_con_white",
        "terumet:block_con_yellow",
    }
    for _, sandcrete in ipairs(sandcrete_blocks) do
        gn(sandcrete)
    end
end

if minetest.get_modpath("titanium") then
    gn("titanium:titanium_in_ground", "titanium:titanium")
end


if not minetest.get_modpath("tubelib_addons1") then return end
local gr = tubelib.add_grinder_recipe

if minetest.get_modpath("bonemeal") then
    gr({input="bonemeal:bone", output="bonemeal:bonemeal 4"})
    tubelib.remove_grinder_recipe({input="default:coral_skeleton"})
    gr({input="default:coral_skeleton", output="bonemeal:bonemeal 4"})
end

if minetest.get_modpath("dye") then
    --gr({input="group:coal", output="dye:black 8"})
    gr({input="default:coal_lump", output="dye:black 8"})
    gr({input="terumet:item_coke", output="dye:black 8"})
    --gr({input="group:horsetail", output="dye:green 2"})
    gr({input="ferns:horsetail_01", output="dye:green 2"})
    gr({input="ferns:horsetail_02", output="dye:green 2"})
    gr({input="ferns:horsetail_03", output="dye:green 2"})
    gr({input="ferns:horsetail_04", output="dye:green 2"})

    gr({input="default:dry_shrub", output="dye:brown 8"})
    gr({input="default:cactus", output="dye:green 8"})
    gr({input="default:coral_brown", output="dye:violet 2"})
    gr({input="default:coral_cyan", output="dye:cyan 2"})
    gr({input="default:coral_green", output="dye:green 2"})
    gr({input="default:coral_orange", output="dye:orange 2"})
    gr({input="default:coral_pink", output="dye:pink 2"})

    if minetest.get_modpath("bakedclay") then
        gr({input="bakedclay:delphinium", output="dye:cyan 8"})
        gr({input="bakedclay:mannagrass", output="dye:dark_green 8"})
        gr({input="bakedclay:thistle", output="dye:magenta 8"})
        gr({input="bakedclay:lazarus", output="dye:pink 8"})
    end

    if minetest.get_modpath("farming") then
        gr({input="farming:cocoa_beans", output="dye:brown 4"})
        gr({input="farming:beans", output="dye:green 2"})
        gr({input="farming:chili_pepper", output="dye:red 2"})
        gr({input="farming:beetroot", output="dye:red 2"})
        --gr({input="group:food_blueberries", output="dye:violet 4"})
        gr({input="farming:blueberries", output="dye:violet 4"})
        gr({input="farming:grapes", output="dye:violet 2"})
        gr({input="farming:carrot", output="dye:orange 2"})
        gr({input="farming:onion", output="dye:yellow 2"})
        gr({input="farming:raspberries", output="dye:red 2"})
        gr({input="farming:rhubarb", output="dye:yellow 2"})
    end

    if minetest.get_modpath("flowers") then
        gr({input="flowers:tulip_black", output="dye:black 8"})
        gr({input="flowers:geranium", output="dye:blue 8"})
        gr({input="flowers:chrysanthemum_green", output="dye:green 8"})
        gr({input="flowers:tulip", output="dye:orange 8"})
        gr({input="flowers:rose", output="dye:red 8"})
        gr({input="flowers:viola", output="dye:violet 8"})
        gr({input="flowers:dandelion_white", output="dye:white 8"})
        gr({input="flowers:dandelion_yellow", output="dye:yellow 8"})
    end
    if minetest.get_modpath("moreplants") then
        gr({input="moreplants:aliengrass", output="dye:orange 4"})
        gr({input="moreplants:bigflower", output="dye:red 8"})
        gr({input="moreplants:blueflower", output="dye:blue 8"})
        gr({input="moreplants:bluespike", output="dye:blue 8"})
        gr({input="moreplants:caveflower", output="dye:magenta 8"})
        gr({input="moreplants:jungleflower", output="dye:red 8"})
        gr({input="moreplants:medflower", output="dye:magenta 8"})
        gr({input="moreplants:moonflower", output="dye:cyan 8"})
    end
    if minetest.get_modpath("redtrees") then
        gr({input="redtrees:rleaves", output="dye:red 4"})
    end
    if minetest.get_modpath("sakuragi") then
        gr({input="sakuragi:sleaves", output="dye:pink 4"})
    end
end

if minetest.get_modpath("farming") then
    gr({input="farming:seed_wheat", output="farming:flour"})
    gr({input="farming:seed_barley", output="farming:flour_multigrain"})
    gr({input="farming:seed_oat", output="farming:flour_multigrain"})
    gr({input="farming:seed_rye", output="farming:flour_multigrain"})
    --gr({input="group:food_rice_raw", output="farming:rice_flour"})
    gr({input="cucina_vegana:rice", output="farming:rice_flour"})
end

if minetest.get_modpath("redtrees") then
    gr({input="redtrees:rtree", output="redtrees:rleaves 8"})
end
if minetest.get_modpath("sakuragi") then
    gr({input="sakuragi:stree", output="sakuragi:sleaves 8"})
end



if not minetest.global_exists("dispenser") then return end

minetest.clear_craft({
	output = "dispenser:dispenser",
})

minetest.register_craft({
	output = "dispenser:dispenser",
	recipe = {
		{"group:wood",    "basic_materials:ic",        "basic_materials:brass_ingot"},
		{"tubelib:tubeS", "basic_materials:gold_wire", "hook:slingshot"},
		{"group:wood",    "basic_materials:motor",     "basic_materials:brass_ingot"},
	},
})

dispenser.set_default_action("shoot")
dispenser.set_overflow_behaviour("spit")
dispenser.set_choice_strategy("first")

-- Mob Automation
dispenser.register_dispensable("mobs:hairball", "use", function (player, item_stack, dispenser_data, default)
	return function (key)
		if key == "get_pos" then
			return function ()
				return vector.add(dispenser_data.pos, {x=0,y=-1.5,z=0})
			end
		end
		return default(player, item_stack, dispenser_data)(key)
	end
end)


local plant_seed = function (item_stack, dispenser_data, player, node, entity)
	local item_name = item_stack:get_name()
	if not minetest.registered_items[item_name]
	or not minetest.registered_items[item_name].on_place then
		return nil, "cannot place"
	end
	if not player then return item_stack, "player not logged in" end
	local result = minetest.registered_items[item_name].on_place(item_stack, player, {
		type="node",
		under=dispenser_data.front,
		above=vector.add(dispenser_data.front, {x=0,y=1,z=0})
	})
	return result
end

local feed_or_plant_seed = function (item_stack, dispenser_data, player, node, entity)
	local feed_result, feed_reason, feed_failure = dispenser.actions.attempt_rightclick_entity(item_stack, dispenser_data, player, node, entity)

	if not feed_failure then
		return feed_result, feed_reason
	end
	return plant_seed(item_stack, dispenser_data, player, node, entity)
end

minetest.register_on_mods_loaded(function ()
	local eddibles = {}
	local mobs = {}
	local seeds = {
		"cucina_vegana:asparagus_seed",
		"cucina_vegana:chives_seed",
		"cucina_vegana:flax_seed",
		"cucina_vegana:kohlrabi_seed",
		"cucina_vegana:lettuce_seed",
		"cucina_vegana:parsley_seed",
		"cucina_vegana:peanut_seed",
		"cucina_vegana:rice_seed",
		"cucina_vegana:rosemary_seed",
		"cucina_vegana:soy_seed",
		"cucina_vegana:sunflower_seed",
		"aqua_farming:alga_seed",
		"aqua_farming:sea_grass_seed",
		"aqua_farming:sea_strawberry_seed",
		"aqua_farming:sea_anemone_seed",
		"aqua_farming:sea_cucumber_seed",
		"farming:seed_barley",
		"farming:seed_cotton",
		"farming:seed_hemp",
		"farming:seed_mint",
		"farming:seed_oat",
		"farming:seed_rice",
		"farming:seed_rye",
		"farming:seed_wheat",
	}

	for _,entity in pairs(minetest.registered_entities) do
		if entity.type == "animal" then
			mobs[entity.name] = true
			mobs[entity.name.."_set"] = true
		end
		if entity.follow then
			if type(entity.follow) == "table" then
				for _,food in pairs(entity.follow) do
					eddibles[food] = true
				end
			end
		end
	end

	-- Register mobs as placable, some are eddible by other mobs
	for mob,_ in pairs(mobs) do
		local actions = "place"
		if eddibles[mob] then
			actions = {"rightclick_entity", "place"}
		end
		dispenser.register_dispensable(mob, actions)
	end
	-- Register seeds as plantable, some are eddible by mobs
	for _,seed in ipairs(seeds) do
		local action = plant_seed
		if eddibles[seed] then
			action = feed_or_plant_seed
			seeds[seed] = true
		end
		dispenser.register_dispensable(seed, action)
	end
	-- Register all other foods as eddible by mobs only
	for food,_ in pairs(eddibles) do
		if not mobs[food] and not seeds[food] then
			dispenser.register_dispensable(food, "rightclick_entity")
		end
	end
end)

dispenser.register_dispensable("mobs:nametag", "rightclick_entity")
dispenser.register_dispensable("mobs:lasso", "rightclick_entity")
dispenser.register_dispensable("mobs:net", "rightclick_entity")
dispenser.register_dispensable("fireflies:bug_net", "rightclick_entity")

dispenser.register_dispensable("mobs:shears", {"rightclick_entity"})
dispenser.register_dispensable("bucket:bucket_empty", {"use", "rightclick_entity"})

-- Place Liquids
dispenser.register_dispensable("bucket:bucket_water", "place")
dispenser.register_dispensable("bucket:bucket_river_water", "place")
dispenser.register_dispensable("bucket:bucket_lava", "place")

-- Place sandcrete mix, to automate solidification
local sandcrete_mixes = {
	"terumet:block_conmix_black",
	"terumet:block_conmix_blue",
	"terumet:block_conmix_brown",
	"terumet:block_conmix_cyan",
	"terumet:block_conmix_dark_green",
	"terumet:block_conmix_dark_grey",
	"terumet:block_conmix_green",
	"terumet:block_conmix_grey",
	"terumet:block_conmix_magenta",
	"terumet:block_conmix_orange",
	"terumet:block_conmix_pink",
	"terumet:block_conmix_red",
	"terumet:block_conmix_violet",
	"terumet:block_conmix_white",
	"terumet:block_conmix_yellow",
}
for _, mix in ipairs(sandcrete_mixes) do
	dispenser.register_dispensable(mix, "place")
end

-- Detonate TNT
dispenser.register_dispensable("default:torch", {"punch_node", "place"})
dispenser.register_dispensable("tnt:tnt", "place")

-- Magix
dispenser.register_dispensable("screwdriver:screwdriver", "use")
dispenser.register_dispensable("tubelib:repairkit", "use")
dispenser.register_dispensable("hook:pchest", "place")
dispenser.register_dispensable("default:cobble", "place")
dispenser.register_dispensable("terumet:tool_ore_saw", "use")
dispenser.register_dispensable("terumet:tool_ore_saw_adv", "use")

-- Extra Farming Automation
dispenser.register_dispensable("bonemeal:bonemeal", "use")
dispenser.register_dispensable("bonemeal:fertiliser", "use")

dispenser.register_dispensable("moreores:hoe_silver", "use")
dispenser.register_dispensable("moreores:hoe_mithril", "use")
dispenser.register_dispensable("farming:hoe_bronze", "use")
dispenser.register_dispensable("farming:hoe_diamond", "use")
dispenser.register_dispensable("farming:hoe_mese", "use")
dispenser.register_dispensable("farming:hoe_steel", "use")
dispenser.register_dispensable("farming:hoe_stone", "use")
dispenser.register_dispensable("farming:hoe_wood", "use")
dispenser.register_dispensable("farming:scythe_mithril", "use")

if not minetest.get_modpath("tubelib_addons1") then return end
local gr = tubelib.add_grinder_recipe

if minetest.get_modpath("bonemeal") then
    gr({input="bonemeal:bone", output="bonemeal:bonemeal 4"})
    tubelib.remove_grinder_recipe({input="default:coral_skeleton"})
    gr({input="default:coral_skeleton", output="bonemeal:bonemeal 4"})
end

if minetest.get_modpath("dye") then
    --gr({input="group:coal", output="dye:black 8"})
    gr({input="default:coal_lump", output="dye:black 8"})
    gr({input="terumet:item_coke", output="dye:black 8"})
    --gr({input="group:horsetail", output="dye:green 2"})
    gr({input="ferns:horsetail_01", output="dye:green 2"})
    gr({input="ferns:horsetail_02", output="dye:green 2"})
    gr({input="ferns:horsetail_03", output="dye:green 2"})
    gr({input="ferns:horsetail_04", output="dye:green 2"})

    gr({input="default:dry_shrub", output="dye:brown 8"})
    gr({input="default:cactus", output="dye:green 8"})
    gr({input="default:coral_brown", output="dye:violet 2"})
    gr({input="default:coral_cyan", output="dye:cyan 2"})
    gr({input="default:coral_green", output="dye:green 2"})
    gr({input="default:coral_orange", output="dye:orange 2"})
    gr({input="default:coral_pink", output="dye:pink 2"})

    if minetest.get_modpath("bakedclay") then
        gr({input="bakedclay:delphinium", output="dye:cyan 8"})
        gr({input="bakedclay:mannagrass", output="dye:dark_green 8"})
        gr({input="bakedclay:thistle", output="dye:magenta 8"})
        gr({input="bakedclay:lazarus", output="dye:pink 8"})
    end

    if minetest.get_modpath("farming") then
        gr({input="farming:cocoa_beans", output="dye:brown 4"})
        gr({input="farming:beans", output="dye:green 2"})
        gr({input="farming:chili_pepper", output="dye:red 2"})
        gr({input="farming:beetroot", output="dye:red 2"})
        --gr({input="group:food_blueberries", output="dye:violet 4"})
        gr({input="farming:blueberries", output="dye:violet 4"})
        gr({input="farming:grapes", output="dye:violet 2"})
        gr({input="farming:carrot", output="dye:orange 2"})
        gr({input="farming:onion", output="dye:yellow 2"})
        gr({input="farming:raspberries", output="dye:red 2"})
        gr({input="farming:rhubarb", output="dye:yellow 2"})
    end

    if minetest.get_modpath("flowers") then
        gr({input="flowers:tulip_black", output="dye:black 8"})
        gr({input="flowers:geranium", output="dye:blue 8"})
        gr({input="flowers:chrysanthemum_green", output="dye:green 8"})
        gr({input="flowers:tulip", output="dye:orange 8"})
        gr({input="flowers:rose", output="dye:red 8"})
        gr({input="flowers:viola", output="dye:violet 8"})
        gr({input="flowers:dandelion_white", output="dye:white 8"})
        gr({input="flowers:dandelion_yellow", output="dye:yellow 8"})
    end
    if minetest.get_modpath("moreplants") then
        gr({input="moreplants:aliengrass", output="dye:orange 4"})
        gr({input="moreplants:bigflower", output="dye:red 8"})
        gr({input="moreplants:blueflower", output="dye:blue 8"})
        gr({input="moreplants:bluespike", output="dye:blue 8"})
        gr({input="moreplants:caveflower", output="dye:magenta 8"})
        gr({input="moreplants:jungleflower", output="dye:red 8"})
        gr({input="moreplants:medflower", output="dye:magenta 8"})
        gr({input="moreplants:moonflower", output="dye:cyan 8"})
    end
    if minetest.get_modpath("redtrees") then
        gr({input="redtrees:rleaves", output="dye:red 4"})
    end
    if minetest.get_modpath("sakuragi") then
        gr({input="sakuragi:sleaves", output="dye:pink 4"})
    end
end

if minetest.get_modpath("farming") then
    gr({input="farming:seed_wheat", output="farming:flour"})
    gr({input="farming:seed_barley", output="farming:flour_multigrain"})
    gr({input="farming:seed_oat", output="farming:flour_multigrain"})
    gr({input="farming:seed_rye", output="farming:flour_multigrain"})
    --gr({input="group:food_rice_raw", output="farming:rice_flour"})
    gr({input="cucina_vegana:rice", output="farming:rice_flour"})
end

if minetest.get_modpath("redtrees") then
    gr({input="redtrees:rtree", output="redtrees:rleaves 8"})
end
if minetest.get_modpath("sakuragi") then
    gr({input="sakuragi:stree", output="sakuragi:sleaves 8"})
end

local gs_api = gravelsieve.api

local gravel_junk_outputs = {
    ["default:silver_sand"] = 1 / 4,
    ["default:sand"] = 1 / 2,
    ["default:desert_sand"] = 1 / 4,
    ["default:gravel"] = 1,
    ["default:flint"] = 1 / 8,
}
if minetest.get_modpath("cavestuff") then
    gravel_junk_outputs["cavestuff:pebble_1"] = 1 / 8
    gravel_junk_outputs["cavestuff:desert_pebble_1"] = 1 / 8
end

local compressed_junk_outputs = {
    ["default:flint"] = 1 / 8,
    ["default:gravel"] = 1,
    ["default:gravel 2"] = 1 / 2,
    ["default:gravel 3"] = 1 / 4,
    ["default:gravel 4"] = 1 / 8,
    ["default:gravel 5"] = 1 / 16,
    ["default:gravel 6"] = 1 / 32,
}

gs_api.after_ores_calculated(function (ore_probabilities)

    -- Average out the probabilities a little to make rare things more common
    local compressed_probabilities = {}
    for ore, probability in pairs(ore_probabilities) do
        compressed_probabilities[ore] = probability^0.8
    end

    -- Scale to appropriate total rate
    local total_ore_probabiltiy = gs_api.sum_probabilities(ore_probabilities)
    compressed_probabilities = gs_api.scale_probabilities_to_fill(compressed_probabilities, total_ore_probabiltiy * 9)

    gs_api.override_input("default:gravel", {
        fixed = ore_probabilities,
        relative = gravel_junk_outputs
    })
    gs_api.register_input("gravelsieve:compressed_gravel", {
        fixed = compressed_probabilities,
        relative = compressed_junk_outputs
    })

    -- Add a few rare gems to compressed output
    if minetest.get_modpath("other_worlds") then
        gs_api.register_fixed_output("gravelsieve:compressed_gravel", "crystals:ghost_crystal_1", 1 / 50000)
        gs_api.register_fixed_output("gravelsieve:compressed_gravel", "crystals:ghost_crystal_2", 1 / 50000)
        gs_api.register_fixed_output("gravelsieve:compressed_gravel", "crystals:red_crystal_1", 1 / 50000)
        gs_api.register_fixed_output("gravelsieve:compressed_gravel", "crystals:red_crystal_2", 1 / 50000)
        gs_api.register_fixed_output("gravelsieve:compressed_gravel", "crystals:rose_quartz_1", 1 / 50000)
        gs_api.register_fixed_output("gravelsieve:compressed_gravel", "crystals:rose_quartz_2", 1 / 50000)
    end
    if minetest.get_modpath("technic_worldgen") then
        gs_api.register_fixed_output("gravelsieve:compressed_gravel", "technic:sulfur_lump", 1 / 100)
    end
end)

--------------------------
-- dirt --
--------------------------

if minetest.get_modpath("cavestuff") then
    gs_api.register_input("default:dirt", {fixed=gs_api.scale_probabilities_to_fill({
        ["default:silver_sand"] = 1,
        ["default:sand"] = 1 / 2,
        ["default:desert_sand"] = 1 / 4,
        ["cavestuff:pebble_1"] = 1 / 8,
        ["cavestuff:desert_pebble_1"] = 1 / 8,
    }, 1 - (1 / 5))})

else
    gs_api.register_input("default:dirt", {fixed=gs_api.scale_probabilities_to_fill({
        ["default:silver_sand"] = 1,
        ["default:sand"] = 1 / 2,
        ["default:desert_sand"] = 1 / 4,
    }, 1 - (1 / 5))})
end

gs_api.register_output("default:dirt", "default:stick", 1)
gs_api.register_output("default:dirt", "default:clay_lump", 1)

if minetest.get_modpath("bonemeal") then
    gs_api.register_output("default:dirt", "bonemeal:bone", 1 / 10)
end

if minetest.get_modpath("chestnuttree") then
    gs_api.register_output("default:dirt", "chestnuttree:bur", 1 / 10)
end

if minetest.get_modpath("cucina_vegana") then
    gs_api.register_output("default:dirt", "cucina_vegana:asparagus_seed", 1 / 2)
    gs_api.register_output("default:dirt", "cucina_vegana:chives_seed", 1 / 2)
    gs_api.register_output("default:dirt", "cucina_vegana:flax_seed", 1 / 2)
    gs_api.register_output("default:dirt", "cucina_vegana:kohlrabi_seed", 1 / 2)
    gs_api.register_output("default:dirt", "cucina_vegana:lettuce_seed", 1 / 2)
    gs_api.register_output("default:dirt", "cucina_vegana:parsley_seed", 1 / 2)
    gs_api.register_output("default:dirt", "cucina_vegana:peanut_seed", 1 / 2)
    gs_api.register_output("default:dirt", "cucina_vegana:rice_seed", 1 / 2)
    gs_api.register_output("default:dirt", "cucina_vegana:rosemary_seed", 1 / 2)
    gs_api.register_output("default:dirt", "cucina_vegana:soy_seed", 1 / 2)
    gs_api.register_output("default:dirt", "cucina_vegana:sunflower_seed", 1 / 2)
end

if minetest.get_modpath("farming") then
    gs_api.register_output("default:dirt", "farming:seed_wheat", 1 / 2)
    gs_api.register_output("default:dirt", "farming:seed_cotton", 1 / 2)
    if farming.mod == "redo" then
        gs_api.register_output("default:dirt", "farming:beans", 1 / 2)
        gs_api.register_output("default:dirt", "farming:beetroot", 1 / 2)
        gs_api.register_output("default:dirt", "farming:carrot", 1 / 2)
        gs_api.register_output("default:dirt", "farming:cocoa_beans", 1 / 2)
        gs_api.register_output("default:dirt", "farming:coffee_beans", 1 / 2)
        gs_api.register_output("default:dirt", "farming:corn", 1 / 2)
        gs_api.register_output("default:dirt", "farming:garlic", 1 / 2)
        gs_api.register_output("default:dirt", "farming:onion", 1 / 2)
        gs_api.register_output("default:dirt", "farming:peas", 1 / 2)
        gs_api.register_output("default:dirt", "farming:peppercorn", 1 / 2)
        gs_api.register_output("default:dirt", "farming:potato", 1 / 2)
        gs_api.register_output("default:dirt", "farming:seed_barley", 1 / 2)
        gs_api.register_output("default:dirt", "farming:seed_hemp", 1 / 2)
        gs_api.register_output("default:dirt", "farming:seed_mint", 1 / 2)
        gs_api.register_output("default:dirt", "farming:seed_oat", 1 / 2)
        gs_api.register_output("default:dirt", "farming:seed_rye", 1 / 2)
        gs_api.register_output("default:dirt", "farming:soy_beans", 1 / 2)
    end
end

if minetest.get_modpath("ferns") then
    gs_api.register_output("default:dirt", "ferns:ferntuber", 1 / 2)
end

if minetest.get_modpath("flowers") then
    gs_api.register_output("default:dirt", "flowers:mushroom_brown", 1 / 2)
    gs_api.register_output("default:dirt", "flowers:mushroom_red", 1 / 2)
end

if minetest.get_modpath("maptools") then
    gs_api.register_output("default:dirt", "maptools:copper_coin", 1 / 100)
    gs_api.register_output("default:dirt", "maptools:silver_coin", 1 / 500)
    gs_api.register_output("default:dirt", "maptools:gold_coin", 1 / 1000)
end

if minetest.get_modpath("molehills") then
    gs_api.register_output("default:dirt", "molehills:molehill", 1 / 2)
end

if minetest.get_modpath("moretrees") then
    gs_api.register_output("default:dirt", "moretrees:acorn", 1 / 2)
    gs_api.register_output("default:dirt", "moretrees:cedar_cone", 1 / 2)
    gs_api.register_output("default:dirt", "moretrees:fir_cone", 1 / 2)
    gs_api.register_output("default:dirt", "moretrees:spruce_cone", 1 / 2)
end

if minetest.get_modpath("nsspf") then
    gs_api.register_output("default:dirt", "nsspf:amanita_muscaria", 1 / 10)
    gs_api.register_output("default:dirt", "nsspf:amanita_phalloides", 1 / 10)
    gs_api.register_output("default:dirt", "nsspf:boletus_edulis", 1 / 10)
    gs_api.register_output("default:dirt", "nsspf:boletus_pinophilus", 1 / 10)
    gs_api.register_output("default:dirt", "nsspf:boletus_satanas", 1 / 10)
    gs_api.register_output("default:dirt", "nsspf:cantharellus_cibarius", 1 / 10)
    gs_api.register_output("default:dirt", "nsspf:clitocybe_glacialis", 1 / 10)
    gs_api.register_output("default:dirt", "nsspf:coprinus_atramentarius", 1 / 10)
    gs_api.register_output("default:dirt", "nsspf:gyromitra_esculenta", 1 / 10)
    gs_api.register_output("default:dirt", "nsspf:hygrophorus_goetzii", 1 / 10)
    gs_api.register_output("default:dirt", "nsspf:lentinus_strigosus", 1 / 10)
    gs_api.register_output("default:dirt", "nsspf:lycoperdon_pyriforme", 1 / 10)
    gs_api.register_output("default:dirt", "nsspf:macrolepiota_procera", 1 / 10)
    gs_api.register_output("default:dirt", "nsspf:marasmius_haematocephalus", 1 / 10)
    gs_api.register_output("default:dirt", "nsspf:morchella_conica", 1 / 10)
    gs_api.register_output("default:dirt", "nsspf:psilocybe_cubensis", 1 / 10)
    gs_api.register_output("default:dirt", "nsspf:russula_xerampelina", 1 / 10)
    gs_api.register_output("default:dirt", "nsspf:suillus_grevillei", 1 / 10)
    gs_api.register_output("default:dirt", "nsspf:terfezia_arenaria", 1 / 10)
    gs_api.register_output("default:dirt", "nsspf:tuber_borchii", 1 / 10)
    gs_api.register_output("default:dirt", "nsspf:tuber_magnatum_pico", 1 / 10)
    gs_api.register_output("default:dirt", "nsspf:tuber_melanosporum", 1 / 10)
end

if minetest.get_modpath("oak") then
    gs_api.register_output("default:dirt", "oak:acorn", 1 / 2)
end

if minetest.get_modpath("rainf") then
    gs_api.register_output("default:dirt", "rainf:champignon", 1 / 2)
end

if minetest.get_modpath("vines") then
    gs_api.register_output("default:dirt", "vines:root_end", 1 / 2)
    gs_api.register_output("default:dirt", "vines:root_middle", 1 / 2)
end

---------------
-- dirt_with_grass
---------------

gs_api.register_input("default:dirt_with_grass", {fixed=gs_api.scale_probabilities_to_fill({
    ["default:silver_sand"] = 1,
    ["default:sand"] = 1 / 2,
    ["default:desert_sand"] = 1 / 4,
    ["default:dirt"] = 1 / 8,
}, 1 - (1 / 5))})

gs_api.register_output("default:dirt_with_grass", "default:apple", 1 / 2)
gs_api.register_output("default:dirt_with_grass", "default:dry_grass_1", 1 / 2)
gs_api.register_output("default:dirt_with_grass", "default:dry_shrub", 1 / 2)
gs_api.register_output("default:dirt_with_grass", "default:fern_1", 1 / 2)
gs_api.register_output("default:dirt_with_grass", "default:grass_1", 1 / 2)
gs_api.register_output("default:dirt_with_grass", "default:junglegrass", 1 / 2)
gs_api.register_output("default:dirt_with_grass", "default:marram_grass_1", 1 / 2)
gs_api.register_output("default:dirt_with_grass", "default:papyrus", 1 / 2)


if minetest.get_modpath("bakedclay") then
    gs_api.register_output("default:dirt_with_grass", "bakedclay:delphinium", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "bakedclay:lazarus", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "bakedclay:mannagrass", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "bakedclay:thistle", 1 / 2)
end

if minetest.get_modpath("baldcypress") then
    gs_api.register_output("default:dirt_with_grass", "baldcypress:dry_branches", 1 / 2)
end

if minetest.get_modpath("bonemeal") then
    gs_api.register_output("default:dirt_with_grass", "bonemeal:bone", 1 / 10)
end


if minetest.get_modpath("bbq") then
    gs_api.register_output("default:dirt_with_grass", "bbq:yeast", 1 / 2)
end

if minetest.get_modpath("butterflies") then
    gs_api.register_output("default:dirt_with_grass", "butterflies:butterfly_red", 1 / 20)
    gs_api.register_output("default:dirt_with_grass", "butterflies:butterfly_violet", 1 / 20)
    gs_api.register_output("default:dirt_with_grass", "butterflies:butterfly_white", 1 / 20)
end

if minetest.get_modpath("cherrytree") then
    gs_api.register_output("default:dirt_with_grass", "cherrytree:cherries", 1 / 2)
end

if minetest.get_modpath("clementinetree") then
    gs_api.register_output("default:dirt_with_grass", "clementinetree:clementine", 1 / 2)
end

if minetest.get_modpath("cottages") then
    gs_api.register_output("default:dirt_with_grass", "cottages:hay_mat", 1 / 2)
end

if minetest.get_modpath("ebony") then
    gs_api.register_output("default:dirt_with_grass", "ebony:creeper", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "ebony:creeper_leaves", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "ebony:liana", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "ebony:persimmon", 1 / 2)
end

if minetest.get_modpath("farming") then
    gs_api.register_output("default:dirt_with_grass", "farming:cotton", 1 / 2)
    if farming.mod == "redo" then
        gs_api.register_output("default:dirt_with_grass", "farming:barley", 1 / 2)
        gs_api.register_output("default:dirt_with_grass", "farming:blackberry", 1 / 2)
        gs_api.register_output("default:dirt_with_grass", "farming:blueberries", 1 / 2)
        gs_api.register_output("default:dirt_with_grass", "farming:cabbage", 1 / 2)
        gs_api.register_output("default:dirt_with_grass", "farming:chili_pepper", 1 / 2)
        gs_api.register_output("default:dirt_with_grass", "farming:cucumber", 1 / 2)
        gs_api.register_output("default:dirt_with_grass", "farming:grapes", 1 / 2)
        gs_api.register_output("default:dirt_with_grass", "farming:hemp_leaf", 1 / 2)
        gs_api.register_output("default:dirt_with_grass", "farming:lettuce", 1 / 2)
        gs_api.register_output("default:dirt_with_grass", "farming:mint_leaf", 1 / 2)
        gs_api.register_output("default:dirt_with_grass", "farming:oat", 1 / 2)
        gs_api.register_output("default:dirt_with_grass", "farming:pepper", 1 / 2)
        gs_api.register_output("default:dirt_with_grass", "farming:pepper_red", 1 / 2)
        gs_api.register_output("default:dirt_with_grass", "farming:pepper_yellow", 1 / 2)
        gs_api.register_output("default:dirt_with_grass", "farming:pineapple", 1 / 2)
        gs_api.register_output("default:dirt_with_grass", "farming:raspberries", 1 / 2)
        gs_api.register_output("default:dirt_with_grass", "farming:rhubarb", 1 / 2)
        gs_api.register_output("default:dirt_with_grass", "farming:rye", 1 / 2)
        gs_api.register_output("default:dirt_with_grass", "farming:tomato", 1 / 2)
    end
end

if minetest.get_modpath("ferns") then
    gs_api.register_output("default:dirt_with_grass", "ferns:fiddlehead", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "ferns:horsetail_01", 1 / 2)
end

if minetest.get_modpath("fireflies") then
    gs_api.register_output("default:dirt_with_grass", "fireflies:firefly", 1 / 40)
end

if minetest.get_modpath("flowers") then
    gs_api.register_output("default:dirt_with_grass", "flowers:chrysanthemum_green", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "flowers:dandelion_white", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "flowers:dandelion_yellow", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "flowers:geranium", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "flowers:rose", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "flowers:tulip", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "flowers:tulip_black", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "flowers:viola", 1 / 2)
end

if minetest.get_modpath("lemontree") then
    gs_api.register_output("default:dirt_with_grass", "lemontree:lemon", 1 / 2)
end

if minetest.get_modpath("mahogany") then
    gs_api.register_output("default:dirt_with_grass", "mahogany:creeper", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "mahogany:flower_creeper", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "mahogany:hanging_creeper", 1 / 2)
end

if minetest.get_modpath("mobs_animal") then
    gs_api.register_output("default:dirt_with_grass", "mobs_animal:bee", 1 / 20)
end

if minetest.get_modpath("mobs_bugslive") then
    gs_api.register_output("default:dirt_with_grass", "mobs_bugslive:bug", 1 / 20)
end

if minetest.get_modpath("moreplants") then
    gs_api.register_output("default:dirt_with_grass", "moreplants:bigfern", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "moreplants:bigflower", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "moreplants:blueflower", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "moreplants:bluespike", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "moreplants:bulrush", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "moreplants:bush", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "moreplants:clover", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "moreplants:curlyfruit", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "moreplants:deadweed", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "moreplants:fern", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "moreplants:groundfung", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "moreplants:jungleflower", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "moreplants:medflower", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "moreplants:moonflower", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "moreplants:spikefern", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "moreplants:tallgrass", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "moreplants:weed", 1 / 2)
end

if minetest.get_modpath("plumtree") then
    gs_api.register_output("default:dirt_with_grass", "plumtree:plum", 1 / 2)
end

if minetest.get_modpath("pomegranate") then
    gs_api.register_output("default:dirt_with_grass", "pomegranate:pomegranate", 1 / 2)
end

if minetest.get_modpath("rainf") then
    gs_api.register_output("default:dirt_with_grass", "rainf:camomille", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "rainf:dahlia", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "rainf:grapes", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "rainf:grass", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "rainf:hyacinth", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "rainf:pansy", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "rainf:red_daisy", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "rainf:weed", 1 / 2)
end

if minetest.get_modpath("sakuragi") then
    gs_api.register_output("default:dirt_with_grass", "sakuragi:cherry", 1 / 2)
end

if minetest.get_modpath("swaz") then
    gs_api.register_output("default:dirt_with_grass", "swaz:barberries", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "swaz:iris", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "swaz:lavender", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "swaz:pampas_grass", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "swaz:reed", 1 / 2)
    gs_api.register_output("default:dirt_with_grass", "swaz:swamp_grass", 1 / 2)
end

----------------------
-- saplings
----------------------

local function register_sapling(leaf, sapling)
    gs_api.register_input(leaf, {fixed=gs_api.scale_probabilities_to_fill({
        ["default:stick"] = 1,
    }, 1 - (1 / 5))})
    gs_api.register_output(leaf, sapling, 1)
end

register_sapling("default:acacia_bush_leaves", "default:acacia_bush_sapling")
register_sapling("default:acacia_leaves", "default:acacia_sapling")
register_sapling("default:aspen_leaves", "default:aspen_sapling")
register_sapling("default:blueberry_bush_leaves", "default:blueberry_bush_sapling")
register_sapling("default:bush_leaves", "default:bush_sapling")
register_sapling("default:jungleleaves", "default:junglesapling")
register_sapling("default:leaves", "default:sapling")
register_sapling("default:pine_bush_needles", "default:pine_bush_sapling")
register_sapling("default:pine_needles", "default:pine_sapling")

if minetest.get_modpath("baldcypress") then
    register_sapling("baldcypress:leaves", "baldcypress:sapling")
end

if minetest.get_modpath("bamboo") then
    register_sapling("bamboo:leaves", "bamboo:sprout")
end

if minetest.get_modpath("birch") then
    register_sapling("birch:leaves", "birch:sapling")
end

if minetest.get_modpath("cherrytree") then
    register_sapling("cherrytree:leaves", "cherrytree:sapling")
    register_sapling("cherrytree:blossom_leaves", "cherrytree:sapling")
end

if minetest.get_modpath("chestnuttree") then
    register_sapling("chestnuttree:leaves", "chestnuttree:sapling")
end

if minetest.get_modpath("clementinetree") then
    register_sapling("clementinetree:leaves", "clementinetree:sapling")
end

if minetest.get_modpath("ebony") then
    register_sapling("ebony:leaves", "ebony:sapling")
end

if minetest.get_modpath("hollytree") then
    register_sapling("hollytree:leaves", "hollytree:sapling")
end

if minetest.get_modpath("jacaranda") then
    register_sapling("jacaranda:blossom_leaves", "jacaranda:sapling")
end

if minetest.get_modpath("larch") then
    register_sapling("larch:leaves", "larch:sapling")
    gs_api.register_output("larch:leaves", "larch:moss", 1 / 10)
end

if minetest.get_modpath("lemontree") then
    register_sapling("lemontree:leaves", "lemontree:sapling")
end

if minetest.get_modpath("mahogany") then
    register_sapling("mahogany:leaves", "mahogany:sapling")
end

if minetest.get_modpath("maple") then
    register_sapling("maple:leaves", "maple:sapling")
end

if minetest.get_modpath("moretrees") then
    register_sapling("moretrees:apple_tree_leaves", "moretrees:apple_tree_sapling")
    register_sapling("moretrees:beech_leaves", "moretrees:beech_sapling")
    register_sapling("moretrees:birch_leaves", "moretrees:birch_sapling")
    register_sapling("moretrees:cedar_leaves", "moretrees:cedar_sapling")
    register_sapling("moretrees:date_palm_leaves", "moretrees:date_palm_sapling")
    register_sapling("moretrees:fir_leaves", "moretrees:fir_sapling")
    register_sapling("moretrees:fir_leaves_bright", "moretrees:fir_sapling")
    register_sapling("moretrees:jungletree_leaves_red", "default:junglesapling")
    register_sapling("moretrees:jungletree_leaves_yellow", "default:junglesapling")
    register_sapling("moretrees:oak_leaves", "moretrees:oak_sapling")
    register_sapling("moretrees:palm_leaves", "moretrees:palm_sapling")
    register_sapling("moretrees:poplar_leaves", "moretrees:poplar_sapling")
    register_sapling("moretrees:rubber_tree_leaves", "moretrees:rubber_tree_sapling")
    register_sapling("moretrees:sequoia_leaves", "moretrees:sequoia_sapling")
    register_sapling("moretrees:spruce_leaves", "moretrees:spruce_sapling")
    register_sapling("moretrees:willow_leaves", "moretrees:willow_sapling")
end

if minetest.get_modpath("oak") then
    register_sapling("oak:leaves", "oak:sapling")
end

if minetest.get_modpath("palm") then
    register_sapling("palm:leaves", "palm:sapling")
end

if minetest.get_modpath("plumtree") then
    register_sapling("plumtree:leaves", "plumtree:sapling")
end

if minetest.get_modpath("pomegranate") then
    register_sapling("pomegranate:leaves", "pomegranate:sapling")
end

if minetest.get_modpath("redtrees") then
    register_sapling("redtrees:rleaves", "redtrees:rsapling")
end

if minetest.get_modpath("sakuragi") then
    register_sapling("sakuragi:sleaves", "sakuragi:ssapling")
end

if minetest.get_modpath("willow") then
    register_sapling("willow:leaves", "willow:sapling")
end
