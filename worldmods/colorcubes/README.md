# Color Cubes [`colorcubes`]
## Description
This mod adds various decorational and colorful blocks to Minetest. This is mostly for creative purposes.

## Current version
The current version of this mod is 0.4.

## Block types and colors
The blocks come in 5 types and 19 colors.

Each block can be dug by hand in a half second.

The following block types are available:

* Basic color cubes: These blocks have a single square pattern
* Tiled color cubes: These blocks have 4 squares in a tile pattern
* Concentric color cubes: These blocks have a pattern of 4 concentric squares
* Window color cubes: These blocks are semi-transparent and let sunlight go through
* Light color cubes: These blocks emit light

### Light color cubes
There are 13 light color cubes. Each light color cube has a different
brightness, depending on its color. The available colors for light color
cubes are, sorted by brightness:

1. White
2. Yellow
3. Orange
4. Red
5. Red-violet
6. Magenta
7. Violet
8. Blue
9. Skyblue
10. Cyan
11. Aqua
12. Green
13. Lime

## Crafting
Some blocks can be crafted for convenience.

### Basic color cubes
This is crafted by multiple means.

Place a tiled color cube of a single color in the crafting grid
to obtain 4 basic color cubes.

Place a concentric color cube in the crafting grid
to obtain 8 basic color cubes.

### Tiled color cubes
This is crafted by placing 4 basic color cubes of the same
color into the crafting grid like this:

    XX
    XX

This yields one tiled color cube of the same color.

There are also a few tiled color cubes with a 2 color mosaic available.
They can be crafted from 4 basic color cubes:

    12
    21

“1” stands for the first color and “2” for the second color.

The following color combinations are available (usually complementary colors):

* Yellow and blue
* Red and cyan
* Green and magenta
* Aqua and red-violet
* Orange and skyblue
* Orange and brown
* Black and white
* Light gray and dark gray

### Concentric color cubes
This is crafted by placing 8 basic color cubes of the same
color into the crafting grid like this:

    XXX
    X X
    XXX

This yields one concentric color cube of the same color.

## Coloring
This mod supports the Paint Roller mod [`paint_roller`].
All color cubes can be painted to change their color,
provided the color is available.

This mod is supported by the Color Machine mod [`colormachine`]
for repainting most of the blocks in this mod.

## License
The entire mod (including all its files) falls under the WTFPL.
Do whatever you want, have fun! :-)
