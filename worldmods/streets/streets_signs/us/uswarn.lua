local uswarn = {
	{ "4wayintersection", "4-Way Intersection", { yellow = 3, black = 3 } },
	{ "arrow_left", "Left Arrow", { yellow = 3, black = 3 } },
	{ "arrow_right", "Right Arrow", { yellow = 3, black = 3 } },
	{ "arrow_leftright", "Left/Right Arrow", { yellow = 3, black = 3 } },
	{ "bepreparedtostop", "Be Prepared to Stop", { yellow = 3, black = 2 } },
	{ "crossbuck", "Railroad Crossing Crossbuck", { white = 3, black = 1 } },
	{ "deadend", "Dead End", { yellow = 3, black = 3 } },
	{ "divhwyend", "Divided Highway End", { yellow = 3, black = 3 } },
	{ "divhwystart", "Divided Highway Start", { yellow = 3, black = 3 } },
	{ "firetruckwarning", "Fire Truck Warning", { yellow = 3, black = 2 } },
	{ "fork", "Fork", { yellow = 3, black = 2 } },
	{ "leftcurve", "Left Curve", { yellow = 3, black = 3 } },
	{ "rightcurve", "Right Curve", { yellow = 3, black = 3 } },
	{ "leftreversecurve", "Left Reverse Curve", { yellow = 3, black = 3 } },
	{ "rightreversecurve", "Right Reverse Curve", { yellow = 3, black = 3 } },
	{ "leftreverseturn", "Left Reverse Turn", { yellow = 3, black = 3 } },
	{ "rightreverseturn", "Right Reverse Turn", { yellow = 3, black = 3 } },
	{ "leftturn", "Left Turn", { yellow = 3, black = 3 } },
	{ "rightturn", "Right Turn", { yellow = 3, black = 3 } },
	{ "merge_newlane", "Merge into New Lane", { yellow = 3, black = 4 } },
	{ "merge_samelane", "Merge", { yellow = 3, black = 3 } },
	{ "nooutlet", "No Outlet", { yellow = 3, black = 3 } },
	{ "nopassing", "No Passing Zone", { yellow = 3, black = 3 } },
	{ "pedwarning", "Pedestrian Warning", { yellow = 3, black = 3 } },
	{ "rightturn270", "270-Degree Right Turn", { yellow = 3, black = 3 } },
	{ "leftturn270", "270-Degree Left Turn", { yellow = 3, black = 3 } },
	{ "roadnarrows", "Road Narrows", { yellow = 3, black = 3 } },
	{ "rrxing", "Railroad Crossing Advance Warning", { yellow = 3, black = 3 } },
	{ "schoolcrossing", "School Crossing", { yellow = 1, green = 3, black = 3 } },
	{ "stopahead", "Stop Ahead", { yellow = 3, black = 1, red = 1 } },
	{ "tintersection", "T-Intersection", { yellow = 3, black = 3 } },
	{ "tintersection_stem", "T-Intersection (Stem)", { yellow = 3, black = 3 } },
	{ "trafficlightahead", "Traffic Light Ahead", { yellow = 3, black = 1, red = 1, green = 1 } },
	{ "twowaytraffic", "Two-Way Traffic", { yellow = 3, black = 3 } },
	{ "wrongway", "Wrong Way", { red = 5, white = 2 } },
	{ "yieldahead", "Yield Ahead", { yellow = 3, black = 1, red = 1, white = 1 } },
}

for k, v in pairs(uswarn) do
	streets.register_road_sign({
		name = "sign_us_" .. v[1],
		friendlyname = v[2] .. " Sign",
		tiles = {
			"streets_sign_us_" .. v[1] .. ".png",
			"streets_sign_back.png",
		},
		type = "normal",
		section = "uswarn",
		dye_needed = v[3]
	})
end