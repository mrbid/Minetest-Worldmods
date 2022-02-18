
--= CHANGED TenPlus1 (moreores tin is now default steel, moreores silver is now copper, removed Moreores dependancy)

-- Home Computer

minetest.register_craft({
    output = "mycoins:home_computer";
    recipe = {
        { "mycoins:home_computer_powersupply", "mycoins:ribbonwire", "mycoins:home_computer_cdrom", },
        { "mycoins:home_computer_ram", "mycoins:home_computer_cpu", "mycoins:home_computer_fan", },
        { "mycoins:home_computer_soundcard", "mycoins:home_computer_motherboard", "mycoins:home_computer_harddrive", },
    };
});



minetest.register_craft({
    output = "mycoins:home_computer_video";
    recipe = {
        { "homedecor:plastic_base", "homedecor:plastic_base", "homedecor:plastic_base", },
        { "homedecor:ic", "mycoins:copper_ribbonwire", "homedecor:ic", },
        { "default:gold_ingot", "default:gold_ingot", "default:gold_ingot", },
    };
});

minetest.register_craft({
    output = "mycoins:home_computer_motherboard";
    recipe = {
        { "homedecor:ic", "homedecor:ic", "homedecor:ic", },
        { "default:gold_ingot", "default:gold_ingot", "default:steel_ingot", },
        { "homedecor:plastic_base", "default:steel_ingot", "default:coalblock", },
    };
});

minetest.register_craft({
    output = "mycoins:home_computer_powersupply";
    recipe = {
        { "mycoins:ribbonwire", "mycoins:ribbonwire", "mycoins:ribbonwire", },
        { "default:steel_ingot", "default:steelblock", "default:steel_ingot", },
        { "homedecor:ic", "homedecor:ic", "homedecor:ic", },
    };
});

minetest.register_craft({
    output = "mycoins:home_computer_cpu";
    recipe = {
        { "homedecor:ic", "default:gold_ingot", "homedecor:ic", },
        { "homedecor:ic", "default:diamond", "homedecor:ic", },
        { "homedecor:ic", "default:gold_ingot", "homedecor:ic", },
    };
});

minetest.register_craft({
    output = "mycoins:home_computer_soundcard";
    recipe = {
        { "default:steel_ingot", "default:steel_ingot", "default:steel_ingot", },
        { "default:steel_ingot", "default:glass", "default:steel_ingot", },
        { "default:gold_ingot", "default:steel_ingot", "default:gold_ingot", },
    };
});

minetest.register_craft({
    output = "mycoins:home_computer_fan";
    recipe = {
        { "mycoins:copper_ribbonwire", "mycoins:copper_ribbonwire", "mycoins:copper_ribbonwire", },
        { "default:steel_ingot", "default:coalblock", "default:steel_ingot", },
        { "mycoins:copper_ribbonwire", "mycoins:copper_ribbonwire", "mycoins:copper_ribbonwire", },
    };
});

minetest.register_craft({
    output = "mycoins:home_computer_harddrive";
    recipe = {
        { "default:gold_ingot", "default:gold_ingot", "default:gold_ingot", },
        { "default:coalblock", "default:steelblock", "default:coalblock", },
        { "mycoins:copper_ribbonwire", "mycoins:copper_ribbonwire", "mycoins:copper_ribbonwire", },
    };
});

minetest.register_craft({
    output = "mycoins:home_computer_cdrom";
    recipe = {
        { "default:steel_ingot", "homedecor:plastic_base", "default:glass", },
        { "default:coal_lump", "default:steel_ingot", "default:coal_lump", },
        { "default:gold_ingot", "default:copper_ingot", "default:gold_ingot", },
    };
});

minetest.register_craft({
    output = "mycoins:home_computer_ram";
    recipe = {
        { "homedecor:plastic_sheeting", "mycoins:copper_ribbonwire", "homedecor:plastic_sheeting", },
        { "homedecor:ic", "homedecor:ic", "homedecor:ic", },
        { "default:gold_ingot", "default:gold_ingot", "default:gold_ingot", },
    };
});


