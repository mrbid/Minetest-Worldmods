--This stuff is junk - get rid of it
minetest.register_alias("xtraores_mblox:platinumtorch", "default:torch")
minetest.register_alias("xtraores_misc:simple_microchip", "xtraores:cobalt_ingot")
minetest.register_alias("xtraores_misc:microchip", "xtraores:geminitinum_ingot")
minetest.register_alias("xtraores_tech:xray", "default:glass")
minetest.register_alias("xtraores_tech:ropegen", "default:wood")
minetest.register_alias("xtraores_tech:rope", "wool:white")
minetest.register_alias("xtraores_tech:lonely_rope", "wool:white")
minetest.register_alias("xtraores_door:door_rainbow", "xtraores_rainbow:wood")
minetest.register_alias("xtraores_door:door_rainbow_a", "doors:door_wood_a")
minetest.register_alias("xtraores_door:door_rainbow_b", "doors:door_wood_b")
minetest.register_alias("xtraores:stone_with_antracite", "default:stone_with_coal")
minetest.register_alias("xtraores:antracite_lump", "default:coal_lump")
minetest.register_alias("xtraores_armor:helmet_crown", "default:gold_ingot")
minetest.register_alias("xtraores_ext:amber_block", "default:meselamp")
minetest.register_alias("xtraores_ext:ankh", "default:apple")
minetest.register_alias("xtraores_ext:coin", "default:gold_ingot")
minetest.register_alias("xtraores_ext:crap", "default:dirt")
minetest.register_alias("xtraores_ext:dagger", "default:sword_steel")
minetest.register_alias("xtraores_ext:dm", "default:goldblock")
minetest.register_alias("xtraores_ext:extractinator", "default:steelblock")
minetest.register_alias("xtraores_ext:gapple", "default:apple")
minetest.register_alias("xtraores_ext:goblet", "vessels:drinking_glass")
minetest.register_alias("xtraores_ext:legendary_sword", "default:sword_mese")
minetest.register_alias("xtraores_ext:lsr", "default:stone")
minetest.register_alias("xtraores_ext:treasure", "default:goldblock")
minetest.register_alias("xtraores_ext:treasure_box", "default:wood")

-- Change "osminum" to "osmium" and "unobtanium" to "unobtainium"
local prefixes = {
	"stone_with",
	"pick",
	"shovel",
	"axe",
	"sword",
	"spear",
}

local suffixes = {
	"brick",
	"lump",
	"bar",
}

local armors = {
	"boots",
	"leggings",
	"chestplate",
	"helmet",
	"shield",
}

local materials = {
	"platinum",
	"cobalt",
	"osmium",
	"rarium",
	"adamantite",
	"unobtanium",
	"titanium",
	"geminitinum",
}

-- (osmium)
for _, prefix in pairs(prefixes) do
	minetest.register_alias("xtraores:"..prefix.."_osminum", "xtraores:"..prefix.."_osmium")
end

for _, suffix in pairs(suffixes) do
	minetest.register_alias("xtraores:osminum_"..suffix, "xtraores:".."osmium_"..suffix)
end

for _, armor in pairs(armors) do
	minetest.register_alias("xtraores_armor:"..armor.."_osminum", "xtraores_armor:"..armor.."_osmium")
end

for _, material in pairs(materials) do
	minetest.register_alias("xtraores:"..material.."_bar", "xtraores:"..material.."_ingot")
end

-- (unobtainium)
for _, prefix in pairs(prefixes) do
	minetest.register_alias("xtraores:"..prefix.."_unobtanium", "xtraores:"..prefix.."_unobtainium")
end

for _, suffix in pairs(suffixes) do
	minetest.register_alias("xtraores:unobtanium_"..suffix, "xtraores:".."unobtainium_"..suffix)
end

for _, armor in pairs(armors) do
	minetest.register_alias("xtraores_armor:"..armor.."_unobtanium", "xtraores_armor:"..armor.."_unobtainium")
end

for _, material in pairs(materials) do
	minetest.register_alias("xtraores:unobtanium_ingot", "xtraores:unobtainium_ingot")
end