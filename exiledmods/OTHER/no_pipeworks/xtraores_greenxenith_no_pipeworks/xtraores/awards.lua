awards.register_award("xtraores:unobtainable",{
	title = "Obtaining the unobtainable",
	description = "Dig an unobtainium ore.",
	icon = "xtraores_unobtainium_lump.png",
	trigger = {
		type = "dig",
		node = "xtraores:stone_with_unobtainium",
		target = 1
	},
})

awards.register_award("xtraores:nya",{
	title = "Nyaaa",
	description = "Dig a geminitinum ore.",
	icon = "xtraores_geminitinum_lump.png",
	trigger = {
		type = "dig",
		node = "xtraores:stone_with_geminitinum",
		target = 1
	},
})

awards.register_award("xtraores:chosen_one",{
	title = "You are the Chosen One",
	description = "Craft Excalibur.",
	icon = "xtraores_sword_excalibur.png",
	trigger = {
		type = "craft",
		item = "xtraores:sword_excalibur",
		target = 1
	},
})

awards.register_award("xtraores:please_nerf",{
	title = "Seems OP, please nerf",
	description = "Craft the Gungir.",
	icon = "xtraores_spear_gungir.png",
	trigger = {
		type = "craft",
		item = "xtraores:spear_gungir",
		target = 1
	},
	requires = {"xtraores:chosen_one"},
	secret = true,
})

awards.register_award("xtraores:epilepsy_warning",{
	title = "Epilepsy warning",
	description = "Place a geminitinum block.",
		icon = "xtraores_geminitinum_ingot.png",
	trigger = {
		type = "place",
		node = "xtraores:geminitinum_block",
		target = 1
	},
	secret = true,
})