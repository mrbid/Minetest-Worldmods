
-- This module supplies pints

minetest.register_node( 'nightclub:pint_glass',
  {
    drop  = 'nightclub:pint_glass',
    description = 'Pint glass',
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

    sounds = default.node_sound_glass_defaults(),
    groups  = { snappy = 1,  choppy = 2,  oddly_breakable_by_hand = 2 },

    drawtype = 'nodebox',
    node_box = {
      type = 'fixed',
      fixed = {
       --  x1,    y1,    z1,    x2,    y2,   z2
        {-0.13, -0.2,  -0.13,  0.13, -0.15, 0.13 },  -- lip
        {-0.11, -0.2,  -0.11,  0.11, -0.35, 0.11 },  -- upper
        {-0.09, -0.45, -0.09,  0.09, -0.35, 0.09 },  -- body
        {-0.1,  -0.5,  -0.1,   0.1,  -0.45, 0.1  },  -- bottom
      }, -- fixed
    }, -- node_box

    selection_box = {
      type = 'fixed',
      fixed = {
       --  x1,    y1,   z1,    x2,   y2,  z2
        {-0.15, -0.5, -0.15,  0.15, 0.0, 0.15 },
      }, -- fixed
    }, -- selection_box

  } -- pint_glass
) --register_node

