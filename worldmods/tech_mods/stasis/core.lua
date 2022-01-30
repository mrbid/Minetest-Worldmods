--
-- Minetest stasis mod - The 'secure cloaking' stasis system
--

stasis.frozen_players = {}

stasis.freeze_player = function(player, pos, previous_node)
    if type(player) == 'string' then
        player = cloaking.get_player_by_name(player)
    end
    local victim = player:get_player_name()
    
    if stasis.frozen_players[victim] then
        return
    end
    
    -- Cloak player
    minetest.chat_send_player(victim, 'You fall into a magical sleep, so deep that the game no longer acknowledges your existence!')
    cloaking.cloak(player)
    
    -- Stop player from moving
    player:set_detach()
    player:set_physics_override({
        speed   = 0,
        jump    = 0,
        gravity = 0,
        sneak   = false,
    })
    
    -- Teleport player into stasis chamber and record the previous position
    local orig_pos = player:get_pos()
    
    local meta = {
        pos         = orig_pos,
        current_pos = orig_pos,
        previous    = previous_node,
    }
    
    if pos then
        player:set_pos(pos)
        meta.current_pos = pos
    end
    
    stasis.frozen_players[victim] = meta
end

-- Unfreezing
stasis.unfreeze_player = cloaking.uncloak

minetest.register_on_joinplayer(function(player)
    local victim = player:get_player_name()
    
    -- Was the player in stasis?
    if not stasis.frozen_players[victim] then
        return
    end
    
    -- Allow player to move
    player:set_detach()
    player:set_physics_override({
        speed   = 1,
        jump    = 1,
        gravity = 1,
        sneak   = true,
    })
    
    -- Teleport player out of stasis chamber
    player:set_pos(stasis.frozen_players[victim].pos)
    
    -- Replace stasis chamber with empty one
    local previous_node = stasis.frozen_players[victim].previous
    if previous_node then
        local pos = stasis.frozen_players[victim].current_pos
        if minetest.get_node(pos).name == previous_node .. '_active' then
            local meta = minetest.get_meta(pos)
            if meta:get_string('victim') == victim then
                local p2 = minetest.get_node(pos).param2
                minetest.swap_node(pos, {name = previous_node, param2 = p2})
            end
        end
    end
    
    -- Hide formspec
    if minetest.close_formspec then
        minetest.close_formspec(victim, 'stasis:end_transit')
    end
    
    -- Send chat message and remove table entry
    stasis.frozen_players[victim] = nil
    minetest.chat_send_player(victim, 'You slowly wake up from your time in stasis.')
end)

-- "Empty" all chambers before shutdown
minetest.register_on_shutdown(function()
    for _, meta in pairs(stasis.frozen_players) do
        if meta.previous then
            local p2 = minetest.get_node(meta.current_pos).param2
            minetest.swap_node(meta.current_pos, {name = meta.previous, p2})
        end
    end
end)

-- Allow players to be put in transit
local formspec_transit_start = 'size[4,2.5]no_prepend[]bgcolor[#000;true]'
    .. 'label[0,0;You are in transit.]'
    .. 'button_exit[0,0.5;4,1;quit;Leave stasis chamber]'

local formspec_transit_end   = 'size[4,2.5]'
    .. 'label[0,0;You have arrived.]'
    .. 'button_exit[0,0.5;4,1;leave_chamber;Leave stasis chamber]'
    .. 'button_exit[0,1.5;4,1;quit;Remain in stasis]'

stasis.begin_transit = function(victim, chamber, active_chamber)
    if victim and type(victim) ~= 'string' then
        victim = victim:get_player_name()
    end
    
    if not stasis.frozen_players[victim] or not cloaking.is_cloaked(victim) then
        return {name = chamber or 'stasis:chamber'}
    end
    
    if not active_chamber then
        active_chamber = chamber .. '_active'
    end
    
    minetest.show_formspec(victim, 'stasis:in_transit', formspec_transit_start)
    
    return {
        name = 'stasis:player',
        metadata = minetest.serialize({
            player_in_transit   = victim,
            stasis_chamber      = chamber,
            active_chamber      = active_chamber,
        }),
    }
end

stasis.end_transit = function(victim, new_pos)
    if not stasis.frozen_players[victim] then return false end
    local exit_pos = {x = new_pos.x, y = new_pos.y + 1, z = new_pos.z}
    stasis.frozen_players[victim].pos = exit_pos
    stasis.frozen_players[victim].current_pos = new_pos
    
    if not cloaking.is_cloaked(victim) then
        stasis.frozen_players[victim] = nil
        return false
    end
    
    cloaking.get_player_by_name(victim):set_pos(new_pos)
    minetest.show_formspec(victim, 'stasis:end_transit', formspec_transit_end)
    
    return true
end


minetest.register_node('stasis:player', {
    description = 'Player in stasis',
    stack_max = 1,
    tiles = {'player.png^default_glass.png'},
    groups = {dig_immediate = 3, not_in_creative_inventory = 1},
    paramtype2 = 'facedir',
    
    after_place_node = function(pos, placer, itemstack)
        local metadata = minetest.deserialize(itemstack:get_metadata()) or {}
        local victim   = metadata.player_in_transit or 'singleplayer'
        local chamber  = metadata.stasis_chamber or 'stasis:chamber'
        local active_chamber = metadata.active_chamber or chamber .. '_active'
        local p2 = minetest.get_node(pos).param2
        minetest.set_node(pos, {name = chamber, param2 = p2})
        if minetest.registered_nodes[chamber].on_construct then
            minetest.registered_nodes[chamber].on_construct(pos)
        end
        local meta = minetest.get_meta(pos)
        meta:set_string('victim', victim)
        if stasis.end_transit(victim, pos) then
            minetest.swap_node(pos, {name = active_chamber, param2 = p2})
        end
    end,
})

minetest.register_on_player_receive_fields(function(player, formname, fields)
    if  (formname == 'stasis:in_transit'  and fields.quit)
     or (formname == 'stasis:end_transit' and fields.leave_chamber) then
        stasis.unfreeze_player(player)
    end
end)
