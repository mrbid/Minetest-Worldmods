
-- This module supplies tap handles

minetest .register_node( 'nightclub:tap_handles',
  {
    drop  = 'nightclub:tap_handles',
    description  = 'Tap handles',
    drawtype  = 'nodebox',

    tiles  = {
      'tap_top.png', -- top
      'back.png',    -- bottom
      'tap.png',   -- left
      'tap.png',   -- right
      'tap.png',  -- back
      'tap.png',  -- front
    },

    light_source  = 4,
    paramtype     = 'light',
    paramtype2    = 'facedir',
    buildable_to  = true,
    walkable      = false,

    sounds  = default .node_sound_wood_defaults(),
    groups  = { snappy = 1,  choppy = 2,  oddly_breakable_by_hand = 2 },

    on_punch  = function(pos, node, player, pointed_thing)
      minetest .swap_node(pos, {name = 'nightclub:tap_left', param2 = node .param2})
      minetest .sound_play('nightclub_tap_left', {pos = pos, gain = 0.5})
    end, -- on_punch

    on_rightclick  = function(pos, node, player, itemstack, pointed_thing)
      minetest .swap_node(pos, {name = 'nightclub:tap_right', param2 = node .param2})
      minetest .sound_play('nightclub_tap_right', {pos = pos, gain = 0.5})
    end, -- on_rightclick

    drawtype  = 'nodebox',
    node_box  = {
      type   = 'fixed',
      fixed  = {
       --  x1,     y1,    z1,     x2,    y2,     z2
        {-0.1,    0.5,  -0.1,   -0.2,   0.1,   -0.15 }, -- left handle up
        {-0.1,    0.18,  0.0,   -0.15,  0.1,   -0.35 }, -- left valve
        {-0.1,    0.1,  -0.3,   -0.13,  0.036, -0.35 }, -- left spigot

        { 0.1,    0.5,  -0.1,    0.2,   0.1,   -0.15 }, -- right handle up
        { 0.1,    0.18,  0.0,    0.15,  0.1,   -0.35 }, -- right valve
        { 0.1,    0.1,  -0.3,    0.13,  0.036, -0.35 }, -- right spigot

        {-0.095, -0.47,  0.095,  0.095, 0.15,  -0.095 }, -- post
        {-0.35,  -0.5,   0.15,   0.35, -0.47,  -0.35 },  -- footer
        }, -- fixed
      }, -- node_box

    selection_box  = {
      type   = 'fixed',
      fixed  = {
         --  x1,   y1,   z1,   x2,  y2,  z2
          {-0.3, -0.5, -0.5,  0.3, 0.5, 0.1 },
        }, -- fixed
      }, -- selection_box

  } -- tap_handles
) -- register_node


minetest .register_node( 'nightclub:tap_left',
  {
    drop  = 'nightclub:tap_handles',
    description  = 'Tap handles',
    drawtype  = 'nodebox',

    tiles  = {
      'tap_top.png', -- top
      'back.png',    -- bottom
      'tap.png',   -- left
      'tap.png',   -- right
      'tap.png',  -- back
      'tap.png',  -- front
    },

    light_source  = 4,
    paramtype     = 'light',
    paramtype2    = 'facedir',
    buildable_to  = true,
    walkable      = false,

    sounds  = default .node_sound_wood_defaults(),
    groups  = { snappy = 1,  choppy = 2,  oddly_breakable_by_hand = 2,  not_in_creative_inventory = 1 },

    on_punch  = function(pos, node, player, pointed_thing)
      minetest .swap_node(pos, {name = 'nightclub:tap_handles', param2 = node .param2})
    end, -- on_punch

    on_rightclick  = function(pos, node, player, itemstack, pointed_thing)
      minetest .swap_node(pos, {name = 'nightclub:tap_handles', param2 = node .param2})
    end, -- on_rightclick

    drawtype  = 'nodebox',
    node_box  = {
      type   = 'fixed',
      fixed  = {
       --  x1,     y1,    z1,     x2,    y2,     z2
        {-0.15,   0.5,  -0.2,   -0.25,  0.35,  -0.25 }, -- left handle high pulled
        {-0.125,  0.35, -0.15,  -0.225, 0.25,  -0.2  }, -- left handle mid pulled
        {-0.1,    0.25, -0.1,   -0.2,   0.1,   -0.15 }, -- left handle low pulled

        {-0.1,    0.18,  0.0,   -0.15,  0.1,   -0.35 }, -- left valve
        {-0.1,    0.1,  -0.3,   -0.13,  0.036, -0.35 }, -- left spigot

        { 0.1,    0.5,  -0.1,    0.2,   0.1,   -0.15 }, -- right handle up
        { 0.1,    0.18,  0.0,    0.15,  0.1,   -0.35 }, -- right valve
        { 0.1,    0.1,  -0.3,    0.13,  0.036, -0.35 }, -- right spigot

        {-0.095, -0.47,  0.095,  0.095, 0.15,  -0.095 }, -- post
        {-0.35,  -0.5,   0.15,   0.35, -0.47,  -0.35 },  -- footer
        }, -- fixed
      }, -- node_box

    selection_box  = {
      type   = 'fixed',
      fixed  = {
         --  x1,   y1,   z1,   x2,  y2,  z2
          {-0.3, -0.5, -0.5,  0.3, 0.5, 0.1 },
        }, -- fixed
      }, -- selection_box

  } -- tap_handles
) -- register_node