-- Game Computer

minetest.register_craft({
    output = "mycoins:game_computer";
    recipe = {
        { "mycoins:game_computer_powersupply", "mycoins:ribbonwire", "mycoins:game_computer_dvdrom", },
        { "mycoins:game_computer_ram", "mycoins:game_computer_cpu", "mycoins:home_computer", },
        { "mycoins:game_computer_soundcard", "mycoins:game_computer_motherboard", "mycoins:game_computer_harddrive", },
    };
});

minetest.register_craft({
    output = "mycoins:game_computer_video";
    recipe = {
        { "homedecor:plastic_sheeting", "default:steel_ingot", "homedecor:ic", },
        { "homedecor:ic", "mycoins:copper_ribbonwire", "homedecor:ic", },
        { "default:gold_ingot", "default:gold_ingot", "default:gold_ingot", },
    };
});

minetest.register_craft({
    output = "mycoins:game_computer_motherboard";
    recipe = {
        { "homedecor:ic", "homedecor:ic", "homedecor:ic", },
        { "default:gold_ingot", "default:goldblock", "mycoins:copper_ribbonwire", },
        { "homedecor:plastic_base", "mycoins:copper_ribbonwire", "default:coalblock", },
    };
});

minetest.register_craft({
    output = "mycoins:game_computer_powersupply";
    recipe = {
        { "mycoins:ribbonwire", "mycoins:ribbonwire", "mycoins:ribbonwire", },
        { "mycoins:copper_ribbonwire", "default:bronzeblock", "mycoins:copper_ribbonwire", },
        { "homedecor:ic", "homedecor:ic", "homedecor:ic", },
    };
});

minetest.register_craft({
    output = "mycoins:game_computer_cpu";
    recipe = {
        { "homedecor:ic", "default:gold_ingot", "homedecor:ic", },
        { "homedecor:ic", "default:diamondblock", "homedecor:ic", },
        { "homedecor:ic", "default:gold_ingot", "homedecor:ic", },
    };
});

minetest.register_craft({
    output = "mycoins:game_computer_soundcard";
    recipe = {
        { "mycoins:copper_ribbonwire", "mycoins:copper_ribbonwire", "mycoins:copper_ribbonwire", },
        { "homedecor:plastic_sheeting", "homedecor:ic", "homedecor:plastic_sheeting", },
        { "default:gold_ingot", "default:gold_ingot", "default:gold_ingot", },
    };
});

minetest.register_craft({
    output = "mycoins:game_computer_harddrive";
    recipe = {
        { "default:gold_ingot", "default:gold_ingot", "default:gold_ingot", },
        { "default:coalblock", "default:bronzeblock", "default:coalblock", },
        { "default:gold_ingot", "default:gold_ingot", "default:gold_ingot", },
    };
});

minetest.register_craft({
    output = "mycoins:game_computer_dvdrom";
    recipe = {
        { "default:steel_ingot", "homedecor:plastic_base", "default:diamond", },
        { "default:coal_lump", "default:steel_ingot", "default:coal_lump", },
        { "default:gold_ingot", "default:bronze_ingot", "default:gold_ingot", },
    };
});

minetest.register_craft({
    output = "mycoins:game_computer_ram";
    recipe = {
        { "mycoins:home_computer_ram", "mycoins:home_computer_ram", },
        { "mycoins:home_computer_ram", "mycoins:home_computer_ram", },
    };
});

-- Alineware Computer

minetest.register_craft({
    output = "mycoins:alien_computer";
    recipe = {
        { "mycoins:alien_computer_powersupply", "mycoins:ribbonwire", "mycoins:alien_computer_cooler", },
        { "mycoins:alien_computer_ram", "mycoins:alien_computer_cpu", "mycoins:game_computer", },
        { "mycoins:alien_computer_soundcard", "mycoins:alien_computer_motherboard", "mycoins:alien_computer_harddrive", },
    };
});

