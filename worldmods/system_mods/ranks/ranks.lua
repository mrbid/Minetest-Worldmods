-- ranks/ranks.lua

ranks.register("admin", {
	prefix = "[Admin]",
	colour = {a = 255, r = 0, g = 230, b = 255},
})

ranks.register("hidden", {
	prefix = "",
	colour = {a = 0, r = 255, g = 255, b = 255},
})


--Just for MultiCraft_Server, its a pain to rank players to builder 
ranks.register("event", {
	prefix = "[Event_Participant]",
	colour = {a = 255, r = 225, g = 174, b = 66},
})

ranks.register("master-builder",{
	prefix = "[Master-Builder]",
	colour = {a = 255, r = 33, g = 235, b = 113},
	grant_missing = true,
	privs = {
		interact = true,
		home = true,
		shout = true,
		fast = true,
		fly = true,
		noclip = true,
		tp = true,
		tp_tpc = true,
		creative = true,
		settime = true,
		areas_high_limit = true,
		worldedit = true,
		kick = true,
		teleport = true,
		jail = true,
		invhack = true,
	},
})

ranks.register("builder",{
	prefix = "[Builder]",
	colour = {a = 255, r = 33, g = 235, b = 113},
	grant_missing = true,
	privs = {
		interact = true,
		home = true,
		shout = true,
		fast = true,
		fly = true,
		noclip = true,
		tp = true,
		tp_tpc = true,
		creative = true,
		settime = true,
		areas_high_limit = true,
	},
})
ranks.register("vip",{
	prefix = "[VIP]",
	colour = {a = 255, r = 255, g = 255, b = 0},
	grant_missing = true,
	privs = {
		interact = true,
		home = true,
		shout = true,
		fast = true,
		fly = true,
		tp = true,
	},
})

