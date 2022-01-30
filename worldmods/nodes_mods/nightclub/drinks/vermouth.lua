
-- This module supplies vermouth bottles

minetest. register_node( 'nightclub:vermouth',
  {
    drop  = 'nightclub:vermouth',
    description = 'Vermouth',
    drawtype = 'nodebox',

    tiles = {
      'gin_top.png',   -- top
      'gin_bottom.png', -- bottom
      'vermouth.png',    -- left
      'vermouth.png',     -- right
      'vermouth.png',      -- back
      'vermouth_label.png', -- front
    }, -- tiles

    light_source  = 4,
    paramtype     = 'light',
    paramtype2    = 'facedir',
    buildable_to  = true,
    walkable      = false,
    use_texture_alpha  = true,

    sounds  = default .node_sound_glass_defaults(),
    groups  = { snappy = 1,  choppy = 2,  oddly_breakable_by_hand = 2 },

    drawtype  = 'nodebox',
    node_box  = {
      type   = 'fixed',
      fixed  = {
       --  x1,     y1,    z1,     x2,    y2,   z2
        {-0.07,   0.3,  -0.07,   0.07,  0.33, 0.07  },  -- lip
        {-0.065, -0.1,  -0.065,  0.065, 0.35, 0.065 },  -- stem
        {-0.15,   0.0,  -0.15,   0.15,  0.05, 0.15  },  -- taper
        {-0.23,  -0.05, -0.23,   0.23, -0.2,  0.23  },  -- ledge
        {-0.2,   -0.5,  -0.2,    0.2,   0.0,  0.2   },  -- body
        {-0.23,  -0.5,  -0.23,   0.23, -0.45, 0.23  },  -- bottom
      },
    },

    selection_box  = {
      type   = 'fixed',
      fixed  = {
       --  x1,   y1,   z1,   x2,  y2,   z2
        {-0.3, -0.5, -0.3,  0.3, 0.35, 0.3},
      }, -- fixed
    }, --selection_box

  }
) -- register_node

