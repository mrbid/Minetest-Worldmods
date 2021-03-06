
-- Load support for intllib.
local path = minetest.get_modpath(minetest.get_current_modname()) .. "/"

local S = minetest.get_translator and minetest.get_translator("mobs_maidroid") or
		dofile(path .. "intllib.lua")

mobs.intllib = S

-- Check for custom mob spawn file
local input = io.open(path .. "spawn.lua", "r")

if input then
	mobs.custom_spawn_npc = true
	input:close()
	input = nil
end

-- NPCs
dofile(path .. "maidroid.lua")

-- Load custom spawning
if mobs.custom_spawn_npc then
	dofile(path .. "spawn.lua")
end

