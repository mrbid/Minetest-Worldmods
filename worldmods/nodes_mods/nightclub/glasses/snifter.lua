
-- This module supplies snifters

minetest .register_node( 'nightclub:snifter',
  {
    drop  = 'nightclub:snifter',
    description  = 'Snifter',
    drawtype  = 'nodebox',

    tiles  = {
      'glass_top.png', -- top
      'glass_top.png', -- bottom
      'glass.png',   -- left
      'glass.png',   -- right
      'glass.png', -- back
      'glass.png', -- front
    }, -- tiles

    paramtype     = 'light',
    light_source  = 4,
    paramtype2    = 'facedir',
    buildable_to  = true,
    walkable      = false,
    use_texture_alpha  = true,

    sounds = default .node_sound_glass_defaults(),
    groups  = { snappy = 1,  choppy = 2,  oddly_breakable_by_hand = 2 },

    drawtype  = 'nodebox',
    node_box  = {
      type   = 'fixed',
      fixed  = {
       --   x1,   y1,    z1,    x2,    y2,   z2
        {-0.11, -0.2,  -0.11,  0.11, -0.35, 0.11 },  -- upper
        {-0.02, -0.48, -0.02,  0.02, -0.35, 0.02 },  -- body
        {-0.1,  -0.5,  -0.1,   0.1,  -0.48, 0.1  },  -- bottom
      }, -- fixed
    }, -- node_box

    selection_box  = {
      type   = 'fixed',
      fixed  = {
       --  x1,    y1,   z1,    x2,   y2,   z2
        {-0.15, -0.5, -0.15,  0.15, -0.1, 0.15 },
      }, -- fixed
    }, -- selection_box

  } -- snifter
) -- register_node


