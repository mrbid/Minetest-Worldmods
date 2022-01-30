
-- This module supplies cutting boards

minetest .register_node( 'nightclub:cutting_board',
  {
    drop  = 'nightclub:cutting_board',
    description  = 'Cutting board',
    drawtype  = 'nodebox',

    tiles  = {'cutting_board.png'}, -- all sides, same texture

    light_source  = 8,
    paramtype     = 'light',
    walkable      = false,
    buildable_to  = true,

    sounds  = default .node_sound_wood_defaults(),
    groups  = { snappy = 1,  choppy = 2,  oddly_breakable_by_hand = 2 },

    drawtype  = 'nodebox',
    node_box  = {
      type   = 'fixed',
      fixed  = {
         --  x1,   y1,    z1,   x2,   y2,  z2
          {-0.3, -0.42, -0.3,  0.3, -0.5, 0.3 },
        }, -- fixed
      }, -- node_box
      
    selection_box  = {
      type   = 'fixed',
      fixed  = {
       --  x1,   y1,    z1,   x2,   y2,  z2
        {-0.5, -0.42, -0.5,  0.5, -0.5, 0.5 },
        }, -- fixed
      }, -- selection_box

  } -- cutting_board
) -- register_node

