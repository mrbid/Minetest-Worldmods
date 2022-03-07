-- originally technic cnc improved, with meshes added from mymeshnodes and mymillworks
-- https://github.com/mrbid/Minetest-Worldmods

function S(strin)
    return strin
end

function firstToUpper(str)
	return (str:gsub("^%l", string.upper))
end

function fancy_string(name)
	name = name:gsub(".*:", "")
	name = name:gsub('%W', ' ')
	name = name:gsub("(%l)(%w*)", function(a,b) return string.upper(a)..b end)
	return name
end

minetest.register_chatcommand("nodes", {
	description = "Sums the total amount of nodes registered.",
	func=function(name)
		local icount, ncount = 0, 0;
		for _, _ in pairs(minetest.registered_items) do
			icount = icount + 1
		end
			
		for _, _ in pairs(minetest.registered_nodes) do
			ncount = ncount + 1
		end
		
		minetest.chat_send_player(name, "Items: "..tostring(icount).." / Nodes: "..tostring(ncount))
	end,
})

workbench_defs = {
	-- Name YieldX  YZ  WH  L
	{"nanoslab",	16, { 0, 0,  0, 8,  1, 8  }},
	{"micropanel",	16, { 0, 0,  0, 16, 1, 8  }},
	-- {"microslab",	8,  { 0, 0,  0, 16, 1, 16 }},
	{"thinstair",	8,  { 0, 7,  0, 16, 1, 8  },
			 { 0, 15, 8, 16, 1, 8  }},
	{"cube", 	4,  { 0, 0,  0, 8,  8, 8  }},
	{"panel",	4,  { 0, 0,  0, 16, 8, 8  }},
	{"doublepanel", 2,  { 0, 0,  0, 16, 8, 8  },
			 { 0, 8,  8, 16, 8, 8  }},
	{"halfstair",	2,  { 0, 0,  0, 8,  8, 16 },
			 { 0, 8,  8, 8,  8, 8  }},
}

function xdecor_pixelbox(size, boxes)
	local fixed = {}
	for _, box in ipairs(boxes) do
		-- `unpack` has been changed to `table.unpack` in newest Lua versions.
		local x, y, z, w, h, l = unpack(box)
		fixed[#fixed + 1] = {
			(x / size) - 0.5,
			(y / size) - 0.5,
			(z / size) - 0.5,
			((x + w) / size) - 0.5,
			((y + h) / size) - 0.5,
			((z + l) / size) - 0.5
		}
	end

	return {type = "fixed", fixed = fixed}
end

-- facade node_boxes
local box_collison = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	},
}

local fa_bannerstone = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		{-0.5, 0.25, -0.5625, 0.5, 0.375, -0.5},
		{-0.5, -0.375, -0.5625, 0.5, -0.25, -0.5},
	},
}

local fa_bannerstone_corner = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		{-0.5625, 0.25, -0.5625, 0.5625, 0.375, 0.5625},
		{-0.5625, -0.375, -0.5625, 0.5625, -0.25, 0.5625},
	},
}

local fa_centerstone = {
	type = "fixed",
	fixed = {
		{-0.4375, -0.4375, -0.4375, 0.4375, 0.4375, 0.4375},
		{-0.5, -0.25, 0.0625, 0.5, 0.25, 0.25},
		{-0.5, -0.25, -0.25, 0.5, 0.25, -0.0625},
		{-0.25, -0.25, -0.5, -0.0625, 0.25, 0.5},
		{0.0625, -0.25, -0.5, 0.25, 0.25, 0.5},
		{-0.5, 0.0625, -0.25, 0.5, 0.25, 0.25},
		{-0.5, -0.25, -0.25, 0.5, -0.0625, 0.25},
		{-0.25, -0.25, -0.5, 0.25, -0.0625, 0.5},
		{-0.25, 0.0625, -0.5, 0.25, 0.25, 0.5},
		{-0.25, -0.5, -0.25, 0.25, 0.5, -0.0625},
		{-0.25, -0.5, 0.0625, 0.25, 0.5, 0.25},
		{0.0625, -0.5, -0.1875, 0.25, 0.5, 0.1875},
		{-0.25, -0.5, -0.1875, -0.0625, 0.5, 0.1875},
		{-0.5, 0.3125, 0.3125, 0.5, 0.5, 0.5},
		{-0.5, 0.3125, -0.5, 0.5, 0.5, -0.3125},
		{0.3125, 0.3125, -0.5, 0.5, 0.5, 0.5},
		{-0.5, 0.3125, -0.5, -0.3125, 0.5, 0.5},
		{-0.5, -0.5, -0.5, -0.3125, -0.3125, 0.5},
		{0.3125, -0.5, -0.5, 0.5, -0.3125, 0.5},
		{-0.5, -0.5, -0.5, 0.5, -0.3125, -0.3125},
		{-0.5, -0.5, 0.3125, 0.5, -0.3125, 0.5},
		{0.3125, -0.5, -0.5, 0.5, 0.5, -0.3125},
		{0.3125, -0.5, 0.3125, 0.5, 0.5, 0.5},
		{-0.5, -0.5, 0.3125, -0.3125, 0.5, 0.5},
		{-0.5, -0.5, -0.5, -0.3125, 0.5, -0.3125},
	},
}

local fa_column = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, -0.4375, 0.5, 0.5, 0.4375},
		{-0.5, -0.5, -0.5, -0.3125, 0.5, 0.5},
		{0.3125, -0.5, -0.5, 0.5, 0.5, 0.5},
		{0.0625, -0.5, -0.5, 0.1875, 0.5, 0.5},
		{-0.1875, -0.5, -0.5, -0.0625, 0.5, 0.5},
	},
}

local fa_column_corner = {
	type = "fixed",
	fixed = {
		{-0.4375, -0.5, -0.4375, 0.4375, 0.5, 0.4375},
		{-0.5, -0.5, 0.3125, -0.3125, 0.5, 0.5},
		{0.3125, -0.5, -0.5, 0.5, 0.5, -0.3125},
		{0.0625, -0.5, -0.5, 0.1875, 0.5, 0.5},
		{-0.1875, -0.5, -0.5, -0.0625, 0.5, 0.5},
		{0.3125, -0.5, 0.3125, 0.5, 0.5, 0.5},
		{-0.5, -0.5, -0.5, -0.3125, 0.5, -0.3125},
		{-0.5, -0.5, 0.0625, 0.5, 0.5, 0.1875},
		{-0.5, -0.5, -0.1875, 0.5, 0.5, -0.0625},
	},
}

local fa_corbel = {
	type = "fixed",
	fixed = {
		{-0.5, 0, -0.5, 0.5, 0.5, 0.5},
		{-0.5, -0.5, 0, 0.5, 0.5, 0.5},
		{-0.1875, -0.3125, -0.3125, 0.1875, 0.5, 0},
	},
}

local fa_corbel_corner = {
	type = "fixed",
	fixed = {
		{-0.5, 0, -0.5, 0.5, 0.5, 0.5},
		{-0.5, -0.5, 0, 0, 0.5, 0.5},
		{0, -0.3125, -0.3125, 0.3125, 0.5, 0},
	},
}

local fa_corbel_corner_inner = {
	type = "fixed",
	fixed = {
		{-0.5, 0, -0.5, 0.5, 0.5, 0.5},
		{-0.5, -0.5, 0, 0.5, 0.5, 0.5},
		{0, -0.3125, -0.3125, 0.3125, 0.5, 0},
		{-0.5, -0.5, -0.5, 0, 0.5, 0.5},
	},
}

local fa_carved_stone_a = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, -0.4375, 0.5, 0.5, 0.5},
		{-0.5, 0.4375, -0.5, 0.5, 0.5, -0.4375},
		{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
		{-0.4375, -0.375, -0.5, -0.3125, 0.375, -0.4375},
		{-0.5, -0.375, -0.5, -0.3125, -0.25, 0.5},
		{-0.4375, 0.25, -0.5, 0.4375, 0.375, 0.5},
		{0.3125, -0.125, -0.5, 0.4375, 0.25, 0.5},
		{-0.1875, -0.375, -0.5, 0.5, -0.25, 0.5},
		{-0.1875, -0.25, -0.5, -0.0625, 0.125, 0.5},
		{0.0625, -0.125, -0.5, 0.3125, 0, 0.5},
		{-0.0625, 0, -0.5, 0.1875, 0.125, 0.5},
	},
}

local fa_carved_stone_a_corner = {
	type = "fixed",
	fixed = {
		{-0.4375, -0.5, -0.4375, 0.5, 0.5, 0.5},
		{-0.5, 0.4375, -0.5, 0.5, 0.5, -0.4375},
		{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
		{-0.4375, -0.375, -0.5, -0.3125, 0.375, -0.4375},
		{-0.5, -0.375, -0.5, -0.3125, -0.25, 0.1875},
		{-0.4375, 0.25, -0.5, 0.4375, 0.375, 0.5},
		{0.3125, -0.125, -0.5, 0.4375, 0.25, 0.5},
		{-0.1875, -0.375, -0.5, 0.5, -0.25, 0.5},
		{-0.1875, -0.25, -0.5, -0.0625, 0.125, 0.5},
		{0.0625, -0.125, -0.5, 0.3125, 0, 0.5},
		{-0.0625, 0, -0.5, 0.1875, 0.125, 0.5},
		{-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
		{-0.5, -0.125, -0.4375, 0.5, 0.375, -0.3125},
		{-0.5, 0.25, -0.3125, 0.5, 0.375, 0.4375},
		{-0.5, -0.375, 0.3125, 0.4375, 0.375, 0.4375},
		{-0.5, -0.375, 0.3125, 0.4375, -0.25, 0.5},
		{-0.5, -0.125, -0.3125, 0.4375, 0, -0.0625},
		{-0.5, 0, -0.1875, 0.4375, 0.125, 0.1875},
		{-0.5, -0.25, 0.0625, 0.4375, 0.125, 0.1875},
	},
}

local fa_rgspro = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, 0.375, 0.5, -0.3125, 0.5},
		{-0.5, -0.3125, 0.25, 0.5, -0.125, 0.5},
		{-0.5, -0.125, 0.125, 0.5, 0.5, 0.5},
	},
}

local fa_rgspro_inner_corner = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, 0.375, 0.5, -0.3125, 0.5},
		{-0.5, -0.3125, 0.25, 0.5, -0.125, 0.5},
		{-0.5, -0.125, 0.125, 0.5, 0.5, 0.5},
		{0.375, -0.5, -0.5, 0.5, -0.3125, 0.375},
		{0.25, -0.3125, -0.5, 0.5, -0.0625, 0.25},
		{0.125, -0.125, -0.5, 0.5, 0.5, 0.125},
	},
}

local fa_rgspro_outer_corner = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, 0.375, 0.5, -0.3125, 0.5},
		{-0.5, -0.3125, 0.25, 0.5, -0.0625, 0.5},
		{-0.5, -0.125, 0.125, 0.5, 0.5, 0.5},
		{-0.625, -0.5, 0.375, -0.5, -0.3125, 1.5},
		{-0.75, -0.3125, 0.25, -0.5, -0.125, 1.5},
		{-0.875, -0.125, 0.125, -0.5, 0.5, 1.5},
	},
}

local fa_corner_bricks = {
	type = "fixed",
	fixed = {
		{-0.5625, -0.5, 0.4375, -0.5, 0, 1},
		{-0.5, -0.5, 0.4375, 0, 0, 0.5},
		{-0.5625, 0, 0.5, -0.5, 0.5, 1.5},
		{-0.5625, 0, 0.4375, 0.5, 0.5, 0.5},
	},
}

