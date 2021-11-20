local modpath = minetest.get_modpath("other_worlds") .. DIR_DELIM

otherworlds = {}

dofile(modpath .. "settings.lua")
dofile(modpath .. "mars_plants.lua")
dofile(modpath .. "crystals.lua")
dofile(modpath .. "space_nodes.lua")
dofile(modpath .. "crafting.lua")
dofile(modpath .. "skybox.lua")

-- required helpers for mapgen options below
dofile(modpath .. "asteroid_layer_helpers.lua")

if otherworlds.settings.space_asteroids.enable then
	dofile(modpath .. "space_asteroids.lua")
end

if otherworlds.settings.redsky_asteroids.enable then
	dofile(modpath .. "redsky_asteroids.lua")
end

if otherworlds.settings.bacchus_asteroids.enable then
	dofile(modpath .. "bacchus_asteroids.lua")
end

if otherworlds.settings.io_asteroids.enable then
	dofile(modpath .. "io_asteroids.lua")
end

if otherworlds.settings.mars_asteroids.enable then
	dofile(modpath .. "mars_asteroids.lua")
end

if otherworlds.settings.minerva_asteroids.enable then
	dofile(modpath .. "minerva_asteroids.lua")
end

if otherworlds.settings.minthe_asteroids.enable then
	dofile(modpath .. "minthe_asteroids.lua")
end

if otherworlds.settings.osiris_asteroids.enable then
	dofile(modpath .. "osiris_asteroids.lua")
end

if otherworlds.settings.sedna_asteroids.enable then
	dofile(modpath .. "sedna_asteroids.lua")
end

if otherworlds.settings.titan_asteroids.enable then
	dofile(modpath .. "titan_asteroids.lua")
end

if otherworlds.settings.venus_asteroids.enable then
	dofile(modpath .. "venus_asteroids.lua")
end