-- CHANGED TenPlus1 (changed mesecons_insulated:insulated_off to default:obsidian_shard, removed Mesecons dependancy)

minetest.register_craft({
    output = "mycoins:alien_computer_video";
    recipe = {
        { "mycoins:home_computer_fan", "mycoins:game_computer_video", "default:obsidian_shard", },
        { "mycoins:home_computer_fan", "mycoins:game_computer_video", "default:obsidian_shard", },
    };
});

minetest.register_craft({
    output = "mycoins:alien_computer_motherboard";
    recipe = {
        { "homedecor:ic", "homedecor:ic", "homedecor:ic", },
        { "default:gold_ingot", "default:diamondblock", "default:gold_ingot", },
        { "homedecor:plastic_base", "mycoins:copper_ribbonwire", "default:coalblock", },
    };
});

minetest.register_craft({
    output = "mycoins:alien_computer_powersupply";
    recipe = {
        { "mycoins:ribbonwire", "mycoins:ribbonwire", "mycoins:ribbonwire", },
        { "default:bronze_ingot", "default:goldblock", "default:bronze_ingot", },
        { "homedecor:ic", "homedecor:ic", "homedecor:ic", },
    };
});

minetest.register_craft({
    output = "mycoins:alien_computer_cpu";
    recipe = {
        { "homedecor:ic", "default:gold_ingot", "homedecor:ic", },
        { "homedecor:ic", "default:mese", "homedecor:ic", },
        { "homedecor:ic", "default:gold_ingot", "homedecor:ic", },
    };
});

minetest.register_craft({
    output = "mycoins:alien_computer_soundcard";
    recipe = {
        { "mycoins:copper_ribbonwire", "mycoins:copper_ribbonwire", "mycoins:copper_ribbonwire", },
        { "homedecor:plastic_sheeting", "default:diamondblock", "homedecor:plastic_sheeting", },
        { "default:gold_ingot", "default:gold_ingot", "default:gold_ingot", },
    };
});

minetest.register_craft({
    output = "mycoins:alien_computer_harddrive";
    recipe = {
        { "homedecor:ic", "default:bronze_ingot", "homedecor:ic", },
        { "homedecor:ic", "default:goldblock", "homedecor:ic", },
        { "homedecor:ic", "mycoins:ribbonwire", "homedecor:ic", },
    };
});

minetest.register_craft({
    output = "mycoins:alien_computer_ram";
    recipe = {
        { "mycoins:game_computer_ram", "mycoins:game_computer_ram", },
    };
});

minetest.register_craft({
    output = "mycoins:alien_computer_cooler";
    recipe = {
        { "default:coal_lump", "default:steelblock", "default:coal_lump", },
        { "homedecor:plastic_base", "bucket:bucket_water", "vessels:glass_bottle", },
        { "homedecor:plastic_base", "homedecor:plastic_base", "homedecor:plastic_base", },
    };
});

-- bitcent

minetest.register_craft({
        output = 'mycoins:bitcent 100',
        recipe = {
                {'', '', 'mycoins:bitcent'},
                {'', '', ''},
                {'', 'mycoins:bitcoin', ''},
        }
})

minetest.register_craft({
        output = 'mycoins:bitcent 25',
        recipe = {
                {'', '', 'mycoins:bitcent'},
                {'', '', ''},
                {'', 'mycoins:bitqu', ''},
        }
})

minetest.register_craft({
        output = 'mycoins:bitcent 10',
        recipe = {
                {'', '', 'mycoins:bitcent'},
                {'', '', ''},
                {'', 'mycoins:bitdi', ''},
        }
})

minetest.register_craft({
        output = 'mycoins:bitcent 5',
        recipe = {
                {'', '', 'mycoins:bitcent'},
                {'', '', ''},
                {'', 'mycoins:bitni', ''},
        }
})


-- bitnickel

minetest.register_craft({
        output = 'mycoins:bitni 20',
        recipe = {
                {'', '', 'mycoins:bitcent'},
                {'', '', ''},
                {'', 'mycoins:bitcoin', ''},
        }
})

