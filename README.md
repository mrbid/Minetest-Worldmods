# Minetest-Worldmods
A collection of worldmods used on the VF-TECHNIC minetest server.

## Highlights
- insane amount of bug fixes to pretty much every mod
- fixing all bugs and offsets in `/vehicles` _(D00Med Vehicles)_
- addition of biofuel chainsaws _(based on technic chainsaw)_
- addition of powerbank mk4 _(zero-point energy)_
- addition of super biofuel and super propane
- fixes to all bugs in [technic_tweak](https://forum.minetest.net/viewtopic.php?t=14510)
- additions to technic_chests _(such as titanium vacuuming chest, amethyst mining chest, mystery boxes, and diamond gift boxes / duplicators)_
- merging of [space_travel](https://forum.minetest.net/viewtopic.php?t=23455) nodes with [other_worlds](https://forum.minetest.net/viewtopic.php?t=16015) to create a more diverse set of asteroid layers, the vanilla space_travel mod produced too much lag to run online as-is.
- modification of all technic_armor skins to remove specular highlights
- some new admin commands in `/exploration` such as a jailing system for disruptive players.
- removal of technic polyfuse and machine protection _(allowing machines to be shared, upgrades are protected however)_
- replaced technic cnc with [Improved Technic CNC](https://content.minetest.net/packages/Emojiminetest/technic_cnc_improve/) and made some improvements upon its supported nodelist.
- significant amount of rework on commodity markets to ensure listed items display a concise, pretty, and still informative item string.

## Notes
To load all these mods at the same time you will need to modify your minetest server:<br>
`<Test_User> src/mapnode.h:45, change "#define MAX_REGISTERED_CONTENT *" to "#define MAX_REGISTERED_CONTENT 0xf800U"`

Server is compiled with -Ofast rather than -O3. This is adjusted in the makefile.

### Most of these mods have been modified from their original state to create a harmony between them all, hence, updating mods in this pack may break things, create crafting collisions, etc. Beware.
