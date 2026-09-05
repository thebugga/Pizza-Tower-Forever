if scr_get_mode("heatmeter").enabled 
{
	if (global.style > 55 && global.stylethreshold < 3)
	{
		global.stylethreshold += 1;
		global.style = global.style - 55;
	}

	if (global.style < 0 && global.stylethreshold != 0)
	{
		global.stylethreshold -= 1;
		global.style = global.style + 55;
	}

	if (global.style < 0 && global.stylethreshold == 0)
		global.style = 0;
	
	if (global.stylethreshold >= 3 && global.style > 55)
		global.style = 55;
	
	global.stylemultiplier = (global.style + global.stylethreshold * 55) / 220;
}