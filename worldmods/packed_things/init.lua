--  default textures are here:
--  https://github.com/minetest/minetest_game/tree/master/mods/default/textures

packed_things_config = Settings(minetest.get_worldpath().."/packed_things.conf")

local conf_table = packed_things_config:to_table()

local defaults = {
	enable_cobble = "true",
	enable_desert_cobble = "false",
	enable_desert_sand = "true",
	enable_dirt = "true",
	enable_gravel = "false",
	enable_ice = "true",
	enable_sand = "true",
	enable_snow = "true",
}

for k, v in pairs(defaults) do
	if conf_table[k] == nil then
		packed_things_config:set(k, v)
	end
end
packed_things_config:write()



local modpath = minetest.get_modpath("packed_things")
if packed_things_config:get_bool("enable_cobble") then 
	dofile(modpath.."/cobble.lua")
end
if packed_things_config:get_bool("enable_desert_cobble") then 
	dofile(modpath.."/desert_cobble.lua")
end
if packed_things_config:get_bool("enable_desert_sand") then 
	dofile(modpath.."/desert_sand.lua")
end
if packed_things_config:get_bool("enable_dirt") then 
	dofile(modpath.."/dirt.lua")
end
if packed_things_config:get_bool("enable_gravel") then 
	dofile(modpath.."/gravel.lua")
end
if packed_things_config:get_bool("enable_ice") then 
	dofile(modpath.."/ice.lua")
end
if packed_things_config:get_bool("enable_sand") then 
	dofile(modpath.."/sand.lua")
end
if packed_things_config:get_bool("enable_snow") then 
	dofile(modpath.."/snow.lua")
end

minetest.log("info", "[packed_things] Done loading main.")


