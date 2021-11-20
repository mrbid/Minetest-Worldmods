
-- Set of colored-semitransparent blocks, using a base plain texture
local name = 1
local descript = 2
local colour = 3
local alphalvl = 4
local glass_list = {
	{"white"  ,"White"   ,"EEEEEE","064"},
	{"black"  ,"Darkened","303030","064"}, 
	{"red"    ,"Red"     ,"FF0000","096"}, 
	{"yellow" ,"Yellow"  ,"FFFF00","096"},
	{"green"  ,"Green"   ,"00FF00","096"}, 
	{"cyan"   ,"Cyan"    ,"00FFFF","096"}, 
	{"blue"   ,"Blue"    ,"0000FF","096"},
	{"magenta","Magenta" ,"FF00FF","096"}, 
	{"orange" ,"Orange"  ,"FF6103","096"}, 
	{"purple" ,"Purple"  ,"800080","096"}, 
}

colorglass = {}
for i in ipairs(glass_list) do
	
    minetest.register_node("colorglass:glass_"..glass_list[i][name], {
        description = glass_list[i][descript].." Glass",
        tiles = {"colorglass_glass.png^[colorize:#"..glass_list[i][colour]..":"..glass_list[i][alphalvl]},
        paramtype = "light",
        paramtype2 = "glasslikeliquidlevel",
        sunlight_propagates = true,
        is_ground_content = false,
        groups = {cracky = 3, oddly_breakable_by_hand = 3},
        sounds = default.node_sound_glass_defaults(),
        use_texture_alpha = true,
        --light_source = 4,
        drawtype = "glasslike",
        }
    )

    minetest.register_craft({
		output = "colorglass:glass_"..glass_list[i][name]..' 1',
		recipe = {
			{'', '', '' },
			{'', 'dye:'..glass_list[i][name], '' },
			{'', 'default:glass', '' },
		    }
	    }
	  )

    minetest.register_craft({
      type = "cooking",
      recipe = "colorglass:glass_"..glass_list[i][name],
      output = "default:glass",
      }
    )
end