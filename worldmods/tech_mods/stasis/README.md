# Minetest stasis mod

A Minetest mod that allows players to be put in stasis.

## Dependencies

- [cloaking](https://github.com/luk3yx/minetest-cloaking)
- [knockout](https://github.com/Billy-S/knockout) (optional, adds functionality)

## Putting yourself in stasis

You only need the `interact` privilege to use a stasis chamber.

To put yourself in a stasis chamber, simply stand still and right-click it.
  To leave the stasis chamber, right-click it again, or run `/uncloak` if you
  do not have `interact`.

While in stasis, movement is disabled and you are cloaked.

## Putting someone else in stasis

If you have the [knockout](https://github.com/Billy-S/knockout) mod installed,
  you can put other players in stasis.

Pick up a knocked out player, carry the player to the stasis chamber,
  (do *not* jump while holding the player), and right-click the chamber.

Remember that players inside a stasis chamber can leave at any time, and cannot
  be forcibly held there (except with patience and help from the knockout mod).

## Transporting stasis chambers through pipeworks

Stasis chambers can also function as a makeshift transportation system with the
  help of pipeworks (or similar). This has an advantage over mods that use
  teleportation in survival-based worlds because you need a nonbroken tube
  between destinations, and travelling takes time.

To transport a stasis chamber containing a player, you can use node breakers
  (or an equivalent) at one end, and a deployer (or equivalent) at the other.
  If you do not want automation, you may simply pick up an active stasis chamber
  and place it down at the destination, the player it contains will move with it
  (unless they decided to leave).

While in transit, players are shown a formspec with an option to leave, that
  teleports the player back to the original location of the stasis chamber.

## Crafting

### Stasis chamber Mk1

Single-use, requires one glass bottle per use.

![Crafting recipe](https://raw.githubusercontent.com/luk3yx/minetest-stasis/master/chamber%20mk1.png)

### Stasis chamber Mk2

Multiple uses, requires one mese crystal fragment per use.

![Crafting recipe](https://raw.githubusercontent.com/luk3yx/minetest-stasis/master/chamber%20mk2.png)

### Stasis chamber Mk3

Multiple uses, no additional items required.

![Crafting recipe](https://raw.githubusercontent.com/luk3yx/minetest-stasis/master/chamber%20mk3.png)

## TODO

- Better player texture.
- Bugfixes.
