--[[
  TronBlocks: A series of blocks to help build a Tron environment
]]
--The code follows a patter of colors as follows: white (plain), orange, blue, then green. the code is the same between them, except for the colors.

dofile(minetest.get_modpath("tronblocks").."/aliases.lua") --register alternate names for nodes.
dofile(minetest.get_modpath("tronblocks").."/crafting.lua") --craft recipes.
dofile(minetest.get_modpath("tronblocks").."/noderegister.lua") --node registry.

--support for moreblocks circular saw
--if minetest.get_modpath("moreblocks") then dofile(minetest.get_modpath("tronblocks").."/sawsupport.lua") end
