--[[
	Ingots - allows the placemant of ingots in the world
	Copyright (C) 2018  Skamiz Kazzarch

	This library is free software; you can redistribute it and/or
	modify it under the terms of the GNU Lesser General Public
	License as published by the Free Software Foundation; either
	version 2.1 of the License, or (at your option) any later version.

	This library is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
	Lesser General Public License for more details.

	You should have received a copy of the GNU Lesser General Public
	License along with this library; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
]]--

function toblock(s)

	if s == "default:steel_ingot" then
		return "default:steelblock"
	end

	if s == "default:tin_ingot" then
		return "default:tinblock"
	end

	if s == "default:gold_ingot" then
		return "default:goldblock"
	end

	if s == "default:copper_ingot" then
		return "default:copperblock"
	end

	if s == "default:bronze_ingot" then
		return "default:bronzeblock"
	end

	if s == "lavastuff:ingot" then
		return "lavastuff:block"
	end

	if s == "rainbow_ore:rainbow_ore_ingot" then
		return "nyancat:nyancat_rainbow"
	end

	return string.gsub(s, "_ingot", "") .. "_block"

end

function splitname(s)

	if s == "ingot" then
		return "Lava"
	end

	if s == "rainbow_ore_ingot" then
		return "Rainbow"
	end

	if s == "carbon_steel_ingot" then
		return "Carbon Steel"
	end

	if s == "stainless_steel_ingot" then
		return "Stainless Steel"
	end

	if s == "cast_iron_ingot" then
		return "Cast Iron"
	end

	if s == "mixed_metal_ingot" then
		return "Mixed Metal"
	end

	return string.gsub(s, "_ingot", "")

end

function firstToUpper(str)
	return (str:gsub("^%l", string.upper))
end

