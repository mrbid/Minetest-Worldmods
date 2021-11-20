
-- This module supplies Cleopatra glasses

minetest .register_node( 'nightclub:cleopatra',
  {
    drop  = 'nightclub:cleopatra',
    description = 'Cleopatra glass',
    drawtype = 'nodebox',

    tiles = {
      'glass_top.png', -- top
      'glass_top.png', -- bottom
      'glass.png',   -- left
      'glass.png',   -- right
      'glass.png', -- back
      'glass.png', -- front
    }, -- tiles

    light_source  = 4,
    paramtype     = 'light',
    paramtype2    = 'facedir',
    buildable_to  = true,
    walkable      = false,
    use_texture_alpha = true,

    sounds  = default .node_sound_glass_defaults(),
    groups  = { snappy = 1,  choppy = 2,  oddly_breakable_by_hand = 2 },

    drawtype  = 'nodebox',
    node_box  = {
      type   = 'fixed',
      fixed  = {
       --  x1,    y1,    z1,    x2,    y2,   z2
        {-0.19, -0.05, -0.09,  0.19,  0.0,  0.19 },  -- lip
        {-0.2,  -0.3,  -0.2,   0.2,  -0.05, 0.2  },  -- body
        {-0.02, -0.48, -0.02,  0.02, -0.3,  0.02 },  -- stem
        {-0.13, -0.5,  -0.13,  0.13, -0.48, 0.13 },  -- bottom
      }, -- fixed
    }, -- node_box

    selection_box = {
      type = 'fixed',
      fixed = {
       --  x1,    y1,   z1,    x2,   y2,   z2
        {-0.25, -0.5, -0.25,  0.25, 0.15, 0.25 },
      }, -- fixed
    }, --selection_box

  } -- cleopatra
) -- register_node

