dofile(minetest.get_modpath('laptop_pc1')..'/craftrecipes.lua')

laptop.register_hardware("laptop_pc1:4k", {
	description = "4K",
	infotext = '4K',
	sequence = { "closed", "open", "open_on" },
	custom_theme = "Blue",
	hw_capabilities = { 'hdd', 'usb', 'net' },
	node_defs = {
		["open"] = {
			hw_state = "power_off",
			tiles = {
				"pc1_HP_Stream_top_c.png",
				"pc1_HP_Stream_b.png",
				"pc1_HP_Stream_s_o.png",
				"pc1_HP_Stream_s_o.png",
				"pc1_HP_Stream_back_o.png",
				"pc1_HP_Stream_f_off.png",
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			 node_box = {
				type = "fixed",
				fixed = {
					{-0.4, -0.5, -0.3, 0.4, -0.45, 0.3}, --keyboard
					{-0.4, -0.5, 0.3, 0.4, 0.2, 0.3500}, --monitor
				}
			}
		},
		["open_on"] = {
			hw_state = "resume",
			light_source = 4,
			tiles = {
				"pc1_HP_Stream_top_c.png",
				"pc1_HP_Stream_b.png",
				"pc1_HP_Stream_s_o.png",
				"pc1_HP_Stream_s_o.png",
				"pc1_HP_Stream_back_o.png",
				"pc1_HP_Stream_f_on.png",
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.4, -0.5, -0.3, 0.4, -0.45, 0.3}, --keyboard
					{-0.4, -0.5, 0.3, 0.4, 0.2, 0.3500}, --monitor
				  }
				}
			 },
		["closed"] = {
			hw_state = "power_off",
			tiles = {
				"pc1_HP_Stream_top_co.png",
				"pc1_HP_Stream_b.png",
				"pc1_HP_Stream_s.png",
				"pc1_HP_Stream_s.png",
				"pc1_HP_Stream_back.png",
				"pc1_HP_Stream_s.png",
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.4, -0.5, -0.3, 0.4, -0.4, 0.3}, --base
					}
			}
		}
	}
})

laptop.register_hardware("laptop_pc1:amstrum45", {
description = "Amstrum 45",
	infotext = "Amstrum 45",
	sequence = { "off", "on"},
	custom_theme = "Green Shell",
	custom_launcher = "cs-bos_launcher",
	os_version = "3.31",
	hw_capabilities = { "hdd", "floppy", "net", "liveboot" },
	node_defs = {
		["on"] = {
			hw_state = "power_on",
			light_source = 4,
			tiles = {
				"pc1_Amstrad_top.png",
				"pc1_Amstrad_s.png",
				"pc1_Amstrad_s.png",
				"pc1_Amstrad_s.png",
				"pc1_Amstrad_s.png",
				"pc1_Amstrad_f_on.png",
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			 node_box = {
				type = "fixed",
				fixed = {
					{-0.3, -0.5, -0.1, 0.3, -0.4, 0.3}, --base
					{-0.1, -0.4, -0.0, 0.1, -0.2, 0.2}, --base2
				   {-0.4, -0.3, -0.2, 0.4, 0.3, 0.4}, --monitor
					{-0.4, -0.5, -0.5, 0.4, -0.4, -0.2}, --keyboard
					}
				},
		},
		["off"] = {
			hw_state = "power_off",
			tiles = {
				"pc1_Amstrad_top.png",
				"pc1_Amstrad_s.png",
				"pc1_Amstrad_s.png",
				"pc1_Amstrad_s.png",
				"pc1_Amstrad_s.png",
				"pc1_Amstrad_f.png",
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.3, -0.5, -0.1, 0.3, -0.4, 0.3}, --base
					{-0.1, -0.4, -0.0, 0.1, -0.2, 0.2}, --base2
				    {-0.4, -0.3, -0.2, 0.4, 0.3, 0.4}, --monitor
					{-0.4, -0.5, -0.5, 0.4, -0.4, -0.2}, --keyboard
				}
			}
		}
	}
})