-- takes an item name and a texture name and a boolean whether the ingots are big
function ingots.register_ingots(ingot_item, texture, is_big)

	--checks, whether the item name is a valid item (thanks 'puzzlecube')
	if not minetest.registered_items[ingot_item] then
		minetest.log("warning", ingot_item.." is not registered. Skipping ingot registration")
		return
	end

	-- de hardcoded modname, which allows the api to be properly used from within other mods (thanks 'argyle')
	local mod_name = minetest.get_current_modname()
	local mod_prefix = mod_name .. ":"

	local stack_size = 64
	local texture_prefix = "ingot_"
	--gets item name witout mod part, to be used in the deffinition of the new nodes
	local ingot_name = string.sub(ingot_item, string.find(ingot_item, ":", 1, true) +1, -1)


	if is_big then
		ingot_name = ingot_name .. "_big"
		stack_size = 8
		texture_prefix = "ingot_big_"
	end

	--this way there is no need for a separate on_punch function for a stack of 1 ingot
	minetest.register_alias(mod_prefix .. ingot_name .."_0", "air")

	--gives the ingot_item the ability to be placed and increase already placed stacks of ingots
	minetest.override_item(ingot_item, {
		on_place = function (itemstack, placer, pointed_thing)
            local pos = minetest.get_pointed_thing_position(pointed_thing, true)
            if minetest.is_protected(pos, placer:get_player_name()) and not minetest.check_player_privs(placer, "protection_bypass") then
			    return
		    end
			if pointed_thing["type"] == "node" then

				local name = minetest.get_node(pointed_thing.under).name
				-- call on_rightclick function of pointed node if applicable and not sneak
				-- might or might not break if item is placed by mod devices
				if minetest.registered_nodes[name].on_rightclick and
					not placer:get_player_control().sneak
				then
					minetest.registered_nodes[name].on_rightclick(pointed_thing.under,
						minetest.get_node(pointed_thing.under),
						placer,
						itemstack)
				elseif string.find(name, mod_prefix .. ingot_name) then
					local count = string.gsub(name, "%D*", "")
					if stack_size > minetest.registered_nodes[minetest.get_node(pointed_thing.under).name]._ingot_count then
						minetest.set_node(pointed_thing.under, {name = mod_prefix .. ingot_name .."_" .. count + 1, param2 = minetest.get_node(pointed_thing.under).param2})
						if not (creative and creative.is_enabled_for and creative.is_enabled_for(placer:get_player_name())) then
							itemstack:take_item()
						end
						local meta = minetest.get_meta(pointed_thing.under)
						meta:set_string("infotext", count + 1 .. " " .. firstToUpper(splitname(ingot_name)) .. " Ingots")
					elseif minetest.get_node(pointed_thing.above).name == "air" then
						minetest.set_node(pointed_thing.above, {name = mod_prefix .. ingot_name .."_1"})
						if not (creative and creative.is_enabled_for and creative.is_enabled_for(placer:get_player_name())) then
							itemstack:take_item()
						end
						local meta = minetest.get_meta(pointed_thing.above)
						meta:set_string("infotext", "1 " .. firstToUpper(splitname(ingot_name))  .. " Ingots")
					end

				elseif minetest.get_node(pointed_thing.above).name == "air" then
					minetest.set_node(pointed_thing.above, {name = mod_prefix .. ingot_name .."_1"})
					if not (creative and creative.is_enabled_for and creative.is_enabled_for(placer:get_player_name())) then
						itemstack:take_item()
					end
					local meta = minetest.get_meta(pointed_thing.above)
					meta:set_string("infotext", "1 " .. firstToUpper(splitname(ingot_name))  .. " Ingots")
				end

				return itemstack
			end
		end
	})

	--registers 'stack_size' number of nodes, each has one more ingot in it than the last
	for i = 1, stack_size do
		local box = {
					type = "fixed",
					fixed = {
						--rectangular box which encompases all placed ingots
						ingots.get_box(is_big, i),
					},
				}
		local incre = 1
		if i == 64 then
			incre = 0
			local bn = toblock(ingot_item);
			minetest.register_craft({
				output = mod_prefix .. ingot_name .. "_64",
				recipe = {
					{bn,bn,bn},
					{bn,bn,bn},
					{bn,ingot_item,''},
				}
			})
		end
		minetest.register_node(mod_prefix .. ingot_name .. "_" .. i,{
			description = firstToUpper(splitname(ingot_name)) .. " Ingots",
			drawtype = "mesh",
			tiles = {texture},
			mesh = texture_prefix .. i .. ".obj",
			selection_box = box,
			collision_box = box,
			paramtype = 'light',
			paramtype2 = "facedir",
			groups = {cracky = 3, level = 2, not_in_creative_inventory = incre--[[, not_in_craft_guide = 1--]]},
			drop = ingot_item .. " " .. i,
			sounds = default.node_sound_metal_defaults(),
			on_punch = function(pos, node, puncher, pointed_thing)

				local count = string.gsub(node.name, "%D*", "")
				local meta = minetest.get_meta(pos)
				meta:set_string("infotext",  count .. " " .. firstToUpper(splitname(ingot_name)) .. " Ingots")

				if puncher then
					local wield = puncher:get_wielded_item()
					--checks, so that a stack can be taken appart only by hand or relevant ingot_item
								if wield:get_name() == ingot_item or
			wield:get_count() == 0 then
                        if minetest.is_protected(pos, puncher:get_player_name()) and not minetest.check_player_privs(puncher, "protection_bypass") then
			                return
		                end
						minetest.set_node(pos, {name = mod_prefix .. ingot_name .."_" .. i - 1, param2 = node.param2})
						if not (creative and creative.is_enabled_for and creative.is_enabled_for(puncher:get_player_name())) then
							local stack = ItemStack(ingot_item)
							puncher:get_inventory():add_item("main", stack)
						end

						local meta = minetest.get_meta(pos)
						meta:set_string("infotext", i - 1 .. " " .. firstToUpper(splitname(ingot_name))  .. " Ingots")
					end
				end
			end,
			after_place_node = function(pos, placer)
				local meta = minetest.get_meta(pos)
				meta:set_string("infotext",  "64 " .. firstToUpper(splitname(ingot_name)) .. " Ingots")
			end,
			_ingot_name = ingot_name,
			_ingot_count = i,
		})
	end
end

--returns an apropriate nodebox for a given number of ingots
function ingots.get_box(is_big, i)
	if is_big then return {-0.5, -0.5, -0.5, 0.5, (((i + 1 - ((i +1 )%2)) / 8) - 0.5), 0.5}
	else return {-0.5, -0.5, -0.5, 0.5, (((i - 1 - ((i-1)%8)) / 8) - 3) / 8, 0.5}
	end
end
