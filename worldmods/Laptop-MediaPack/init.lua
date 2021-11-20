dofile(minetest.get_modpath("laptop_mediapack").."/api.lua")
dofile(minetest.get_modpath("laptop_mediapack").."/craftrecipes.lua")

-- Default nodes for Itemshelf mod
-- By Zorman2000

local default_shelf = {
	type = "fixed",
	fixed = {
		{-0.25, -0.5, -0.25, 0.25, -0.45, 0.25}, -- bottom
		{-0.25, -0.5, -0.25, 0.25, -0.25, -0.20}, -- front bottom *gigity*
		{-0.25, -0.5, 0.25, 0.25, -0.15, 0.20}, -- the dreaded rear bottom
		{-0.25, -0.5, -0.25, -0.2, -0.25, 0.25}, -- left bottom untouched
		{0.25, -0.5, -0.25, 0.2, -0.25, 0.25}, -- right bottom. damned right.
		{-0.20, -0.5, -0.25, 0.20, -0.22, -0.20}, -- front catch
		{-0.05, -0.23, -0.25, 0.05, -0.20, -0.28}, -- front release
		{-0.25, -0.5, 0.10, -0.2, -0.15, 0.25}, -- left hinge
		{-0.27, -0.1875, 0.157, -0.25, -0.225, 0.20}, -- left hinge catch
		{0.25, -0.5, 0.10, 0.21, -0.15, 0.25}, -- right hinge
		{0.27, -0.1875, 0.157, 0.25, -0.225, 0.20}, -- left hinge catch

		{-0.07, 0.01, -0.06, 0.03, 0.01, 0.04}, -- top spot 1
		{0.03, 0.01, -0.06, 0.13, 0.01, -0.16}, -- top spot 2

		{-0.26, -0.25, 0.27, -0.25, -0.0, 0.26}, -- top left rear
		{0.26, -0.25, 0.27, 0.25, -0.0, 0.26}, -- top right rear
		{-0.26, -0.25, -0.27, -0.25, -0.0, -0.26}, -- top left front
		{0.26, -0.25, -0.27, 0.25, -0.0, -0.26}, -- top right front

		{-0.26, 0.01, 0.27, -0.25, -0.25, -0.27}, -- top left
		{0.26, 0.01, 0.27, 0.25, -0.25, -0.27}, -- top right
		{-0.26, -0.25, -0.26, 0.26, 0.01, -0.27}, -- top front
		{-0.26, -0.25, 0.26, 0.26, 0.01, 0.27}, -- top rear



	}
}


itemshelf.register_shelf("disk_storage", {
	description = "Disk Storage",
	textures = {

		"laptop_disk_storage_top.png", --top
		"laptop_disk_storage_bottom.png", --bottom
		"laptop_disk_storage_side.png^[transformFx", --right
		"laptop_disk_storage_side.png", --left
		"laptop_disk_storage_back.png", --back
		"laptop_disk_storage_front.png", --front
	},
	nodebox = default_shelf,
	paramtype2 = "facedir",
	capacity = 16,
	shown_items = 1,
})

---------------------------------------


minetest.register_craftitem(":laptop:floppy_525", {
	description = 'Double density floppy',
	inventory_image = "laptop_floppy_525_inv.png",
	wield_image = "laptop_floppy_525.png",
	paramtype2 = "facedir",
	groups = {laptop_removable_floppy = 1},
	stack_max = 1,
})

minetest.register_craftitem(":laptop:punchcard", {
	description = 'Punch Card',
	inventory_image = "laptop_punchcard.png",
	wield_image = "laptop_punchcard.png",
	groups = {laptop_removable_floppy = 1},
	stack_max = 1,
})

minetest.register_craftitem(":laptop:cd", {
	description = 'Compact Disc',
	inventory_image = "laptop_cd.png",
	wield_image = "laptop_cd.png",
	groups = {laptop_removable_floppy = 1},
	stack_max = 1,
})

minetest.register_craftitem(":laptop:cassette", {
	description = 'D-C60 Cassette',
	inventory_image = "laptop_cassette.png",
	wield_image = "laptop_cassette.png",
	groups = {laptop_removable_floppy = 1},
	stack_max = 1,
})