laptop.register_hardware("laptop_pc1:os4_5", {
	description = "OS 4.5",
	infotext = "OS 4.5",
	sequence = { "off", "on"},
	custom_theme = "Boing!",
	os_version = "6.33",
	hw_capabilities = { "hdd", "usb", "floppy", "net", "liveboot" },
	node_defs = {
		["on"] = {
			hw_state = "power_on",
			light_source = 4,
			tiles = {
				"pc1_old_school_top.png",
				"pc1_old_school_s.png",
				"pc1_old_school_s.png",
				"pc1_old_school_s.png",
				"pc1_old_school_s.png",
				"pc1_old_school_on.png",
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			 node_box = {
				type = "fixed",
				fixed = {
					{-0.4, -0.5, -0.1, 0.0, -0.4, 0.3}, --base
					{-0.5, -0.4, -0.1, 0.1, 0.1, 0.4}, --base2
					{-0.6, -0.3, -0.2, 0.2, 0.3, 0.2}, --monitor
					{-0.5, -0.5, -0.2, 0.2, -0.4, -0.5}, --keyboard
					{0.30990, -0.5, -0.320, 0.4600, -0.4, -0.5}, --mouse
					{0.1, -0.5, -0.1, 0.6, -0.3, 0.4}, --system
				}
			}
		},
		["off"] = {
			hw_state = "power_off",
			tiles = {
				"pc1_old_school_top.png",
				"pc1_old_school_s.png",
				"pc1_old_school_s.png",
				"pc1_old_school_s.png",
				"pc1_old_school_s.png",
				"pc1_old_school_f.png",
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.4, -0.5, -0.1, 0.0, -0.4, 0.3}, --base
					{-0.5, -0.4, -0.1, 0.1, 0.1, 0.4}, --base2
					{-0.6, -0.3, -0.2, 0.2, 0.3, 0.2}, --monitor
					{-0.5, -0.5, -0.2, 0.2, -0.4, -0.5}, --keyboard
					{0.30990, -0.5, -0.320, 0.4600, -0.4, -0.5}, --mouse
					{0.1, -0.5, -0.1, 0.6, -0.3, 0.4}, --system
				}
			}
		}
	}
})

laptop.register_hardware("laptop_pc1:war5000", {
	description = "WAR 5000",
	infotext = "WAR 5000",
	sequence = { "off", "on"},
	custom_theme = "Amber Shell",
	custom_launcher = "cs-bos_launcher",
	os_version = "1.10",
	hw_capabilities = { "hdd", "floppy", "net", "liveboot" },
	node_defs = {
		["on"] = {
			hw_state = "power_on",
			light_source = 4,
			tiles = {
				"pc1_war_pc_top.png",
				"pc1_war_pc_s.png",
				"pc1_war_pc_s.png",
				"pc1_war_pc_s.png",
				"pc1_war_pc_back.png",
				{name='pc1_war_pc_f_on.png', animation={type='vertical_frames', aspect_w=32, aspect_h=32,length=2}},
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.5, -0.5, -0.1, 0.5, 0.5, 0.5}, --base
					{-0.5, -0.3, -0.5, 0.5, -0.5, 0.5}, --base
				  }
             }
		},
		["off"] = {
			hw_state = "power_off",
			tiles = {
				"pc1_war_pc_top.png",
				"pc1_war_pc_s.png",
				"pc1_war_pc_s.png",
				"pc1_war_pc_s.png",
				"pc1_war_pc_back.png",
				"pc1_war_pc_f_off.png",
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.5, -0.5, -0.1, 0.5, 0.5, 0.5}, --base
					{-0.5, -0.3, -0.5, 0.5, -0.5, 0.5}, --base
				}
			}
		}
	}
})

