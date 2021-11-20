
-- This module supplies martini glasses

minetest .register_node( 'nightclub:martini',
  {
    drop  = 'nightclub:martini',
    description  = 'Martini glass',
    drawtype  = 'nodebox',

    tiles  = {
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
    use_texture_alpha  = true,

    sounds  = default .node_sound_glass_defaults(),
    groups  = { snappy = 1,  choppy = 2,  oddly_breakable_by_hand = 2 },

    drawtype  = 'nodebox',
    node_box  = {
      type   = 'fixed',
      fixed  = {
       --  x1,    y1,   z1,     x2,    y2,   z2
        {-0.15, -0.2,  -0.15,  0.15, -0.25, 0.15 },  -- upper
        {-0.13, -0.3,  -0.13,  0.15, -0.25, 0.13 },  -- 
        {-0.11, -0.35, -0.11,  0.11, -0.3,  0.11 },  -- body
        {-0.01, -0.48, -0.01,  0.01, -0.35, 0.01 },  -- 
        {-0.09, -0.5,  -0.09,  0.09, -0.48, 0.09 },  -- bottom
        },
      },

    selection_box  = {
      type   = 'fixed',
      fixed  = {
       --  x1,   y1,   z1,   x2,   y2,  z2
        {-0.2, -0.5, -0.2,  0.2, -0.1, 0.2 },
      },
    },

  } -- martini
) -- register_node

