
-- This module supplies wine glasses

minetest .register_node( 'nightclub:wine_glass',
  {
    drop  = 'nightclub:wine_glass',
    description = 'Wine glass',
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
        {-0.14, -0.3,  -0.14,  0.14, -0.05, 0.14 },  -- upper
        {-0.01, -0.48, -0.01,  0.01, -0.3,  0.01 },  -- body
        {-0.09, -0.5,  -0.09,  0.09, -0.48, 0.09 },  -- bottom
      }, -- fixed
    }, -- node_box

    selection_box = {
      type = 'fixed',
      fixed = {
       --  x1,   y1,   z1,   x2,  y2,  z2
        {-0.2, -0.5, -0.2,  0.2, 0.0, 0.2 },
      }, -- fixed
    }, -- selection_box

  } -- wine_glass
) -- register_node

