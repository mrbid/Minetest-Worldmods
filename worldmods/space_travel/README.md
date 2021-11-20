![Main screenshot](https://git.minetest.land/Red_King_Cyclops/space_travel/raw/branch/master/screenshot.png)
# Space Travel

The Space Travel mod adds in a massive amount of new space content, including:
* 20 new space dimensions, including several planets, moons, dwarf planets, exoplanets, one exomoon, and one asteriod belt
* tens of new skyboxes
* tens of new nodes
* several new liquids
* new ores not found on earth
* a progression system
* complete use of Minetest's vertical space
* space geysers such as volcanoes and cryovolcanoes
* interplanetary and interstellar travel
* day-night cycles on certain planets and moons

## How to play
Look at the Wiki: *here*

TL;DR: Essentially, the player has to make "space drives", which they can use in a rocket orbiting a planet or moon to travel to other planets and moons.

First, make a rocket (from the rocket mod, see instructions [here](https://forum.minetest.net/viewtopic.php?f=9&t=23120)) and something (such as a spacesuit) to keep you alive in a vacuum (from the vacuum mod, see instructions [here](https://forum.minetest.net/viewtopic.php?f=11&t=20195)). Second, make a space drive, a type of tool from this mod that allows you travel between space dimensions. Using minerals from newly discovered planets and moons, you can craft increasingly powerful space drives that can take you to more places. You can use a crafting guide to help you make these space drives. Third, fly your rocket into outer space (on Earth, the atmosphere ends at Y=1000), but avoid crashing into meteoroids. Fourth, left click with your space drive inside the rocket and select a location, teleporting you there. Fifth, carefully descend onto the surface. Lastly, repeat steps 3 through 5 to return home.

## Dependencies

### Hard

* default
* bucket
* stairs
* tnt
* [multidimensions](https://forum.minetest.net/viewtopic.php?f=9&t=16009)
* [vacuum](https://forum.minetest.net/viewtopic.php?f=11&t=20195)
* [rocket](https://forum.minetest.net/viewtopic.php?f=9&t=23120)
* [radiant_damage](https://forum.minetest.net/viewtopic.php?t=20185)

### Recommended

* [scifi_nodes](https://forum.minetest.net/viewtopic.php?t=11751)
* [spacesuit](https://github.com/thomasrudin-mt/spacesuit)
* [3d armor](https://forum.minetest.net/viewtopic.php?t=4654)

I understand that these are a lot of dependencies, but I have depended on them for main space features that I did not want to reinvent. In a way, these mods are part of the Space Travel experience.

## Licence
The code is licensed as LGPL-2.1-or-later. A nodebox was borrowed from Farlands to make the titan alien crystal. The textures have a variety of different licences since most of the textures have been borrowed and modified, so I've broken all of the textures down into licences and origins.
### By Red_King_Cyclops (me): CC BY-SA 3.0
* space_travel_dark_sky.png
* space_travel_geyser_hole.png
* space_travel_space_drive_1.png
* space_travel_space_drive_2.png
* space_travel_space_drive_3.png
* space_travel_space_drive_4.png
* space_travel_space_drive_5.png
* space_travel_space_drive_6.png
* space_travel_space_drive_7.png
* space_travel_space_drive_engine.png
* space_travel_warp_drive_engine.png
* space_travel_mars_iron_powder.png
* space_travel_minthe_copper_powder.png
### Taken/modified from NASA/Wikipedia: Public Domain / CC0
* space_travel_callisto_space_sky.png from "https://en.wikipedia.org/wiki/Callisto_(moon)#/media/File:Callisto.jpg"
* space_travel_charon_space_sky.png from "https://en.wikipedia.org/wiki/Charon_(moon)#/media/File:Charon_in_True_Color_-_High-Res.jpg"
* space_travel_europa_space_sky.png from "https://en.wikipedia.org/wiki/Europa_(moon)#/media/File:Europa-moon-with-margins.jpg"
* space_travel_ganymede_space_sky.png from "https://en.wikipedia.org/wiki/Ganymede_(moon)#/media/File:Ganymede_g1_true-edit1.jpg"
* space_travel_io_space_sky.png from "https://en.wikipedia.org/wiki/Io_(moon)#/media/File:Io_highest_resolution_true_color.jpg"
* space_travel_mercury_space_sky.png from "https://en.wikipedia.org/wiki/Mercury_(planet)#/media/File:Mercury_in_color_-_Prockter07-edit1.jpg"
* space_travel_neptune_space_sky.png from "https://en.wikipedia.org/wiki/Neptune#/media/File:Neptune_Full.jpg"
* space_travel_pluto_space_sky.png from "https://en.wikipedia.org/wiki/Pluto#/media/File:Pluto_in_True_Color_-_High-Res.jpg"
* space_travel_sun_space_sky.png from "https://en.wikipedia.org/wiki/Sun#/media/File:The_Sun_by_the_Atmospheric_Imaging_Assembly_of_NASA's_Solar_Dynamics_Observatory_-_20100819.jpg"
* space_travel_uranus_space_sky.png from "https://en.wikipedia.org/wiki/Uranus#/media/File:Uranus2.jpg"
* space_travel_venus_space_sky.png from "https://en.wikipedia.org/wiki/Venus#/media/File:Venus-real_color.jpg"
### Taken from NASA outside of Wikpedia: CC-BY-2.0
* space_travel_jupiter_space_sky.png from "https://www.flickr.com/photos/nasahubble/46616136772"
### Taken directly from minetest_game and renamed: CC BY-SA 3.0
* space_travel_space_stone.png
* space_travel_space_stone_block.png
* space_travel_space_stone_brick.png
### Taken and modified from minetest_game: CC BY-SA 3.0
* space_travel_bacchus_cobble.png
* space_travel_bacchus_dirt.png
* space_travel_bacchus_grass_1.png
* space_travel_bacchus_grass_2.png
* space_travel_bacchus_grass_3.png
* space_travel_bacchus_grass_4.png
* space_travel_bacchus_grass_5.png
* space_travel_bacchus_grass_side.png
* space_travel_bacchus_grass_stop.png
* space_travel_bacchus_leaves.png
* space_travel_bacchus_sand.png
* space_travel_bacchus_stone.png
* space_travel_bacchus_stone_block.png
* space_travel_bacchus_stone_brick.png
* space_travel_bacchus_tree.png
* space_travel_bacchus_tree_sapling.png
* space_travel_bacchus_tree_top.png
* space_travel_bacchus_water.png
* space_travel_bacchus_water_flowing_animated.png
* space_travel_bacchus_water_source_animated.png
* space_travel_bacchus_wood.png
* space_travel_bucket_bacchus_water.png
* space_travel_bucket_cryolava.png
* space_travel_bucket_liquid_hydrocarbon.png
* space_travel_bucket_minerva_water.png
* space_travel_bucket_sulfuric_acid.png
* space_travel_cryolava_flowing_animated.png
* space_travel_cryolava.png
* space_travel_cryolava_source_animated.png
* space_travel_dark_matter_crystal.png
* space_travel_dark_matter_crystal_block.png
* space_travel_galena_lump.png
* space_travel_io_stone.png
* space_travel_io_stone_block.png
* space_travel_io_stone_brick.png
* space_travel_lava_crystal.png
* space_travel_lava_crystal_block.png
* space_travel_lead_block.png
* space_travel_lead_ingot.png
* space_travel_liquid_hydrocarbon.png
* space_travel_liquid_hydrocarbon_flowing_animated.png
* space_travel_liquid_hydrocarbon_source_animated.png
* space_travel_lunar_spinel_block.png
* space_travel_lunar_spinel_gem.png
* space_travel_martian_ice_crystal.png
* space_travel_martian_ice_crystal_block.png
* space_travel_mineral_dark_matter_crystal.png
* space_travel_mineral_galena.png
* space_travel_mineral_ilmenite.png
* space_travel_mineral_lava_crystal.png
* space_travel_mineral_lunar_spinel.png
* space_travel_mineral_martian_ice_crystal.png
* space_travel_mineral_solar_mese.png
* space_travel_minerva_cobble.png
* space_travel_minerva_dirt.png
* space_travel_minerva_fern_1.png
* space_travel_minerva_fern_2.png
* space_travel_minerva_fern_3.png
* space_travel_minerva_grass_side.png
* space_travel_minerva_grass_top.png
* space_travel_minerva_pine_needles.png
* space_travel_minerva_pine_sapling.png
* space_travel_minerva_pine_tree.png
* space_travel_minerva_pine_tree_top.png
* space_travel_minerva_pine_wood.png
* space_travel_minerva_sand.png
* space_travel_minerva_stone.png
* space_travel_minerva_stone_block.png
* space_travel_minerva_stone_brick.png
* space_travel_minerva_water.png
* space_travel_minerva_water_animated.png
* space_travel_minerva_water_source_animated.png
* space_travel_minthe_cobble.png
* space_travel_minthe_sand.png
* space_travel_minthe_sandstone.png
* space_travel_minthe_sandstone_block.png
* space_travel_minthe_sandstone_brick.png
* space_travel_minthe_stone.png
* space_travel_minthe_stone_block.png
* space_travel_minthe_stone_brick.png
* space_travel_solar_mese_block.png
* space_travel_solar_mese_crystal.png
* space_travel_sulfuric_acid.png
* space_travel_sulfuric_acid_flowing_animated.png
* space_travel_sulfuric_acid_source_animated.png
* space_travel_tholins.png
* space_travel_titan_hydrocarbon_sand.png
* space_travel_titan_icestone.png
* space_travel_titan_icestone_with_pebbles.png
* space_travel_titanium_block.png
* space_travel_titanium_ingot.png
* space_travel_titanium_lump.png
* space_travel_venus_stone.png
* space_travel_venus_stone_block.png
* space_travel_venus_stone_brick.png
### Taken directly from other_worlds (https://forum.minetest.net/viewtopic.php?t=16015) and renamed: CC BY-SA 3.0
* space_travel_cosmos_sky_neg_x.png
* space_travel_cosmos_sky_neg_y.png
* space_travel_cosmos_sky_neg_z.png
* space_travel_cosmos_sky_pos_x.png
* space_travel_cosmos_sky_pos_y.png
* space_travel_cosmos_sky_pos_z.png
* space_travel_sedna_cobble.png
* space_travel_sedna_dust.png
* space_travel_sedna_gravel.png
* space_travel_sedna_stone.png
* space_travel_space_cobble.png
* space_travel_space_dust.png
* space_travel_space_gravel.png
* space_travel_io_cobble.png
* space_travel_io_gravel.png
* space_travel_io_dust.png
* space_travel_venus_cobble.png
* space_travel_venus_gravel.png
* space_travel_venus_dust.png
### Taken directly from space (https://forum.minetest.net/viewtopic.php?t=14497) and renamed: CC0
* space_travel_earth_space_sky.png
* space_travel_stars_sky.png
### Taken and modified from space (https://forum.minetest.net/viewtopic.php?t=14497): CC0
* space_travel_minerva_space_sky.png
* space_travel_bacchus_space_sky.png
* space_travel_osiris_space_sky.png
### Taken directly from Marssurvive (https://forum.minetest.net/viewtopic.php?t=13913) and renamed: CC0
* space_travel_mars_space_sky.png
### Taken and modified from Marssurvive (https://forum.minetest.net/viewtopic.php?t=13913) and renamed: CC0
* space_travel_minthe_space_sky.png
### Taken directly from minetest_saturn (https://forum.minetest.net/viewtopic.php?t=15081) and renamed: CC BY-SA 3.0
* space_travel_saturn_space_sky_neg_x.png
* space_travel_saturn_space_sky_neg_y.png
* space_travel_saturn_space_sky_neg_z.png
* space_travel_saturn_space_sky_pos_x.png
* space_travel_saturn_space_sky_pos_y.png
* space_travel_saturn_space_sky_pos_z.png
### Taken and modified from minetest_saturn (https://forum.minetest.net/viewtopic.php?t=15081): CC BY-SA 3.0
* space_travel_titan_sky_neg_x.png
* space_travel_titan_sky_neg_y.png
* space_travel_titan_sky_neg_z.png
* space_travel_titan_sky_pos_x.png
* space_travel_titan_sky_pos_y.png
* space_travel_titan_sky_pos_z.png
* space_travel_caelus_space_sky_neg_x.png
* space_travel_caelus_space_sky_neg_y.png
* space_travel_caelus_space_sky_neg_z.png
* space_travel_caelus_space_sky_pos_x.png
* space_travel_caelus_space_sky_pos_y.png
* space_travel_caelus_space_sky_pos_z.png
* space_travel_ourea_sky_neg_x.png
* space_travel_ourea_sky_neg_y.png
* space_travel_ourea_sky_neg_z.png
* space_travel_ourea_sky_pos_x.png
* space_travel_ourea_sky_pos_y.png
* space_travel_ourea_sky_pos_z.png
### Taken and modified from farlands (https://forum.minetest.net/viewtopic.php?f=15&t=16921): CC BY-SA 3.0
* space_travel_titan_alien_crystal.png
* space_travel_titan_alien_crystal_item.png