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

## Notes
To load all these mods at the same time you will need to modify your minetest server:<br>
`<Test_User> src/mapnode.h:45, change "#define MAX_REGISTERED_CONTENT *" to "#define MAX_REGISTERED_CONTENT 0xf800U"`

Server is compiled with -Ofast rather than -O3. This is adjusted in the makefile.

~~We are now running Buckaroo's mapserver: https://forum.minetest.net/viewtopic.php?f=14&t=21999<br>~~
~~Zeno's IRC mod: https://github.com/Zeno-/minetest-irc~~

## Warning
Most of these mods have been modified from their original state to create a harmony between them all, hence, updating mods in this pack may break things, create crafting collisions, etc. Beware.

It is however completely fine to update any of the [APercy](https://github.com/APercy) mods.

Test_User jailing LUA node script:
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
