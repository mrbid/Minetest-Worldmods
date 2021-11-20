
-- This module supplies beer bottles

minetest .register_node( 'nightclub:beer_bottle',
  {
    drop  = 'nightclub:beer_bottle',
    description = 'Beer bottle',
    drawtype = 'nodebox',
    tiles = {
      'beer_cap.png',  -- top
      'back.png',      -- bottom
      'beer_bottle.png', -- left
      'beer_bottle.png', -- right
      'beer_label.png',    -- back
      'beer_label.png',    -- front
    },

    light_source  = 4,
    paramtype     = 'light',
    paramtype2    = 'facedir',
    buildable_to  = true,
    walkable      = false,

    sounds  = default .node_sound_glass_defaults(),
    groups  = { snappy = 1,  choppy = 2,  oddly_breakable_by_hand = 2 },

    drawtype = 'nodebox',
    node_box = {
      type = 'fixed',
      fixed = {
         -- x1,   y1,     z1,     x2,    y2,   z2
        {-0.063, -0.1,  -0.063,  0.063, 0.18, 0.063 },  -- cap / stem
        {-0.068,  0.1,  -0.068,  0.068, 0.13, 0.068 },  -- lip
        {-0.08,  -0.2,  -0.08,   0.08, -0.1,  0.08  },  -- upper
        {-0.10,  -0.45, -0.10,   0.11, -0.2,  0.10  },  -- body
        {-0.09,  -0.5,  -0.09,   0.09, -0.45, 0.09  },  -- bottom
      }, -- fixed
    }, -- node_box

    selection_box = {
      type = 'fixed',
      fixed = {
        -- x1,   y1,   z1,   x2,  y2,  z2
        {-0.3, -0.5, -0.3,  0.3, 0.3, 0.3 },
      }, -- fixed
    }, --selection_box

  } -- beer_bottle
) -- register_node
