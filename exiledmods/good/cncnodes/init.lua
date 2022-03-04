-- REGISTER MATERIALS AND PROPERTIES FOR NONCUBIC ELEMENTS:
-----------------------------------------------------------

local ethereal = ethereal or {}

function S(strin)
    return strin
end

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

	{ suffix = "column",
	model  = "mymillwork_mach5.obj",
	desc  = "Column",
	sbox   = { type = "fixed",
			fixed = {{-0.5,-0.5,-0.5,0.5,0.5,0.5},
			}
	},
	cbox   = { type = "fixed",
			fixed = {{-0.5,-0.5,-0.5,0.5,0.5,0.5},
			}
	},
	},

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

	{ suffix = "base_oc",
	model  = "mymillwork_mach21.obj",
	desc  = "Baseboard OC",
	sbox   = { type = "fixed",
			fixed = {{0.4375, -0.5, 0.4375, 0.5, -0.1875, 0.5},
			}
	},
	cbox   = { type = "fixed",
			fixed = {{-0.5, -0.5, 0.4375, 0.5, -0.1875, 0.5},
			}
	},
	},

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

	{ suffix = "base_fancy_oc",
	model  = "mymillwork_mach24.obj",
	desc  = "Fancy Baseboard OC",
	sbox   = { type = "fixed",
			fixed = {{0.3125, -0.5, 0.3125, 0.5, 0.1875, 0.5},
			}
	},
	cbox   = { type = "fixed",
			fixed = {{0.3125, -0.5, 0.3125, 0.5, 0.1875, 0.5},
			}
	},
	},