-- laptop_pc1 v2.0
laptop.register_hardware("laptop_pc1:4k_pink", {
	description = "4K (pink)",
	infotext = "4K (pink)",
	sequence = { "closed", "open", "open_on"},
	custom_theme = "Bubbles",
	hw_capabilities = { "hdd", "usb", "net", "liveboot" },
	node_defs = {
		["closed"] = {
			hw_state = "power_off",
			tiles = {
				"pc1_HP_Stream_top_co_p.png",
				"pc1_HP_Stream_b_p.png",
				"pc1_HP_Stream_s_p.png",
				"pc1_HP_Stream_s_p.png",
				"pc1_HP_Stream_back_p2.png",
				"pc1_HP_Stream_s_p.png",
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.4, -0.5, -0.3, 0.4, -0.4, 0.3}, --base
					}
				}
		},
		["open"] = {
			hw_state = "power_off",
			tiles = {
				"pc1_HP_Stream_top_c_p.png",
				"pc1_HP_Stream_b_p.png",
				"pc1_HP_Stream_back_p.png",
				"pc1_HP_Stream_back_p.png",
				"pc1_HP_Stream_back_o_p.png",
				"pc1_HP_Stream_f_off_p.png",
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			 node_box = {
				type = "fixed",
				fixed = {
					{-0.4, -0.5, -0.3, 0.4, -0.45, 0.3}, --keyboard
					{-0.4, -0.5, 0.3, 0.4, 0.2, 0.3500}, --monitor
				}
			}
		},
		["open_on"] = {
			hw_state = "resume",
			light_source = 4,
			tiles = {
				"pc1_HP_Stream_top_c_p.png",
				"pc1_HP_Stream_b_p.png",
				"pc1_HP_Stream_back_p.png",
				"pc1_HP_Stream_back_p.png",
				"pc1_HP_Stream_back_o_p.png",
				"pc1_HP_Stream_f_on_p.png",
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.4, -0.5, -0.3, 0.4, -0.45, 0.3}, --keyboard
					{-0.4, -0.5, 0.3, 0.4, 0.2, 0.3500}, --monitor
				}
			}
		}
	}
})

laptop.register_hardware("laptop_pc1:minetu", {
	description = "MineTu",
	infotext = "MineTu",
	sequence = { "closed", "open", "open_on"},
	custom_theme = "Snow Pines",
	os_version = "6.33",
	hw_capabilities = { "hdd", "usb", "net", "liveboot" },
	node_defs = {
		["closed"] = {
			hw_state = "power_off",
			tiles = {
				"pc1_l_back.png",
				"pc1_l_back.png",
				"pc1_l_back.png",
				"pc1_l_back.png",
				"pc1_l_back.png",
				"pc1_l_back.png",
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.4, -0.5, -0.3, 0.4, -0.4, 0.3}, --base
					}
				}
		},
		["open"] = {
			hw_state = "power_off",
			tiles = {
				"pc1_l_top_co.png",
				"pc1_l_back.png",
				"pc1_l_back.png",
				"pc1_l_back.png",
				"pc1_l_back.png",
				"pc1_l_f_off.png",
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.4, -0.5, -0.3, 0.4, -0.45, 0.3}, --keyboard
					{-0.4, -0.5, 0.3, 0.4, 0.2, 0.3500}, --monitor
					}
				}
		},
		["open_on"] = {
			hw_state = "resume",
			light_source = 4,
			tiles = {
				"pc1_l_top_co.png",
				"pc1_l_back.png",
				"pc1_l_back.png",
				"pc1_l_back.png",
				"pc1_l_back.png",
				"pc1_l_f_on.png",
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.4, -0.5, -0.3, 0.4, -0.45, 0.3}, --keyboard
					{-0.4, -0.5, 0.3, 0.4, 0.2, 0.3500}, --monitor
				}
			}
		}
	}
})

minetest.register_alias("laptop_pc1:linux_closed", "laptop_pc1:minetu_closed")
minetest.register_alias("laptop_pc1:linux_open", "laptop_pc1:minetu_open")
minetest.register_alias("laptop_pc1:linux_open_on", "laptop_pc1:minetu_open_on")
