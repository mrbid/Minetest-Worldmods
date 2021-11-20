dofile(minetest.get_modpath('laptop_pc2')..'/craftrecipes.lua')

-----BEGIN BELL TOWER-----
laptop.register_hardware("laptop_pc2:bell_tower", {
description = "Bell Tower",
	infotext = "Bell Tower",
	sequence = { "off", "on"},
	os_version = "6.33",
	hw_capabilities = { "hdd", "floppy", "net", "liveboot" },
	node_defs = {
		["on"] = {
			hw_state = "power_on",
			light_source = 4,
			tiles = {
				"bell_redo_top.png",
				"bell_redo_bottom.png",
				"bell_redo_right.png",
				"bell_redo_left.png",
				"bell_redo_back.png",
				"bell_redo_front.png"
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.5, -0.3125, 0, 0.1875, 0.25, 0.0625}, -- NodeBox2
					{-0.4375, -0.25, 0.0625, 0.125, 0.1875, 0.125}, -- NodeBox3
					{-0.25, -0.25, 0.125, -0.0625, -0.1875, 0.25}, -- NodeBox4
					{-0.25, -0.4375, 0.1875, -0.0625, -0.25, 0.25}, -- NodeBox5
					{-0.375, -0.5, -0.0625, 0.0625, -0.4375, 0.375}, -- NodeBox6
					{-0.5, -0.5, -0.4375, 0.1875, -0.4375, -0.1875}, -- NodeBox7
					{0.25, -0.5, -0.4375, 0.375, -0.4375, -0.25}, -- NodeBox8
					{0.25, -0.5, -0.125, 0.4375, 0.125, 0.4375}, -- NodeBox9
				}
			},
		},
		["off"] = {
			hw_state = "power_off",
			tiles = {
				"bell_redo_top.png",
				"bell_redo_bottom.png",
				"bell_redo_right.png",
				"bell_redo_left.png",
				"bell_redo_back.png",
				"bell_redo_front_off.png"
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.5, -0.3125, 0, 0.1875, 0.25, 0.0625}, -- NodeBox2
					{-0.4375, -0.25, 0.0625, 0.125, 0.1875, 0.125}, -- NodeBox3
					{-0.25, -0.25, 0.125, -0.0625, -0.1875, 0.25}, -- NodeBox4
					{-0.25, -0.4375, 0.1875, -0.0625, -0.25, 0.25}, -- NodeBox5
					{-0.375, -0.5, -0.0625, 0.0625, -0.4375, 0.375}, -- NodeBox6
					{-0.5, -0.5, -0.4375, 0.1875, -0.4375, -0.1875}, -- NodeBox7
					{0.25, -0.5, -0.4375, 0.375, -0.4375, -0.25}, -- NodeBox8
					{0.25, -0.5, -0.125, 0.4375, 0.125, 0.4375}, -- NodeBox9
				}
			},
		}
	}
})
-----END BELL TOWER-----

-----BEGIN BENSON DATAWRITTER 48-----
laptop.register_hardware("laptop_pc2:benson_printer", {
	description = "Benson DataWriter 48",
	infotext = 'Benson DataWriter 48',
	sequence = { "off", "on" },
	custom_launcher = "printer_launcher",
	custom_theme = "Green Shell!",
	hw_capabilities = {"hdd"},
	node_defs = {

		["on"] = {
			hw_state = "power_on",
			tiles = {
				"printer_top.png",
				"printer_bottom.png",
				"printer_right.png",
				"printer_left.png",
				"printer_back.png",
				"printer_front_on.png"
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			groups = {choppy=2, oddly_breakably_by_hand=2, dig_immediate = 2, laptop_printer = 1},
			node_box = {
				type = "fixed",
				fixed = {
					{-0.375, -0.5, -0.375, 0.375, -0.3125, 0.375}, -- NodeBox1
					{-0.3125, -0.3125, 0.0625, 0.3125, -0.25, 0.3125}, -- NodeBox2
				}
			       }
			    },
		["off"] = {
			hw_state = "power_off",
			tiles = {
				"printer_top.png",
				"printer_bottom.png",
				"printer_right.png",
				"printer_left.png",
				"printer_back.png",
				"printer_front.png"
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.375, -0.5, -0.375, 0.375, -0.3125, 0.375}, -- NodeBox1
					{-0.3125, -0.3125, 0.0625, 0.3125, -0.25, 0.3125}, -- NodeBox2
				}
			}
		}
	}
})
-----END BENSON DATAWRITTER 48-----

