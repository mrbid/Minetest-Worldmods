--Daytime Mod v0.2 by Dipity aka. DipityPlays
--Licensed under the WTFPL
--You just DO WHAT THE FUCK YOU WANT TO.

function daytime()
	minetest.set_timeofday(0.5)
end

minetest.register_chatcommand ("day", {
	privs = {settime = true},
	params = "",
	description = "Sets the time to day",
	func = function (name)
		minetest.set_timeofday(0.5)
	end
})

minetest.register_chatcommand ("long_night", {
	privs = {settime = true},
	params = "",
	description = "Sets the time to night",
	func = function (name)
		minetest.set_timeofday(0)
		minetest.chat_send_player(name, "This change will last 6 minutes before changing back to day time.")
		minetest.chat_send_all(name .. " has enabled night for 6 minutes.");
		minetest.after(333.0, daytime)
	end
})

minetest.register_chatcommand ("long_dawn", {
	privs = {settime = true},
	params = "",
	description = "Sets the time to dawn",
	func = function (name)
		minetest.set_timeofday(0.2)
		minetest.chat_send_player(name, "This change will last 6 minutes before changing back to day time.")
		minetest.chat_send_all(name .. " has enabled dawn for 6 minutes.");
		minetest.after(333.0, daytime)
	end
})

minetest.register_chatcommand ("long_dusk", {
	privs = {settime = true},
	params = "",
	description = "Sets the time to dusk",
	func = function (name)
		minetest.set_timeofday(0.8)
		minetest.chat_send_player(name, "This change will last 6 minutes before changing back to day time.")
		minetest.chat_send_all(name .. " has enabled dusk for 6 minutes.");
		minetest.after(333.0, daytime)
	end
})

minetest.register_chatcommand ("night", {
	privs = {settime = true},
	params = "",
	description = "Sets the time to night",
	func = function (name)
		minetest.set_timeofday(0)
		minetest.chat_send_player(name, "This change will last 33 seconds before changing back to day time.")
		minetest.chat_send_all(name .. " has enabled night for 33 seconds.");
		minetest.after(33.0, daytime)
	end
})

minetest.register_chatcommand ("dawn", {
	privs = {settime = true},
	params = "",
	description = "Sets the time to dawn",
	func = function (name)
		minetest.set_timeofday(0.2)
		minetest.chat_send_player(name, "This change will last 33 seconds before changing back to day time.")
		minetest.chat_send_all(name .. " has enabled dawn for 33 seconds.");
		minetest.after(33.0, daytime)
	end
})

minetest.register_chatcommand ("dusk", {
	privs = {settime = true},
	params = "",
	description = "Sets the time to dusk",
	func = function (name)
		minetest.set_timeofday(0.8)
		minetest.chat_send_player(name, "This change will last 33 seconds before changing back to day time.")
		minetest.chat_send_all(name .. " has enabled dusk for 33 seconds.");
		minetest.after(33.0, daytime)
	end
})



