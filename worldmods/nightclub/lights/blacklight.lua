
-- This module supplies blacklights

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- fluorescent tubes on ceiling

minetest .register_node( 'nightclub:blacklight',
  {
    drop  = 'nightclub:blacklight',
    description  = ('Blacklight'),
    drawtype  = 'nodebox',

    tiles  = {
      'back.png',         -- top
      'blacklight.png',    -- bottom
      'back.png',           -- ends
      'back.png',            -- ends
      'blacklight_sides.png', -- back
      'blacklight_sides.png',  -- front
    }, -- tiles

    node_box  = {
      type  = 'fixed',
      fixed  = {
        { -0.48, 0.35, -0.3,  0.48, 0.5, -0.2 },
        { -0.48, 0.35,  0.3,  0.48, 0.5,  0.2 },
      }, -- fixed
    }, -- node_box

    selection_box  = {
      type  = 'fixed',
      fixed  = {
        { -0.48, 0.35, -0.3,  0.48, 0.5, 0.3 },
      }, -- fixed
    }, -- selection_box

    light_source  = 9,
    paramtype     = 'light',
    paramtype2    = 'facedir',
    buildable_to  = true,
    sunlight_propagates  = false,

    groups  = { snappy  = 3 },
    sounds  = default .node_sound_glass_defaults(),

    on_place  = function( itemstack, placer, pointedg )

      local node  = minetest .env :get_node( pointedg .under )
      if not minetest .registered_nodes[ node .name ]
      or not minetest .registered_nodes[ node .name ] .on_rightclick then

        local above  = pointedg .above
        local under  = pointedg .under
        local pitch  = placer :get_look_pitch()
        local node  = minetest .env :get_node(above)

        if node .name ~= 'air' then return end

        if above .x ~= under .x or above .z ~= under .z then
          local fdir  = minetest .dir_to_facedir( placer :get_look_dir() )
          minetest .env :add_node( above, { name  = 'nightclub:blacklight_wall',  param2  = fdir } )
        else
          local fdir  = minetest .dir_to_facedir( placer :get_look_dir() )
          minetest .env :add_node( above, { name  = 'nightclub:blacklight',  param2  = fdir } )
        end -- above .x or .z

        if not minetest .setting_getbool( 'creative_mode' ) then
          itemstack :take_item()
        end -- creative_mode

        return minetest .item_place_node( itemstack,  placer,  pointedg )
      else
        minetest .registered_nodes[ node .name ] .on_rightclick( pointedg .under,  node,  placer )
      end -- [ node .name ]
    end -- on_place
  } -- blacklight
) -- register_node

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- fluorescent tubes on wall

minetest .register_node( 'nightclub:blacklight_wall',
  {
    drop  = 'nightclub:blacklight',
    description  = ('Blacklight on wall'),
    drawtype  = 'nodebox',

    tiles  = {
      'blacklight_sides.png', -- top
      'blacklight_sides.png', -- bottom
      'back.png',  -- ends
      'back.png',  -- ends
      'back.png',        -- back
      'blacklight.png',  -- front
    }, -- tiles

    node_box  = {
      type  = 'fixed',
      fixed  = {
        { -0.48,  0.3, 0.35,  0.48,  0.2, 0.5 },
        { -0.48, -0.3, 0.35,  0.48, -0.2, 0.5 },
      }, -- fixed
    }, -- node_box

    selection_box  = {
      type  = 'fixed',
      fixed  = {
        { -0.48, -0.3, 0.35,  0.48, 0.3, 0.5 },
      }, -- fixed
    }, -- selection_box

    light_source  = 9,
    paramtype     = 'light',
    paramtype2    = 'facedir',
    buildable_to  = true,
    sunlight_propagates  = false,

    sounds  = default.node_sound_glass_defaults(),
    groups  = { snappy = 3,  not_in_creative_inventory = 1 },

    on_place  = function( itemstack, placer, pointedg )
      local node  = minetest .env :get_node( pointedg .under )
      if not minetest .registered_nodes[ node .name ]
      or not minetest .registered_nodes[ node .name ] .on_rightclick then

        local above  = pointedg .above
        local under  = pointedg .under
        local pitch  = placer :get_look_pitch()
        local node   = minetest .env :get_node( above )

        if node .name ~= 'air' then return end

        if above .x ~= under .x or above .z ~= under .z then 
          local fdir  = minetest .dir_to_facedir( placer :get_look_dir() )
          minetest .env :add_node( above,  { name = 'nightclub:blacklight_wall',  param2 = fdir } )
        else
          local fdir  = minetest .dir_to_facedir( placer :get_look_dir() )
          minetest. env :add_node( above,  { name  = 'nightclub:blacklight',  param2 = fdir } )
        end -- if above .x or .z

        if not minetest .setting_getbool('creative_mode') then
          itemstack :take_item()
        end -- creative_mode

        return minetest .item_place_node( itemstack, placer, pointedg )
      else
        minetest .registered_nodes[ node .name ] .on_rightclick( pointedg .under,  node,  placer )
      end -- [ node .name ]
    end, -- on_place

  } -- blacklight_wall
) -- register_node

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- bulbs on ceiling

