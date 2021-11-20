
minetest.register_privilege("reboot", "Required to issue server restarts");

minetest.register_chatcommand("reboot_server",
{
	privs = {reboot = true},
	params = "",
	description = "Reboots the server",
	func = function (name, param)
		minetest.chat_send_all("Server rebooting in 5 seconds.");
		minetest.after(5.0, minetest.request_shutdown);
	end
})


