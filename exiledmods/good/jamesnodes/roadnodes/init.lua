-- streets mod was a bit ... big ... on node id's so I forked the textures to make this more compacted version.
-- https://github.com/mrbid/Minetest-Worldmods

asphalt_colors = {'black', 'blue', 'red', 'yellow'}

function firstToUpper(str)
	return (str:gsub("^%l", string.upper))
end

function fancy_string(name)
    name = name:gsub(".*:", "")
    name = name:gsub('%W', ' ')
    name = name:gsub("(%l)(%w*)", function(a,b) return string.upper(a)..b end)
    return name
end

function register_asphalt(color)

    minetest.register_node("roadnodes:asphalt_" .. color,
    {
        description = ("Asphalt " .. firstToUpper(color)),
        tiles = {"streets_asphalt_" .. color .. ".png"},
        groups = {cracky=3, oddly_breakable_by_hand=2},
        sounds = default.node_sound_stone_defaults(),
        paramtype2 = 'facedir',
        on_place = minetest.rotate_node,
    })

end

function register_asphalt_marking(color, marking)

    minetest.register_node("roadnodes:asphalt_" .. color .. "_" .. marking,
    {
        description = ("Asphalt " .. firstToUpper(color) .. " " .. fancy_string(marking)),
        tiles = {"streets_asphalt_" .. color .. ".png^streets_" .. marking .. ".png"},
        groups = {cracky=3, oddly_breakable_by_hand=2},
        sounds = default.node_sound_stone_defaults(),
        paramtype2 = 'facedir',
        on_place = minetest.rotate_node,
    })

end

function register_asphalt_marking_all(marking)
    for i, clr in ipairs(asphalt_colors) do
        register_asphalt_marking(clr, marking)
    end
end

-- generate asphalt blocks
for i, clr in ipairs(asphalt_colors) do
    register_asphalt(clr);
end

-- generate asphalt road markings
register_asphalt_marking_all("arrow_left_right");
register_asphalt_marking_all("arrow_right");
register_asphalt_marking_all("arrow_right_straight");
register_asphalt_marking_all("arrow_straight");
register_asphalt_marking_all("dashed_center_line");
register_asphalt_marking_all("dashed_center_line_wide");
register_asphalt_marking_all("dashed_side_line");
register_asphalt_marking_all("dashed_side_line_wide");
register_asphalt_marking_all("double_dashed_center_line");
register_asphalt_marking_all("double_solid_center_line");
register_asphalt_marking_all("double_solid_center_line_corner");
register_asphalt_marking_all("double_solid_center_line_crossing");
register_asphalt_marking_all("double_solid_center_line_tjunction");
register_asphalt_marking_all("mixed_center_line");
register_asphalt_marking_all("solid_center_line");
register_asphalt_marking_all("solid_center_line_corner");
register_asphalt_marking_all("solid_center_line_crossing");
register_asphalt_marking_all("solid_center_line_tjunction");
register_asphalt_marking_all("solid_center_line_wide");
register_asphalt_marking_all("solid_center_line_wide_corner");
register_asphalt_marking_all("solid_center_line_wide_crossing");
register_asphalt_marking_all("solid_center_line_wide_tjunction");
register_asphalt_marking_all("solid_side_line");
register_asphalt_marking_all("solid_side_line_combinated_corner");
register_asphalt_marking_all("solid_side_line_corner");
register_asphalt_marking_all("solid_side_line_wide");
register_asphalt_marking_all("solid_side_line_wide_corner");
register_asphalt_marking_all("solid_stripe");
register_asphalt_marking_all("solid_line_offset");