minetest .register_node( 'nightclub:blacklight_bulb',
  {
    drop  = 'nightclub:blacklight_bulb',
    description  = ('Blacklight bulb'),
    drawtype  = 'nodebox',

    tiles  = {
      'blacklight_bulb_back.png', -- top
      'blacklight.png',           -- bottom
      'blacklight.png',  -- side
      'blacklight.png',  -- side
      'blacklight.png',  -- back
      'blacklight.png',  -- front
    }, -- tiles

    node_box  = {
      type  = 'fixed',
      fixed  = {
        { -0.062, 0.35, -0.062,  0.062, 0.5, 0.062 },
        { -0.1,   0.35, -0.1,    0.1,   0.2, 0.1   },
        { -0.15,  0.2,  -0.15,   0.15, -0.1, 0.15  },
      }, -- fixed
    }, -- node_box

    selection_box  = {
      type  = 'fixed',
      fixed  = {
        { -0.3, -0.2, -0.3,  0.3, 0.5, 0.3 },
      }, -- fixed
    }, -- selection_box

    light_source  = 9,
    paramtype     = 'light',
    buildable_to  = true,
    walkable      = false,
    sunlight_propagates  = false,

    groups  = { snappy = 3 },
    sounds  = default .node_sound_glass_defaults(),

    on_place  = function( itemstack, placer, pointedg )

      local node  = minetest .env :get_node( pointedg .under )
      if not minetest .registered_nodes[ node .name ]
      or not minetest .registered_nodes[ node .name ] .on_rightclick then

        local above  = pointedg .above
        local under  = pointedg .under
        local pitch  = placer :get_look_pitch()
        local node   = minetest .env :get_node(above)

        if node .name ~= 'air' then return end

        if above .x ~= under .x or above .z ~= under .z then
          local fdir  = minetest .dir_to_facedir( placer :get_look_dir() )
          minetest .env :add_node( above,  { name = 'nightclub:blacklight_bulb_wall',  param2 = fdir } )
        else
          minetest .env :add_node( above,  { name = 'nightclub:blacklight_bulb' } )
        end -- above .x or .z

        if not minetest .setting_getbool('creative_mode') then
          itemstack :take_item()
        end -- creative_mode

        return minetest .item_place_node( itemstack, placer, pointedg )
      else
        minetest .registered_nodes[ node .name ] .on_rightclick( pointedg .under,  node,  placer )
      end -- [ node .name ]
    end -- on_place

  } -- blacklight_bulb
) -- register_node

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- bulbs on wall

minetest .register_node( 'nightclub:blacklight_bulb_wall',
  {
    drop  = 'nightclub:blacklight_bulb',
    description  = ('Blacklight bulb, on wall'),
    drawtype  = 'nodebox',

    tiles  = {
      'blacklight.png',       -- top
      'blacklight.png',        -- bottom
      'blacklight.png',         -- side
      'blacklight.png',          -- side
      'blacklight_bulb_back.png', -- back
      'blacklight.png',            -- front
    }, -- tiles

    node_box  = {
      type  = 'fixed',
      fixed  = {
        { -0.062, -0.062, 0.35,  0.062, 0.062, 0.5 },
        { -0.1,   -0.1,   0.35,  0.1,   0.1,   0.2 },
        { -0.15,  -0.15,  0.2,   0.15,  0.15, -0.1 },
      }, -- fixed
    }, -- node_box

    selection_box  = {
      type  = 'fixed',
      fixed  = {
        { -0.3, -0.3, -0.2,  0.3, 0.3, 0.5 },
      }, -- fixed
    }, -- selection_box

    light_source  = 9,
    paramtype     = 'light',
    paramtype2    = 'facedir',
    buildable_to  = true,
    walkable      = false,
    sunlight_propagates  = false,

    sounds  = default.node_sound_glass_defaults(),
    groups  = { snappy = 3,  not_in_creative_inventory = 1 },

    on_place  = function( itemstack, placer, pointedg )
      local node  = minetest.env:get_node(pointedg.under)
      if not minetest .registered_nodes[ node .name ]
      or not minetest .registered_nodes[ node .name] .on_rightclick then

        local above  = pointedg .above
        local under  = pointedg .under
        local pitch  = placer :get_look_pitch()
        local node  = minetest .env :get_node(above)

        if node .name ~= 'air' then return end

        if above .x ~= under .x or above .z ~= under .z then 
          local fdir  = minetest .dir_to_facedir( placer :get_look_dir() )
          minetest .env :add_node( above, { name = 'nightclub:blacklight_bulb_wall',  param2 = fdir } )
        else
          minetest .env :add_node( above, { name = 'nightclub:blacklight_bulb' } )
        end -- above .x or .z

        if not minetest.setting_getbool('creative_mode') then
          itemstack :take_item()
        end -- creative_mode

        return minetest .item_place_node( itemstack, placer, pointedg )
      else
        minetest .registered_nodes[ node .name ] .on_rightclick( pointedg .under,  node,  placer )
      end -- node .name
    end, -- on_place

  } -- blacklight_bulb_wall
) -- register_node

