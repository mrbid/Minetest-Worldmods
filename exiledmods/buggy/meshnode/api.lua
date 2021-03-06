meshnode = {}

meshnode.config = {
	max_speed = 22,
	max_lift = 10,
	yaw_amount = 0.077,
	max_radius = 16,
	show_in_creative = true,
	enable_crafting = true,
	disable_privilege = false,
	fake_shading = false,
	autoconf = false,
}

meshnode.blacklist = {}

local face_rotation = {
	{x=0, y=0, z=0}, {x=0, y=90, z=0}, {x=0, y=180, z=0},
	{x=0, y=-90, z=0}, {x=90, y=0, z=0}, {x=90, y=0, z=90},
	{x=90, y=0, z=180}, {x=90, y=0, z=-90}, {x=-90, y=0, z=0},
	{x=-90, y=0, z=-90}, {x=-90, y=0, z=180}, {x=-90, y=0, z=90},
	{x=0, y=0, z=-90}, {x=90, y=90, z=0}, {x=180, y=0, z=90},
	{x=0, y=-90, z=-90}, {x=0, y=0, z=90}, {x=0, y=90, z=90},
	{x=180, y=0, z=-90}, {x=0, y=-90, z=90}, {x=180, y=180, z=0},
	{x=180, y=90, z=0}, {x=180, y=0, z=0}, {x=180, y=-90, z=0},
}

local meshnode_id = 0

local function connects_to_group(pos, groups)
	local node = minetest.get_node(pos)
	for _, group in pairs(groups) do
		if minetest.get_item_group(node.name, group) > 0 then
			return true
		end
	end
end

local function get_tile_textures(tiles)
	local textures = table.copy(tiles or {})
	for i, v in pairs(textures) do
		if type(v) == "table" then
			textures[i] = v.name or "blank.png"
			if v.name and v.animation then
				local w = v.animation.aspect_w or 16
				local h = v.animation.aspect_h or w
				textures[i] = "[combine:"..w.."x"..h..":0,0="..v.name
			end
		end
	end
	return textures
end

local function get_tile_shading(t, facedir)
	local tiles = {t[1], t[1], t[1], t[1], t[1], t[1]}
	if #t == 3 then
		tiles = {t[1], t[2], t[3], t[3], t[3], t[3]}
	elseif #t == 6 then
		tiles = table.copy(t)
	end
	if facedir and meshnode.config.fake_shading == true then
		local tile_opposite = {2, 1, 4, 3, 6, 5}
		local tile_rotation = {[0] =
			{1, 6}, {1, 3}, {1, 5}, {1, 4},
			{6, 2}, {3, 2}, {5, 2}, {4, 2},
			{5, 1}, {4, 1}, {6, 1}, {3, 1},
			{4, 6}, {6, 3}, {3, 5}, {5, 4},
			{3, 6}, {5, 3}, {4, 5}, {6, 4},
			{2, 6}, {2, 3}, {2, 5}, {2, 4},
		}
		local modifiers = {}
		local top = tile_rotation[facedir][1]
		local front = tile_rotation[facedir][2]
		local bottom = tile_opposite[top]
		local back = tile_opposite[front]
		modifiers[top] = "^[colorize:#000000:16"
		modifiers[bottom] = "^[colorize:#000000:128"
		modifiers[front] = "^[colorize:#000000:64"
		modifiers[back] = "^[colorize:#000000:64"
		for i = 1, 6 do
			local modifier = modifiers[i] or "^[colorize:#000000:32"
			tiles[i] = tiles[i]..modifier
		end
	end
	return tiles
end

local function get_facecon_textures(facecons, texture)
	local textures = {
		"meshnode_trans.png",
		"meshnode_trans.png",
		"meshnode_trans.png",
		"meshnode_trans.png",
	}
	for i = 1, 4 do
		if facecons[i] == true then
			textures[i] = texture
		end
	end
	return textures
end

local function restore_facedir(node, delta, yaw)
	local facedir = node.param2 or 0
	local def = minetest.registered_items[node.name] or {}
	if def.paramtype2 == "facedir" then
		local rot = (meshnode.yaw_to_facedir(yaw) + delta) % 4
		node.param2 = meshnode.rotate_facedir(rot, facedir)
	end
end

meshnode.new_id = function()
	meshnode_id = meshnode_id + 1
	return tostring(meshnode_id)
end

meshnode.get_luaentity = function(id)
	for _, entity in pairs(minetest.luaentities) do
		if entity.mesh_id == id then
			return entity
		end
	end
end

meshnode.get_map_pos = function(ref, parent)
	local pos = parent.object:getpos()
	local yaw = parent.object:getyaw()
	local rot = meshnode.rotate_offset(yaw, ref.offset)
	local vec = vector.add(pos, rot)
	return vector.round(vec)
end

