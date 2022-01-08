--
-- Minetest stasis mod - More chambers
--

-- Take an item from the player's inventory
local steal_item = function(player, required)
    local victim = player:get_player_name()
    local item = player:get_wielded_item()
    local required = ItemStack(required)
    local required_name = required:get_name()
    local required_count = required:get_count()
    
    if item:get_name() == required_name and
      item:get_count() >= required_count then
        if item:get_count() == required_count then
            item = nil
        else
            item = item:take_item(required_count)
        end
        minetest.after(0, function()
            player:set_wielded_item(item)
        end)
    else
        local def = minetest.registered_items[required_name]
        if def and def.description then
            item = def.description:lower()
        else
            item = required_name
        end
        minetest.chat_send_player(victim,
            'You must hold ' .. tostring(required_count) .. 'x ' ..
            item .. ' to use this stasis chamber.')
        return true
    end
end

--
-- Mk1 chambers
--
-- Requires 1 glass bottle per use, SINGLE-USE ONLY
--
stasis.register_chamber('stasis:1_chamber', {
    description = "Stasis chamber Mk1",
    tiles = {'default_wood.png'},
    drawtype = 'stasis_chamber',
    groups = {dig_immediate = 2},
    replace_with = 'stairs:slab_wood',
    
    on_construct = function(pos)
        local meta = minetest.get_meta(pos)
        meta:set_string('infotext', 'Stasis chamber Mk1\nSINGLE USE ONLY')
    end,
    
    on_rightclick = function(pos, node, player)
        local meta = minetest.get_meta(pos)
        if steal_item(player, 'vessels:glass_bottle') then
            return true
        else
            meta:set_string('infotext', '')
        end
    end,
})

--
-- Mk2 chambers
--
-- Requires 1 mese crystal fragment per use
--
stasis.register_chamber('stasis:2_chamber', {
    description = "Stasis chamber Mk2",
    tiles = {'default_brick.png'},
    drawtype = 'stasis_chamber',
    groups = {dig_immediate = 2},
    
    on_construct = function(pos)
        local meta = minetest.get_meta(pos)
        meta:set_string('infotext', 'Stasis chamber Mk2')
    end,
    
    on_rightclick = function(pos, node, player)
        return steal_item(player, 'default:mese_crystal_fragment')
    end,
})

--
-- Crafting
--

minetest.register_craft({
    output = 'stasis:1_chamber',
    recipe = {
        {'default:snow',  'doors:door_glass', 'default:snow'},
        {'group:wood',    'beds:fancy_bed',   'group:wood'},
        {'default:torch', 'group:wood',       'default:torch'},
    },
})

minetest.register_craft({
    output = 'stasis:2_chamber',
    recipe = {
        {'default:ice',   'default:brick',        'default:ice'},
        {'default:brick', 'stasis:1_chamber',     'default:brick'},
        {'default:ice',   'default:mese_crystal', 'default:ice'},
    },
})

minetest.register_craft({
    output = 'stasis:chamber',
    recipe = {
        {'default:ice',        'default:mese',     'default:ice'},
        {'default:steelblock', 'stasis:2_chamber', 'default:steelblock'},
        {'default:steelblock', 'default:mese',     'default:steelblock'},
    },
    replacements = {
        {'default:mese', 'default:diamondblock'},
    },
})
