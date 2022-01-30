--Skybox code, as well as cloud code and physics code

local stars_sky = {
	"space_travel_stars_sky.png", -- +y (top)
	"space_travel_stars_sky.png", -- -y (bottom)
	"space_travel_stars_sky.png", -- +z (back)
	"space_travel_stars_sky.png", -- -z (front)
	"space_travel_stars_sky.png", -- -x (left)
	"space_travel_stars_sky.png", -- +x (right)
}

local earth_space = {
	"space_travel_stars_sky.png", -- +y (top)
	"space_travel_earth_space_sky.png", -- -y (bottom)
	"space_travel_stars_sky.png", -- +z (back)
	"space_travel_stars_sky.png", -- -z (front)
	"space_travel_stars_sky.png", -- -x (left)
	"space_travel_stars_sky.png", -- +x (right)
}

local moon_sky = {
	"space_travel_stars_sky.png", -- +y (top)
	"space_travel_stars_sky.png", -- -y (bottom)
	"space_travel_stars_sky.png", -- +z (back)
	"space_travel_earth_space_sky.png", -- -z (front)
	"space_travel_stars_sky.png", -- -x (left)
	"space_travel_stars_sky.png", -- +x (right)
}

local mars_night = {
	"space_travel_stars_sky.png^[colorize:#cf411b11", -- +y (top)
	"space_travel_stars_sky.png^[colorize:#cf411b11", -- -y (bottom)
	"space_travel_stars_sky.png^[colorize:#cf411b11", -- +z (back)
	"space_travel_stars_sky.png^[colorize:#cf411b11", -- -z (front)
	"space_travel_stars_sky.png^[colorize:#cf411b11", -- -x (left)
	"space_travel_stars_sky.png^[colorize:#cf411b11", -- +x (right)
}

local mars_space = {
	"space_travel_stars_sky.png", -- +y (top)
	"space_travel_mars_space_sky.png", -- -y (bottom)
	"space_travel_stars_sky.png", -- +z (back)
	"space_travel_stars_sky.png", -- -z (front)
	"space_travel_stars_sky.png", -- -x (left)
	"space_travel_stars_sky.png", -- +x (right)
}

local mercury_sky = {
	"space_travel_dark_sky.png", -- +y (top)
	"space_travel_dark_sky.png", -- -y (bottom)
	"space_travel_dark_sky.png", -- +z (back)
	"space_travel_sun_space_sky.png", -- -z (front)
	"space_travel_dark_sky.png", -- -x (left)
	"space_travel_dark_sky.png", -- +x (right)
}

local mercury_space = {
	"space_travel_dark_sky.png", -- +y (top)
	"space_travel_mercury_space_sky.png", -- -y (bottom)
	"space_travel_dark_sky.png", -- +z (back)
	"space_travel_sun_space_sky.png", -- -z (front)
	"space_travel_dark_sky.png", -- -x (left)
	"space_travel_dark_sky.png", -- +x (right)
}

local venus_space = {
	"space_travel_dark_sky.png", -- +y (top)
	"space_travel_venus_space_sky.png", -- -y (bottom)
	"space_travel_dark_sky.png", -- +z (back)
	"space_travel_dark_sky.png", -- -z (front)
	"space_travel_dark_sky.png", -- -x (left)
	"space_travel_dark_sky.png", -- +x (right)
}

local jupiter_space = {
	"space_travel_dark_sky.png", -- +y (top)
	"space_travel_dark_sky.png", -- -y (bottom)
	"space_travel_dark_sky.png", -- +z (back)
	"space_travel_jupiter_space_sky.png", -- -z (front)
	"space_travel_dark_sky.png", -- -x (left)
	"space_travel_dark_sky.png", -- +x (right)
}

local ganymede_space = {
	"space_travel_dark_sky.png", -- +y (top)
	"space_travel_ganymede_space_sky.png", -- -y (bottom)
	"space_travel_dark_sky.png", -- +z (back)
	"space_travel_jupiter_space_sky.png", -- -z (front)
	"space_travel_dark_sky.png", -- -x (left)
	"space_travel_dark_sky.png", -- +x (right)
}