meshnode.facedir_to_yaw = function(facedir)
	local yaw = 0
	local rot = facedir % 4
	if rot == 1 then
		yaw = 3 * math.pi / 2
	elseif rot == 2 then
		yaw = math.pi
	elseif rot == 3 then
		yaw = math.pi / 2
	end
	return yaw
end

meshnode.yaw_to_facedir = function(yaw)
	local deg = math.floor(math.deg(yaw) + 0.5) % 360
	if deg < 90 then
		return 0
	end
	return 4 - math.floor(deg / 90)
end

meshnode.facedir_to_rotation = function(facedir)
	return face_rotation[facedir + 1] or face_rotation[1]
end

meshnode.rotation_to_facedir = function(rotation)
	for i, v in ipairs(face_rotation) do
		if vector.equals(v, rotation) then
			return i - 1
		end
	end
	return 0
end

meshnode.rotate_facedir = function(rot, facedir)
	if rot == 0 then
		return facedir
	end
	local rotation = facedir % 32
	local axis = math.floor(rotation / 4)
	if axis == 0 then
		rotation = rotation + rot
	elseif axis == 5 then
		rotation = rotation - rot
	else
		local axis_rotation = {
			{3, 2, 4},
			{4, 1, 3},
			{2, 4, 1},
			{1, 3, 2},
		}
		local next_axis = axis_rotation[axis]
		axis = next_axis[rot]
		rotation = rotation + rot
	end
	return axis * 4 + (rotation % 4)
end

meshnode.rotate_offset = function(yaw, offset)
	local cos = math.cos(yaw)
	local sin = math.sin(yaw)
	local x = offset.x * cos - offset.z * sin
	local z = offset.x * sin + offset.z * cos
	return vector.round({x=x, y=offset.y, z=z})
end

meshnode.add_entity = function(ref, parent)
	local pos = meshnode.get_map_pos(ref, parent)
	local object = minetest.add_entity(pos, "meshnode:mesh")
	if object then
		local properties = {textures={ref.node.name}}
		local def = minetest.registered_items[ref.node.name] or {}
		local tiles = get_tile_textures(def.tiles)
		if ref.meshtype == "stair" or
				ref.meshtype == "cube" or
				ref.meshtype == "slab" then
			local param2 = ref.node.param2 or 0
			properties.visual = "mesh"
			properties.visual_size = {x=1, y=1}
			properties.mesh = "meshnode_"..ref.meshtype..".obj"
			properties.textures = get_tile_shading(tiles, param2)
		elseif ref.meshtype == "mesh" then
			properties.visual = "mesh"
			properties.visual_size = {x=10, y=10}
			properties.mesh = def.mesh
			properties.textures = tiles
		elseif ref.meshtype == "plant" then
			properties.visual = "mesh"
			properties.visual_size = {x=1, y=1}
			properties.mesh = "meshnode_plant.obj"
			properties.textures = {tiles[1]}
		elseif ref.meshtype == "fence" then
			local textures = get_facecon_textures(ref.facecons, tiles[1])
			table.insert(textures, 1, tiles[1])
			properties.visual = "mesh"
			properties.visual_size = {x=1, y=1}
			properties.mesh = "meshnode_fence.obj"
			properties.textures = textures
		elseif ref.meshtype == "wall" then
			local textures = get_facecon_textures(ref.facecons, tiles[1])
			table.insert(textures, 1, tiles[1])
			properties.visual = "mesh"
			properties.visual_size = {x=1, y=1}
			properties.mesh = "meshnode_wall.obj"
			properties.textures = textures
		elseif ref.meshtype == "pane" then
			local textures = get_facecon_textures(ref.facecons, tiles[3])
			properties.visual = "mesh"
			properties.visual_size = {x=1, y=1}
			properties.mesh = "meshnode_pane.obj"
			properties.textures = textures
		end
		object:set_properties(properties)
		if parent then
			local entity = object:get_luaentity()
			if entity then
				entity.mesh_id = ref.id
				entity.parent_id = parent.mesh_id
			else
				object:remove()
				return
			end
			local yaw = parent.object:getyaw()
			local offset = vector.multiply(ref.offset, 10)
			object:set_attach(parent.object, "", offset, ref.rotation)
		end
	end
	return object
end

