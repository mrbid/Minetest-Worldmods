--
-- Minetest stasis mod
--

stasis = {}

local path = minetest.get_modpath(minetest.get_current_modname())
dofile(path .. '/core.lua')
dofile(path .. '/chamber.lua')
dofile(path .. '/morechambers.lua')
