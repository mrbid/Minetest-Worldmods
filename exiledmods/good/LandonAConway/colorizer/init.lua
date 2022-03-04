local modpath = minetest.get_modpath("colorizer")

colorizer = {}

dofile(modpath.."/api.lua")

local sort_to_indexed = function(t)
	local _t = {}
	
	for k, v in pairs(t) do
		table.insert(_t, {key=k,value=v})
	end
	
	table.sort(_t, function(a,b) return a.value:upper() < b.value:upper() end)
	return _t
end

local get_available_outputs = function(input)
	local outputs_keyed = {}
	
    if colorizer.registered_crafts[input] then
      for k, v in pairs(colorizer.registered_crafts[input]) do
        local desc = minetest.registered_nodes[v.output].description or v.output
        outputs_keyed[desc] = v.output
      end
	  
	  return sort_to_indexed(outputs_keyed)
    end
end

local ui = function(pos, player, cartridge)
  local node_inv = "nodemeta:"..pos.x..','..pos.y..','..pos.z
  local inv = minetest.get_inventory({type="node", pos=pos})
  local input
  local available_outputs = ""
  
  local fdata = colorizer.colorizer_ui[player:get_player_name()]
  fdata.available_outputs = {}
  
  if not inv:is_empty("input") then
    input = inv:get_stack("input", 1):get_name()

    if colorizer.registered_crafts[input] then
	  for i, v in ipairs(get_available_outputs(input)) do
		available_outputs = available_outputs..v.key..","
		fdata.available_outputs[v.key] = v.value
	  end

      available_outputs:sub(1, -2)
    end
  end
  
  local cartridge_level = "0%"
  if not inv:is_empty(cartridge) then
    cartridge_level = inv:get_stack(cartridge, 1):get_meta():get_string("level")
    if cartridge_level == "" then cartridge_level = "100%" else
      cartridge_level = (tonumber(cartridge_level) * 100).."%"
    end
  end
  
  local cartridges = {white=1,black=2,cyan=3,magenta=4,yellow=5}
  
  local formspec = "formspec_version[3]"..
    "size[12.5,11]"..
    "button_exit[9,10;3,0.75;exit;Exit]"..
    "list["..node_inv..";"..cartridge..";9.5,0.8;1,1;0]"..
    "textlist[7,0.8;2,2.7;ink_cartridge_slots;white,black,cyan,magenta,yellow;"..cartridges[cartridge]..";false]"..
    "label[0.5,0.5;Input]"..
    "label[2.5,0.5;Output]"..
    "list["..node_inv..";input;0.5,0.8;1,1;0]"..
    "list["..node_inv..";output;2.5,0.8;1,1;0]"..
    "label[7,0.5;Ink:]"..
    "list[current_player;main;1.3,4.8;8,4;0]"..
    "dropdown[0.5,2.8;5,0.75;available_outputs;"..available_outputs..";1]"..
    "label[0.5,2.5;Available Outputs:]"..
    "label[9.5,0.5;Cartridge]"..
    "label[9.5,2.3;Ink Level: "..cartridge_level.."]"..
    "label[1.3,4.5;Inventory]"..
    "listring["..node_inv..";output]"..
    "listring[current_player;main]"
    
    return formspec
end


minetest.register_craftitem("colorizer:ink_cartridge_empty", {
  description = "Empty Ink Cartridge",
  inventory_image = "ink_cartridge_empty.png"
})

minetest.register_craft({
  type = "shaped",
  output = "colorizer:ink_cartridge_empty",
  recipe = {
    { "basic_materials:plastic_strip", "basic_materials:plastic_sheet", "basic_materials:plastic_strip" },
    { "basic_materials:plastic_sheet", "basic_materials:ic", "basic_materials:plastic_sheet" },
    { "basic_materials:plastic_strip", "basic_materials:plastic_sheet", "basic_materials:plastic_strip" },
  }
})

for k,v in pairs({white = "White", black = "Black", magenta = "Magenta", yellow = "Yellow", cyan = "Cyan"}) do
  minetest.register_tool("colorizer:ink_cartridge_"..k, {
    description = v.." Ink Cartridge",
    inventory_image = "ink_cartridge_"..k..".png",
    groups = {
      [k.."_colorizer_ink"] = 1
    }
  })
  
  minetest.register_craft({
    type = "shapeless",
    output = "colorizer:ink_cartridge_"..k,
    recipe = {
      "colorizer:ink_cartridge_empty",
      "dye:"..k
    }
  })
  
  minetest.register_craft({
    type = "shapeless",
    output = "colorizer:ink_cartridge_"..k,
    recipe = {
      "colorizer:ink_cartridge_"..k,
      "dye:"..k
    }
  })
end

colorizer.colorizer_ui = {}



local function get_current_data(pos)
  local inv = minetest.get_meta(pos):get_inventory()

  local input_name
  local output_name

  if not inv:is_empty("input") then
    input_name = inv:get_stack("input", 1):get_name()
    if not inv:is_empty("output") then
      output_name = inv:get_stack("output", 1):get_name()
    end
  end

  return {input_name = input_name, output_name = output_name}
end

local function get_current_ink_levels(pos)
  local inv = minetest.get_meta(pos):get_inventory()
  local levels = {}
  
  for k, v in pairs({"white", "black", "magenta", "yellow", "cyan"}) do
    if not inv:is_empty(v) then
      local stack = inv:get_stack(v, 1)
      local meta = stack:get_meta()
      
      if meta:get_string("level") ~= "" then
        local level = tonumber(meta:get_string("level"))
        levels[v] = level
      else
        meta:set_string("level", "1")
        inv:set_stack(v, 1, stack)
        levels[v] = 1
      end
    else
      levels[v] = 0
    end
  end
  
  return levels