meshnode.create = function(pos, parent)
	local node = minetest.get_node(pos)
	local meta = minetest.get_meta(pos)
	local def = minetest.registered_items[node.name] or {}
	local meshtype = "wielditem"
	local scaffold = "meshnode:scaffold"
	local facecons = {}
	local faces = {
		[1] = {x=0, y=0, z=-1},
		[2] = {x=-1, y=0, z=0},
		[3] = {x=0, y=0, z=1},
		[4] = {x=1, y=0, z=0},
	}
	if not parent or
			meshnode.blacklist[node.name] or
			node.name == "meshnode:controller" or
			node.name == "air" or
			node.name == "ignore" or
			def.paramtype2 == "wallmounted" or
			def.paramtype2 == "flowingliquid" then
		return
	elseif def.drawtype == nil or
			def.drawtype == "normal" or
			def.drawtype == "liquid" then
		meshtype = "cube"
	elseif def.drawtype == "mesh" then
		if string.find(node.name, "^stairs:stair_") then
			meshtype = "stair"
		else
			meshtype = "mesh"
		end
	elseif string.find(node.name, "^stairs:slab_") then
		meshtype = "slab"
	elseif def.drawtype == "plantlike" then
		meshtype = "plant"
	elseif minetest.get_item_group(node.name, "fence") > 0 then
		scaffold = "meshnode:scaffold_fence"
		if def.drawtype ~= "mesh" then
			meshtype = "fence"
			for i, face in pairs(faces) do
				local p = vector.add(pos, face)
				facecons[i] = connects_to_group(p, {"fence", "wood", "tree"})
			end
		end
	elseif minetest.get_item_group(node.name, "wall") > 0 then
		scaffold = "meshnode:scaffold_wall"
		if def.drawtype ~= "mesh" then
			meshtype = "wall"
			for i, face in pairs(faces) do
				local p = vector.add(pos, face)
				facecons[i] = connects_to_group(p, {"wall", "stone"})
			end
		end
	elseif minetest.get_item_group(node.name, "pane") > 0 then
		meshtype = "pane"
		scaffold = "meshnode:scaffold_pane"
		if string.find(node.name, "_flat$") then
			facecons = {[2]=true, [4]=true}
		else
			for i, face in pairs(faces) do
				local p = vector.add(pos, face)
				facecons[i] = connects_to_group(p, {"pane"})
			end
		end
	elseif def.wield_image ~= "" or def.inventory_image ~="" then
		return
	end
	local param2 = node.param2 or 0
	local offset = vector.subtract(pos, parent.object:getpos())
	local yaw = math.pi * 2 - parent.object:getyaw()
	local delta = meshnode.yaw_to_facedir(yaw)
	local facedir = meshnode.rotate_facedir(delta, param2)
	local meta_str = nil
	local meta_tab = meta:to_table() or {}
	if meta_tab.inventory then
		for _, list in pairs(meta_tab.inventory) do
			for i, stack in ipairs(list) do
				local str = ItemStack(stack):to_string()
				if str:len() > 0xffff then
					minetest.log("error", "String too long for serialization!")
					str = ""
				end
				list[i] = str
			end
		end
	end
	local ref = {
		id = meshnode.new_id(),
		node = node,
		meta = meta_tab,
		delta = delta,
		meshtype = meshtype,
		facecons = facecons,
		offset = meshnode.rotate_offset(yaw, offset),
		rotation = meshnode.facedir_to_rotation(facedir),
	}
	local object = meshnode.add_entity(ref, parent)
	if object then
		minetest.set_node(pos, {name=scaffold})
		table.insert(parent.nodes, ref)
	end
	return object
end

meshnode.restore = function(ref, parent)
	local entity = meshnode.get_luaentity(ref.id)
	local pos = meshnode.get_map_pos(ref, parent)
	local yaw = parent.object:getyaw()
	restore_facedir(ref.node, ref.delta, yaw)
	minetest.add_node(pos, ref.node)
	if entity then
		entity.object:setpos(pos)
		entity.object:set_detach()
		entity.object:remove()
	end
	if ref.meta then
		local meta = minetest.get_meta(pos)
		local meta_tab = ref.meta or {}
		meta:from_table(meta_tab)
	end
end

meshnode.restore_all = function(parent, name)
	local positions = {}
	if #parent.nodes == 0 then
		return positions
	end
	local minp = {x=32000, y=32000, z=32000}
	local maxp = vector.multiply(minp, -1)
	local yaw = parent.object:getyaw()
	local nodedata = {}
	for _, ref in pairs(parent.nodes) do
		local pos = meshnode.get_map_pos(ref, parent)
		if not minetest.get_node_or_nil(pos) then
			return
		end
		if name and minetest.is_protected(pos, name) then
			return
		end
		table.insert(nodedata, {pos=pos, ref=ref})
		for axis, val in pairs(pos) do
			if val < minp[axis] then
				minp[axis] = val
			end
			if val > maxp[axis] then
				maxp[axis] = val
			end
		end
	end
	local vm = minetest.get_voxel_manip(minp, maxp)
	for _, data in pairs(nodedata) do
		restore_facedir(data.ref.node, data.ref.delta, yaw)
		vm:set_node_at(data.pos, data.ref.node)
	end
	vm:write_to_map()
	vm:update_liquids()
	vm:update_map()
	for _, data in pairs(nodedata) do
		local entity = meshnode.get_luaentity(data.ref.id)
		if entity then
			entity.object:setpos(data.pos)
			entity.object:set_detach()
			entity.object:remove()
		end
		if data.ref.meta then
			local meta = minetest.get_meta(data.pos)
			local meta_tab = data.ref.meta or {}
			meta:from_table(meta_tab)
		end
		table.insert(positions, data.pos)
	end
	return positions
end
