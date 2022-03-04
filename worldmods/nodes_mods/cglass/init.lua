-- A better coloured glass mod
-- https://github.com/mrbid/Minetest-Worldmods

glass_colors = {
    black='#2b2b2b',
    blue='#0063b0',
    brown='#8c5922',
    cyan='#07B6BC',
    dark_green='#567a42',
    dark_grey='#6d6d6d',
    green='#4ee34c',
    grey='#9f9f9f',
    magenta='#ff0098',
    orange='#ff8b0e',
    pink='#ff62c6',
    red='#dc1818',
    violet='#a437ff',
    white='#FFFFFF',
    yellow='#ffe400',
    neon_cyan='#4deeea',
    neon_pink='#f000ff',
    neon_blue='#001eff',
    vibrant_yellow='#e3ff00',
    vibrant_green='#01ff1f',
    vibrant_orange='#ff9a00',
    vibrant_purple='#bd00ff',
    vibrant_blue='#0078ff',
}

-- glass_colors = {
--     neon_cyan='#4deeea',
--     neon_green='#74ee15',
--     neon_yellow='#ffe700',
--     neon_pink='#f000ff',
--     neon_blue='#001eff', 
-- }

-- glass_colors = {
--     vibrant_yellow='#e3ff00',
--     vibrant_green='#01ff1f',
--     vibrant_orange='#ff9a00',
--     vibrant_purple='#bd00ff',
--     vibrant_blue='#0078ff',
-- }

function fancy_string(name)
    name = name:gsub(".*:", "")
    name = name:gsub('%W', ' ')
    name = name:gsub("(%l)(%w*)", function(a,b) return string.upper(a)..b end)
    return name
end

for k, v in pairs(glass_colors) do
    print(k,v)
    minetest.register_node("cglass:glass_" .. k, {
        description = fancy_string(k) .. " Glass",
        drawtype = "glasslike_framed",

        tiles = {"cglass.png^[multiply:" .. v, "cglass_detail.png^[multiply:" .. v},
        inventory_image = minetest.inventorycube("cglass.png^[multiply:" .. v),

        paramtype = "light",
        sunlight_propagates = true, 
        is_ground_content = false,

        groups = {cracky = 3, oddly_breakable_by_hand = 3},
        sounds = default.node_sound_glass_defaults()
    })
end
