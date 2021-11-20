-- Nightclub mod for Minetest by @Doyousketch2
-- Wed 7 Feb 2018                GNU GPL 3.0

-- https://forum.minetest.net/viewtopic.php?f=9&t=5939
-- https://github.com/doyousketch2/nightclub

-- info from http://www.drinksmixer.com/guide/
-- http://en.wikipedia.org/wiki/List_of_glassware

-- lights modified from VanessaE's homedecor glowlights.
-- init.lua loosely based on Rabbi Bob's Bob blocks.

-- note to self: be sure to include
-- drop  = 'nightclub:stuff',
-- in every file

modname  = '[Nightclub]'
author  = '@Doyousketch2'
ver  = '2.0'

print( '\n' ..modname ..' version: ' ..ver ..'  by ' ..author )
modpath  = minetest .get_modpath( 'nightclub' )


------------------------------------------
print( '[Nightclub] prepping bar tools...' )
------------------------------------------


dofile( modpath ..'/bar_tools/can_opener.lua' )

dofile( modpath ..'/bar_tools/cutting_board.lua' )

dofile( modpath ..'/bar_tools/knife.lua' )

dofile( modpath ..'/bar_tools/tap_handles.lua' )

dofile( modpath ..'/bar_tools/bar_stool.lua' )

dofile( modpath ..'/bar_tools/towel.lua' )

--[[

dofile( modpath ..'/bar_tools/bottle_opener.lua' )

dofile( modpath ..'/bar_tools/shaker.lua' )
-- click to open

dofile( modpath ..'/bar_tools/blender.lua' )
-- blend noise

dofile( modpath ..'/bar_tools/ice_bucket.lua' )
-- ice noise

dofile( modpath ..'/bar_tools/bar_tools.lua' )
-- jigger, bar spoon, corkscrew, cork

--]]

dofile( modpath ..'/bar_tools/juicer.lua' )


-------------------------------------
print( '[Nightclub] cleaning cups...' )
-------------------------------------


dofile( modpath ..'/glasses/stein.lua' )

dofile( modpath ..'/glasses/pilsner.lua' )

dofile( modpath ..'/glasses/pint.lua' )

dofile( modpath ..'/glasses/highball.lua' )

dofile( modpath ..'/glasses/lowball.lua' )

dofile( modpath ..'/glasses/snifter.lua' )

dofile( modpath ..'/glasses/shotglass.lua' )
-- plus flaming shot

dofile( modpath ..'/glasses/martini.lua' )

dofile( modpath ..'/glasses/wine_glass.lua' )

dofile( modpath ..'/glasses/champaigne_glass.lua' )

dofile( modpath ..'/glasses/saki_cups.lua' )

dofile( modpath ..'/glasses/punch_bowl.lua' )

dofile( modpath ..'/glasses/cleopatra.lua' )

dofile( modpath ..'/glasses/decanter.lua' )

dofile( modpath ..'/glasses/absinthe_glass.lua' )
-- with flaming slotted sugar spoon


--------------------------------------------
print( '[Nightclub] getting drinks ready...' )
--------------------------------------------


dofile( modpath ..'/drinks/beer.lua' )

dofile( modpath ..'/drinks/white_wine.lua' )

dofile( modpath ..'/drinks/red_wine.lua' )

dofile( modpath ..'/drinks/champaigne.lua' )

dofile( modpath ..'/drinks/vermouth.lua' )

dofile( modpath ..'/drinks/tequila.lua' )

dofile( modpath ..'/drinks/brandy.lua' )

dofile( modpath ..'/drinks/cream.lua' )

dofile( modpath ..'/drinks/whiskey.lua' )

dofile( modpath ..'/drinks/rum.lua' )

dofile( modpath ..'/drinks/vodka.lua' )

dofile( modpath ..'/drinks/gin.lua' )

dofile( modpath ..'/drinks/saki.lua' )

dofile( modpath ..'/drinks/absinthe.lua' )


--------------------------------------------------
print( '[Nightclub] turning the club lights on...' )
--------------------------------------------------


dofile( modpath ..'/lights/disco_ball.lua' )

dofile( modpath ..'/lights/floor.lua' )

dofile( modpath ..'/lights/blacklight.lua' )

dofile( modpath ..'/lights/rainbow.lua' )

dofile( modpath ..'/lights/led_bars.lua' )

dofile( modpath ..'/lights/led_dots.lua' )

dofile( modpath ..'/lights/rope_light.lua' )


------------------------------------
print( '[Nightclub] Ready to party!\n' )
------------------------------------