local fa_columnia_bottom = {
	type = "fixed",
	fixed = {
		{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
		{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
		{-0.375, -0.5, -0.375, 0.375, 0, 0.375},
	},
}

local fa_columnia_crosslink = {
	type = "fixed",
	fixed = {
		{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
		{-0.5, 0, -0.25, 0.5, 0.5, 0.25},
		{-0.25, 0, -0.5, 0.25, 0.5, 0.5},
		{-0.4375, 0.0625, -0.4375, 0.4375, 0.4375, 0.4375},
	},
}

local fa_columnia_link = {
	type = "fixed",
	fixed = {
		{-0.25, 0, -0.5, 0.25, 0.5, 0.5},
	},
}

local fa_columnia_linkdown = {
	type = "fixed",
	fixed = {
		{-0.25, 0, -0.5, 0.25, 0.5, 0.5},
		{-0.125, -0.5, -0.125, 0.125, 0, 0.125},
		{-0.1875, -0.5, -0.1875, 0.1875, -0.375, 0.1875},
		{-0.1875, -0.125, -0.1875, 0.1875, 0, 0.1875},
	},
}

-- mychisel node_boxes

local vert1 = {
	type = "fixed",
	fixed = {
			{-0.5, -0.5, -0.4375, 0.5, 0.5, 0.5}, 
			{0.1875, -0.5, -0.5, 0.5, 0.5, 0.5}, 
			{-0.5, -0.5, -0.5, -0.1875, 0.5, 0.5}, 
		}
	}

local vert2 = {
	type = "fixed",
	fixed = {
			{-0.5, -0.5, -0.375, 0.5, 0.5, 0.5},
			{0.1875, -0.5, -0.5, 0.5, 0.5, 0.5}, 
			{-0.5, -0.5, -0.5, -0.1875, 0.5, 0.5}, 
		}
	}

local vert3 = {
	type = "fixed",
	fixed = {
			{-0.5, -0.5, -0.3125, 0.5, 0.5, 0.5}, 
			{0.1875, -0.5, -0.5, 0.5, 0.5, 0.5}, 
			{-0.5, -0.5, -0.5, -0.1875, 0.5, 0.5}, 
		}
	}

local vert4 = {
	type = "fixed",
	fixed = {
			{-0.5, -0.5, -0.25, 0.5, 0.5, 0.5},
			{0.1875, -0.5, -0.5, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, -0.1875, 0.5, 0.5}, 
		}
	}

local hori1 = {
	type = "fixed",
	fixed = {
			{-0.5, -0.5, -0.4375, 0.5, 0.5, 0.5},
			{-0.5, 0.1875, -0.5, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, 0.5, -0.1875, 0.5},   
		}
	}

local hori2 = {
	type = "fixed",
	fixed = {
			{-0.5, -0.5, -0.375, 0.5, 0.5, 0.5},
			{-0.5, 0.1875, -0.5, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, 0.5, -0.1875, 0.5},  
		}
	}

local hori3 = {
	type = "fixed",
	fixed = {
			{-0.5, -0.5, -0.3125, 0.5, 0.5, 0.5}, 
			{-0.5, 0.1875, -0.5, 0.5, 0.5, 0.5}, 
			{-0.5, -0.5, -0.5, 0.5, -0.1875, 0.5},  
		}
	}

local hori4 = {
	type = "fixed",
	fixed = {
			{-0.5, -0.5, -0.25, 0.5, 0.5, 0.5}, 
			{-0.5, 0.1875, -0.5, 0.5, 0.5, 0.5}, 
			{-0.5, -0.5, -0.5, 0.5, -0.1875, 0.5}, 
		}
	}

local cross1 = {
	type = "fixed",
	fixed = {
			{-0.5, -0.5, -0.4375, 0.5, 0.5, 0.5},
			{0.1875, -0.5, -0.5, 0.5, -0.1875, 0.5},
			{-0.5, -0.5, -0.5, -0.1875, -0.1875, 0.5},
			{-0.5, 0.1875, -0.5, -0.1875, 0.5, 0.5}, 
			{0.1875, 0.1875, -0.5, 0.5, 0.5, 0.5},
		}
	}

local cross2 = {
	type = "fixed",
	fixed = {
			{-0.5, -0.5, -0.375, 0.5, 0.5, 0.5},
			{0.1875, -0.5, -0.5, 0.5, -0.1875, 0.5}, 
			{-0.5, -0.5, -0.5, -0.1875, -0.1875, 0.5}, 
			{-0.5, 0.1875, -0.5, -0.1875, 0.5, 0.5},
			{0.1875, 0.1875, -0.5, 0.5, 0.5, 0.5},  
		}
	}

local cross3 = {
	type = "fixed",
	fixed = {
			{-0.5, -0.5, -0.3125, 0.5, 0.5, 0.5},
			{0.1875, -0.5, -0.5, 0.5, -0.1875, 0.5},
			{-0.5, -0.5, -0.5, -0.1875, -0.1875, 0.5}, 
			{-0.5, 0.1875, -0.5, -0.1875, 0.5, 0.5},
			{0.1875, 0.1875, -0.5, 0.5, 0.5, 0.5}, 
		}
	}

local cross4 = {
	type = "fixed",
	fixed = {
			{-0.5, -0.5, -0.25, 0.5, 0.5, 0.5},
			{0.1875, -0.5, -0.5, 0.5, -0.1875, 0.5}, 
			{-0.5, -0.5, -0.5, -0.1875, -0.1875, 0.5}, 
			{-0.5, 0.1875, -0.5, -0.1875, 0.5, 0.5}, 
			{0.1875, 0.1875, -0.5, 0.5, 0.5, 0.5},
		}
	}

local chis1 = {
	type = "fixed",
	fixed = {
			{-0.5, -0.5, -0.4375, 0.5, 0.5, 0.5},
			{-0.4375, -0.4375, -0.5, 0.4375, 0.4375, 0.5},
		}
	}

local chis2 = {
	type = "fixed",
	fixed = {
			{-0.5, -0.5, -0.375, 0.5, 0.5, 0.5}, 
			{-0.375, -0.375, -0.5, 0.375, 0.375, 0.5}, 
			{-0.4375, -0.4375, -0.4375, 0.4375, 0.4375, 0.5},
		}
	}

local chis3 = {
	type = "fixed",
	fixed = {
			{-0.5, -0.5, -0.3125, 0.5, 0.5, 0.5}, 
			{-0.375, -0.375, -0.4375, 0.375, 0.375, 0.5},
			{-0.4375, -0.4375, -0.375, 0.4375, 0.4375, 0.5},
			{-0.3125, -0.3125, -0.5, 0.3125, 0.3125, 0.5},
		}
	}

local chis4 = {
	type = "fixed",
	fixed = {
			{-0.5, -0.5, -0.25, 0.5, 0.5, 0.5}, 
			{-0.375, -0.375, -0.375, 0.375, 0.375, 0.5},
			{-0.4375, -0.4375, -0.3125, 0.4375, 0.4375, 0.5}, 
			{-0.3125, -0.3125, -0.4375, 0.3125, 0.3125, 0.5}, 
			{-0.25, -0.25, -0.5, 0.25, 0.25, 0.5},
		}
	}

local squar1 = {
	type = "fixed",
	fixed = {
			{-0.5, -0.5, -0.4375, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, -0.3125, 0.5, -0.4375},
			{0.3125, -0.5, -0.5, 0.5, 0.5, -0.4375},
			{-0.5, -0.5, -0.5, 0.5, -0.3125, -0.4375},
			{-0.5, 0.3125, -0.5, 0.5, 0.5, -0.4375}, 
		}
	}

local squar2 = {
	type = "fixed",
	fixed = {
			{-0.5, -0.5, -0.375, 0.5, 0.5, 0.5}, 
			{-0.5, -0.5, -0.5, -0.3125, 0.5, -0.375},
			{0.3125, -0.5, -0.5, 0.5, 0.5, -0.375},
			{-0.5, -0.5, -0.5, 0.5, -0.3125, -0.375},
			{-0.5, 0.3125, -0.5, 0.5, 0.5, -0.375},
		}
	}

local squar3 = {
	type = "fixed",
	fixed = {
			{-0.5, -0.5, -0.3125, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, -0.3125, 0.5, -0.3125},
			{0.3125, -0.5, -0.5, 0.5, 0.5, -0.3125},
			{-0.5, -0.5, -0.5, 0.5, -0.3125, -0.3125},
			{-0.5, 0.3125, -0.5, 0.5, 0.5, -0.3125},
		}
	}

local squar4 = {
	type = "fixed",
	fixed = {
			{-0.5, -0.5, -0.25, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, -0.3125, 0.5, -0.25},
			{0.3125, -0.5, -0.5, 0.5, 0.5, -0.25},
			{-0.5, -0.5, -0.5, 0.5, -0.3125, -0.25},
			{-0.5, 0.3125, -0.5, 0.5, 0.5, -0.25},
		}
	}

-- Define slope boxes for the various nodes
-------------------------------------------
programs = {
-- mymillwork
	{ suffix = "crownmould",
	model  = "mymillwork_mach1.obj",
	desc  = "Crown Mould",
	sbox   = { type = "fixed",
			fixed = {{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
						{-0.5, -0.375, 0.125, 0.5, -0.125, 0.375},
						{-0.5, -0.375, 0.375, 0.5, 0.5, 0.5},
			}
	},
	cbox   = { type = "fixed",
			fixed = {{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
						{-0.5, -0.375, 0.125, 0.5, -0.125, 0.375},
						{-0.5, -0.375, 0.375, 0.5, 0.5, 0.5},
			}
	},
	},

	{ suffix = "crownmould_ic",
	model  = "mymillwork_mach2.obj",
	desc  = "Crown Mould IC",
	sbox   = { type = "fixed",
			fixed = {{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
						{-0.5, -0.375, 0.125, 0.375, -0.125, 0.375},
						{0.125, -0.375, -0.5, 0.375, -0.125, 0.125},
						{-0.5, -0.375, 0.375, 0.5, 0.5, 0.5},
						{0.375, -0.375, -0.5, 0.5, 0.5, 0.375},
			}
	},
	cbox   = { type = "fixed",
			fixed = {{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
						{-0.5, -0.375, 0.125, 0.375, -0.125, 0.375},
						{0.125, -0.375, -0.5, 0.375, -0.125, 0.125},
						{-0.5, -0.375, 0.375, 0.5, 0.5, 0.5},
						{0.375, -0.375, -0.5, 0.5, 0.5, 0.375},
			}
	},
	},

	{ suffix = "crownmould_oc",
	model  = "mymillwork_mach3.obj",
	desc  = "Crown Mould OC",
	sbox   = { type = "fixed",
			fixed = {{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
						{-0.5, -0.375, 0.125, -0.125, -0.125, 0.5},
						{-0.5, -0.125, 0.375, -0.375, 0.5, 0.5},
			}
	},
	cbox   = { type = "fixed",
			fixed = {{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
						{-0.5, -0.375, 0.125, -0.125, -0.125, 0.5},
						{-0.5, -0.125, 0.375, -0.375, 0.5, 0.5},
			}
	},
	},

	{ suffix = "crownmould_beam",
	model  = "mymillwork_mach4.obj",
	desc  = "Crown Mould with Beam",
	sbox   = { type = "fixed",
			fixed = {{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
						{-0.5, -0.375, 0.125, 0.5, -0.125, 0.375},
						{-0.25, -0.375, -0.5, 0.25, -0.1875, 0.125},
						{-0.5, -0.375, 0.375, 0.5, 0.5, 0.5},
			}
	},
	cbox   = { type = "fixed",
			fixed = {{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
						{-0.5, -0.375, 0.125, 0.5, -0.125, 0.375},
						{-0.25, -0.375, -0.5, 0.25, -0.1875, 0.125},
						{-0.5, -0.375, 0.375, 0.5, 0.5, 0.5},
			}
	},
	},

	-- { suffix = "column",
	-- model  = "mymillwork_mach5.obj",
	-- desc  = "Column",
	-- sbox   = { type = "fixed",
	-- 		fixed = {{-0.5,-0.5,-0.5,0.5,0.5,0.5},
	-- 		}
	-- },
	-- cbox   = { type = "fixed",
	-- 		fixed = {{-0.5,-0.5,-0.5,0.5,0.5,0.5},
	-- 		}
	-- },
	-- },

	{ suffix = "column_base",
	model  = "mymillwork_mach6.obj",
	desc  = "Column Base",
	sbox   = { type = "fixed",
			fixed = {{-0.5,-0.5,-0.5,0.5,0.5,0.5},
			}
	},
	cbox   = { type = "fixed",
			fixed = {{-0.5,-0.5,-0.5,0.5,0.5,0.5},
			}
	},
	},

	{ suffix = "column_half",
	model  = "mymillwork_mach7.obj",
	desc  = "Half Column",
	sbox   = { type = "fixed",
			fixed = {{-0.5,-0.5,0.0,0.5,0.5,0.5},
			}
	},
	cbox   = { type = "fixed",
			fixed = {{-0.5,-0.5,0.0,0.5,0.5,0.5},
			}
	},
	},

	{ suffix = "column_half_base",
	model  = "mymillwork_mach8.obj",
	desc  = "Half Column Base",
	sbox   = { type = "fixed",
			fixed = {{-0.5,-0.5,0.0,0.5,0.5,0.5},
			}
	},
	cbox   = { type = "fixed",
			fixed = {{-0.5,-0.5,0.0,0.5,0.5,0.5},
			}
	},
	},

	{ suffix = "column_half_wbeam",
	model  = "mymillwork_mach9.obj",
	desc  = "Half Column Base With Beam",
	sbox   = { type = "fixed",
			fixed = {{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
						{-0.5, -0.375, 0.0, 0.5, 0.5, 0.5},
						{-0.25, -0.375, -0.5, 0.25, -0.1875, 0.0},
			}
	},
	cbox   = { type = "fixed",
			fixed = {{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
						{-0.5, -0.375, 0.0, 0.5, 0.5, 0.5},
						{-0.25, -0.375, -0.5, 0.25, -0.1875, 0.0},
			}
	},
	},

	{ suffix = "column_quarter",
	model  = "mymillwork_mach10.obj",
	desc  = "Quarter Column",
	sbox   = { type = "fixed",
			fixed = {{-0.5,-0.5,0,0,0.5,0.5},
			}
	},
	cbox   = { type = "fixed",
			fixed = {{-0.5,-0.5,0,0,0.5,0.5},
			}
	},
	},

	{ suffix = "column_quarter_base",
	model  = "mymillwork_mach11.obj",
	desc  = "Quarter Column Base",
	sbox   = { type = "fixed",
			fixed = {{-0.5,-0.5,0,0,0.5,0.5},
			}
	},
	cbox   = { type = "fixed",
			fixed = {{-0.5,-0.5,0,0,0.5,0.5},
			}
	},
	},

	{ suffix = "column_quarter_wbase",
	model  = "mymillwork_mach12.obj",
	desc  = "Quarter Column Base Baseboard",
	sbox   = { type = "fixed",
			fixed = {{-0.5,-0.5,0,0,0.5,0.5},
						{0.0, -0.5, 0.4375, 0.5, -0.1875, 0.5},
						{-0.5, -0.5, -0.5, -0.4375, -0.1875, 0.0},
			}
	},
	cbox   = { type = "fixed",
			fixed = {{-0.5,-0.5,0,0,0.5,0.5},
						{0.0, -0.5, 0.4375, 0.5, -0.1875, 0.5},
						{-0.5, -0.5, -0.5, -0.4375, -0.1875, 0.0},
			}
	},
	},

	{ suffix = "column_quarter_fancybase",
	model  = "mymillwork_mach13.obj",
	desc  = "Quarter Column Base Fancy Baseboard",
	sbox   = { type = "fixed",
			fixed = {{-0.5,-0.5,0,0,0.5,0.5},
						{0.0, -0.5, 0.3125, 0.5, 0.1875, 0.5},
						{-0.5, -0.5, -0.5, -0.3125, 0.1875, 0.0},
			}
	},
	cbox   = { type = "fixed",
			fixed = {{-0.5,-0.5,0,0,0.5,0.5},
						{0.0, -0.5, 0.3125, 0.5, 0.1875, 0.5},
						{-0.5, -0.5, -0.5, -0.3125, 0.1875, 0.0},
			}
	},
	},

	{ suffix = "ceiling",
	model  = "mymillwork_mach14.obj",
	desc  = "Ceiling",
	sbox   = { type = "fixed",
			fixed = {{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			}
	},
	cbox   = { type = "fixed",
			fixed = {{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			}
	},
	},

	{ suffix = "ceiling_post",
	model  = "mymillwork_mach15.obj",
	desc  = "Ceiling with Post",
	sbox   = { type = "fixed",
			fixed = {{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
						{-0.125, -0.4375, -0.125, 0.125, 0.5, 0.125},
			}
	},
	cbox   = { type = "fixed",
			fixed = {{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
						{-0.125, -0.4375, -0.125, 0.125, 0.5, 0.125},
			}
	},
	},

	{ suffix = "beam",
	model  = "mymillwork_mach16.obj",
	desc  = "Beam",
	sbox   = { type = "fixed",
			fixed = {{-0.25, -0.5, -0.5, 0.25, -0.1875, 0.5},
			}
	},
	cbox   = { type = "fixed",
			fixed = {{-0.25, -0.5, -0.5, 0.25, -0.1875, 0.5},
			}
	},
	},

	{ suffix = "beam_t",
	model  = "mymillwork_mach17.obj",
	desc  = "Beam T",
	sbox   = { type = "fixed",
			fixed = {{-0.5, -0.5, -0.25, -0.25, -0.1875, 0.25},
						{-0.25, -0.5, -0.5, 0.25, -0.1875, 0.5},
						{0.25, -0.5, -0.25, 0.5, -0.1875, 0.25},
			}
	},
	cbox   = { type = "fixed",
			fixed = {{-0.5, -0.5, -0.25, -0.25, -0.1875, 0.25},
						{-0.25, -0.5, -0.5, 0.25, -0.1875, 0.5},
						{0.25, -0.5, -0.25, 0.5, -0.1875, 0.25},
			}
	},
	},

	{ suffix = "beam_ceiling_t",
	model  = "mymillwork_mach18.obj",
	desc  = "Ceiling with Beam T",
	sbox   = { type = "fixed",
			fixed = {{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
						{-0.5, -0.4375, -0.25, -0.25, -0.1875, 0.25},
						{-0.25, -0.4375, -0.5, 0.25, -0.1875, 0.5},
						{0.25, -0.4375, -0.25, 0.5, -0.1875, 0.25},
			}
	},
	cbox   = { type = "fixed",
			fixed = {{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
						{-0.5, -0.4375, -0.25, -0.25, -0.1875, 0.25},
						{-0.25, -0.4375, -0.5, 0.25, -0.1875, 0.5},
						{0.25, -0.4375, -0.25, 0.5, -0.1875, 0.25},
			}
	},
	},

	{ suffix = "base",
	model  = "mymillwork_mach19.obj",
	desc  = "Baseboard",
	sbox   = { type = "fixed",
			fixed = {{-0.5, -0.5, 0.4375, 0.5, -0.1875, 0.5},
			}
	},
	cbox   = { type = "fixed",
			fixed = {{-0.5, -0.5, 0.4375, 0.5, -0.1875, 0.5},
			}
	},
	},

	{ suffix = "base_ic",
	model  = "mymillwork_mach20.obj",
	desc  = "Baseboard IC",
	sbox   = { type = "fixed",
			fixed = {{-0.5, -0.5, 0.4375, 0.5, -0.1875, 0.5},
						{-0.5, -0.5, -0.5, -0.4375, -0.1875, 0.4375},
			}
	},
	cbox   = { type = "fixed",
			fixed = {{-0.5, -0.5, 0.4375, 0.5, -0.1875, 0.5},
			}
	},
	},

	-- { suffix = "base_oc",
	-- model  = "mymillwork_mach21.obj",
	-- desc  = "Baseboard OC",
	-- sbox   = { type = "fixed",
	-- 		fixed = {{0.4375, -0.5, 0.4375, 0.5, -0.1875, 0.5},
	-- 		}
	-- },
	-- cbox   = { type = "fixed",
	-- 		fixed = {{-0.5, -0.5, 0.4375, 0.5, -0.1875, 0.5},
	-- 		}
	-- },
	-- },

	{ suffix = "base_fancy",
	model  = "mymillwork_mach22.obj",
	desc  = "Fancy Baseboard",
	sbox   = { type = "fixed",
			fixed = {{-0.5, -0.5, 0.3125, 0.5, 0.1875, 0.5},
			}
	},
	cbox   = { type = "fixed",
			fixed = {{-0.5, -0.5, 0.3125, 0.5, 0.1875, 0.5},
			}
	},
	},

	{ suffix = "base_fancy_ic",
	model  = "mymillwork_mach23.obj",
	desc  = "Fancy Baseboard IC",
	sbox   = { type = "fixed",
			fixed = {{-0.5, -0.5, 0.3125, 0.5, 0.1875, 0.5},
						{-0.5, -0.5, -0.5, -0.3125, 0.1875, 0.3125},
			}
	},
	cbox   = { type = "fixed",
			fixed = {{-0.5, -0.5, 0.3125, 0.5, 0.1875, 0.5},
						{-0.5, -0.5, -0.5, -0.3125, 0.1875, 0.3125},
			}
	},
	},

	-- { suffix = "base_fancy_oc",
	-- model  = "mymillwork_mach24.obj",
	-- desc  = "Fancy Baseboard OC",
	-- sbox   = { type = "fixed",
	-- 		fixed = {{0.3125, -0.5, 0.3125, 0.5, 0.1875, 0.5},
	-- 		}
	-- },
	-- cbox   = { type = "fixed",
	-- 		fixed = {{0.3125, -0.5, 0.3125, 0.5, 0.1875, 0.5},
	-- 		}
	-- },
	-- },

-- mymeshnodes
	{ suffix  = "mmn_circle",
		model = "mymeshnodes_circle.obj",
		desc  = S("Circle"),
		cbox  = {
			type = "fixed",
			fixed = {
				{ -1/2,  -1/2, -1/2, 1/2,  -2/5, 1/2 },
			}
		}
	},

	{ suffix  = "mmn_cone",
		model = "mymeshnodes_cone.obj",
		desc  = S("Cone")
	},

	{ suffix  = "mmn_octagon",
		model = "mymeshnodes_oct.obj",
		desc  = S("Octagon")
	},

	{ suffix  = "mmn_pole",
		model = "mymeshnodes_pole.obj",
		desc  = S("Pole"),
		cbox  = {
			type = "fixed",
			fixed = {
				{-0.15, -0.5, -0.15, 0.15, 0.5, 0.15},
			}
		}
	},


-- technic cnc
	{ suffix  = "cnc_stick",
		model = {-0.15, -0.5, -0.15, 0.15, 0.5, 0.15},
		desc  = S("Stick")
	},

	{ suffix  = "cnc_element_end",
		model = {-0.3, -0.5, -0.3, 0.3, 0, 0.5},
		desc  = S("Element End")
	},
	
	{ suffix  = "cnc_element_end_double",
		model = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.5},
		desc  = S("Element End Double")
	},

	{ suffix  = "cnc_element_cross",
		model = {
			{0.3, -0.5, -0.3, 0.5, 0, 0.3},
			{-0.3, -0.5, -0.5, 0.3, 0, 0.5},
			{-0.5, -0.5, -0.3, -0.3, 0, 0.3}},
		desc  = S("Element Cross")
	},
	
	{ suffix  = "cnc_element_cross_double",
		model = {
			{0.3, -0.5, -0.3, 0.5, 0.5, 0.3},
			{-0.3, -0.5, -0.5, 0.3, 0.5, 0.5},
			{-0.5, -0.5, -0.3, -0.3, 0.5, 0.3}},
		desc  = S("Element Cross Double")
	},

	{ suffix  = "cnc_element_t",
		model = {
			{-0.3, -0.5, -0.5, 0.3, 0, 0.3},
			{-0.5, -0.5, -0.3, -0.3, 0, 0.3},
			{0.3, -0.5, -0.3, 0.5, 0, 0.3}},
		desc  = S("Element T")
	},
	
	{ suffix  = "cnc_element_t_double",
		model = {
			{-0.3, -0.5, -0.5, 0.3, 0.5, 0.3},
			{-0.5, -0.5, -0.3, -0.3, 0.5, 0.3},
			{0.3, -0.5, -0.3, 0.5, 0.5, 0.3}},
		desc  = S("Element T Double")
	},

	{ suffix  = "cnc_element_edge",
		model = {
			{-0.3, -0.5, -0.5, 0.3, 0, 0.3},
			{-0.5, -0.5, -0.3, -0.3, 0, 0.3}},
		desc  = S("Element Edge")
	},
	
	{ suffix  = "cnc_element_edge_double",
		model = {
			{-0.3, -0.5, -0.5, 0.3, 0.5, 0.3},
			{-0.5, -0.5, -0.3, -0.3, 0.5, 0.3}},
		desc  = S("Element Edge Double")
	},

	{ suffix  = "cnc_element_straight",
		model = {-0.3, -0.5, -0.5, 0.3, 0, 0.5},
		desc  = S("Element Straight")
	},
	
	{ suffix  = "cnc_element_straight_double",
		model = {-0.3, -0.5, -0.5, 0.3, 0.5, 0.5},
		desc  = S("Element Straight Double")
	},


	{ suffix  = "cnc_oblate_spheroid",
		model = "technic_oblate_spheroid.obj",
		desc  = S("Oblate spheroid"),
		cbox  = {
			type = "fixed",
			fixed = {
				{ -6/16,  4/16, -6/16, 6/16,  8/16, 6/16 },
				{ -8/16, -4/16, -8/16, 8/16,  4/16, 8/16 },
				{ -6/16, -8/16, -6/16, 6/16, -4/16, 6/16 }
			}
		}
	},

	{ suffix  = "cnc_sphere",
		model = "technic_sphere.obj",
		desc  = S("Sphere")
	},
	
	
	{ suffix  = "cnc_sphere_half",
		model = "technic_sphere_half.obj",
		desc  = S("Half Sphere"),
		cbox  = {
			type = "fixed",
			fixed = {
				{ -0.5,  -0.5, -0.5, 0.5,  0, 0.5 },
			}
		}
	},
	
	{ suffix  = "cnc_sphere_quarter",
		model = "technic_sphere_quarter.obj",
		desc  = S("Quarter Sphere"),
		cbox  = {
			type = "fixed",
			fixed = {
				{ -0.5,  -0.5, -0.5, 0.5,  0, 0 },
			}
		}
	},

	{ suffix  = "cnc_cylinder",
		model = "technic_cylinder.obj",
		desc  = S("Cylinder")
	},
	
	{ suffix  = "cnc_cylinder_half",
		model = "technic_cylinder_half.obj",
		desc  = S("Half Cylinder"),
		cbox  = {
			type = "fixed",
			fixed = {
				{ -0.5,  -0.5, -0.5, 0.5,  0, 0.5 },
			}
		}
	},
	
	{ suffix  = "cnc_cylinder_half_corner",
		model = "technic_cylinder_half_corner.obj",
		desc  = S("Half Cylinder Corner"),
		cbox  = {
			type = "fixed",
			fixed = {
				{ -0.5,  -0.5, -0.5, 0.5,  0, 0.5 },
			}
		}
	},

	{ suffix  = "cnc_cylinder_fluted",
		model = "technic_cylinder_fluted.obj",
		desc  = S("Fluted Cylinder Column")
	},
	
	{ suffix  = "cnc_block_fluted",
		model = "technic_block_fluted.obj",
		desc  = S("Fluted Square Column")
	},
	
	{ suffix  = "cnc_twocurvededge",
		model = "technic_two_curved_edge.obj",
		desc  = S("Two Curved Edge/Corner Block")
	},

	{ suffix  = "cnc_onecurvededge",
		model = "technic_one_curved_edge.obj",
		desc  = S("One Curved Edge Block")
	},
	
	{ suffix  = "cnc_innercurvededge",
		model = "technic_inner_curved_edge.obj",
		desc  = S("Inner Curved Edge Block")
	},
	
	{ suffix  = "cnc_opposedcurvededge",
		model = "technic_opposed_curved_edge.obj",
		desc  = S("Opposed Curved Edges Block")
	},
	
	-- large radius

	{ suffix  = "cnc_onecurvededge_lr",
		model = "technic_one_curved_edge_lr.obj",
		desc  = S("One Curved Edge LR Block")
	},
	
	{ suffix  = "cnc_twocurvededge_lr",
		model = "technic_two_curved_edge_lr.obj",
		desc  = S("Two Curved Edges LR Block")
	},
	
	-- 4/16 Diagonal truss
	
	{ suffix  = "cnc_diagonal_truss",
		model = "technic_diagonal_truss.obj",
		desc  = S("Diagonal Truss"),
		cbox  = {
			type = "fixed",
			fixed = {
				{ -0.5,  -0.5, -0.25, 0.5,  0.5, 0.25 },
			}
		}
	},
		
	{ suffix  = "cnc_diagonal_truss_cross",
		model = "technic_diagonal_truss_cross.obj",
		desc  = S("Diagonal Truss Cross"),
		cbox  = {
			type = "fixed",
			fixed = {
				{ -0.5,  -0.5, -0.25, 0.5,  0.5, 0.25 },
			}
		}
	},
	
	-- 2/16 Beams
	
	{ suffix  = "cnc_beam216",
		model = "technic_beam_216.obj",
		desc  = S("2/16 Beam"),
		cbox  = {
			type = "fixed",
			fixed = {
				{0.5, 0.5, 0.065, -0.5, 0, -0.065},
			}
		}
	},
	
	{ suffix  = "cnc_beam216_cross",
		model = "technic_beam_216_cross.obj",
		desc  = S("2/16 Beam Cross"),
		cbox  = {
			type = "fixed",
			fixed = {
				{0.5, 0.5, 0.5, -0.5, 0, -0.5},
			}
		}
	},
	
	{ suffix  = "cnc_beam216_tee",
		model = "technic_beam_216_tee.obj",
		desc  = S("2/16 Beam T"),
		cbox  = {
			type = "fixed",
			fixed = {
				{-0.5, 0.5, -0.5, 0.5, 0, 0.0625},
			}
		}
	},
	
	{ suffix  = "cnc_beam216_cross_column",
		model = "technic_beam_216_cross_column.obj",
		desc  = S("2/16 Beam Cross with Column"),
		cbox  = {
			type = "fixed",
			fixed = {
				{0.5, 0.5, 0.5, -0.5, -0.5, -0.5},
			}
		}
	},
	
	-- 2/16 slope panel


	{ suffix  = "cnc_d45_slope_216",
		model = "technic_45_slope_216.obj",
		desc  = S("2/16 45° Slope"),
		cbox  = {
			type = "fixed",
			fixed = {
				{0.25, -0.5, -0.5, 0.5, -0.25, 0.5},
				{0, -0.25, -0.5, 0.25, 0, 0.5},
				{-0.25, 0, -0.5, 0, 0.25, 0.5},
				{-0.5, 0.25, -0.5, -0.25, 0.5, 0.5},
			}
		}
	},
	
	
-- 	{ suffix  = "cnc_d45_beam_216",
-- 		model = "technic_45_beam_216.obj",
-- 		desc  = S("2/16 45° Beam")
-- 	},
	
	-- 2/16 Arch
	
	{ suffix  = "cnc_arch216",
		model = "technic_arch_216.obj",
		desc  = S("2/16 Arch"),
		cbox  = {
			type = "fixed",
			fixed = {
				{0.4375, -0.5, -0.5, 0.5, -0.1875, 0.5},
				{-0.5, 0.4375, -0.5, -0.1875, 0.5, 0.5},
				{-0.1875, 0.25, -0.5, 0, 0.4375, 0.5},
				{0.25, -0.1875, -0.5, 0.4375, 0, 0.5},
				{-0.0625, 0.1875, -0.5, 0.125, 0.3125, 0.5},
				{0.1875, -0.0625, -0.5, 0.3125, 0.125, 0.5},
				{0.0625, 0.0625, -0.5, 0.25, 0.25, 0.5},
			}
		}
	},
	
	{ suffix  = "cnc_arch216_flange",
		model = "technic_arch_216_flange.obj",
		desc  = S("2/16 Arch Flange"),
		cbox  = {
			type = "fixed",
			fixed = {
			{-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			{0.4375, -0.5, -0.5, 0.5, 0.5, 0.5},
			{0.0625, 0.0625, -0.5, 0.4375, 0.4375, 0.5},
			}
		}
	},
	
	{ suffix  = "cnc_tile_beveled",
		model = "technic_tile_beveled.obj",
		desc  = S("Beveled Tile"),
		cbox  = {
			type = "fixed",
			fixed = {
				{ -1/2,  -1/2, -1/2, 1/2,  -2/5, 1/2 },
			}
		}
	},
	
	{ suffix  = "cnc_spike",
		model = "technic_pyramid_spike.obj",
		desc  = S("Spike"),
		cbox    = {
			type = "fixed",
			fixed = {
				{ -2/16,  4/16, -2/16, 2/16,  8/16, 2/16 },
				{ -4/16,     0, -4/16, 4/16,  4/16, 4/16 },
				{ -6/16, -4/16, -6/16, 6/16,     0, 6/16 },
				{ -8/16, -8/16, -8/16, 8/16, -4/16, 8/16 }
			}
		}
	},

	{ suffix  = "cnc_pyramid",
		model = "technic_pyramid.obj",
		desc  = S("Pyramid"),
		cbox  = {
			type = "fixed",
			fixed = {
				{ -2/16, -2/16, -2/16, 2/16,     0, 2/16 },
				{ -4/16, -4/16, -4/16, 4/16, -2/16, 4/16 },
				{ -6/16, -6/16, -6/16, 6/16, -4/16, 6/16 },
				{ -8/16, -8/16, -8/16, 8/16, -6/16, 8/16 }
			}
		}
	},

	{ suffix  = "cnc_slope_inner_edge",
		model = "technic_innercorner.obj",
		desc  = S("Slope Inner Edge/Corner"),
		sbox  = {
			type = "fixed",
			fixed = { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 }
		},
		cbox  = {
			type = "fixed",
			fixed = {
				{ -0.5,  -0.5,  -0.5,  0.5, -0.25,  0.5  },
				{ -0.5,  -0.25, -0.25, 0.5,  0,     0.5  },
				{ -0.25, -0.25, -0.5,  0.5,  0,    -0.25 },
				{ -0.5,   0,     0,    0.5,  0.25,  0.5  },
				{  0,     0,    -0.5,  0.5,  0.25,  0.5  },
				{ -0.5,   0.25,  0.25, 0.5,  0.5,   0.5  },
				{  0.25,  0.25, -0.5,  0.5,  0.5,   0.5  }
			}
		}
	},

	{ suffix  = "cnc_slope_edge",
		model = "technic_outercorner.obj",
		desc  = S("Slope Outer Edge/Corner"),
		cbox  = {
			type = "fixed",
			fixed = {
				{  4/16,  4/16,  4/16, 8/16,  8/16, 8/16 },
				{     0,     0,     0, 8/16,  4/16, 8/16 },
				{ -4/16, -4/16, -4/16, 8/16,     0, 8/16 },
				{ -8/16, -8/16, -8/16, 8/16, -4/16, 8/16 }
			}
		}
	},

	{ suffix  = "cnc_slope",
		model = "technic_slope.obj",
		desc  = S("Slope"),
		cbox  = {
			type = "fixed",
			fixed = {
				{ -8/16,  4/16,  4/16, 8/16,  8/16, 8/16 },
				{ -8/16,     0,     0, 8/16,  4/16, 8/16 },
				{ -8/16, -4/16, -4/16, 8/16,     0, 8/16 },
				{ -8/16, -8/16, -8/16, 8/16, -4/16, 8/16 }
			}
		}
	},
	
}

-- Generic function for registering all the different node types
function register_program(recipeitem, suffix, model, groups, images, description, cbox, sbox)

	local dtype
	local nodeboxdef
	local meshdef

	if type(model) ~= "string" then -- assume a nodebox if it's a table or function call
		dtype = "nodebox"
		nodeboxdef = {
			type  = "fixed",
			fixed = model
		}
	else
		dtype = "mesh"
		meshdef = model
	end

	if cbox and not sbox then sbox = cbox end
	
	local uta = false
	if groups.utalpha == 1 then
		uta = true
	end

	-- groups['cnc_node'] = 1
	-- groups['not_in_creative_inventory'] = 1

	minetest.register_node(":"..recipeitem.."_"..suffix, {
		description   = description,
		drawtype      = dtype,
		node_box      = nodeboxdef,
		mesh          = meshdef,
		tiles         = images,
		paramtype     = "light",
		paramtype2    = "facedir",
		walkable      = true,
		groups        = groups,
		selection_box = sbox,
		collision_box = cbox,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})
end

-- mymillwork
-- for i = 1, 24 do
-- 	table.insert(programs, { suffix  = "mymillwork_mach" .. i,
-- 		model = "mymillwork_mach" .. i .. ".obj",
-- 		desc  = S("Mach" .. i)
-- 	})
-- end

-- function to iterate over all the programs the CNC machine knows
function register_all(recipeitem, groups, images, description)

	local uta = false
	if groups.utalpha == 1 then
		uta = true
	end

	groups['cnc_node'] = 1
	groups['not_in_creative_inventory'] = 0

	minetest.register_node(":"..recipeitem.."_vertical_1", {
		description = description.." Vertical1",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = vert1,
		selection_box = vert1,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})
	
	minetest.register_node(":"..recipeitem.."_vertical_2", {
		description = description.." Vertical2",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = vert2,
		selection_box = vert2,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})
	
	minetest.register_node(":"..recipeitem.."_vertical_3", {
		description = description.." Vertical3",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = vert3,
		selection_box = vert3,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})
	
	minetest.register_node(":"..recipeitem.."_vertical_4", {
		description = description.." Vertical4",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = vert4,
		selection_box = vert4,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})
	
	minetest.register_node(":"..recipeitem.."_chiseled_1", {
		description = description.." Chiseled1",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = chis1,
		selection_box = chis1,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})
	
	minetest.register_node(":"..recipeitem.."_chiseled_2", {
		description = description.." Chiseled2",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = chis2,
		selection_box = chis2,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})
	
	minetest.register_node(":"..recipeitem.."_chiseled_3", {
		description = description.." Chiseled3",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = chis3,
		selection_box = chis3,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})
	
	minetest.register_node(":"..recipeitem.."_chiseled_4", {
		description = description.." Chiseled4",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = chis4,
		selection_box = chis4,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})
	
	minetest.register_node(":"..recipeitem.."_horizontal_1", {
		description = description.." Horizontal1",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = hori1,
		selection_box = hori1,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})
	
	minetest.register_node(":"..recipeitem.."_horizontal_2", {
		description = description.." Horizontal2",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = hori2,
		selection_box = hori2,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})
	
	minetest.register_node(":"..recipeitem.."_horizontal_3", {
		description = description.." Horizontal3",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = hori3,
		selection_box = hori3,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})
	
	minetest.register_node(":"..recipeitem.."_horizontal_4", {
		description = description.." Horizontal4",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = hori4,
		selection_box = hori4,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})
	
	minetest.register_node(":"..recipeitem.."_cross_1", {
		description = description.." Cross1",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = cross1,
		selection_box = cross1,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})
	
	minetest.register_node(":"..recipeitem.."_cross_2", {
		description = description.." Cross2",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = cross2,
		selection_box = cross2,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})
	
	minetest.register_node(":"..recipeitem.."_cross_3", {
		description = description.." Cross3",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = cross3,
		selection_box = cross3,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})
	
	minetest.register_node(":"..recipeitem.."_cross_4", {
		description = description.." Cross4",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = cross4,
		selection_box = cross4,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})
	
	minetest.register_node(":"..recipeitem.."_square_1", {
		description = description.." Cross1",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = squar1,
		selection_box = squar1,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})
	
	minetest.register_node(":"..recipeitem.."_square_2", {
		description = description.." Cross2",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = squar2,
		selection_box = squar2,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})
	
	minetest.register_node(":"..recipeitem.."_square_3", {
		description = description.." Cross3",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = squar3,
		selection_box = squar3,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})
	
	minetest.register_node(":"..recipeitem.."_square_4", {
		description = description.." Cross4",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = squar4,
		selection_box = squar4,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})

	---

	minetest.register_node(":"..recipeitem.."_bannerstone", {
		description = description.." Banner Stone",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = fa_bannerstone,
		selection_box = fa_bannerstone,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})

	minetest.register_node(":"..recipeitem.."_bannerstone_corner", {
		description = description.." Banner Stone Corner",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = fa_bannerstone_corner,
		selection_box = fa_bannerstone_corner,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})

	minetest.register_node(":"..recipeitem.."_centerstone", {
		description = description.." Centerstone",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = fa_centerstone,
		selection_box = fa_centerstone,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})

	minetest.register_node(":"..recipeitem.."_column", {
		description = description.." Column",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = fa_column,
		selection_box = fa_column,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})

	minetest.register_node(":"..recipeitem.."_column_corner", {
		description = description.." Column Corner",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = fa_column_corner,
		selection_box = fa_column_corner,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})

	minetest.register_node(":"..recipeitem.."_corbel", {
		description = description.." Corbel",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = fa_corbel,
		selection_box = fa_corbel,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})

	minetest.register_node(":"..recipeitem.."_corbel_corner", {
		description = description.." Corbel Corner",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = fa_corbel_corner,
		selection_box = fa_corbel_corner,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})

	minetest.register_node(":"..recipeitem.."_corbel_corner_inner", {
		description = description.." Corbel Corner Inner",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = fa_corbel_corner_inner,
		selection_box = fa_corbel_corner_inner,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})

	minetest.register_node(":"..recipeitem.."_carved_stone_a", {
		description = description.." Carved Stone A",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = fa_carved_stone_a,
		selection_box = fa_carved_stone_a,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})

	minetest.register_node(":"..recipeitem.."_rgspro", {
		description = description.." Rgspro",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = fa_rgspro,
		selection_box = fa_rgspro,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})

	minetest.register_node(":"..recipeitem.."_rgspro_inner_corner", {
		description = description.." Rgspro Inner Corner",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = fa_rgspro_inner_corner,
		selection_box = fa_rgspro_inner_corner,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})

	minetest.register_node(":"..recipeitem.."_rgspro_outer_corner", {
		description = description.." Rgspro Outer Corner",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = fa_rgspro_outer_corner,
		selection_box = fa_rgspro_outer_corner,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})

	minetest.register_node(":"..recipeitem.."_corner_bricks", {
		description = description.." Corner Bricks",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = fa_corner_bricks,
		selection_box = fa_corner_bricks,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})

	minetest.register_node(":"..recipeitem.."_columnia_bottom", {
		description = description.." Columnia Bottom",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = fa_columnia_bottom,
		selection_box = fa_columnia_bottom,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})

	minetest.register_node(":"..recipeitem.."_columnia_crosslink", {
		description = description.." Columnia Crosslink",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = fa_columnia_crosslink,
		selection_box = fa_columnia_crosslink,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})

	minetest.register_node(":"..recipeitem.."_columnia_link", {
		description = description.." Columnia Link",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = fa_columnia_link,
		selection_box = fa_columnia_link,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})

	minetest.register_node(":"..recipeitem.."_columnia_linkdown", {
		description = description.." Columnia Linkdown",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = fa_columnia_linkdown,
		selection_box = fa_columnia_linkdown,
		on_place = minetest.rotate_node,
		light_source  = groups.light_source,
		use_texture_alpha = uta
	})

	---

	for _, d in ipairs(workbench_defs) do
		local nbox = xdecor_pixelbox(16, {unpack(d, 3)})
		minetest.register_node(":"..recipeitem.."_"..d[1], {
			description = description.." "..firstToUpper(d[1]),
			drawtype = "nodebox",
			tiles = images,
			paramtype = "light",
			paramtype2 = "facedir",
			groups = groups,
			node_box = nbox,
			selection_box = nbox,
			on_place = minetest.rotate_node,
			light_source  = groups.light_source,
			use_texture_alpha = uta
		})
	end

	---

	if groups.cg == 1 then
		minetest.register_node(":"..recipeitem.."_node",
		{
			description = description .. " Node",
			drawtype = "glasslike_framed",
	
			tiles = images,
	
			paramtype = "light",
			sunlight_propagates = true, 
			is_ground_content = false,
	
			groups = {cracky = 3, oddly_breakable_by_hand = 3},
			sounds = default.node_sound_glass_defaults()
		})
	else
		groups.rn = 1 -- regular node
		minetest.register_node(":"..recipeitem.."_node",
		{
			description = description .. " Node",
			tiles = images,
			groups = groups,
			drawtype      = "nodebox",
			paramtype     = "light",
			paramtype2    = "facedir",
			walkable      = true,
			light_source  = groups.light_source,
			use_texture_alpha = uta
		})
	end

	---

	local mod, name = recipeitem:match("(.*):(.*)")
	stairs.register_stair_and_slab(
		name,
		recipeitem,
		groups,
		images,
		("%s Stair"):format(description),
		("%s Slab"):format(description)
	)

	---

	for _, data in ipairs(programs) do
		register_program(recipeitem, data.suffix, data.model,
			groups, images, description.." "..data.desc, data.cbox, data.sbox)
	end
end

function register_all_simple(name)
	register_all("cnc:"..name,
		{cracky=3},
		{name..".png"},
		fancy_string(name))
end

function register_all_simple_alpha(name)
	register_all("cnc:"..name,
		{cracky=3, utalpha=1},
		{name..".png"},
		fancy_string(name))
end

function register_all_lamp_max(name)
	register_all("cnc:"..name,
		{cracky=3, light_source=13, utalpha=1},
		{name..".png"},
		fancy_string(name))
end

function register_all_lamp(name, bright)
	register_all("cnc:"..name,
		{cracky=3, light_source=bright, utalpha=1},
		{name..".png"},
		fancy_string(name))
end



-- COLOURED GLASS
-------
glass_colors = {
	black='#2b2b2b',
	blue='#0063b0',
	brown='#8c5922',
	cyan='#07B6BC',
	dark_green='#567a42',
	dark_grey='#6d6d6d',
	green='#4ee34c',
	grey='#9f9f9f',
	magenta='#ff0098',
	orange='#ff8b0e',
	pink='#ff62c6',
	red='#dc1818',
	violet='#a437ff',
	white='#FFFFFF',
	yellow='#ffe400',
	neon_cyan='#4deeea',
	neon_pink='#f000ff',
	neon_blue='#001eff',
	vibrant_yellow='#e3ff00',
	vibrant_green='#01ff1f',
	vibrant_orange='#ff9a00',
	vibrant_purple='#bd00ff',
	vibrant_blue='#0078ff',
}

for k, v in pairs(glass_colors) do
	register_all("cglass:glass_" .. k,
				{snappy=2,choppy=2,oddly_breakable_by_hand=3,cg=1},
				{"cglass.png^[multiply:" .. v, "cglass_detail.png^[multiply:" .. v},
				fancy_string(k) .. " Glass")
end


-- MISC
-------

register_all("cnc:ghost_crystal",
{cracky=3, light_source=13, utalpha=1},
{"crystals_ghost_crystal.png"},
S("Ghost Crystal"))

register_all("cnc:red_crystal",
{cracky=3, light_source=13, utalpha=1},
{"crystals_red_crystal.png"},
S("Red Crystal"))

register_all("cnc:rose_quartz",
{cracky=3, light_source=13, utalpha=1},
{"crystals_rose_quartz.png"},
S("Rose Quartz"))

register_all("cnc:blue_marble",
{cracky=3, light_source=13, utalpha=1},
{"ethereal_blue_marble.png"},
S("Blue Marble"))

register_all("cnc:blue_marble_tile",
{cracky=3, light_source=13, utalpha=1},
{"ethereal_blue_marble_tile.png"},
S("Blue Marble Tile"))

register_all("cnc:etherium_glass",
{cracky=3, light_source=13, utalpha=1},
{"etherium_glass.png"},
S("Etherium Glass"))

register_all("cnc:etherium_crystal_glass",
{cracky=3, light_source=13, utalpha=1},
{"etherium_crystal_glass.png"},
S("Etherium Crystal Glass"))

register_all("cnc:amethyst_block",
{cracky=3},
{"gems_amethyst_block.png"},
S("Amethyst Block"))

register_all("cnc:emerald_block",
{cracky=3},
{"gems_emerald_block.png"},
S("Emerald Block"))

register_all("cnc:ruby_block",
{cracky=3},
{"gems_ruby_block.png"},
S("Ruby Block"))

register_all("cnc:sapphire_block",
{cracky=3},
{"gems_sapphire_block.png"},
S("Sapphire Block"))
	
register_all("cnc:uranium",
{cracky=3, light_source=13},
{"technic_uranium_block.png"},
S("Uranium Block"))

register_all("cnc:sulfur",
{cracky=3},
{"technic_sulfur_block.png"},
S("Sulfur Block"))

register_all("cnc:marble_bricks",
{cracky=3},
{"technic_marble_bricks.png"},
S("Marble Bricks"))

register_all("cnc:lead_block",
{cracky=3},
{"technic_lead_block.png"},
S("Lead Block"))

register_all_simple("nether_brick_deep")

register_all_simple("block_thermese")
register_all_simple("block_raw")

register_all_simple("tron_glass")
register_all_simple("tron_glass_blue")
register_all_simple("tron_glass_green")
register_all_simple("tron_glass_orange")

register_all_simple("rarium_brick")
register_all_simple("minthe_sand")
register_all_simple("bacchus_sand")
register_all_simple("lichen")
register_all_simple("cryon")
register_all_simple("mithril_block")
register_all_simple("silver_block")
register_all_simple("tin_block")
register_all_simple("block_tgol")
register_all_simple("redmarble")
register_all_simple("bacchus_wood")
register_all_simple("etherium_sandstone_block")
register_all_simple("etherium_sand")
register_all_simple("lavastuff_block")
register_all_simple("date_wood")
register_all_simple("willow_wood")
register_all_simple("cobalt_brick")
register_all_simple("minthe_cobble")
register_all_simple("titan_sand")
register_all_simple("adamantite_brick")
register_all_simple("default_sand")

register_all_simple("moss")
register_all_simple("algae")
register_all_simple("solar")
register_all_simple("coal_dust")

register_all_simple("default_coral_orange")
register_all_simple("default_diamond_block")

register_all_simple("circle_stone_bricks")
register_all_simple("mushroom_cap")
register_all_simple("bacchus_cobble")

register_all_simple("colorcubes_4_cyan")
register_all_simple("colorcubes_4c_green_magenta")
register_all_simple("colorcubes_4c_black_white")
register_all_simple("colorcubes_4c_light_gray_dark_gray")
register_all_simple("colorcubes_4c_lime_violet")
register_all_simple("colorcubes_4_magenta")
register_all_simple("colorcubes_4c_orange_brown")
register_all_simple("colorcubes_4c_orange_skyblue")
register_all_simple("colorcubes_4c_red_cyan")
register_all_simple("colorcubes_4c_aqua_redviolet")
register_all_simple("colorcubes_1_dark_green")
register_all_simple("colorcubes_4_aqua")
register_all_simple("colorcubes_4c_yellow_blue")
register_all_simple("colorcubes_4_blue")
register_all_simple("colorcubes_4_violet")
register_all_simple("colorcubes_inward_black")
register_all_simple("colorcubes_inward_orange")
register_all_simple("colorcubes_inward_pink")
register_all_simple("colorcubes_inward_white")
register_all_simple("colorcubes_4_green")
register_all_simple("colorcubes_4_yellow")
register_all_simple("nyancat_side")
register_all_simple("nyancat_rainbow")
register_all_simple("ice_crystal_block")
register_all_simple("xtraores_bluemarble")
register_all_simple("xtraores_bluemarble_bricks")
register_all_simple("bluemarble_column")
register_all_simple("bacchus_tree_top")

register_all_simple("sandcobble")
register_all_simple("ocean_stone")
register_all_simple("ocean_cobble")
register_all_simple("ocean_carved")

register_all_simple("minerva_cobble")
register_all_simple("rayref_back")
register_all_simple("rarium_block_chiseled")
register_all_simple("osmium_brick")
register_all_simple("xtraores_marble")
register_all_simple("xtraores_marble_bricks")
register_all_simple("marble_column")
register_all_simple("bluemarble_polished")
register_all_simple("etherium_sandstone")
register_all_simple("etherium_sandstone_brick")
register_all_simple("redmarble_column")
register_all_simple("redmarble_polished")
register_all_simple("redmarble_column_side")
register_all_simple("redmarble_bricks")
register_all_simple("bacchus_stone_brick")
register_all_simple("cedar_wood")
register_all_simple("empty_shelf")
register_all_simple("block_tste")
register_all_simple("unobtainium_block_chiseled")
register_all_simple("unobtainium_brick")
register_all_simple("blackmarble_bricks")
register_all_simple("blackmarble")
register_all_simple("cobalt_block_compressed")
register_all_simple("block_ceramic")
register_all_simple("titanium_brick")
register_all_simple("platinum_brick")
register_all_simple("minerva_sand")
register_all_simple("basalt_chiselled_top")
register_all_simple("basalt_chiselled_side")
register_all_simple("nether_basalt")
register_all_simple("nether_basalt_hewn")
register_all_simple("spinel_block")
register_all_simple("block_entropy")
register_all_simple("raw_mach_bot")
register_all_simple("xtraores_marble_polished")
register_all_simple("cobalt_block_chiseled")
register_all_simple("adamantite_block_chiseled")
register_all_simple("bacchus_stone_block")
register_all_simple("bacchus_stone")
register_all_simple("rack_deep")
register_all_simple("minerva_stone_block")
register_all_simple("minthe_stone_brick")
register_all_simple("minthe_stone_block")
register_all_simple("block_cgls")
register_all_simple("blackmarble_column_top")
register_all_simple("blackmarble_column_side")
register_all_simple("blackmarble_polished")
register_all_simple("bluemarble_column_side")
register_all_simple("osmium_block_chiseled")
register_all_simple("bacchus_dirt")
register_all_simple("sedna_dust")
register_all_simple("dark_matter_crystal_block")
register_all_simple("inward_violet")
register_all_simple("inward_redviolet")
register_all_simple("inward_magenta")
register_all_simple("inward_red")
register_all_simple("inward_skyblue")
register_all_simple("inward_cyan")
register_all_simple("inward_blue")
register_all_simple("inward_brown")
register_all_simple("inward_yellow")
register_all_simple("inward_aqua")
register_all_simple("inward_dark_green")
register_all_simple("inward_lime")
register_all_simple("inward_green")
register_all_simple("inward_light_gray")
register_all_simple("inward_dark_gray")

register_all_simple("unobtainium_block")
register_all_simple("unobtainium_block_compressed")
register_all_simple("rarium_block")
register_all_simple("rarium_block_compressed")
register_all_simple("platinum_block_compressed")
register_all_simple("platinum_block_chiseled")
register_all_simple("iron_checker")
register_all_simple("plankstone")
register_all_simple("nether_brick")
register_all_simple("spruce_wood")
register_all_simple("frame_cgls")
register_all_simple("palm_trunk_top")
register_all_simple("spruce_trunk_top")
register_all_simple("block_ttin")
register_all_simple("poplar_trunk")
register_all_simple("willow_trunk_top")
register_all_simple("vacoven_top")
register_all_simple("osmium_block")
register_all_simple("platinum_block")
register_all_simple("minerva_pine_wood")
register_all_simple("poplar_wood")
register_all_simple("tholins")
register_all_simple("dust_bio")
register_all_simple("titanium_block")
register_all_simple("pwood_sides")
register_all_simple("pwood")
register_all_simple("cobalt_block")
register_all_simple("xtraores_titanium_block")
register_all_simple("rubber_tree_full")
register_all_simple("rubber_tree_empty")
register_all_simple("mineral_sulfur")
register_all_simple("mineral_uranium")

register_all_simple("tdis_front")
register_all_simple("titan_icestone_with_pebbles")
register_all_simple("tree_cube")
register_all_simple("minthe_stone")
register_all_simple("minthe_sandstone_brick")
register_all_simple("minthe_sandstone_block")
register_all_simple("minthe_sandstone")
register_all_simple("minerva_stone_brick")
register_all_simple("minerva_stone")
register_all_simple("reddust")

register_all_simple("palm_trunk")
register_all_simple("osmium_block_compressed")
register_all_simple("space_cobble")
register_all_simple("palm_wood")
register_all_simple("sedna_cobble")
register_all_simple("beech_wood")
register_all_simple("apple_tree_trunk")
register_all_simple("titan_icestone")
register_all_simple("space_dust")
register_all_simple("minerva_pine_tree_top")
register_all_simple("sequoia_wood")
register_all_simple("sequoia_trunk")
register_all_simple("spruce_trunk")
register_all_simple("poplar_trunk_top")
register_all_simple("minerva_dirt")
register_all_simple("io_stone_brick")
register_all_simple("io_cobble")
register_all_simple("oak_wood")
register_all_simple("fir_trunk")
register_all_simple("beech_trunk")
register_all_simple("dirt_compressed")
register_all_simple("tar")
register_all_simple("adamantite_block")
register_all_simple("adamantite_block_compressed")
register_all_simple("base_block")
register_all_simple("block_tcop")
register_all_simple("frame_raw")
register_all_simple("mach_top")
register_all_simple("titanium_block_compressed")
register_all_simple("rayref_front")
register_all_simple("raw_heater_sides")
register_all_simple("frame_tste")
register_all_simple("fir_wood")
register_all_simple("birch_wood")
register_all_simple("apple_tree_wood")
register_all_simple("birch_trunk")
register_all_simple("date_palm_trunk")
register_all_simple("oak_trunk")
register_all_simple("willow_trunk")
register_all_simple("iron_stone")
register_all_simple("block_tcha")
register_all_simple("colorcubes_4_lime")
register_all_simple("colorcubes_4_orange")
register_all_simple("colorcubes_4_pink")
register_all_simple("colorcubes_4_red")
register_all_simple("colorcubes_4_black")
register_all_simple("colorcubes_4_skyblue")
register_all_simple("colorcubes_4_white")
register_all_simple("colorcubes_4_brown")
register_all_simple("colorcubes_4_dark_gray")
register_all_simple("colorcubes_4_dark_green")
register_all_simple("colorcubes_4_light_gray")
register_all_simple("colorcubes_4_redviolet")
register_all_simple("colorcubes_1_aqua")
register_all_simple("colorcubes_1_black")
register_all_simple("colorcubes_1_blue")
register_all_simple("colorcubes_1_brown")
register_all_simple("colorcubes_1_cyan")
register_all_simple("colorcubes_1_dark_gray")
register_all_simple("colorcubes_1_green")
register_all_simple("colorcubes_1_light_gray")
register_all_simple("colorcubes_1_lime")
register_all_simple("colorcubes_1_magenta")
register_all_simple("colorcubes_1_orange")
register_all_simple("colorcubes_1_pink")
register_all_simple("colorcubes_1_red")
register_all_simple("colorcubes_1_redviolet")
register_all_simple("colorcubes_1_skyblue")
register_all_simple("colorcubes_1_violet")
register_all_simple("colorcubes_1_white")
register_all_simple("colorcubes_1_yellow")
register_all_simple("io_gravel")
register_all_simple("io_stone")
register_all_simple("io_stone_block")
register_all_simple("io_sulfur_dust")
register_all_simple("rubber_tree_leaves")
register_all_simple("apple_tree_leaves")

register_all_lamp_max("crystal_lamp")
register_all_lamp_max("emerald_lamp")
register_all_lamp_max("mese_lamp")
register_all_lamp_max("crystal_lamp")
register_all_lamp_max("ruby_lamp")
register_all_lamp_max("default_meselamp")
register_all_lamp_max("sandstone_light_block")
register_all_lamp_max("super_glow_glass")

register_all_lamp("glow_glass", 8)
register_all_lamp("nether_glowstone_deep", 8)
register_all_lamp("nether_glowstone", 8)

register_all_lamp("thin_ice", 3)
register_all_lamp("salt_crystal", 3)
register_all_lamp("salty2", 3)
register_all_lamp("crystal_glass_detail", 3)
register_all_lamp("glow_amethyst_ore", 3)
register_all_lamp("glow_ruby_ore", 3)
register_all_lamp("glow_emerald_ore", 3)
register_all_lamp("glow_ore", 3)
register_all_lamp("trap_box_glass", 3)
register_all_lamp("block_thermese_hot", 3)
register_all_lamp("glow_block_blue", 3)
register_all_lamp("glow_block_green", 3)
register_all_lamp("glow_block_orange", 3)
register_all_lamp("glow_block_purple", 3)
register_all_lamp("glow_block_red", 3)
register_all_lamp("glow_block_white", 3)
register_all_lamp("glow_block_yellow", 3)
register_all_lamp("mushroom_light", 3)

register_all_lamp("colorcubes_light_aqua", 3)
register_all_lamp("colorcubes_light_blue", 3)
register_all_lamp("colorcubes_light_cyan", 3)
register_all_lamp("colorcubes_light_green", 3)
register_all_lamp("colorcubes_light_lime", 3)
register_all_lamp("colorcubes_light_magenta", 3)
register_all_lamp("colorcubes_light_orange", 3)
register_all_lamp("colorcubes_light_red", 3)
register_all_lamp("colorcubes_light_redviolet", 3)
register_all_lamp("colorcubes_light_skyblue", 3)
register_all_lamp("colorcubes_light_violet", 3)
register_all_lamp("colorcubes_light_white", 3)
register_all_lamp("colorcubes_light_yellow", 3)

register_all_simple_alpha("window_redviolet")
register_all_simple_alpha("window_blue")
register_all_simple_alpha("window_brown")
register_all_simple_alpha("window_cyan")
register_all_simple_alpha("window_dark_green")
register_all_simple_alpha("window_yellow")
register_all_simple_alpha("window_pink")
register_all_simple_alpha("window_white")
register_all_simple_alpha("window_skyblue")
register_all_simple_alpha("window_violet")
register_all_simple_alpha("window_red")
register_all_simple_alpha("window_orange")
register_all_simple_alpha("window_magenta")
register_all_simple_alpha("window_lime")
register_all_simple_alpha("window_light_gray")
register_all_simple_alpha("window_green")
register_all_simple_alpha("window_dark_gray")
register_all_simple_alpha("window_black")
register_all_simple_alpha("window_aqua")

register_all_simple_alpha("crystal_water")
register_all_simple_alpha("cryolava")
register_all_simple_alpha("bacchus_water")
register_all_simple_alpha("liquid_hydrocarbon")
register_all_simple_alpha("minerva_water")
register_all_simple_alpha("sulfuric_acid")
register_all_simple_alpha("titan_alien_crystal")
-- register_all_simple_alpha("")
-- register_all_simple_alpha("")
-- register_all_simple_alpha("")


--[[

	EVERYTHING BELOW IS ALL THE ORIGINAL TECHNIC_CNC_IMPROVED REGISTRATIONS

	JUST LEAVE THEM ALONE AND TRY TO STICK TO MY;
	register_all_simple('texture_name_for_solid_nodes')
	register_all_simple_alpha('texture_name_for_nodes_with_transparency_in_the_texture')
	register_all_lamp_max('texture_name')
	register_all_lamp('texture_name', brightness)

	FUNCTIONS, UNLESS YOU REALLY NEED TO SET SOME CUSTOM NODE GROUPS.

	thh everything below should be re-factored and put into standardised functions
	like the ones used above.

	I did consider for each standard function making long pre-defined arrays and then
	looping for the register function but, no, it makes little difference to me.

]]--


-- CAVEREALMS
-------

register_all("caverealms:glow_emerald",
				{cracky=3, light_source=13, utalpha=1},
				{"caverealms_glow_emerald.png"},
				S("Glow Emerald"))

register_all("caverealms:glow_ruby",
				{cracky=3, light_source=13, utalpha=1},
				{"caverealms_glow_ruby.png"},
				S("Glow Ruby"))

register_all("caverealms:glow_crystal",
				{cracky=3, light_source=13, utalpha=1},
				{"caverealms_glow_crystal.png"},
				S("Glow Sapphire"))

register_all("caverealms:glow_mese",
				{cracky=3, light_source=13, utalpha=1},
				{"caverealms_glow_mese.png"},
				S("Glow Mese"))

register_all("caverealms:glow_amethyst",
				{cracky=3, light_source=13, utalpha=1},
				{"caverealms_glow_amethyst.png"},
				S("Glow Amethyst"))

register_all("caverealms:glow_obsidian",
				{cracky=1, light_source=7, level=2},
				{"caverealms_glow_obsidian.png"},
				S("Glowing Obsidian"))

register_all("caverealms:glow_obsidian_2",
				{cracky=1, light_source=9, hot=1, level=2},
				{"caverealms_glow_obsidian2.png"},
				S("Hot Glowing Obsidian"))

register_all("caverealms:glow_obsidian_brick",
				{cracky=1, light_source=7, level=2},
				{"caverealms_glow_obsidian_brick.png"},
				S("Glow Obsidian Brick"))

register_all("caverealms:glow_obsidian_brick_2",
				{cracky=1, light_source=9, hot=1, level=2},
				{"caverealms_glow_obsidian_brick_2.png"},
				S("Glow Obsidian Brick"))


-- DIRT
-------
register_all("default:dirt",
                {snappy=2,choppy=2,oddly_breakable_by_hand=3},
                {"default_grass.png", "default_dirt.png", "default_grass.png"},
                S("Dirt"))

register_all("default:glass",
                {snappy=2,choppy=2,oddly_breakable_by_hand=3},
                {"default_glass.png"},
                S("Glass"))

register_all("default:obsidian_glass",
                {snappy=2,choppy=2,oddly_breakable_by_hand=3},
                {"default_obsidian_glass.png"},
                S("Obsidian Glass"))

-- WOOD
-------
register_all("default:wood",
                {snappy=2, choppy=2, oddly_breakable_by_hand=2},
                {"default_wood.png"},
                S("Wooden"))

register_all("default:junglewood",
                {snappy=2, choppy=2, oddly_breakable_by_hand=2},
                {"default_junglewood.png"},
                S("Junglewood"))

register_all("default:pine_wood",
                {snappy=2, choppy=2, oddly_breakable_by_hand=2},
                {"default_pine_wood.png"},
                S("Pine"))

register_all("default:acacia_wood",
                {snappy=2, choppy=2, oddly_breakable_by_hand=2},
                {"default_acacia_wood.png"},
                S("Acacia"))

register_all("default:aspen_wood",
                {snappy=2, choppy=2, oddly_breakable_by_hand=2},
                {"default_aspen_wood.png"},
                S("Aspen"))

-- STONE
--------
register_all("default:stone",
                {cracky=3, stone=1},
                {"default_stone.png"},
                S("Stone"))

register_all("default:stonebrick",
                {crumbly=2, cracky=3, stone=1},
                {"default_stone_brick.png"},
                S("Stone Brick"))

register_all("default:stone_block",
                {crumbly=2, cracky=3, stone=1},
                {"default_stone_block.png"},
                S("Stone Block"))


register_all("default:desert_stone",
                {cracky=3, stone=1},
                {"default_desert_stone.png"},
                S("Desert Stone"))

register_all("default:desert_stonebrick",
                {crumbly=2, cracky=3, stone=1},
                {"default_desert_stone_brick.png"},
                S("Desert Stone Brick"))

register_all("default:desert_stone_block",
                {crumbly=2, cracky=3, stone=1},
                {"default_desert_stone_block.png"},
                S("Desert Stone Block"))

-- CONCRETE AND CEMENT
----------------------

register_all("basic_materials:concrete_block",
				{cracky=2, level=2},
				{"basic_materials_concrete_block.png"},
				S("Concrete"))

register_all("basic_materials:cement_block",
				{cracky=2, level=2},
				{"basic_materials_cement_block.png"},
				S("Cement"))

register_all("basic_materials:brass_block",
				{cracky=1, level=2},
				{"basic_materials_brass_block.png"},
				S("Brass block"))

register_all("basic_materials:chain_brass",
				{cracky=1, level=2},
				{"basic_materials_chain_brass.png"},
				S("Chain Brass"))


-- COBBLE
---------
register_all("default:cobble",
                {cracky=3, stone=1},
                {"default_cobble.png"},
                S("Cobble"))

register_all("default:mossycobble",
                {cracky=3, stone=1},
                {"default_mossycobble.png"},
                S("Mossy Cobblestone"))

register_all("default:desert_cobble",
                {cracky=3, stone=1},
                {"default_desert_cobble.png"},
                S("Desert Cobble"))

-- BRICK
--------
register_all("default:brick",
                {cracky=3},
                {"default_brick.png"},
                S("Brick"))


-- SANDSTONE
------------
register_all("default:sandstone",
                {crumbly=2, cracky=3},
                {"default_sandstone.png"},
                S("Sandstone"))

register_all("default:sandstonebrick",
                {crumbly=2, cracky=3},
                {"default_sandstone_brick.png"},
                S("Sandstone Brick"))

register_all("default:sandstone_block",
                {crumbly=2, cracky=3},
                {"default_sandstone_block.png"},
                S("Sandstone Block"))


register_all("default:desert_sandstone",
                {crumbly=2, cracky=3},
                {"default_desert_sandstone.png"},
                S("Desert Sandstone"))

register_all("default:desert_sandstone_brick",
                {crumbly=2, cracky=3},
                {"default_desert_sandstone_brick.png"},
                S("Desert Sandstone Brick"))

register_all("default:desert_sandstone_block",
                {crumbly=2, cracky=3},
                {"default_desert_sandstone_block.png"},
                S("Desert Sandstone Block"))


register_all("default:silver_sandstone",
                {crumbly=2, cracky=3},
                {"default_silver_sandstone.png"},
                S("Silver Sandstone"))

register_all("default:silver_sandstone_brick",
                {crumbly=2, cracky=3},
                {"default_silver_sandstone_brick.png"},
                S("Silver Sandstone Brick"))

register_all("default:silver_sandstone_block",
                {crumbly=2, cracky=3},
                {"default_silver_sandstone_block.png"},
                S("Silver Sandstone Block"))



-- TREES
--------
register_all("default:tree",
                {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=3, wood=1},
                {"default_tree.png"},
                S("Tree"))
register_all("default:acacia_tree",
                {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=3, wood=1},
                {"default_acacia_tree.png"},
                S("Acacia Tree"))
register_all("default:aspen_tree",
                {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=3, wood=1},
                {"default_aspen_tree.png"},
                S("Aspen Tree"))
register_all("default:jungletree",
                {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=3, wood=1},
                {"default_jungletree.png"},
                S("Jungle Tree"))
register_all("default:pine_tree",
                {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=3, wood=1},
                {"default_pine_tree.png"},
                S("Pine Tree"))

-- ICE
-------
register_all("default:ice",
                {cracky=3, puts_out_fire=1, cools_lava=1},
                {"default_ice.png"},
                S("Ice"))


-- OBSIDIAN
-----------
register_all("default:obsidian_block",
                {cracky=1, level=2},
                {"default_obsidian_block.png"},
                S("Obsidian"))

-- Bronze
--------
register_all("default:bronzeblock",
                {cracky=1, level=2},
                {"default_bronze_block.png"},
                S("Bronze"))


-- WROUGHT IRON
---------------
register_all("default:steelblock",
                {cracky=1, level=2},
                {"technic_wrought_iron_block.png"},
                S("Wrought Iron"))

-- Zinc
--------
register_all("technic:zinc_block",
                {cracky=1, level=2},
                {"technic_zinc_block.png"},
                S("Zinc"))

-- Cast Iron
------------
register_all("technic:cast_iron_block",
                {cracky=1, level=2},
                {"technic_cast_iron_block.png"},
                S("Cast Iron"))

-- Stainless Steel
------------------
register_all("technic:stainless_steel_block",
                {cracky=1, level=2},
                {"technic_stainless_steel_block.png"},
                S("Stainless Steel"))

-- Carbon steel
---------------
register_all("technic:carbon_steel_block",
                {cracky=1, level=2},
                {"technic_carbon_steel_block.png"},
                S("Carbon Steel"))

-- Brass
--------
register_all("technic:brass_block",
                {cracky=1, level=2},
                {"basic_materials_brass_block.png"},
                S("Brass"))

-- Copper
---------
register_all("default:copperblock",
                {cracky=1, level=2},
                {"default_copper_block.png"},
                S("Copper"))

-- Tin
------
register_all("default:tinblock",
                {cracky=1, level=2},
                {"default_tin_block.png"},
                S("Tin"))

-- Gold
-------
register_all("default:goldblock",
                {cracky=1, level=2},
                {"default_gold_block.png"},
                S("Gold"))


-- Marble
------------
register_all("technic:marble",
                {cracky=3},
                {"technic_marble.png"},
                S("Marble"))

-- Granite
------------
register_all("technic:granite",
                {cracky=1},
                {"technic_granite.png"},
                S("Granite"))



-- Glostone
------------
register_all("ethereal:glostone",
		{cracky=1, light_source=13},
		{"ethereal_glostone.png"},
		S("Glo Stone"))

-- Crystal block
----------------
register_all("ethereal:crystal_block",
			{snappy=2, choppy=2, oddly_breakable_by_hand=2},
			{"ethereal_crystal_block.png"},
			S("Crystal"))

-- Ethereal Wood types
-------------------
register_all("ethereal:banana_wood",
			{snappy=2, choppy=2, oddly_breakable_by_hand=2},
			{"ethereal_banana_wood.png"},
			S("Banana Wood"))
register_all("ethereal:banana_trunk",
			{snappy=2, choppy=2, oddly_breakable_by_hand=2},
			{"ethereal_banana_trunk.png"},
			S("Banana Trunk"))

register_all("ethereal:frost_wood",
			{snappy=2, choppy=2, oddly_breakable_by_hand=2},
			{"ethereal_frost_wood.png"},
			S("Frost Wood"))
register_all("ethereal:frost_tree",
			{snappy=2, choppy=2, oddly_breakable_by_hand=2},
			{"ethereal_frost_tree.png"},
			S("Frost Tree"))

register_all("ethereal:willow_wood",
			{snappy=2, choppy=2, oddly_breakable_by_hand=2},
			{"ethereal_willow_wood.png"},
			S("Willow Wood"))
register_all("ethereal:willow_trunk",
			{snappy=2, choppy=2, oddly_breakable_by_hand=2},
			{"ethereal_willow_trunk.png"},
			S("Willow Trunk"))

register_all("ethereal:yellow_wood",
			{snappy=2, choppy=2, oddly_breakable_by_hand=2},
			{"ethereal_yellow_wood.png"},
			S("Healing Tree Wood"))
register_all("ethereal:yellow_trunk",
			{snappy=2, choppy=2, oddly_breakable_by_hand=2},
			{"ethereal_yellow_tree.png"},
			S("Healing Tree Trunk"))

register_all("ethereal:redwood_wood",
			{snappy=2, choppy=2, oddly_breakable_by_hand=2},
			{"ethereal_redwood_wood.png"},
			S("Redwood"))
register_all("ethereal:redwood_trunk",
			{snappy=2, choppy=2, oddly_breakable_by_hand=2},
			{"ethereal_redwood_trunk.png"},
			S("Redwood Trunk"))

register_all("ethereal:sakura_wood",
			{snappy=2, choppy=2, oddly_breakable_by_hand=2},
			{"ethereal_sakura_wood.png"},
			S("Sakura"))
register_all("ethereal:sakura_trunk",
			{snappy=2, choppy=2, oddly_breakable_by_hand=2},
			{"ethereal_sakura_trunk.png"},
			S("Sakura Trunk"))


-- Glorious bamboo
-------------------
register_all("ethereal:bamboo_floor",
			{snappy=2, choppy=2, oddly_breakable_by_hand=2},
			{"ethereal_bamboo_floor.png"},
			S("Bamboo"))


-- Tiles
------------
register_all("moreblocks:stone_tile",
		{stone=1, cracky=3},
		{"moreblocks_stone_tile.png"},
		S("Stone Tile"))

register_all("moreblocks:split_stone_tile",
		{stone=1, cracky=3},
		{"moreblocks_split_stone_tile.png"},
		S("Split Stone Tile"))

register_all("moreblocks:checker_stone_tile",
		{stone=1, cracky=3},
		{"moreblocks_checker_stone_tile.png"},
		S("Checker Stone Tile"))

register_all("moreblocks:cactus_checker",
		{stone=1, cracky=3},
		{"moreblocks_cactus_checker.png"},
		S("Cactus Checker"))

-- Bricks
------------
register_all("moreblocks:cactus_brick",
		{cracky=3},
		{"moreblocks_cactus_brick.png"},
		S("Cactus Brick"))

register_all("moreblocks:grey_bricks",
		{cracky=3},
		{"moreblocks_grey_bricks.png"},
		S("Grey Bricks"))

-- Metals
------------
register_all("moreblocks:copperpatina",
		{cracky=1, level=2},
		{"moreblocks_copperpatina.png"},
		S("Copper Patina"))

-- Glass types
------------

register_all("moreblocks:clean_glass",
			{snappy=2,choppy=2,oddly_breakable_by_hand=3},
			{"moreblocks_clean_glass.png"},
			S("Clean Glass"))

register_all("moreblocks:coal_glass",
			{snappy=2,choppy=2,oddly_breakable_by_hand=3},
			{"moreblocks_coal_glass_stairsplus.png"},
			S("Coal Glass"))

register_all("moreblocks:iron_glass",
			{snappy=2,choppy=2,oddly_breakable_by_hand=3},
			{"moreblocks_iron_glass_stairsplus.png"},
			S("Iron Glass"))


register_all("moretrees:rubber_tree_planks",
			{snappy=2, choppy=2, oddly_breakable_by_hand=2},
			{"moretrees_rubber_tree_wood.png"},
			S("Rubber Tree Planks"))

register_all("maple:maple_wood",
			{snappy=2, choppy=2, oddly_breakable_by_hand=2},
			{"maple_wood.png"},
			S("Maple"))

register_all("farming:hemp_block",
			{snappy = 1, oddly_breakable_by_hand = 1, flammable = 2},
			{"farming_hemp_block.png"},
			S("Hemp Block"))


local clay = {
	{"white", "White"},
	{"grey", "Grey"},
	{"black", "Black"},
	{"red", "Red"},
	{"yellow", "Yellow"},
	{"green", "Green"},
	{"cyan", "Cyan"},
	{"blue", "Blue"},
	{"magenta", "Magenta"},
	{"orange", "Orange"},
	{"violet", "Violet"},
	{"brown", "Brown"},
	{"pink", "Pink"},
	{"dark_grey", "Dark Grey"},
	{"dark_green", "Dark Green"},

	{"terracotta_black", "Terracotta Black"},
	{"terracotta_blue", "Terracotta Blue"},
	{"terracotta_brown", "Terracotta Brown"},
	{"terracotta_cyan", "Terracotta Cyan"},
	{"terracotta_dark_green", "Terracotta Dark Green"},
	{"terracotta_dark_grey", "Terracotta Dark Grey"},
	{"terracotta_green", "Terracotta Green"},
	{"terracotta_grey", "Terracotta Grey"},
	{"terracotta_light_blue", "Terracotta Light Blue"},
	{"terracotta_magenta", "Terracotta Magenta"},
	{"terracotta_orange", "Terracotta Orange"},
	{"terracotta_pink", "Terracotta Pink"},
	{"terracotta_red", "Terracotta Red"},
	{"terracotta_violet", "Terracotta Violet"},
	{"terracotta_white", "Terracotta White"},
	{"terracotta_yellow", "Terracotta Yellow"},
}

for _,c in ipairs(clay) do
	register_all("bakedclay:" .. c[1],
			{cracky=3},
			{"baked_clay_" .. c[1] .. ".png"},
			S(c[2] .. " Clay"))
end
