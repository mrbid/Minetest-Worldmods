
-- This file supplies lowball glasses

minetest .register_node( 'nightclub:lowball',
  {
    drop  = 'nightclub:lowball',
    description = 'lowball glass',
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
    use_texture_alpha  = true,

    sounds  = default .node_sound_glass_defaults(),
    groups  = { snappy = 1,  choppy = 2,  oddly_breakable_by_hand = 2 },

    drawtype = 'nodebox',
    node_box = {
      type = 'fixed',
      fixed = {
       --  x1,    y1,    z1,    x2,    y2,   z2
        {-0.12, -0.4,  -0.12,  0.12, -0.23, 0.12 },  -- upper
        {-0.11, -0.45, -0.11,  0.11, -0.4,  0.11 },  -- body
        {-0.1,  -0.5,  -0.1,   0.1,  -0.45, 0.1  },  -- bottom
        },
      },

    selection_box  = {
      type  = 'fixed',
      fixed  = {
       --  x1,    y1,   z1,    x2,    y2,   z2
        {-0.15, -0.5, -0.15,  0.15, -0.15, 0.15 },
      },
    },

  } -- lowball
) -- register_node

