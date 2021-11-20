
-- This module supplies can openers
-- http://soundbible.com/2111-Screw-In.html

minetest .register_node( 'nightclub:can_opener',
  {
    drop  = 'nightclub:can_opener',
    description  = 'Can opener',
    drawtype  = 'nodebox',

    tiles  = {
      'tool.png',    -- up to crank
      'tool.png',    -- down
      'tool_left.png', -- left
      'tool_right.png', -- right
      'tool_top.png',     -- top
      'tool_bottom.png',  -- handle bottom
    }, -- tiles

    light_source = 4,
    paramtype    = 'light',
    paramtype2   = 'facedir',
    buildable_to = true,
    walkable     = false,

    sounds  = default .node_sound_wood_defaults(),
    groups  = { snappy = 1,  choppy = 2,  oddly_breakable_by_hand = 2 },

    on_use  = function(itemstack, player, pointed_thing)
      pos  = player :getpos()
      minetest .sound_play('can_opener', {pos = pos, gain = 0.5})
    end, -- on_use

    drawtype  = 'nodebox',
    node_box  = {
      type   = 'fixed',
      fixed  = {
       --  x1,    y1,    z1,     x2,    y2,    z2
        {-0.1,  -0.48, -0.18,   0.1,  -0.46,  0     },  -- top
        {-0.15, -0.43, -0.1,    0.15, -0.4,  -0.125 },  -- crank
        {-0.12, -0.5,  -0.45,  -0.06, -0.44, -0.18  },  -- left handle
        { 0.12, -0.5,  -0.45,   0.06, -0.44, -0.18  },  -- right handle
        }, -- fixed
      }, -- node_box

    selection_box  = {
      type   = 'fixed',
      fixed  = {
       --  x1,   y1,   z1,   x2,   y2,  z2
        {-0.2, -0.4, -0.5,  0.2, -0.5, 0.1 },
        }, -- fixed
      }, -- selection_box

  } -- can_opener
) -- register_node

