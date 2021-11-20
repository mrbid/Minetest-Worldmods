
-- This module supplies red wine bottles

minetest .register_node( 'nightclub:red_wine',
  {
    drop  = 'nightclub:red_wine',
    description  = 'red wine',
    drawtype  = 'nodebox',

    tiles  = {
      'red_wine_top.png',  -- top
      'red_wine_top.png',  -- bottom
      'red_wine.png',  -- left
      'red_wine.png',  -- right
      'red_wine.png',        -- back
      'red_wine_label.png',  -- front
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
        -- x1,    y1,    z1,     x2,    y2,   z2
        {-0.07,  0.3,  -0.07,   0.07,  0.33, 0.07  },  -- lip
        {-0.065, 0.0,  -0.065,  0.065, 0.35, 0.065 },  -- stem
        {-0.13, -0.08, -0.13,   0.13,  0.0,  0.13  },  -- taper
        {-0.18, -0.24, -0.18,   0.18, -0.08, 0.18  },  -- upper
        {-0.2,  -0.45, -0.2,    0.2,  -0.24, 0.2   },  -- body
        {-0.19, -0.5,  -0.19,   0.19, -0.45, 0.19  },  -- bottom
      }, -- fixed
    }, -- node_box

    selection_box = {
      type = 'fixed',
      fixed = {
        -- x1,   y1,   z1,   x2,  y2,   z2
        {-0.3, -0.5, -0.3,  0.3, 0.35, 0.3},
      }, -- fixed
    }, -- selection_box

  } -- red_wine
) -- register_node

