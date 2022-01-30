if not minetest.global_exists('test') then return end
if test.active then return end

local describe = test.describe
local it = test.it
local stub = test.stub
local assert_equal = test.assert.equal

describe("Doomed Mob", function ()
	describe("Doomed", function ()
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
			stub_spawn_specific.called_with(mobs, "mobs_doomed:badger", { "default:dirt_with_grass", "default:dirt", "default:dirt_with_coniferous_litter" }, { "air" }, 0, 14, 30, 300000, 2, 0, 5000)
			stub_spawn_specific.called_with(mobs, "mobs_doomed:elephant", { "default:dirt_with_dry_grass", "default:desert_sand" }, { "air" }, 10, 14, 30, 300000, 2, 0, 5000, true)
			stub_spawn_specific.called_with(mobs, "mobs_doomed:fox", { "default:dirt_with_grass", "default:dirt", "default:dirt_with_coniferous_litter", "default:dirt_with_snow" }, { "air" }, 0, 14, 30, 300000, 2, 0, 5000)
			stub_spawn_specific.called_with(mobs, "mobs_doomed:hedgehog", { "default:dirt_with_grass", "default:dirt_with_coniferous_litter" }, { "air" }, 0, 14, 30, 300000, 2, 0, 5000)
			stub_spawn_specific.called_with(mobs, "mobs_doomed:owl", { "group:leaves" }, { "air" }, 0, 14, 30, 300000, 2, 0, 5000, false)
			stub_spawn_specific.called_with(mobs, "mobs_doomed:tortoise", { "default:clay", "group:sand" }, { "air" }, 10, 14, 30, 300000, 2, 0, 5000, true)
			stub_spawn_specific.called_with(mobs, "mobs_doomed:whale", { "default:water_source" }, { "default:water_source" }, 0, 14, 30, 3000000, 1, -40, 0, true)
		end)
	end)
end)

test.execute(true)