-----BEGIN CUBE C3-----
laptop.register_hardware("laptop_pc2:cube_c3", {
description = "Cube C3",
	infotext = "Cube C3",
	sequence = { "off", "on"},
	os_version = "1.10",
	hw_capabilities = { "hdd", "floppy", "liveboot" },
	node_defs = {
		["on"] = {
			hw_state = "power_on",
			light_source = 4,
			tiles = {
				"cube_top.png",
				"cube_bottom.png",
				"cube_right.png",
				"cube_left.png",
				"cube_back.png",
				"cube_font.png"
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.375, -0.5, -0.125, 0.375, -0.375, 0.375}, -- NodeBox1
					{-0.4375, -0.375, -0.1875, 0.4375, 0.1875, 0.4375}, -- NodeBox2
					{-0.375, -0.5, -0.4375, 0.375, -0.4375, -0.125}, -- NodeBox3
				}
			},
		},
		["off"] = {
			hw_state = "power_off",
			tiles = {
				"cube_top.png",
				"cube_bottom.png",
				"cube_right.png",
				"cube_left.png",
				"cube_back.png",
				"cube_font_off.png"
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.375, -0.5, -0.125, 0.375, -0.375, 0.375}, -- NodeBox1
					{-0.4375, -0.375, -0.1875, 0.4375, 0.1875, 0.4375}, -- NodeBox2
					{-0.375, -0.5, -0.4375, 0.375, -0.4375, -0.125}, -- NodeBox3
				}
			},
		}
	}
})
-----END CUBE C3-----

-----BEGIN FRUIT SPIRIT-----
laptop.register_hardware("laptop_pc2:fruit_spirit", {
	description = "Fruit Spirit",
	infotext = "Fruit Spirit",
	sequence = { "off", "on"},
	hw_capabilities = { "hdd", "usb", "net", "floppy", "liveboot" },
	node_defs = {
		["on"] = {
			hw_state = "resume",
			light_source = 4,
			tiles = {
				"fruit_top.png",
				"fruit_bottom.png",
				"fruit_right.png",
				"fruit_left.png",
				"fruit_back.png",
				"fruit_front.png"
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.125, -0.5, -0.0625, 0.125, -0.4375, 0.4375}, -- NodeBox1
					{-0.125, -0.4375, 0.375, 0.125, -0.25, 0.4375}, -- NodeBox2
					{-0.125, -0.3125, 0.25, 0.125, -0.25, 0.375}, -- NodeBox3
					{-0.4375, -0.375, 0.0625, 0.4375, 0.25, 0.25}, -- NodeBox4
					{-0.4375, -0.5, -0.4375, 0.25, -0.4375, -0.1875}, -- NodeBox5
					{0.3125, -0.5, -0.375, 0.4375, -0.4375, -0.1875}, -- NodeBox6
				}
			}
		},
		["off"] = {
			hw_state = "power_off",
			tiles = {
				"fruit_top.png",
				"fruit_bottom.png",
				"fruit_right.png",
				"fruit_left.png",
				"fruit_back.png",
				"fruit_front_off.png"
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.125, -0.5, -0.0625, 0.125, -0.4375, 0.4375}, -- NodeBox1
					{-0.125, -0.4375, 0.375, 0.125, -0.25, 0.4375}, -- NodeBox2
					{-0.125, -0.3125, 0.25, 0.125, -0.25, 0.375}, -- NodeBox3
					{-0.4375, -0.375, 0.0625, 0.4375, 0.25, 0.25}, -- NodeBox4
					{-0.4375, -0.5, -0.4375, 0.25, -0.4375, -0.1875}, -- NodeBox5
					{0.3125, -0.5, -0.375, 0.4375, -0.4375, -0.1875}, -- NodeBox6
				}
			}
		}
	}
})
-----END FRUIT SPIRIT-----

-----Begin Bell Prime-----
laptop.register_hardware("laptop_pc2:bell_prime", {
	description = "Bell Prime",
	infotext = "Bell Prime",
	sequence = { "off", "on"},
	os_version = "3.31",
	hw_capabilities = { "hdd", "floppy", "liveboot" },
	node_defs = {
		["on"] = {
			hw_state = "power_on",
			light_source = 4,
			tiles = {
				"dell_top.png",
				"dell_bottom.png",
				"dell_right.png",
				"dell_left.png",
				"dell_back.png",
				"dell_front.png"
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.3125, -0.5, -0.4375, 0.3125, -0.4375, -0.25}, -- NodeBox1
					{-0.3125, -0.5, -0.125, 0.3125, -0.3125, 0.4375}, -- NodeBox2
					{-0.1875, -0.3125, 0, 0.1875, -0.25, 0.3125}, -- NodeBox4
					{-0.25, -0.25, -0.0625, 0.25, 0.125, 0.375}, -- NodeBox6
				}
			}
		},
		["off"] = {
			hw_state = "power_off",
			tiles = {
				"dell_top.png",
				"dell_bottom.png",
				"dell_right.png",
				"dell_left.png",
				"dell_back.png",
				"dell_front_off.png"
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.3125, -0.5, -0.4375, 0.3125, -0.4375, -0.25}, -- NodeBox1
					{-0.3125, -0.5, -0.125, 0.3125, -0.3125, 0.4375}, -- NodeBox2
					{-0.1875, -0.3125, 0, 0.1875, -0.25, 0.3125}, -- NodeBox4
					{-0.25, -0.25, -0.0625, 0.25, 0.125, 0.375}, -- NodeBox6
				}
			}
		}
	}
})
----End Bell Prime-----

