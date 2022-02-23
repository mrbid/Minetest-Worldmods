-- Set this value to the stack size you want. If lowering the value already
-- existing larger stacks won?t be affected ? you just can?t fill them to their
-- original size.
--
-- Set to 100 to achive what?s discussed here:
-- https://forum.minetest.net/viewtopic.php?f=3&t=16817
--
-- Please note: The value of 99 for stacks (instead of using stack_max) is
-- hardcoded at various places in Minetest and can?t be altered by a mod. Using
-- this mod makes stacks the size you want in your everyday gameplay.
local desired_stack_size = 999


-- The mods you want to support. (opt-)depend this mod on them and add the
-- mod?s prefixes to this table in order to alter them.
local supported_mods = {
    'default',
    'moreblocks',
    'moreores',
	'gems',
	'ethereal',
	'extranodes',
	'technic',
	'space_travel',
	'other_worlds',
	'caverealms',
	'rainbow_ore',
	'terumet',
    'technic_tweak',
    'packed_things',
    'quartz',
}


function alter(object_name)
    for v,value in pairs(supported_mods) do
        if value == object_name:gsub(':.*','') then return true end
    end
    return false
end

local all_objects = {}
for w,what in pairs({'items', 'nodes', 'craftitems', 'tools'}) do
    for k,v in pairs(minetest['registered_'..what]) do all_objects[k] = v end
end

for name,def in pairs(all_objects) do
    if def.stack_max == 99 and alter(name) then
        minetest.override_item(name, {
            stack_max = desired_stack_size
        })
    end
end
