
-- This module supplies vodka bottles

minetest .register_node( 'nightclub:vodka',
  {
    drop  = 'nightclub:vodka',
    description = 'Vodka',
    drawtype = 'nodebox',

    tiles = {
      'white_wine_top.png', -- top
      'white_wine_top.png', -- bottom
      'vodka.png',  -- left
      'vodka.png',  -- right
      'vodka.png',       -- back
      'vodka_label.png', -- front
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
        -- x1,    y1,    z1,    x2,    y2,   z2
        {-0.07,  0.3,  -0.07,  0.07,  0.33, 0.07  },  -- lip
        {-0.065, 0.05, -0.065, 0.065, 0.35, 0.065 },  -- stem
        {-0.15,  0.0,  -0.15,  0.15,  0.05, 0.15  },  -- taper
        {-0.2,  -0.45, -0.2,   0.2,   0.0,  0.2   },  -- body
        {-0.18, -0.5,  -0.18,  0.18, -0.45, 0.18  },  -- bottom
      }, -- fixed
    }, -- node_box

    selection_box  = {
      type   = 'fixed',
      fixed  = {
       --  x1,   y1,   z1,   x2,  y2,   z2
        {-0.3, -0.5, -0.3,  0.3, 0.35, 0.3},
      }, -- fixed
    }, -- selection_box

  } -- vodka
) -- register_node

