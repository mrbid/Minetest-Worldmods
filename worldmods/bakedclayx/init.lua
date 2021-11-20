for i = 1,323 do
	local tex = "323_palette.png^[sheet:17x19:" .. (i - 1) % 17 .. "," .. math.floor((i - 1) / 17)
	minetest.register_node("bakedclayx:" .. i, {
		description = "Baked Clay ".. i,
		tiles = {tex.."^mask.png"},
		groups = {cracky=3, bakedclay=1},
		sounds = default.node_sound_stone_defaults()
	})
end

