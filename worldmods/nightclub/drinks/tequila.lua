
-- This module supplies tequila bottles

minetest .register_node( 'nightclub:tequila',
  {
    drop  = 'nightclub:tequila',
    description = 'Tequila',
    drawtype = 'nodebox',

    tiles = {
      'glass_top.png',  -- top
      'glass_top.png',  -- bottom
      'glass.png',    -- left
      'glass.png',    -- right
      'glass.png',  -- back
      'glass.png',  -- front
    },

    light_source  = 4,
    paramtype     = 'light',
    paramtype2    = 'facedir',
    buildable_to  = true,
    walkable      = false,
    use_texture_alpha  = true,

    sounds  = default .node_sound_glass_defaults(),
    groups  = { snappy = 1,  choppy = 2,  oddly_breakable_by_hand = 2 },

    drawtype = 'nodebox',
    node_box = {
      type = 'fixed',
      fixed = {
       --  x1,     y1,    z1,     x2,    y2,   z2
        {-0.065, -0.1,  -0.065,  0.065, 0.3,  0.065 },  -- cap / stem
        {-0.07,   0.25, -0.07,   0.07,  0.28, 0.07  },  -- lip
        {-0.18,  -0.2,  -0.18,   0.18, -0.1,  0.18  },  -- upper
        {-0.2,   -0.45, -0.2,    0.2,  -0.2,  0.2   },  -- body
        {-0.19,  -0.5,  -0.19,   0.19, -0.45, 0.19  },  -- bottom
      }, -- fixed
    }, -- node_box

    selection_box  = {
      type   = 'fixed',
      fixed  = {
       --  x1,   y1,   z1,   x2,  y2,  z2
        {-0.3, -0.5, -0.3,  0.3, 0.3, 0.3},
      }, -- fixed
    }, --selection_box

  } -- tequila
) -- register_node

