bakedclayaddition = {}

dofile(minetest.get_modpath("bakedclayaddition").."/_config.txt")

local variations = bakedclayaddition.color_variations
if variations ~= 9 and
  variations ~= 16 and
  variations ~= 25 and
  variations ~= 64 and
  variations ~= 81 and
  variations ~= 264 and
  variations ~= 289 then
    variations = 64
end

bakedclayaddition.colors = {
  red = {r=255,g=0,b=0},
  pink = {r=255,g=0,b=127},
  magenta = {r=255,g=0,b=255},
  purple = {r=192,g=0,b=255},
  violet = {r=128,g=0,b=255},
  violet_blue = {r=85,g=0,b=255},
  blue = {r=0,g=0,b=255},
  blue_cyan = {r=0,g=128,b=255},
  cyan = {r=0,g=255,b=255},
  cyan_aqua = {r=0,g=255,b=192},
  aqua = {r=0,g=255,b=128},
  green = {r=0,g=255,b=0},
  lime = {r=128,g=255,b=0},
  lime_yellow = {r=192,g=225,b=0},
  yellow = {r=255,g=255,b=0},
  golden_yellow = {r=255,g=190,b=0},
  yellow_orange = {r=255,g=162,b=0},
  orange = {r=255,g=128,b=0},
  orange_red = {r=255,g=64,b=0}
}

bakedclayaddition.colors_cmy = {
  red = {c=0,m=100,y=100},
  pink = {c=0,m=100,y=50},
  magenta = {c=0,m=100,y=0},
  purple = {c=20,m=100,y=0},
  violet = {c=50,m=100,y=0},
  violet_blue = {c=67,m=100,y=0},
  blue = {c=100,m=100,y=0},
  blue_cyan = {c=100,m=50,y=0},
  cyan = {c=100,m=0,y=0},
  cyan_aqua = {c=100,m=0,y=25},
  aqua = {c=100,m=0,y=50},
  green = {c=100,m=0,y=100},
  lime = {c=50,m=0,y=100},
  lime_yellow = {c=25,m=0,y=100},
  yellow = {c=0,m=0,y=100},
  golden_yellow = {c=0,m=25,y=100},
  yellow_orange = {c=0,m=36,y=100},
  orange = {c=0,m=50,y=100},
  orange_red = {c=0,m=75,y=100}
}

bakedclayaddition.grayscale = {
  white = {r=255,g=255,b=255},
  light_grey_1 = {r=232,g=232,b=232},
  light_grey_2 = {r=209,g=209,b=209},
  light_grey_3 = {r=185,g=185,b=185},
  light_grey_4 = {r=162,g=162,b=162},
  grey_1 = {r=139,g=139,b=139},
  grey_2 = {r=115,g=115,b=115},
  dark_grey_1 = {r=93,g=93,b=93},
  dark_grey_2 = {r=70,g=70,b=70},
  dark_grey_3 = {r=46,g=46,b=46},
  dark_grey_4 = {r=23,g=23,b=23},
  black = {r=0,g=0,b=0}
}

bakedclayaddition.variations = {
  { 5, groups = {_289=1, _256=1, _144=1, _64=1, _81=1} },
  { 12, groups = {_289=1, _256=1, _144=1, _16=1, _25=1} },
  { 17, groups = {_289=1,_256=1, _144=1, _64=1, _81=1, _9=1} },
  { 24, groups = {_289=1, _256=1} },
  { 29, groups = {_289=1, _256=1, _144=1, _64=1, _81=1, _25=1} },
  { 35, groups = {_289=1, _256=1, _16=1} },
  { 41, groups = {_289=1, _256=1, _144=1, _64=1, _81=1} },
  { 47, groups = {_289=1, _256=1, _144=1} },
  { 50, groups = {_289=1, _81=1, _25=1, _9=1} },
  { 53, groups = {_289=1, _256=1, _144=1, _64=1} },
  { 59, groups = {_289=1, _256=1, _144=1, _16=1, _81=1} },
  { 65, groups = {_289=1, _256=1, _64=1} },
  { 71, groups = {_289=1, _256=1, _144=1, _81=1, _25=1} },
  { 76, groups = {_289=1, _256=1, _64=1} },
  { 82, groups = {_289=1, _256=1, _144=1, _16=1, _81=1, _9=1} },
  { 88, groups = {_289=1, _256=1, _144=1, _64=1, _25=1} },
  { 94, groups = {_289=1, _256=1, _144=1, _81=1} }
}

