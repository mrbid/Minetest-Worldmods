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
item_strings = {}
function item_strings.print(name, message)
	minetest.chat_send_player(name, "item_strings: " .. message, false)
end
function item_strings.sort(first, second)
	return first.name < second.name
end
function item_strings.get(name, pattern)
	local items = {}
	for key, val in pairs(minetest.registered_items) do
		table.insert(items, val)
	end
	table.sort(items, item_strings.sort)
	for key, val in pairs(items) do
		local str = val.name .. " (" .. val.description .. ")"
		if pattern == "" or string.find(string.lower(str), string.lower(pattern)) ~= nil then
			item_strings.print(name, str)
		end
	end
end
function item_strings.version(name)
	item_strings.print(name, "item_strings 20161209")
	item_strings.print(name, "By YuGiOhJCJ <yugiohjcj@1s.fr>")
	item_strings.print(name, "http://yugiohjcj.1s.fr/")
end
