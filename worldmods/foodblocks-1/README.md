# Foodblocks for Minetest

![A screenshot of all the food blocks in the mod lined up in a row with their constituent plants in front of them.](screenshot.jpg)

This mod adds large blocks for various types of food growable with the farming, farming\_redo & farming\_undo, and ethereal mods for minetest.

Q: Isn't this a bit silly? What should I do with these blocks?

A: Yes, very silly. You could use them to build a house if you really wanted.

## Installation

Foodblocks requires Minetest 5 as it uses the translation feature built in to that version, but you could easily backport it to intllib on 0.4.x if you direly need to keep using that version.

This mod depends on farming, but that can be provided by the farming mod installed with Minetest Game (this gives only apples and blueberries), Tenplus1's farming\_redo or Felfa's farming\_undo fork of farming\_redo. It will detect which version you have installed and register the appropriate nodes.

There is an optional dependency on ethereal which will register blocks from the edible plants of ethereal.

## Recipes

All of these blocks are crafting by filling the 3x3 crafting grid with the appropriate harvested plant.

## Configuration

Since blueberries were introduced to minetest_game, but already existed in farming, this mod lets you decide what you want the blueberry blocks to drop: default blueberries, wild blueberries (from farming) or the type they were crafted from. See settingstypes.txt and the in-game configuration menu.

## API

You can register your own food blocks in your mod with the external API table `foodblocks`. Read the source for more information. Contributions back to this mod are welcome as well depending on how you want mod dependencies to work.

## Licences

(C) 2021 Blockhead unless otherwise specified

The code of this mod is licensed under the GNU Affero General Public License, version 3, available from the GNU Project. This means any modifications or forks you make to the mod and use on a minetest server have to be published online. Read the AGPL online [here](https://www.gnu.org/licenses/agpl-3.0.en.html).

The art assets of this mod are licensed under the Creative Commons  Attribution-ShareAlike 3.0 Unported License (CC BY-SA 3.0). View this licence online [here](https://creativecommons.org/licenses/by-sa/3.0/),