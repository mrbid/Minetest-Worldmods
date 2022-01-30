resize_mod = {}

minetest.register_privilege("set_size", {
        description = "Allows player to set their own size.",
})

minetest.register_chatcommand("restore_size", {
        params = "<player>",
        description = "Restores players size",
        privs = {set_size=true},
        func = function(name, text)
			local player = minetest.get_player_by_name(name)
			if text ~= nil and text ~= "" then
				for _, _player in ipairs(minetest.get_connected_players()) do
					if _player:get_player_name() == text then
						resize_mod.restore(_player)
						return true, "Size set to normal."
					end
				end
				return false, "'"..text.."' is not online or does not exist."
			end
			resize_mod.restore(player)
			return true, "Size set to normal."
        end
})

minetest.register_chatcommand("set_size", {
        params = "<player> <size>",
        description = "Set players size",
        privs = {set_size=true},
        func = function(name, text)
			if tonumber(text) then
				local player = minetest.get_player_by_name(name)
				resize_mod.set_size(player, tonumber(text))
				return true, "Size set to '"..text.."'."
			else
				local split_str = resize_mod.split_string(text, " ")
				if split_str[1] ~= nil and split_str[1] ~= "" then
					for _, _player in ipairs(minetest.get_connected_players()) do
						if _player:get_player_name() == split_str[1] then
							if split_str[2] ~= nil and split_str ~= "" then
								if tonumber(split_str[2]) then
									resize_mod.set_size(_player, tonumber(split_str[2]))
									return true, "Size set to "..split_str[2].."."
								end
								return false, "'"..split_str[2].."' is not a valid number."
							end
							return false, "Please enter a number."
						end
					end
					return false, "'"..split_str[1].."' is not online or does not exist."
				end
				return false, "Please enter a player name or a number."
			end
        end
})

function resize_mod.restore(player)
  local properties = player:get_properties()
  local prop = {
    visual_size = {x=1,y=1,z=1},
    eye_height = 1.4700000286102,
    collisionbox = {-0.30000001192093, 0, -0.30000001192093, 0.30000001192093, 1.7000000476837, 0.30000001192093},
    selectionbox = {-0.30000001192093, 0, -0.30000001192093, 0.30000001192093, 1.7000000476837, 0.30000001192093},
  }
  player:set_properties(prop)
  player:set_physics_override({jump=1})
  
  --hand
  local inv = player:get_inventory()
  local stack = inv:get_stack("hand", 1)
  local meta = stack:get_meta()
  local tool_capabilities = stack:get_tool_capabilities()
  local range = resize_mod.get_range(player:get_player_name())
  
--  minetest.override_item("", {
--    range = range,
--    tool_capabilities = tool_capabilities
--  })

  --meta:set_tool_capabilities(nil)
  --inv:set_stack("hand", 1, stack)
end

function resize_mod.set_size(player, size)
  local eye_height = 1.4700000286102*size
  local prop = {
    visual_size = {x = size, y = size, z = size},
    eye_height = eye_height,
    collisionbox = {-0.30000001192093*size, 0*size, -0.30000001192093*size, 0.30000001192093*size, 1.7000000476837*size, 0.30000001192093*size},
    selectionbox = {-0.30000001192093*size, 0*size, -0.30000001192093*size, 0.30000001192093*size, 1.7000000476837*size, 0.30000001192093*size},
  }
  player:set_properties(prop)
  player:set_physics_override({jump=size})
  
  --hand
  local inv = player:get_inventory()
  local stack = inv:get_stack("hand", 1)
  local meta = stack:get_meta()
  local tool_capabilities = stack:get_tool_capabilities()
  local range = resize_mod.get_range(player:get_player_name())
  
--  minetest.override_item("", {
--    range = range*(size),
--    tool_capabilities = tool_capabilities
--  })
  --meta:set_tool_capabilities(tool_capabilities)
  --inv:set_stack("hand", 1, stack)
end

function resize_mod.get_range(player)
  if creative.is_enabled_for(player) then
    return 10
  end
  return 4
end

function resize_mod.split_string(inputstr, sep)
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