-- More Cupcakes
-- cupcake texture by TacoBella
-- sugar texture by TenPlus?

local cupcake = {}

cupcake.colours = {
	{"black",      "Black"},
	{"blue",       "Blue"},
	{"brown",      "Brown"},
	{"cyan",       "Cyan"},
	{"dark_green", "Dark Green"},
	{"green",      "Green"},
	{"magenta",    "Magenta"},
	{"orange",     "Orange"},
	{"pink",       "Pink"},
	{"red",        "Red"},
	{"violet",     "Violet"},
	{"white",      "White"},
	{"yellow",     "Yellow"},
}

for _, row in ipairs(cupcake.colours) do
	local name = row[1]
	local desc = row[2]

	minetest.register_craftitem("more_cupcakes:"..name.."_cupcake", {
		description = desc.." Cupcake",
		inventory_image = "morecupcakes_"..name.."_cupcake.png",
		on_use = minetest.item_eat(6),
	})

	minetest.register_craft({
		output = "more_cupcakes:"..name.."_cupcake",
		recipe = {
			{"", "dye:"..name, ""},
			{ "farming:flour", "farming:sugar", "mobs:bucket_milk" },
			{"default:paper", "default:paper","default:paper"},
		}
	})
end

minetest.register_craftitem("more_cupcakes:cupcake_bow", {
	description = "Cupcake with a bow",
	inventory_image = "morecupcakes_cupcake4.png",
	on_use = minetest.item_eat(6),
})

minetest.register_craft( {
	output = "more_cupcakes:cupcake_bow",
	recipe = {
		{"", "farming:sugar", ""},
		{ "farming:sugar", "dye:blue", "farming:sugar" },
		{"", "farming:flour",""},
	}
})

if farming.mod ~= "redo" then  -- If we don't have TenPlus1's farming redo version, register sugar. We need it!

--= Sugar (from TenPlus1's farming redo mod)

	minetest.register_craftitem(":farming:sugar", {
	description = "Sugar",
	inventory_image = "farming_sugar.png",
	})

	minetest.register_craft({
	type = "cooking",
	cooktime = 3,
	output = "farming:sugar 2",
	recipe = "default:papyrus",
	})
end