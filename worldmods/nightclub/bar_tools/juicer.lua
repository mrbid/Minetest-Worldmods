
-- This module supplies citrus juicers

minetest .register_node( 'nightclub:juicer',
  {
    drop  = 'nightclub:juicer',
    description  = 'Citrus juicer',
    drawtype  = 'nodebox',

    tiles  = {
      'juicer_top.png',-- top
      'juicer_top.png',-- bottom
      'juicer_side.png', -- left
      'juicer_side.png', -- right
      'juicer_side.png',   -- back
      'juicer_side.png',   -- front
    }, -- tiles

    light_source = 4,
    paramtype    = 'light',
    paramtype2   = 'facedir',
    buildable_to = true,
    walkable     = false,
    use_texture_alpha  = true,

    sounds  = default .node_sound_glass_defaults(),
    groups  = { snappy = 1,  choppy = 2,  oddly_breakable_by_hand = 2 },

    drawtype  = 'nodebox',
    node_box  = {
      type   = 'fixed',
      fixed  = {
      --   x1,    y1,    z1,     x2,    y2,   z2
        {-0.02, -0.3,  -0.02,   0.02, -0.27, 0.02 },  -- tip
        {-0.04, -0.35, -0.04,   0.04, -0.3,  0.04 },  -- taper
        {-0.06, -0.45, -0.06,   0.06, -0.35, 0.06 },  -- grinder

        {-0.2,  -0.35,  -0.18, -0.18, -0.45, -0.1  },  -- bowl left
        {-0.25, -0.375, -0.1,  -0.18, -0.45, -0.05 },  -- bowl spout
        {-0.28, -0.4,  -0.05, -0.18, -0.45, 0.05 },  -- spout
        {-0.25, -0.375, 0.1,  -0.18, -0.45, 0.05 },  -- bowl spout
        {-0.2,  -0.35,  0.1,  -0.18, -0.45, 0.18 },  -- bowl left

        {-0.18, -0.35, -0.2,  0.18, -0.45, -0.18 },  -- bowl front
        { 0.2,  -0.35, -0.18, 0.18, -0.45,  0.18 },  -- bowl right
        {-0.18, -0.35,  0.2,  0.18, -0.45,  0.18 },  -- bowl back

        { 0.2,  -0.45, -0.04,  0.3,  -0.35, 0.04 },  -- handle
        {-0.18, -0.5,  -0.18,  0.18, -0.45, 0.18 },  -- bottom
      }, -- fixed
    }, -- node_box

    selection_box  = {
      type   = 'fixed',
      fixed  = {
       --  x1,    y1,   z1,   x2,   y2,   z2
        {-0.3, -0.5, -0.3,  0.3, -0.35, 0.3 },
      }, -- fixed
    }, -- selection_box

  } -- juicer
) -- register_node