-----Begin MBI Scholastic-----
laptop.register_hardware("laptop_pc2:mbi_scholastic", {
	description = "MBI Scholastic",
	infotext = 'MBI Scholastic',
	sequence = { "closed", "open", "open_on" },
	os_version = "3.31",
	hw_capabilities = { 'hdd', 'usb', 'floppy', 'net' },
	node_defs = {
		["open"] = {
			hw_state = "power_off",
			tiles = {
				"laptop_top.png",
				"laptop_bottom.png",
				"laptop_right.png",
				"laptop_left.png",
				"laptop_back.png",
				"laptop_front_off.png"
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.375, -0.5, -0.4375, 0.375, -0.4375, 0.125}, -- NodeBox1
					{-0.375, -0.4375, 0.125, 0.375, 0.125, 0.1875}, -- NodeBox2
				}
			}
		},
		["open_on"] = {
			hw_state = "power_on",
			light_source = 4,
			tiles = {
				"laptop_top.png",
				"laptop_bottom.png",
				"laptop_right.png",
				"laptop_left.png",
				"laptop_back.png",
				"laptop_front.png"
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.375, -0.5, -0.4375, 0.375, -0.4375, 0.125}, -- NodeBox1
					{-0.375, -0.4375, 0.125, 0.375, 0.125, 0.1875}, -- NodeBox2
				  }
			       }
			    },
		["closed"] = {
			hw_state = "power_off",
			tiles = {
				"laptop_closed_top.png",
				"laptop_closed_bottom.png",
				"laptop_closed_right.png",
				"laptop_closed_left.png",
				"laptop_closed_back.png",
				"laptop_closed_front.png"
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.375, -0.5, -0.4375, 0.375, -0.375, 0.125}, -- NodeBox1
				}
			}
		}
	}
})
-----End MBI Scholastic-----

-----Begin Regal Writer-----
laptop.register_hardware("laptop_pc2:regal_writer", {
	description = "Regal Writer",
	infotext = 'Regal Writer',
	sequence = { "closed", "open", "open_on" },
	os_version = "1.10",
	hw_capabilities = { "floppy", "liveboot" },
	node_defs = {
		["open"] = {
			hw_state = "power_off",
			tiles = {
				"laptopv2_top.png",
				"laptopv2_bottom.png",
				"laptopv2_right.png",
				"laptopv2_left.png",
				"laptopv2_back.png",
				"laptopv2_front_off.png"
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.3125, -0.5, 0, 0.3125, -0.375, 0.375}, -- NodeBox1
					{-0.3125, -0.5, -0.375, 0.3125, -0.4375, 0}, -- NodeBox2
					{-0.3125, -0.375, -0.0625, 0.3125, 0, 0}, -- NodeBox3
				}
			}
		},
		["open_on"] = {
			hw_state = "power_on",
			light_source = 4,
			tiles = {
				"laptopv2_top.png",
				"laptopv2_bottom.png",
				"laptopv2_right.png",
				"laptopv2_left.png",
				"laptopv2_back.png",
				"laptopv2_front.png"
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.3125, -0.5, 0, 0.3125, -0.375, 0.375}, -- NodeBox1
					{-0.3125, -0.5, -0.375, 0.3125, -0.4375, 0}, -- NodeBox2
					{-0.3125, -0.375, -0.0625, 0.3125, 0, 0}, -- NodeBox3
				  }
			       }
			    },
		["closed"] = {
			hw_state = "power_off",
			tiles = {
				"laptopv2_closed_top.png",
				"laptopv2_closed_bottom.png",
				"laptopv2_closed_right.png",
				"laptopv2_closed_left.png",
				"laptopv2_closed_back.png",
				"laptopv2_closed_front.png"
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.375, -0.5, -0.375, 0.375, -0.375, 0.375}, -- NodeBox1
				}
			}
		}
	}
})
-----End Regal Writer-----
