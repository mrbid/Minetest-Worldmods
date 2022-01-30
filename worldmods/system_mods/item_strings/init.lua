-- item_strings: A minetest mod to get item strings.
-- Copyright (C) 2016 YuGiOhJCJ

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
dofile(minetest.get_modpath("item_strings") .. "/item_strings.lua")

minetest.register_privilege("item_strings", "Required to search for item strings");

minetest.register_chatcommand("item_strings_get", {
	params = "[<pattern>]",
	description = "Get the item strings corresponding to a pattern",
	privs = {item_strings = true},
	func = function(name, param)
		item_strings.get(name, param)
	end
})
minetest.register_chatcommand("gs", {
	params = "[<pattern>]",
	description = "Get the item strings corresponding to a pattern",
	privs = {item_strings = true},
	func = function(name, param)
		item_strings.get(name, param)
	end
})
minetest.register_chatcommand("item_strings_version", {
	params = "",
	description = "Show the item_strings version",
	privs = {item_strings = true},
	func = function(name, param)
		local result = string.match(param, "^%s*$")
		if result ~= nil then
			item_strings.version(name)
		else
			item_strings.print(name, "Invalid parameters (see /help item_strings_version)")
		end
	end
})
