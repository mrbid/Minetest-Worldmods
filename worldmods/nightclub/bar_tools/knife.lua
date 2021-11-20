
-- This module supplies knives

minetest .register_node( 'nightclub:knife',
  {
    drop  = 'nightclub:knife',
    description  = 'Knife',
    drawtype  = 'nodebox',

    tiles  = {
      'tool.png', -- up
      'tool.png', -- down
      'tool_left.png',  -- left
      'tool_right.png', -- right
      'tool_top.png',     -- tip
      'tool_bottom.png',  -- handle bottom
    }, -- tiles

    light_source  = 8,
    paramtype     = 'light',
    paramtype2    = 'facedir',
    buildable_to  = true,
    walkable      = false,

    sounds = default .node_sound_wood_defaults(),
    groups = { snappy = 1,  choppy = 2,  oddly_breakable_by_hand = 2 },

    drawtype  = 'nodebox',
    node_box  = {
      type   = 'fixed',
      fixed  = {
         --  x1,    y1,    z1,     x2,    y2,    z2
          {-0.45, -0.473, 0.1,   -0.35, -0.477, 0.15 },  -- tip
          {-0.45, -0.48, -0.18,  -0.3,  -0.47,  0.1  },  -- blade
          {-0.45, -0.45, -0.4,   -0.38, -0.5,  -0.18 },  -- handle
        }, -- fixed
      }, -- node_box

    selection_box  = {
      type   = 'fixed',
      fixed  = {
         --  x1,   y1,    z1,    x2,   y2,  z2
          {-0.5, -0.42, -0.5,  -0.2, -0.5, 0.1},
        }, -- fixed
      }, -- selection_box

  } -- knife
) -- register_node

