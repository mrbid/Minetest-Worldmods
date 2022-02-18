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
- significant rework on commodity markets listed items string formatting to ensure a concise, pretty, and still informative item string.
- modifications to [edit mod](https://github.com/mrbid/Minetest-Worldmods/tree/main/worldmods/edit) to make it safer for use by builders.
- bones chests in different fun colours, so you can trophy your kills.
- technic_gen machines that generate cobble
- pipeworks autocrafters now have three tiers of speed
- abm that converts lead to gold when 3.5% uranium blocks are placed next to it. ([1972 Lake Baikal in Siberia](http://www.chm.bris.ac.uk/webprojects2002/crabb/modern.html))
- HV Dark Matter Transmuter, a new technic machine that uses Dark Matter Crystals and Blocks to transmute ores, ingots, and ingot blocks.
- some new amusing/trick food items under the "hawk" mod
- improved automobiles with passenger support and extended skins (locked, private access for driver)
- automobiles2 with 4x passenger support, tiers of handling and public access to drive (and flying versions)
- abriglass has been updated with cornered one-way glass thanks to Test_User.
- we have plasma_mod by two which has nodes with instant kill properties, a great replacement to lava for protecting your base from users glitching through walls.
- maidroid was a little too buggy and pointless so it's been re-implemented as a simple NPC.
- added HV Biomass Generator, consumes bones (bones:bones, bonemeal:bone, foody:bone) and produces power. 100x the power of a HV Battery Box.
- replaced the model on cars:car and then adapted it to a jets:jet for the VF-MESHNODE server as a novel method of increasing player speed.
- titanium chests now harvest nearby items on mesecon signal.
- a much improved and extended version of stacked ingots mod has been added, added support for more ingots, some improved textures, crafts for full stacks and better stack descriptions.
- added moreores support to [hidden doors](https://forum.minetest.net/viewtopic.php?t=18294).
- texture alpha/transparency support added to Technic CNC & Mymillworks


## TODO
- `worldmods/furnishings_mods/homedecor_modpack/homedecor_seating/sofas.lua` and `armchairs.lua` could do with some proper sit code to change the player animation.
- technic crafting types `freezing`, `alloying`, `extracting`, `compressing`, `grinding`, `transmuting`, `separating`, could do with icons for the i3 inventory.
- personal log could be registered as a tab in the i3 inventory, but the personal log formspec wont work by default - needs to be looked at.
- could add an icon to invoke the `/helpform` ui in i3 inventory.
- extend hotbar slot icon images from 23 to 32

## DONE
~~- transparency support needs to be added to `mymillwork` for the caverealms glow crystal cuts~~<br>
~~- some of the doors such as the diamond door in the `doors` mod open up inverse, this needs to be fixed.~~<br>
~~- Gold trapdoor in `doors` has no craft and: Adamantine door, Aquarium door, Brass door.~~<br>
~~- `packed_things` nodes need to be updated with node groups that represent the original node being packed.~~<br>
~~- `ingots_extended` needs metal groups for dig sounds, also needs terumet support, possibly even the other xtraores mod support, which could be confusing because they both share the same name.~~

## Notes
To load all these mods at the same time you will need to modify your minetest server:<br>
`<Test_User> src/mapnode.h:45, change "#define MAX_REGISTERED_CONTENT *" to "#define MAX_REGISTERED_CONTENT 0xf800U"`

Server is compiled with -Ofast rather than -O3. This is adjusted in the makefile.

~~We are now running Buckaroo's mapserver: https://forum.minetest.net/viewtopic.php?f=14&t=21999~~<br>
~~Zeno's IRC mod: https://github.com/Zeno-/minetest-irc~~<br>
~~Vehicles, Planes, and Aquatics from: https://github.com/APercy~~

## Warning
Most of these mods have been modified from their original state to create a harmony between them all, hence, updating mods in this pack may break things, create crafting collisions, etc. Beware.

## Test_User jailing LUA node script:
player_detector > injector_controller > luablock
```
corner_1 = {x=-798,y=43,z=-1148}
corner_2 = {x=-765,y=20,z=-1182}

local detector_pos = {x=-780,y=21,z=-1167}

local is_in = function(tbl, val)
  for _, v in pairs(tbl) do
    if v == val then return true end
  end
  return false
end

local meta = minetest.get_meta(detector_pos)
local names = meta:get_string("scanname"):split(",")

local playerlist = {}
local objects = minetest.get_objects_in_area(corner_1, corner_2)
for _, object in pairs(objects) do
  if object:is_player() then
    table.insert(playerlist, object:get_player_name())
  end
end

local online = {}
for _, player in pairs(minetest.get_connected_players()) do
  table.insert(online, player:get_player_name())
end

for _, name in pairs(names) do
  if is_in(online, name) and not is_in(playerlist, name) then
    local player = minetest.get_player_by_name(name)
    player:set_detach()
    player:set_pos(vector.add(detector_pos, {x=0,y=1,z=0}))
  end
end
```

## skinsdb invis code
_this will reset your skin back to normal on hotbar item change, causing an avatar update to display the new visual tool selected._
```
invis:
/lua local p = minetest.get_player_by_name('@nearest'); p:set_nametag_attributes({color = {a = 0, r = 255, g = 255, b = 255}}) p:set_properties({visual = "mesh", textures={"character_1917.png"}, visual_size = {x=0, y=0}, pointable=false})

normal:
/lua local p = minetest.get_player_by_name('@nearest'); p:set_nametag_attributes({color = {a = 255, r = 255, g = 255, b = 255}}) p:set_properties({visual = "mesh", textures={"character_454.png"}, visual_size = {x=1, y=1}, pointable=true})
```

## Bug in ma_pops_furniture
A bug discovered when calling the check_table() function causes a crash when certain tables of a non-expected naming convention are used, specifically that I am aware of, the wood and cobble tables. The solution I have opted for to comment out all calls to this function as I deem the optimization of legs when placing tables next to one another superfluous .. however this may change in the future as user "Test_User" put in some considerable time to find the exact problem as listed above and provide a solution to said problem as listed below:
```
functions.lua on line 114, should be able to replace if check_this then with if check_this and material ~= "_wood" then
or, if the wood one did have other forms, at the start if material == "_wood" then material = "wood" end
```
To trigger this you would add a wooden table next to an acacia table for example, and the optimization of legs performed by the check_table() function would cause a crash.

Issue filed: https://github.com/Gerold55/ma_pops_furniture/issues/11


