if not minetest.global_exists('test') then return end
if test.active then return end

local describe = test.describe
local it = test.it
local stub = test.stub
local assert_equal = test.assert.equal

describe("Turtles Mob", function ()
	describe("Turtles", function ()
		local original_spawn_specific = mobs.spawn_specific
		local stub_spawn_specific = stub()
		test.before_all(function ()
			mobs.spawn_specific = stub_spawn_specific.call
		end)
		test.after_all(function ()
			mobs.spawn_specific = original_spawn_specific
		end)
		it("calls the main mob spawn registration function with the same values as before config was added", function ()
			dofile(minetest.get_modpath(minetest.get_current_modname()) .. "/init.lua")
			-- The original call before config was added, testing for consistency with config defaults
			stub_spawn_specific.called_with(mobs, "mobs_turtles:turtle", { "default:dirt_with_grass", "default:jungle_grass", "default:sand", "default:desert_sand" }, { "default:dirt_with_grass", "default:jungle_grass", "default:sand", "default:desert_sand", "default:papyrus", "default:cactus", "dryplants:juncus", "dryplants:reedmace" }, 5, 20, 30, 300000, 1, 1, 5000)
			stub_spawn_specific.called_with(mobs, "mobs_turtles:seaturtle", { "default:water_flowing", "default:water_source" }, { "default:water_flowing", "default:water_source", "group:seaplants", "seawrecks:woodship", "seawrecks:uboot" }, 5, 20, 30, 300000, 1, -50, 0)
		end)
	end)
end)

test.execute(true)