if (global.panic || instance_exists(obj_wartimer))
{
	event_inherited();
	if (!scr_get_mode("war").enabled || global.leveltosave == "war")
		exit;
	with (obj_wartimer)
	{
		addseconds += 0.5
		alarm[0] = -1;
		alarm[2] = 1;
	}
}