local callisto_space = {
	"space_travel_dark_sky.png", -- +y (top)
	"space_travel_callisto_space_sky.png", -- -y (bottom)
	"space_travel_dark_sky.png", -- +z (back)
	"space_travel_jupiter_space_sky.png", -- -z (front)
	"space_travel_dark_sky.png", -- -x (left)
	"space_travel_dark_sky.png", -- +x (right)
}

local io_space = {
	"space_travel_dark_sky.png", -- +y (top)
	"space_travel_io_space_sky.png", -- -y (bottom)
	"space_travel_dark_sky.png", -- +z (back)
	"space_travel_jupiter_space_sky.png", -- -z (front)
	"space_travel_dark_sky.png", -- -x (left)
	"space_travel_dark_sky.png", -- +x (right)
}

local europa_space = {
	"space_travel_dark_sky.png", -- +y (top)
	"space_travel_europa_space_sky.png", -- -y (bottom)
	"space_travel_dark_sky.png", -- +z (back)
	"space_travel_jupiter_space_sky.png", -- -z (front)
	"space_travel_dark_sky.png", -- -x (left)
	"space_travel_dark_sky.png", -- +x (right)
}

local titan_sky = {
	"space_travel_titan_sky_pos_y.png^[transform3", -- +y (top)
	"space_travel_titan_sky_neg_y.png^[transform1", -- -y (bottom)
	"space_travel_titan_sky_pos_z.png", -- +z (back)
	"space_travel_titan_sky_neg_z.png", -- -z (front)
	"space_travel_titan_sky_neg_x.png", -- -x (left)
	"space_travel_titan_sky_pos_x.png", -- +x (right)
}

