
-- This module supplies absinthe glasses

minetest .register_node( 'nightclub:absinthe_glass',
  {
    drop  = 'nightclub:absinthe_glass',
    description  = 'Absinthe glass',
    drawtype  = 'nodebox',

    tiles  = {
        'absinthe_top_full.png', -- top
        'absinthe_top_full.png', -- bottom
        'absinthe_glass_full.png', -- left
        'absinthe_glass_full.png', -- right
        'absinthe_glass_full.png', -- back
        'absinthe_glass_full.png', -- front
      }, -- tiles

    light_source  = 4,
    paramtype     = 'light',
    paramtype2    = 'facedir',
    buildable_to  = true,
    walkable      = false,
    use_texture_alpha  = true,

    sounds  = default .node_sound_glass_defaults(),
    groups  = { snappy = 1,  choppy = 2,   oddly_breakable_by_hand = 2 },

    on_punch  = function(pos, node, player, pointed_thing)
      node .tiles  = {
        'absinthe_top_full.png', -- top
        'absinthe_top_full.png', -- bottom
        'absinthe_glass_full.png', -- left
        'absinthe_glass_full.png', -- right
        'absinthe_glass_full.png', -- back
        'absinthe_glass_full.png', -- front
      }, -- tiles
      minetest .sound_play('nightclub_tap_left', {pos = pos, gain = 0.5})
    end, -- on_punch

    on_rightclick  = function(pos, node, player, itemstack, pointed_thing)
      node .tiles  = {
        'absinthe_top.png', -- top
        'absinthe_top.png', -- bottom
        'absinthe_glass.png', -- left
        'absinthe_glass.png', -- right
        'absinthe_glass.png', -- back
        'absinthe_glass.png', -- front
      }, -- tiles
      minetest .sound_play('nightclub_tap_right', {pos = pos, gain = 0.5})
    end, -- on_rightclick

    drawtype  = 'nodebox',
    node_box  = {
      type  = 'fixed',
      fixed  = {
         --  x1,    y1,    z1,    x2,    y2,    z2
          {-0.03, -0.22, -0.03,  0.03, -0.17,  0.03 },  -- sugar cube

          {-0.03, -0.25, -0.06,  0.03, -0.22,  0.06 },  -- spoon
          {-0.2,  -0.25, -0.02,  0.2,  -0.22,  0.02 },  -- handle

          {-0.11, -0.35, -0.11,  0.11, -0.25,  0.11 },  -- body
          {-0.01, -0.48, -0.01,  0.01, -0.35,  0.01 },  -- stem
          {-0.09, -0.5,  -0.09,  0.09, -0.48,  0.09 },  -- bottom
          }, -- fixed
      }, -- node_box

    selection_box  = {
      type  = 'fixed',
      fixed  = {
         --   x1,    y1,   z1,   x2,    y2,  z2
          { -0.23, -0.5, -0.1,  0.23, -0.17, 0.1 },
      }, -- fixed
    }, -- selection_box

  } -- absinthe_glass
) -- register_node

