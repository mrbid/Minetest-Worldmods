
-- This file supplies rum bottles

minetest.register_node( 'nightclub:rum',
  {
    drop  = 'nightclub:rum',
    description = 'Rum',
    drawtype = 'nodebox',

    tiles = {
      'red_wine_top.png', -- top
      'red_wine_top.png', -- bottom
      'rum.png',  -- left
      'rum.png',  -- right
      'rum.png',       -- back
      'rum_label.png', -- front
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
        {-0.18, -0.45, -0.18,   0.18, -0.08, 0.18  },  -- body
        {-0.15, -0.5,  -0.15,   0.15, -0.45, 0.15  },  -- bottom
      }, -- fixed
    }, -- node_box

    selection_box = {
      type = 'fixed',
      fixed = {
        -- x1,   y1,   z1,   x2,  y2,   z2
        {-0.3, -0.5, -0.3,  0.3, 0.35, 0.3},
      }, -- fixed
    }, -- selection_box

  } -- rum
) -- register_node