-- mymeshnodes
	{ suffix  = "mymeshnodes_circle",
		model = "mymeshnodes_circle.obj",
		desc  = S("Circle"),
		cbox  = {
			type = "fixed",
			fixed = {
				{ -1/2,  -1/2, -1/2, 1/2,  -2/5, 1/2 },
			}
		}
	},

	{ suffix  = "mymeshnodes_cone",
		model = "mymeshnodes_cone.obj",
		desc  = S("Cone")
	},

	{ suffix  = "mymeshnodes_oct",
		model = "mymeshnodes_oct.obj",
		desc  = S("Octagon")
	},

	{ suffix  = "mymeshnodes_peak",
		model = "mymeshnodes_peak.obj",
		desc  = S("Peak")
	},

	{ suffix  = "mymeshnodes_pole",
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
	{ suffix  = "technic_cnc_stick",
		model = {-0.15, -0.5, -0.15, 0.15, 0.5, 0.15},
		desc  = S("Stick")
	},

	{ suffix  = "technic_cnc_element_end",
		model = {-0.3, -0.5, -0.3, 0.3, 0, 0.5},
		desc  = S("Element End")
	},
	
	{ suffix  = "technic_cnc_element_end_double",
		model = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.5},
		desc  = S("Element End Double")
	},

	{ suffix  = "technic_cnc_element_cross",
		model = {
			{0.3, -0.5, -0.3, 0.5, 0, 0.3},
			{-0.3, -0.5, -0.5, 0.3, 0, 0.5},
			{-0.5, -0.5, -0.3, -0.3, 0, 0.3}},
		desc  = S("Element Cross")
	},
	
	{ suffix  = "technic_cnc_element_cross_double",
		model = {
			{0.3, -0.5, -0.3, 0.5, 0.5, 0.3},
			{-0.3, -0.5, -0.5, 0.3, 0.5, 0.5},
			{-0.5, -0.5, -0.3, -0.3, 0.5, 0.3}},
		desc  = S("Element Cross Double")
	},

	{ suffix  = "technic_cnc_element_t",
		model = {
			{-0.3, -0.5, -0.5, 0.3, 0, 0.3},
			{-0.5, -0.5, -0.3, -0.3, 0, 0.3},
			{0.3, -0.5, -0.3, 0.5, 0, 0.3}},
		desc  = S("Element T")
	},
	
	{ suffix  = "technic_cnc_element_t_double",
		model = {
			{-0.3, -0.5, -0.5, 0.3, 0.5, 0.3},
			{-0.5, -0.5, -0.3, -0.3, 0.5, 0.3},
			{0.3, -0.5, -0.3, 0.5, 0.5, 0.3}},
		desc  = S("Element T Double")
	},

	{ suffix  = "technic_cnc_element_edge",
		model = {
			{-0.3, -0.5, -0.5, 0.3, 0, 0.3},
			{-0.5, -0.5, -0.3, -0.3, 0, 0.3}},
		desc  = S("Element Edge")
	},
	
	{ suffix  = "technic_cnc_element_edge_double",
		model = {
			{-0.3, -0.5, -0.5, 0.3, 0.5, 0.3},
			{-0.5, -0.5, -0.3, -0.3, 0.5, 0.3}},
		desc  = S("Element Edge Double")
	},

	{ suffix  = "technic_cnc_element_straight",
		model = {-0.3, -0.5, -0.5, 0.3, 0, 0.5},
		desc  = S("Element Straight")
	},
	
	{ suffix  = "technic_cnc_element_straight_double",
		model = {-0.3, -0.5, -0.5, 0.3, 0.5, 0.5},
		desc  = S("Element Straight Double")
	},


	{ suffix  = "technic_cnc_oblate_spheroid",
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

	{ suffix  = "technic_cnc_sphere",
		model = "technic_sphere.obj",
		desc  = S("Sphere")
	},
	
	
	{ suffix  = "technic_cnc_sphere_half",
		model = "technic_sphere_half.obj",
		desc  = S("Half Sphere"),
		cbox  = {
			type = "fixed",
			fixed = {
				{ -0.5,  -0.5, -0.5, 0.5,  0, 0.5 },
			}
		}
	},
	
	{ suffix  = "technic_cnc_sphere_quarter",
		model = "technic_sphere_quarter.obj",
		desc  = S("Quarter Sphere"),
		cbox  = {
			type = "fixed",
			fixed = {
				{ -0.5,  -0.5, -0.5, 0.5,  0, 0 },
			}
		}
	},

	{ suffix  = "technic_cnc_cylinder",
		model = "technic_cylinder.obj",
		desc  = S("Cylinder")
	},
	
	{ suffix  = "technic_cnc_cylinder_half",
		model = "technic_cylinder_half.obj",
		desc  = S("Half Cylinder"),
		cbox  = {
			type = "fixed",
			fixed = {
				{ -0.5,  -0.5, -0.5, 0.5,  0, 0.5 },
			}
		}
	},
	
	{ suffix  = "technic_cnc_cylinder_half_corner",
		model = "technic_cylinder_half_corner.obj",
		desc  = S("Half Cylinder Corner"),
		cbox  = {
			type = "fixed",
			fixed = {
				{ -0.5,  -0.5, -0.5, 0.5,  0, 0.5 },
			}
		}
	},

	{ suffix  = "technic_cnc_cylinder_fluted",
		model = "technic_cylinder_fluted.obj",
		desc  = S("Fluted Cylinder Column")
	},
	
	{ suffix  = "technic_cnc_block_fluted",
		model = "technic_block_fluted.obj",
		desc  = S("Fluted Square Column")
	},
	
	{ suffix  = "technic_cnc_twocurvededge",
		model = "technic_two_curved_edge.obj",
		desc  = S("Two Curved Edge/Corner Block")
	},

	{ suffix  = "technic_cnc_onecurvededge",
		model = "technic_one_curved_edge.obj",
		desc  = S("One Curved Edge Block")
	},
	
	{ suffix  = "technic_cnc_innercurvededge",
		model = "technic_inner_curved_edge.obj",
		desc  = S("Inner Curved Edge Block")
	},
	
	{ suffix  = "technic_cnc_opposedcurvededge",
		model = "technic_opposed_curved_edge.obj",
		desc  = S("Opposed Curved Edges Block")
	},
	
	-- large radius

	{ suffix  = "technic_cnc_onecurvededge_lr",
		model = "technic_one_curved_edge_lr.obj",
		desc  = S("One Curved Edge LR Block")
	},
	
	{ suffix  = "technic_cnc_twocurvededge_lr",
		model = "technic_two_curved_edge_lr.obj",
		desc  = S("Two Curved Edges LR Block")
	},
	
	-- 4/16 Diagonal truss
	
	{ suffix  = "technic_cnc_diagonal_truss",
		model = "technic_diagonal_truss.obj",
		desc  = S("Diagonal Truss"),
		cbox  = {
			type = "fixed",
			fixed = {
				{ -0.5,  -0.5, -0.25, 0.5,  0.5, 0.25 },
			}
		}
	},
		
	{ suffix  = "technic_cnc_diagonal_truss_cross",
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
	
	{ suffix  = "technic_cnc_beam216",
		model = "technic_beam_216.obj",
		desc  = S("2/16 Beam"),
		cbox  = {
			type = "fixed",
			fixed = {
				{0.5, 0.5, 0.065, -0.5, 0, -0.065},
			}
		}
	},
	
	{ suffix  = "technic_cnc_beam216_cross",
		model = "technic_beam_216_cross.obj",
		desc  = S("2/16 Beam Cross"),
		cbox  = {
			type = "fixed",
			fixed = {
				{0.5, 0.5, 0.5, -0.5, 0, -0.5},
			}
		}
	},
	
	{ suffix  = "technic_cnc_beam216_tee",
		model = "technic_beam_216_tee.obj",
		desc  = S("2/16 Beam T"),
		cbox  = {
			type = "fixed",
			fixed = {
				{-0.5, 0.5, -0.5, 0.5, 0, 0.0625},
			}
		}
	},
	
	{ suffix  = "technic_cnc_beam216_cross_column",
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


	{ suffix  = "technic_cnc_d45_slope_216",
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
	
	
-- 	{ suffix  = "technic_cnc_d45_beam_216",
-- 		model = "technic_45_beam_216.obj",
-- 		desc  = S("2/16 45° Beam")
-- 	},
	
	-- 2/16 Arch
	
	{ suffix  = "technic_cnc_arch216",
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
	
	{ suffix  = "technic_cnc_arch216_flange",
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
	
	{ suffix  = "technic_cnc_tile_beveled",
		model = "technic_tile_beveled.obj",
		desc  = S("Beveled Tile"),
		cbox  = {
			type = "fixed",
			fixed = {
				{ -1/2,  -1/2, -1/2, 1/2,  -2/5, 1/2 },
			}
		}
	},
	
	{ suffix  = "technic_cnc_spike",
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

	{ suffix  = "technic_cnc_pyramid",
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

	{ suffix  = "technic_cnc_slope_inner_edge_upsdown",
		model = "technic_innercorner_upsdown.obj",
		desc  = S("Slope Upside Down Inner Edge/Corner"),
		sbox  = {
			type = "fixed",
			fixed = { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 }
		},
		cbox  = {
			type = "fixed",
			fixed = {
				{  0.25, -0.25, -0.5,  0.5, -0.5,   0.5  },
				{ -0.5,  -0.25,  0.25, 0.5, -0.5,   0.5  },
				{  0,     0,    -0.5,  0.5, -0.25,  0.5  },
				{ -0.5,   0,     0,    0.5, -0.25,  0.5  },
				{ -0.25,  0.25, -0.5,  0.5,  0,    -0.25 },
				{ -0.5,   0.25, -0.25, 0.5,  0,     0.5  },
				{ -0.5,   0.5,  -0.5,  0.5,  0.25,  0.5  }
			}
		}
	},

	{ suffix  = "technic_cnc_slope_edge_upsdown",
		model = "technic_outercorner_upsdown.obj",
		desc  = S("Slope Upside Down Outer Edge/Corner"),
		cbox  = {
			type = "fixed",
			fixed = {
				{ -8/16,  8/16, -8/16, 8/16,  4/16, 8/16 },
				{ -4/16,  4/16, -4/16, 8/16,     0, 8/16 },
				{     0,     0,     0, 8/16, -4/16, 8/16 },
				{  4/16, -4/16,  4/16, 8/16, -8/16, 8/16 }
			}
		}
	},

	{ suffix  = "technic_cnc_slope_inner_edge",
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

	{ suffix  = "technic_cnc_slope_edge",
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

	{ suffix  = "technic_cnc_slope_upsdown",
		model = "technic_slope_upsdown.obj",
		desc  = S("Slope Upside Down"),
		cbox  = {
			type = "fixed",
			fixed = {
				{ -8/16,  8/16, -8/16, 8/16,  4/16, 8/16 },
				{ -8/16,  4/16, -4/16, 8/16,     0, 8/16 },
				{ -8/16,     0,     0, 8/16, -4/16, 8/16 },
				{ -8/16, -4/16,  4/16, 8/16, -8/16, 8/16 }
			}
		}
	},

	{ suffix  = "technic_cnc_slope",
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
	for _, data in ipairs(programs) do
		register_program(recipeitem, data.suffix, data.model,
			groups, images, description.." "..data.desc, data.cbox, data.sbox)
	end
end

-- CAVEREALMS
-------
if minetest.get_modpath("caverealms") then

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

end

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


-- WROUGHT IRON
---------------
register_all("default:steelblock",
                {cracky=1, level=2},
                {"technic_wrought_iron_block.png"},
                S("Wrought Iron"))

-- Bronze
--------
register_all("default:bronzeblock",
                {cracky=1, level=2},
                {"default_bronze_block.png"},
                S("Bronze"))

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


if minetest.get_modpath("ethereal") then
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
	
	register_all("ethereal:birch_wood",
                {snappy=2, choppy=2, oddly_breakable_by_hand=2},
                {"moretrees_birch_wood.png"},
                S("Birch Wood"))
	register_all("ethereal:birch_trunk",
                {snappy=2, choppy=2, oddly_breakable_by_hand=2},
                {"moretrees_birch_trunk.png"},
                S("Birch Trunk"))
	
	register_all("ethereal:frost_wood",
                {snappy=2, choppy=2, oddly_breakable_by_hand=2},
                {"ethereal_frost_wood.png"},
                S("Frost Wood"))
	register_all("ethereal:frost_tree",
                {snappy=2, choppy=2, oddly_breakable_by_hand=2},
                {"ethereal_frost_tree.png"},
                S("Frost Tree"))
	
	register_all("ethereal:palm_wood",
                {snappy=2, choppy=2, oddly_breakable_by_hand=2},
                {"moretrees_palm_wood.png"},
                S("Palm Wood"))
	register_all("ethereal:palm_trunk",
                {snappy=2, choppy=2, oddly_breakable_by_hand=2},
                {"moretrees_palm_trunk.png"},
                S("Palm Trunk"))
	
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
	
	-- Shaped hedge bush for gardens and parks
	-------------------------------------------
	
	register_all("ethereal:bush",
		{snappy=3, flamable=2},
		{"ethereal_bush.png"},
		S("Bush"))
	
	-- if baked clay isn't added and barebones ethereal is used
	
	if not minetest.get_modpath("bakedclay") then
		-- Clay
		------------
		register_all("bakedclay:red",
				{cracky=3},
				{"baked_clay_red.png"},
				S("Red Clay"))
		
		register_all("bakedclay:orange",
				{cracky=3},
				{"baked_clay_orange.png"},
				S("Orange Clay"))
		
		register_all("bakedclay:grey",
				{cracky=3},
				{"baked_clay_grey.png"},
				S("Grey Clay"))
	end
	
	-- undo-specific items
	if ethereal.mod and ethereal.mod == "undo" then
		register_all("ethereal:olive_wood",
			{snappy=2, choppy=2, oddly_breakable_by_hand=2},
			{"olive_wood.png"},
			S("Olive Wood"))
		register_all("ethereal:olive_trunk",
			{snappy=2, choppy=2, oddly_breakable_by_hand=2},
			{"olive_trunk.png"},
			S("Olive Trunk"))
		--lemon trees have default:wood trunks
	end
	
end


if minetest.get_modpath("moreblocks") then
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

end

if minetest.get_modpath("technic_worldgen") then
	register_all("moretrees:rubber_tree_planks",
                {snappy=2, choppy=2, oddly_breakable_by_hand=2},
                {"moretrees_rubber_tree_wood.png"},
                S("Rubber Tree Planks"))
end

if minetest.get_modpath("pathv7") then
	-- jungle wood already exists (and hence the CNC'd parts would be identical)
	register_all("pathv7:bridgewood",
                {snappy=2, choppy=2, oddly_breakable_by_hand=2},
                {"pathv7_bridgewood.png"},
                S("Bridge Wood"))
end

if minetest.get_modpath("maple") then
	register_all("maple:maple_wood",
                {snappy=2, choppy=2, oddly_breakable_by_hand=2},
                {"maple_wood.png"},
                S("Maple"))
end

if minetest.get_modpath("farming") then
	register_all("farming:hemp_block",
                {snappy = 1, oddly_breakable_by_hand = 1, flammable = 2},
                {"farming_hemp_block.png"},
                S("Hemp Block"))
end

if minetest.get_modpath("bakedclay") then
	
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
	}

	for _,c in ipairs(clay) do
		register_all("bakedclay:" .. c[1],
				{cracky=3},
				{"baked_clay_" .. c[1] .. ".png"},
				S(c[2] .. " Clay"))
	end
	
end