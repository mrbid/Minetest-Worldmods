
-- Healing - +1 HP every 5, 10, or 15 seconds
--------------------------------------------------

local timer = {}

local function on_step(player, name, seconds)
	if not timer[name] then
		timer[name] = 0
	end
	if timer[name] >= seconds then
		player:set_hp(player:get_properties().hp_max)
	else
		timer[name] = timer[name] + 1
	end
end

beacon.register_effect("healing", {
	desc_name = "Healing",
	info = "Heals health fully every second.",
	min_level = 4,
	on_step = function(player, name)
		on_step(player, name, 1)
	end,
	on_remove = function(player, name)
		timer[name] = nil
	end,
})