function bakedclayaddition.get_variations()
  local t = {}
  for i, v in ipairs(bakedclayaddition.variations) do
    if v.groups["_"..variations] then
      table.insert(t,v[1])
    end
  end
  return t
end

local function upper_first(text)
  local firstletter = string.sub(text, 1,1)
  local therest = string.sub(text, 2)
  return firstletter:upper()..therest
end

local function split_string(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  
  local t = {}
  if string.find(inputstr, sep) then
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
      table.insert(t, str)
    end
  else
    table.insert(t, inputstr)
  end
  
  return t
end

local function Description(text)
  local words = split_string(text,"_")
  local t = {}
  for _, word in ipairs(words) do
    table.insert(t,upper_first(word))
  end
  return table.concat(t," ")
end

local index = 1
for color, rgb in pairs(bakedclayaddition.colors) do
  for wi, white in ipairs(bakedclayaddition.get_variations()) do
    for bi, black in ipairs(bakedclayaddition.get_variations()) do
      local colorstring = minetest.rgba(rgb.r,rgb.g,rgb.b)
      minetest.register_node("bakedclayaddition:"..color.."_"..index, {
        description = Description(color.."_"..index.."_baked_clay"),
        tiles = {"blank.png^[colorize:"..colorstring..":255^white_"..white..".png^black_"..black..".png^noise"..math.random(1,12)..".png"},
        groups = {cracky=3, bakedclay=1},
        sounds = default.node_sound_stone_defaults()
      })
      
      --current / maximum = percentage
      local cmy = bakedclayaddition.colors_cmy[color]
      local max = 0.125
      colorizer.register_craft({
        input = "default:clay",
        output = "bakedclayaddition:"..color.."_"..index,
        ink_usage = {
          white = 1 * max,
          black = (black / variations) * max,
          magenta = (cmy.m / 100) * max,
          yellow = (cmy.y / 100) * max,
          cyan = (cmy.c / 100) * max
        }
      })
      
      minetest.register_alias("bc_"..color.."_"..index, "bakedclayaddition:"..color.."_"..index)
      
      if bakedclayaddition.stairs_and_slabs then
        stairs.register_stair_and_slab("bakedclayaddition_"..color.."_"..index, "bakedclayaddition:"..color.."_"..index,
          {cracky = 3, bakedclay=1},
          {"blank.png^[colorize:"..colorstring..":255^white_"..white..".png^black_"..black..".png^noise"..math.random(1,12)..".png"},
          Description(color.."_"..index.."_baked_clay_stair"),
          Description(color.."_"..index.."_baked_clay_slab"),
          default.node_sound_stone_defaults())
      end
      index = index + 1
    end
  end
  index = 1
end

for color, rgb in pairs(bakedclayaddition.grayscale) do
  local colorstring = minetest.rgba(rgb.r,rgb.g,rgb.b)
  minetest.register_node("bakedclayaddition:"..color, {
    description = Description(color.."_baked_clay"),
    tiles = {"blank.png^[colorize:"..colorstring..":255^noise"..math.random(1,12)..".png"},
    groups = {cracky=3, bakedclay=1},
    sounds = default.node_sound_stone_defaults()
  })
  
  local max = 0.125
  colorizer.register_craft({
    input = "default:clay",
    output = "bakedclayaddition:"..color,
    ink_usage = {
      white = 1 * max,
      black = (rgb.r / 12) * max,
      magenta = 0,
      yellow = 0,
      cyan = 0,
    }
  })
  
  minetest.register_alias("bc_"..color, "bakedclayaddition:"..color)
  
  if bakedclayaddition.stairs_and_slabs then
    stairs.register_stair_and_slab("bakedclayaddition_"..color, "bakedclayaddition:"..color,
      {cracky = 3, bakedclay=1},
      {"blank.png^[colorize:"..colorstring..":255^noise"..math.random(1,12)..".png"},
      Description(color.."_".."_baked_clay_stair"),
      Description(color.."_".."_baked_clay_slab"),
      default.node_sound_stone_defaults())
  end
end