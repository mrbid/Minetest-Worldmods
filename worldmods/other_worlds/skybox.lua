-- Heights for skyboxes
local underground = -50
local space_low = 5000
local space_high = 5999
local redsky_low = 6000
local redsky_high = 6999

-- Holds name of skybox showing for each player
local player_list = {}

-- Outerspace skybox
local spaceskybox = {
	"sky_pos_z.png",
	"sky_neg_z.png^[transformR180",
	"sky_neg_y.png^[transformR270",
	"sky_pos_y.png^[transformR270",
	"sky_pos_x.png^[transformR270",
	"sky_neg_x.png^[transformR90"
}

-- Redsky skybox
local redskybox = {
	"sky_pos_z.png^[colorize:#99000050",
	"sky_neg_z.png^[transformR180^[colorize:#99000050",
	"sky_neg_y.png^[transformR270^[colorize:#99000050",
	"sky_pos_y.png^[transformR270^[colorize:#99000050",
	"sky_pos_x.png^[transformR270^[colorize:#99000050",
	"sky_neg_x.png^[transformR90^[colorize:#99000050"
}

-- Darkest space skybox
local darkskybox = {
	"sky_pos_z.png^[colorize:#00005070",
	"sky_neg_z.png^[transformR180^[colorize:#00005070",
	"sky_neg_y.png^[transformR270^[colorize:#00005070",
	"sky_pos_y.png^[transformR270^[colorize:#00005070",
	"sky_pos_x.png^[transformR270^[colorize:#00005070",
	"sky_neg_x.png^[transformR90^[colorize:#00005070"
}


-- check for active pova mod
local pova = minetest.get_modpath("pova")

-- gravity helper function
local set_gravity = function(player, grav)

	if pova then
		pova.add_override(player:get_player_name(), "default", {gravity = grav})
	else
		player:set_physics_override({gravity = grav})
	end
end


local timer = 0

minetest.register_globalstep(function(dtime)

	timer = timer + dtime

	if timer < 2 then
		return
	end

	timer = 0

	for _, player in pairs(minetest.get_connected_players()) do

		local name = player:get_player_name()
		local pos = player:get_pos()
		local current = player_list[name] or ""

		-- Underground
		if pos.y < underground and current ~= "underground" then

			player:set_sky({
				type = "plain",
				clouds = false,
				sunrise_visible = false,
				base_color = 000000
			})

			player:set_moon({visible = false})
			player:set_stars({visible = false})
			player:set_sun({visible = false, sunrise_visible = false})

			player_list[name] = "underground"

			if otherworlds.settings.gravity.enable then
				set_gravity(player, 1.0)
			end

		-- Earth
		elseif pos.y > underground and pos.y < space_low
		and current ~= "earth" then

			player:set_sky({
				type = "regular",
				clouds = true,
				sunrise_visible = true
			})

			player:set_moon({visible = true})
			player:set_stars({visible = true})
			player:set_sun({visible = true, scale = 1.0, sunrise_visible = true})

			player_list[name] = "earth"

			if otherworlds.settings.gravity.enable then
				set_gravity(player, 1.0)
			end

		-- Outerspace
		elseif pos.y > space_low and pos.y < space_high
		and current ~= "space" then

			player:set_sky({
				type = "skybox",
				textures = spaceskybox,
				clouds = false,
				sunrise_visible = false
			})

			player:set_moon({visible = false})
			player:set_stars({visible = false})
			player:set_sun({visible = true, scale = 1.0, sunrise_visible = false})

			player_list[name] = "space"

			if otherworlds.settings.gravity.enable then
				set_gravity(player, 0.4)
			end

		-- Redsky
		elseif pos.y > redsky_low and pos.y < redsky_high
		and current ~= "redsky" then

			player:set_sky({
				type = "skybox",
				textures = redskybox,
				clouds = false,
				sunrise_visible = false
			})

			player:set_moon({visible = false})
			player:set_stars({visible = false})
			player:set_sun({visible = true, scale = 0.5, sunrise_visible = false})

			player_list[name] = "redsky"

			if otherworlds.settings.gravity.enable then
				set_gravity(player, 0.2)
			end

		-- Everything else (blackness)
		elseif pos.y > redsky_high and current ~= "blackness" then

			player:set_sky({
				type = "skybox",
				textures = darkskybox,
				clouds = false,
				sunrise_visible = false
			})

			player:set_moon({visible = false})
			player:set_stars({visible = true})
			player:set_sun({visible = true, scale = 0.1})

			player_list[name] = "blackness"

			if otherworlds.settings.gravity.enable then
				set_gravity(player, 0.1)
			end
		end
	end
end)

minetest.register_on_leaveplayer(function(player)
	player_list[player:get_player_name()] = nil
end)