local saturn_space = {
	"space_travel_saturn_space_sky_pos_y.png^[transform3", -- +y (top)
	"space_travel_saturn_space_sky_neg_y.png^[transform1", -- -y (bottom)
	"space_travel_saturn_space_sky_pos_z.png", -- +z (back)
	"space_travel_saturn_space_sky_neg_z.png", -- -z (front
	"space_travel_saturn_space_sky_neg_x.png", -- -x (left)
	"space_travel_saturn_space_sky_pos_x.png", -- +x (right)
}

local uranus_space = {
	"space_travel_dark_sky.png", -- +y (top)
	"space_travel_dark_sky.png", -- -y (bottom)
	"space_travel_dark_sky.png", -- +z (back)
	"space_travel_uranus_space_sky.png", -- -z (front)
	"space_travel_dark_sky.png", -- -x (left)
	"space_travel_dark_sky.png", -- +x (right)
}

local neptune_space = {
	"space_travel_dark_sky.png", -- +y (top)
	"space_travel_dark_sky.png", -- -y (bottom)
	"space_travel_dark_sky.png", -- +z (back)
	"space_travel_neptune_space_sky.png", -- -z (front)
	"space_travel_dark_sky.png", -- -x (left)
	"space_travel_dark_sky.png", -- +x (right)
}

local pluto_sky = {
	"space_travel_dark_sky.png", -- +y (top)
	"space_travel_dark_sky.png", -- -y (bottom)
	"space_travel_dark_sky.png", -- +z (back)
	"space_travel_charon_space_sky.png", -- -z (front)
	"space_travel_dark_sky.png", -- -x (left)
	"space_travel_dark_sky.png", -- +x (right)
}

local pluto_space = {
	"space_travel_dark_sky.png", -- +y (top)
	"space_travel_pluto_space_sky.png", -- -y (bottom)
	"space_travel_dark_sky.png", -- +z (back)
	"space_travel_charon_space_sky.png", -- -z (front)
	"space_travel_dark_sky.png", -- -x (left)
	"space_travel_dark_sky.png", -- +x (right)
}

local charon_sky = {
	"space_travel_dark_sky.png", -- +y (top)
	"space_travel_dark_sky.png", -- -y (bottom)
	"space_travel_dark_sky.png", -- +z (back)
	"space_travel_pluto_space_sky.png", -- -z (front)
	"space_travel_dark_sky.png", -- -x (left)
	"space_travel_dark_sky.png", -- +x (right)
}

local charon_space = {
	"space_travel_dark_sky.png", -- +y (top)
	"space_travel_charon_space_sky.png", -- -y (bottom)
	"space_travel_dark_sky.png", -- +z (back)
	"space_travel_pluto_space_sky.png", -- -z (front)
	"space_travel_dark_sky.png", -- -x (left)
	"space_travel_dark_sky.png", -- +x (right)
}

local sedna_sky = {
	"space_travel_cosmos_sky_pos_z.png^[colorize:#99000050",
	"space_travel_cosmos_sky_neg_z.png^[transformR180^[colorize:#99000050",
	"space_travel_cosmos_sky_neg_y.png^[transformR270^[colorize:#99000050",
	"space_travel_cosmos_sky_pos_y.png^[transformR270^[colorize:#99000050",
	"space_travel_cosmos_sky_pos_x.png^[transformR270^[colorize:#99000050",
	"space_travel_cosmos_sky_neg_x.png^[transformR90^[colorize:#99000050",
}

local cosmos_sky = {
	"space_travel_cosmos_sky_pos_z.png",
	"space_travel_cosmos_sky_neg_z.png^[transformR180",
	"space_travel_cosmos_sky_neg_y.png^[transformR270",
	"space_travel_cosmos_sky_pos_y.png^[transformR270",
	"space_travel_cosmos_sky_pos_x.png^[transformR270",
	"space_travel_cosmos_sky_neg_x.png^[transformR90",
}

local minerva_night = {
	"space_travel_stars_sky.png^[colorize:#f98b8b06", -- +y (top)
	"space_travel_stars_sky.png^[colorize:#f98b8b06", -- -y (bottom)
	"space_travel_stars_sky.png^[colorize:#f98b8b06", -- +z (back)
	"space_travel_stars_sky.png^[colorize:#f98b8b06", -- -z (front)
	"space_travel_stars_sky.png^[colorize:#f98b8b06", -- -x (left)
	"space_travel_stars_sky.png^[colorize:#f98b8b06", -- +x (right)
}

local minerva_space = {
	"space_travel_stars_sky.png", -- +y (top)
	"space_travel_minerva_space_sky.png", -- -y (bottom)
	"space_travel_stars_sky.png", -- +z (back)
	"space_travel_stars_sky.png", -- -z (front)
	"space_travel_stars_sky.png", -- -x (left)
	"space_travel_stars_sky.png", -- +x (right)
}

local bacchus_night = {
	"space_travel_stars_sky.png^[colorize:#F08BF906", -- +y (top)
	"space_travel_stars_sky.png^[colorize:#F08BF906", -- -y (bottom)
	"space_travel_stars_sky.png^[colorize:#F08BF906", -- +z (back)
	"space_travel_stars_sky.png^[colorize:#F08BF906", -- -z (front)
	"space_travel_stars_sky.png^[colorize:#F08BF906", -- -x (left)
	"space_travel_stars_sky.png^[colorize:#F08BF906", -- +x (right)
}

local bacchus_space = {
	"space_travel_stars_sky.png", -- +y (top)
	"space_travel_bacchus_space_sky.png", -- -y (bottom)
	"space_travel_stars_sky.png", -- +z (back)
	"space_travel_stars_sky.png", -- -z (front)
	"space_travel_stars_sky.png", -- -x (left)
	"space_travel_stars_sky.png", -- +x (right)
}

--[[
local ourea_sky = {
	"space_travel_ourea_sky.png", -- +y (top)
	"space_travel_ourea_sky.png", -- -y (bottom)
	"space_travel_ourea_sky.png", -- +z (back)
	"space_travel_ourea_sky_front.png", -- -z (front)
	"space_travel_ourea_sky.png", -- -x (left)
	"space_travel_ourea_sky.png", -- +x (right)
}
]]

local ourea_sky = {
	"space_travel_ourea_sky_pos_y.png^[transform3", -- +y (top)
	"space_travel_ourea_sky_neg_y.png^[transform1", -- -y (bottom)
	"space_travel_ourea_sky_pos_z.png", -- +z (back)
	"space_travel_ourea_sky_neg_z.png", -- -z (front)
	"space_travel_ourea_sky_neg_x.png", -- -x (left)
	"space_travel_ourea_sky_pos_x.png", -- +x (right)
}

local caelus_space = {
	"space_travel_caelus_space_sky_pos_y.png^[transform3", -- +y (top)
	"space_travel_caelus_space_sky_neg_y.png^[transform1", -- -y (bottom)
	"space_travel_caelus_space_sky_pos_z.png", -- +z (back)
	"space_travel_caelus_space_sky_neg_z.png", -- -z (front
	"space_travel_caelus_space_sky_neg_x.png", -- -x (left)
	"space_travel_caelus_space_sky_pos_x.png", -- +x (right)
}

local osiris_night = {
	"space_travel_stars_sky.png^[colorize:#f7b48a11", -- +y (top)
	"space_travel_stars_sky.png^[colorize:#f7b48a11", -- -y (bottom)
	"space_travel_stars_sky.png^[colorize:#f7b48a11", -- +z (back)
	"space_travel_stars_sky.png^[colorize:#f7b48a11", -- -z (front)
	"space_travel_stars_sky.png^[colorize:#f7b48a11", -- -x (left)
	"space_travel_stars_sky.png^[colorize:#f7b48a11", -- +x (right)
}

local osiris_space = {
	"space_travel_stars_sky.png", -- +y (top)
	"space_travel_osiris_space_sky.png", -- -y (bottom)
	"space_travel_stars_sky.png", -- +z (back)
	"space_travel_stars_sky.png", -- -z (front)
	"space_travel_stars_sky.png", -- -x (left)
	"space_travel_stars_sky.png", -- +x (right)
}

local minthe_night = {
	"space_travel_stars_sky.png^[colorize:#75dbaa11", -- +y (top)
	"space_travel_stars_sky.png^[colorize:#75dbaa11", -- -y (bottom)
	"space_travel_stars_sky.png^[colorize:#75dbaa11", -- +z (back)
	"space_travel_stars_sky.png^[colorize:#75dbaa11", -- -z (front)
	"space_travel_stars_sky.png^[colorize:#75dbaa11", -- -x (left)
	"space_travel_stars_sky.png^[colorize:#75dbaa11", -- +x (right)
}

local minthe_space = {
	"space_travel_stars_sky.png", -- +y (top)
	"space_travel_minthe_space_sky.png", -- -y (bottom)
	"space_travel_stars_sky.png", -- +z (back)
	"space_travel_stars_sky.png", -- -z (front)
	"space_travel_stars_sky.png", -- -x (left)
	"space_travel_stars_sky.png", -- +x (right)
}

local time = 0

minetest.register_globalstep(function(dtime)
	time = time + dtime
	if time > 1 then
		for _, player in ipairs(minetest.get_connected_players()) do
			time = 0
			
			local name = player:get_player_name()
			local pos = player:getpos()
			
			local day_time = nil
			--if minetest.get_timeofday()*24000 > 6000 and minetest.get_timeofday()*24000 <= 18000 then
			if minetest.get_timeofday() > 0.25 and minetest.get_timeofday() <= 0.75 then
				day_time = true
			--elseif minetest.get_timeofday()*24000 <= 6000 or minetest.get_timeofday()*24000 > 18000 then
			elseif minetest.get_timeofday() <= 0.25 or minetest.get_timeofday() > 0.75 then
				day_time = false
			else
				day_time = nil
			end
			
			--Skybox code, cloud code, and physics code right here
			if minetest.get_player_by_name(name) and pos.y < 1000 then --Earth sky
				player:set_sky({}, "regular", {})
				player:set_clouds({
					density = 0.4,
					color = "#fff0f0e5",
					ambient = "#000000",
					height = 120,
					thickness = 16,
					speed ={x=0, z=-2},
				})
				player:set_physics_override(1, 1, 1) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 1000 and pos.y < 1500 then --Earth orbit
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", earth_space)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 1500 and pos.y < 2500 then --Moon sky
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", moon_sky)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 2500 and pos.y < 3000 then --Moon orbit
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", moon_sky)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 3000 and pos.y < 4000 and day_time then --Mars sky at day
				player:set_sky({r=219, g=168, b=117}, "plain", {})
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 3000 and pos.y < 4000 and (not day_time) then --Mars sky at night
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", mars_night)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 4000 and pos.y < 4500 then --Mars orbit
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", mars_space)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 4500 and pos.y < 5500 then --Mercury sky
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", mercury_sky)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 5500 and pos.y < 6000 then --Mercury orbit
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", mercury_space)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 6000 and pos.y < 7000 and day_time then --Venus sky at day
				player:set_sky({r=208, g=177, b=11}, "plain", {})
				player:set_clouds({
					density = 0.6,
					color = "#CCA526", --"#B18A21",
					ambient = "#000000",
					height = 6620,
					thickness = 32,
					speed ={x=0, z=10},
				})
				player:set_physics_override(1, 1, 1) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 6000 and pos.y < 7000 and (not day_time) then --Venus sky at night
				player:set_sky({r=102, g=87, b=5}, "plain", {})
				player:set_clouds({
					density = 0.6,
					color = "#CCA526", --"#B18A21",
					ambient = "#000000",
					height = 6620,
					thickness = 32,
					speed ={x=0, z=10},
				})
				player:set_physics_override(1, 1, 1) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 7000 and pos.y < 7500 then --Venus orbit
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", venus_space)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 7500 and pos.y < 8500 then --Ganymede sky
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", jupiter_space)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 8500 and pos.y < 9000 then --Ganymede orbit
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", ganymede_space)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 9000 and pos.y < 10000 then --Callisto sky
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", jupiter_space)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 10000 and pos.y < 10500 then --Callisto orbit
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", callisto_space)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 10500 and pos.y < 11500 then --Io sky
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", jupiter_space)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 11500 and pos.y < 12000 then --Io orbit
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", io_space)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 12000 and pos.y < 13000 then --Europa sky
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", jupiter_space)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 13000 and pos.y < 13500 then --Europa orbit
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", europa_space)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 13500 and pos.y < 14500 and day_time then --Titan sky at day
				player:set_sky({r = 239, g = 194, b = 109}, "skybox", titan_sky)
				player:set_clouds({
					density = 0.5,
					color = "#EFC26D",
					ambient = "#000000",
					height = 14120,
					thickness = 32,
					speed ={x=0, z=-6},
				})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 13500 and pos.y < 14500 and (not day_time) then --Titan sky at night
				player:set_sky({r = 128, g = 103, b = 58}, "plain", {})
				player:set_clouds({
					density = 0.5,
					color = "#EFC26D",
					ambient = "#000000",
					height = 14120,
					thickness = 32,
					speed ={x=0, z=-6},
				})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 14500 and pos.y < 15000 then --Titan orbit
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", saturn_space)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 15000 and pos.y < 16000 then --Oberon sky
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", uranus_space)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 16000 and pos.y < 16500 then --Oberon orbit
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", uranus_space)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 16500 and pos.y < 17500 then --Triton sky
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", neptune_space)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 17500 and pos.y < 18000 then --Triton orbit
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", neptune_space)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 18000 and pos.y < 19000 then --Pluto sky
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", pluto_sky)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 19000 and pos.y < 19500 then --Pluto orbit
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", pluto_space)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 19500 and pos.y < 20500 then --Charon sky
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", charon_sky)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 20500 and pos.y < 21000 then --Charon orbit
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", charon_space)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 21000 and pos.y < 22000 then --Sedna sky
				player:set_sky({r = 118, g = 84, b = 84}, "skybox", sedna_sky)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 22000 and pos.y < 22500 then --Sedna orbit
				player:set_sky({r = 118, g = 84, b = 84}, "skybox", sedna_sky)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 22500 and pos.y < 23500 then --Asteriod belt sky
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", cosmos_sky)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 23500 and pos.y < 24500 and day_time then --Minerva sky at day
				player:set_sky({r=249, g=139, b=139}, "plain", {})
				player:set_clouds({
					density = 0.4,
					color = "#FA7070",
					ambient = "#000000",
					height = 24120,
					thickness = 16,
					speed ={x=0, z=-2},
				})
				player:set_physics_override(1, 1, 1) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 23500 and pos.y < 24500 and (not day_time) then --Minerva sky at night
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", minerva_night)
				player:set_clouds({
					density = 0.4,
					color = "#FA7070",
					ambient = "#000000",
					height = 24120,
					thickness = 16,
					speed ={x=0, z=-2},
				})
				player:set_physics_override(1, 1, 1) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 24500 and pos.y < 25000 then --Minerva orbit
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", minerva_space)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 25000 and pos.y < 26000 and day_time then --Bacchus sky at day
				player:set_sky({r=240, g=139, b=249}, "plain", {})
				player:set_clouds({
					density = 0.4,
					color = "#ED64F9",
					ambient = "#000000",
					height = 25620,
					thickness = 16,
					speed ={x=0, z=-2},
				})
				player:set_physics_override(1, 1, 1) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 25000 and pos.y < 26000 and (not day_time) then --Bacchus sky at night
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", minerva_night)
				player:set_clouds({
					density = 0.4,
					color = "#ED64F9",
					ambient = "#000000",
					height = 25620,
					thickness = 16,
					speed ={x=0, z=-2},
				})
				player:set_physics_override(1, 1, 1) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 26000 and pos.y < 26500 then --Bacchus orbit
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", bacchus_space)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 26500 and pos.y < 27500 and day_time then --Ourea sky at day
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", ourea_sky)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 26500 and pos.y < 27500 and (not day_time) then --Ourea night at day
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", caelus_space)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 27500 and pos.y < 28000 then --Ourea orbit
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", caelus_space)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 28000 and pos.y < 29000 and day_time then --Osiris sky at day
				player:set_sky({r=247, g=180, b=138}, "plain", {})
				player:set_clouds({
					density = 0.4,
					color = "#f79c63",
					ambient = "#000000",
					height = 28620,
					thickness = 16,
					speed ={x=0, z=-2},
				})
				player:set_physics_override(1, 1, 1) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 28000 and pos.y < 29000 and (not day_time) then --Osiris sky at night
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", osiris_night)
				player:set_clouds({
					density = 0.4,
					color = "#f79c63",
					ambient = "#000000",
					height = 28620,
					thickness = 16,
					speed ={x=0, z=-2},
				})
				player:set_physics_override(1, 1, 1) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 29000 and pos.y < 29500 then --Osiris orbit
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", osiris_space)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 29500 and pos.y < 30500 and day_time then --Minthe sky at day
				player:set_sky({r=117, g=219, b=170}, "plain", {})
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 29500 and pos.y < 30500 and (not day_time) then --Minthe sky at night
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", minthe_night)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			elseif minetest.get_player_by_name(name) and pos.y >= 30500 and pos.y < 31000 then --Minthe orbit
				player:set_sky({r = 0, g = 0, b = 0}, "skybox", minthe_space)
				player:set_clouds({density = 0})
				player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
			end
			--End of important code
		end
	end
end)
