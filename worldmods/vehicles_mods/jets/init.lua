jets = {["current_jets"]={}}
minetest.register_craftitem("jets:jet",{
	description = "Jet",
	inventory_image = "jets_jet_inv.png",
	on_use = function(_,user)
		local name = user:get_player_name()
		if jets.current_jets[name] == nil then
			jets.current_jets[name] = {}
			jets.current_jets[name].properties = user:get_properties()
			jets.current_jets[name].physics_override = user:get_physics_override()
			user:set_properties({visual="mesh",visual_size={x=2.6,y=2.6},mesh="jets_jet.obj",textures={"jets_jet.png"},collisionbox = {-1.45, 0, -0.5, 1.45, 1.2, 0.5},})
			user:set_physics_override({speed=(minetest.setting_getbool("disable_anticheat")== true and 6 or 1),jump=0,gravity=0.2})
		else
			user:set_properties(jets.current_jets[name].properties)
			user:set_physics_override(jets.current_jets[name].physics_override)
			jets.current_jets[name] = nil
		end
	end}
)
minetest.register_craft({output="jets:jet",recipe={
	{"default:obsidian_glass","technic:carbon_steel_ingot","default:obsidian_glass"},
	{"technic:carbon_steel_ingot","homedecor:motor","technic:carbon_steel_ingot"},
	{"technic:chromium_ingot","technic:chromium_ingot","technic:chromium_ingot"}
}})