end

minetest.register_node("colorizer:machine", {
  description = "Colorizer Machine",
  tiles = {"colorizer.png"},
  groups = {
    cracky = 3
  },
  
  after_place_node = function(pos, placer, itemstack, pointed_thing)
    local inv = minetest.get_meta(pos):get_inventory()
    for k, v in pairs({input=1,output=1,white=1,black=1,magenta=1,yellow=1,cyan=1}) do
      inv:set_size(k,v)
    end
  end,
  
  on_rightclick = function(pos, node, player, itemstack, pointed_thing)
    colorizer.colorizer_ui[player:get_player_name()] = {pos=pos, cartridge="white"}
    minetest.show_formspec(player:get_player_name(), "colorizer_ui", ui(pos, player, "white"))
  end,
  
  allow_metadata_inventory_put = function(pos, listname, index, stack, player)
    local result = 0
    local er, msg = pcall(function()
      if listname == "input" then elseif listname == "output" then
        result = -1
        return
      elseif listname == "white" or listname == "black" or listname == "magenta" or listname == "yellow" or listname == "cyan" then
        if minetest.get_item_group(stack:get_name(), listname.."_colorizer_ink") > 0 then
          result = stack:get_count()
          return
        end
        return 0
      end
      result = stack:get_count()
      return
    end)
    
    minetest.chat_send_all(msg or "")
    return result
  end,
  
  allow_metadata_inventory_take = function(pos, listname, index, stack, player)
    local result = stack:get_count()
    local er, msg = pcall(function()
      local inv = minetest.get_meta(pos):get_inventory()
      if listname == "output" then
        local data = get_current_data(pos)
        if data.input_name and data.output_name then
          local craft = colorizer.registered_crafts[data.input_name][data.output_name]
          local ink = craft.ink_usage
          local c_ink = get_current_ink_levels(pos)

          local has_enough = true
          for color, needed in pairs(ink) do
            if needed > c_ink[color] then
              has_enough = false
            end
          end
          
          if not has_enough then
            result = 0
            minetest.chat_send_player(player:get_player_name(), "Please check ink levels!")
            return
          end
        end
      end
    end)
    
    minetest.chat_send_all(msg or "")
    return result
  end,
  
  on_metadata_inventory_put = function(pos, listname, index, stack, player)
    local er, msg = pcall(function()
      local fdata = colorizer.colorizer_ui[player:get_player_name()]
      minetest.show_formspec(player:get_player_name(), "colorizer_ui", ui(fdata.pos,player,fdata.cartridge))
    end)
    
    minetest.chat_send_all(msg or "")
  end,
  
  on_metadata_inventory_take = function(pos, listname, index, stack, player)
    local er, msg = pcall(function()
      if listname == "output" then
        local inv = minetest.get_meta(pos):get_inventory()

        local data = get_current_data(pos)
        local fdata = colorizer.colorizer_ui[player:get_player_name()]
        local craft = colorizer.registered_crafts[data.input_name][stack:get_name()]
        local ink = craft.ink_usage
        local c_ink = get_current_ink_levels(pos)

        for color, level in pairs(c_ink) do
          local stack = inv:get_stack(color, 1)
          local meta = stack:get_meta()

          local new_level = level - ink[color]
          meta:set_string("level", new_level)

          inv:set_stack(color, 1, stack)
        end
        
		inv:remove_item("input", ItemStack(inv:get_stack("input",1):get_name()))
        inv:set_stack("output", 1, ItemStack(stack:get_name()))

        minetest.show_formspec(player:get_player_name(), "colorizer_ui", ui(fdata.pos,player,fdata.cartridge))
      end
    end)
    
    minetest.chat_send_all(msg or "")
  end
})

minetest.register_craft({
  type = "shaped",
  output = "colorizer:machine",
  recipe = {
    {"default:steel_ingot", "default:steel_ingot", "default:steel_ingot" },
    {"default:steel_ingot", "basic_materials:ic", "default:steel_ingot" },
    {"default:steel_ingot", "default:steel_ingot", "default:steel_ingot" }
  }
})

minetest.register_on_player_receive_fields(function(player, formname, fields)
  if formname == "colorizer_ui" then
    local er, msg = pcall(function()
      local fdata = colorizer.colorizer_ui[player:get_player_name()]
      if fields.ink_cartridge_slots then
        local event = minetest.explode_textlist_event(fields.ink_cartridge_slots)
        if(event.type == "CHG") then
          local cartridges = {"white","black","cyan","magenta","yellow"}
          fdata.cartridge = cartridges[event.index]
          minetest.show_formspec(player:get_player_name(), formname, ui(fdata.pos,player,cartridges[event.index]))
        end
      elseif fields.available_outputs then
        local inv = minetest.get_meta(fdata.pos):get_inventory()

        if not inv:is_empty("input") then
          local input = inv:get_stack("input:", 1):get_name()
          local output = fdata.available_outputs[fields.available_outputs]
          
          if output then
            inv:set_stack("output", 1, ItemStack(output))
          end

          minetest.show_formspec(player:get_player_name(), formname, ui(fdata.pos,player,fdata.cartridge))
        end
      end
    end)
    minetest.chat_send_all(msg or "")
  end
end)
