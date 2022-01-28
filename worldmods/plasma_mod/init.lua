minetest.register_node('plasma_mod:red_plasma', {
    paramtype = 'light',  
	walkable = false,  
    description = 'red plasma',
    tiles = {'plasma_texture.png'},
    is_ground_content = true,
	groups = {cracky=3, oddly_breakable_by_hand=1},
	drop = 'plasma_mod:red_plasma',
    light_source = 15, 
    damage_per_second = 10000
})

minetest.register_craft({
    output = 'plasma_mod:red_plasma',
    recipe = {
        {'plasma_mod:quantum_obsidian_block','bucket:bucket_lava','plasma_mod:quantum_obsidian_block'},
        {'bucket:bucket_lava','bucket:bucket_water','bucket:bucket_lava'},
        {'plasma_mod:quantum_obsidian_block','bucket:bucket_lava','plasma_mod:quantum_obsidian_block'}
    }
})
minetest.register_node('plasma_mod:red_plasma_with_sound', {
    paramtype = 'light',  
	walkable = false,  
    description = 'red plasma with sound',
    tiles = {'plasma_texture.png'},
    is_ground_content = true,
	groups = {cracky=3, oddly_breakable_by_hand=1},
	drop = 'plasma_mod:red_plasma_with_sound',
    light_source = 15, 
    damage_per_second = 10000,

    after_place_node = function(pos)
            local timer = minetest.get_node_timer(pos)
            timer:start(10)
    end,
    on_timer = function(pos)
            local timer = minetest.get_node_timer(pos)
            minetest.sound_play("plasma_block_sound_effect", {pos = pos, max_hear_distance = 10, gain = 0.1, loop = false})
            timer:start(10)
    end,
    on_destruct = function(pos)
        local timer = minetest.get_node_timer(pos)
        timer:stop()
    end
}) 

minetest.register_craft({
    output = 'plasma_mod:red_plasma_with_sound',
    recipe = {
        {'default:tinblock','bucket:bucket_lava','default:tinblock'},
        {'bucket:bucket_lava','bucket:bucket_water','bucket:bucket_lava'},
        {'default:tinblock','bucket:bucket_lava','default:tinblock'}
    }
})
minetest.register_node('plasma_mod:quantum_obsidian_block', {
    walkable = true,
    description='quantun obsidian',
    tiles = {
        -- tile 1
        {
            name = 'quantum_obsidian_block_animation.png',
            animation = {
                type = "vertical_frames",
                aspect_w = 16,
                aspect_h = 16,
                length = 3
            }
        }
        -- next tile
    },
    is_ground_content = true,
    groups = {cracky=3, oddly_breakable_by_hand=1},
    drop = 'plasma_mod:quantum_obsidian_block'
})

minetest.register_craft({
	output = "plasma_mod:quantum_obsidian_block",
	recipe = {
		{'plasma_mod:quantum_obsidian_plate','plasma_mod:quantum_obsidian_plate','plasma_mod:quantum_obsidian_plate'},
        {'plasma_mod:quantum_obsidian_plate','plasma_mod:quantum_obsidian_plate','plasma_mod:quantum_obsidian_plate'},
        {'plasma_mod:quantum_obsidian_plate','plasma_mod:quantum_obsidian_plate','plasma_mod:quantum_obsidian_plate'}
	}
})
minetest.register_craftitem('plasma_mod:quantum_obsidian_plate', {
	image = 'quantum_obsidian_plate.png',
	on_place_on_ground = minetest.craftitem_place_item,
    	description='quantun obsidian plate',
})

minetest.register_craft({
	output = 'plasma_mod:quantum_obsidian_plate',
	recipe = {
		{'default:obsidian_glass','default:obsidian','default:obsidian_glass'},
        {'default:obsidian','default:mese','default:obsidian'},
        {'default:obsidian_glass','default:obsidian','default:obsidian_glass'}
	}
})
--minetest.register_node('plasma_mod:red_plasma', {
	--paramtype = "light",	
	--description = 'red plasma',
	--tiles = {'plasma_texture.png'},
	--group = {snappy=1, oddly_breakable_by_hand=1 }
	--})light_source = 14, 
	--damage_per_second = 0,
--
--minetest.register_craft({
	--output = 'plasma_mod:red_plasma'
	--})recipe = {
		--{'default:steelblock','bucket:bucket_lava','default:steelblock'}
		--{'bucket:bucket_lava','bucket:bucket_water','bucket:bucket_lava'}
		--{'default:steelblock','bucket:bucket_lava','default:steelblock'}
--})
