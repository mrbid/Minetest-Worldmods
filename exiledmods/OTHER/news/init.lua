
function setNews()
	return "size[8.01,8.78]label[0.42,0.2;Welcome to VF-TECHNIC]label[0.42,4.96;Join us on Discord:]textarea[3.28,5.05;4.92,0.65;;;https://discord.gg/QmPap8PkkG]label[0.42,1.06;You can earn creative on this server for FREE!]label[0.42,1.84;All you need to do is head on over to https://vfcash.uk]label[0.42,2.19;and mine some VFC!]label[0.42,2.97;1 day of creative = 10 VFC]label[0.42,3.4;1 month of creative = 200 VFC]label[0.42,4.18;Creative requests are managed over discord.]image_button_exit[2.18,7.13;3.57,1.61;blank.png;;OK Let me play!]label[0.42,5.74;Please don't steal from other players\, jail on this server]label[0.42,6.09;is worse than getting banned.]"
end

function showNews(player)
	local name = player:get_player_name()
	minetest.show_formspec(name, "news", setNews())
end


minetest.register_chatcommand("news",{
	params = "",
	description="Shows the server news",
	func = function (name,params)
		local player = minetest.get_player_by_name(name)
		minetest.show_formspec(name, "news", setNews())	
	end,
})

minetest.register_on_joinplayer(function (player)
	minetest.after(5, showNews, player)
end)