minetest .register_node( 'nightclub:tap_right',
  {
    drop  = 'nightclub:tap_handles',
    description  = 'Tap handles',
    drawtype  = 'nodebox',

    tiles  = {
      'tap_top.png', -- top
      'back.png',    -- bottom
      'tap.png',   -- left
      'tap.png',   -- right
      'tap.png',  -- back
      'tap.png',  -- front
    },

    light_source  = 4,
    paramtype     = 'light',
    paramtype2    = 'facedir',
    buildable_to  = true,
    walkable      = false,

    sounds  = default .node_sound_wood_defaults(),
    groups  = { snappy = 1,  choppy = 2,  oddly_breakable_by_hand = 2,  not_in_creative_inventory = 1 },

    on_punch  = function(pos, node, player, pointed_thing)
      minetest .swap_node(pos, {name = 'nightclub:tap_handles', param2 = node .param2})
    end, -- on_punch

    on_rightclick  = function(pos, node, player, itemstack, pointed_thing)
      minetest .swap_node(pos, {name = 'nightclub:tap_handles', param2 = node .param2})
    end, -- on_rightclick

    drawtype  = 'nodebox',
    node_box  = {
      type   = 'fixed',
      fixed  = {
       --  x1,     y1,    z1,     x2,    y2,     z2
        {-0.1,    0.5,  -0.1,   -0.2,   0.1,   -0.15 }, -- left handle up
        {-0.1,    0.18,  0.0,   -0.15,  0.1,   -0.35 }, -- left valve
        {-0.1,    0.1,  -0.3,   -0.13,  0.036, -0.35 }, -- left spigot

        { 0.15,   0.5,  -0.2,    0.25,  0.35,  -0.25 }, -- right handle high pulled
        { 0.125,  0.35, -0.15,   0.225, 0.25,  -0.2  }, -- right handle mid pulled
        { 0.1,    0.25, -0.1,    0.2,   0.1,   -0.15 }, -- right handle low pulled

        { 0.1,    0.18,  0.0,    0.15,  0.1,   -0.35 }, -- right valve
        { 0.1,    0.1,  -0.3,    0.13,  0.036, -0.35 }, -- right spigot

        {-0.095, -0.47,  0.095,  0.095, 0.15,  -0.095 }, -- post
        {-0.35,  -0.5,   0.15,   0.35, -0.47,  -0.35 },  -- footer
        }, -- fixed
      }, -- node_box

    selection_box  = {
      type   = 'fixed',
      fixed  = {
         --  x1,   y1,   z1,   x2,  y2,  z2
          {-0.3, -0.5, -0.5,  0.3, 0.5, 0.1 },
        }, -- fixed
      }, -- selection_box

  } -- tap_handles
) -- register_node