minetest.register_craft({
        output = 'mycoins:bitni 5',
        recipe = {
                {'', '', 'mycoins:bitcent'},
                {'', '', ''},
                {'', 'mycoins:bitqu', ''},
        }
})

minetest.register_craft({
        output = 'mycoins:bitni 2',
        recipe = {
                {'', '', 'mycoins:bitcent'},
                {'', '', ''},
                {'', 'mycoins:bitdi', ''},
        }
})

minetest.register_craft({
	output = 'mycoins:bitni',
	recipe = {
		{'', '', 'mycoins:bitcent'},
		{'mycoins:bitcent', 'mycoins:bitcent', ''},
		{'mycoins:bitcent', 'mycoins:bitcent', 'mycoins:bitcent'},
	}
})

-- bitdime

minetest.register_craft({
        output = 'mycoins:bitdi 10',
        recipe = {
                {'', '', 'mycoins:bitcent'},
                {'', '', ''},
                {'', 'mycoins:bitcoin', ''},
        }
})

minetest.register_craft({
	output = 'mycoins:bitdi',
	recipe = {
		{'', '', 'mycoins:bitcent'},
		{'', 'mycoins:bitni', ''},
		{'', 'mycoins:bitni', ''},
	}
})

--bitquarter

minetest.register_craft({
        output = 'mycoins:bitqu 4',
        recipe = {
                {'', '', 'mycoins:bitcent'},
                {'', '', ''},
                {'', 'mycoins:bitcoin', ''},
        }
})

minetest.register_craft({
	output = 'mycoins:bitqu',
	recipe = {
		{'mycoins:bitcent', 'mycoins:bitdi', 'mycoins:bitcent'},
		{'mycoins:bitcent', 'mycoins:bitdi', ''},
		{'mycoins:bitcent', 'mycoins:bitcent', 'mycoins:bitcent'},
	}
})

minetest.register_craft({
	output = 'mycoins:bitqu',
	recipe = {
		{'', 'mycoins:bitni', 'mycoins:bitcent'},
		{'', 'mycoins:bitdi', ''},
		{'', 'mycoins:bitdi', ''},
	}
})

minetest.register_craft({
	output = 'mycoins:bitqu',
	recipe = {
		{'', '', 'mycoins:bitcent'},
		{'mycoins:bitni', 'mycoins:bitni', ''},
		{'mycoins:bitni', 'mycoins:bitni', 'mycoins:bitni'},
	}
})

-- bitcoin

minetest.register_craft({
	output = 'mycoins:bitcoin',
	recipe = {
		{'', '', 'mycoins:bitcent'},
		{'', 'mycoins:bitqu', ''},
		{'mycoins:bitqu', 'mycoins:bitqu', 'mycoins:bitqu'},
	}
})

minetest.register_craft({
    output = "mycoins:router";
    recipe = {
        { "default:steel_ingot", "homedecor:ic", "default:steel_ingot", },
        { "homedecor:ic", "default:mese", "homedecor:ic", },
        { "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", },
    };
});


-- copper wire

minetest.register_craft({
    output = "mycoins:copper_ribbonwire 9";
    recipe = {
        { "default:copper_ingot", "default:copper_ingot", "default:copper_ingot", },
    };
});

minetest.register_craft({
    output = "mycoins:ribbonwire 3";
    recipe = {
        { "dye:red", "dye:green", "dye:yellow", },
        { "mycoins:copper_ribbonwire", "mycoins:copper_ribbonwire", "mycoins:copper_ribbonwire", },
        { "dye:blue", "homedecor:plastic_sheeting", "dye:violet", },
    };
});

-- ISP

minetest.register_craft({
    output = "mycoins:isp";
    recipe = {
        { "mycoins:copper_ribbonwire", "homedecor:ic", "default:clay_lump", },
        { "mycoins:ribbonwire", "homedecor:ic", "mycoins:ribbonwire", },
        { "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", },
    };
});





