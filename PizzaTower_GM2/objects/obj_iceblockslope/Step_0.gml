if (place_meeting(x, y - 1, obj_player))
{
	var _dir = sign(image_xscale);
	with (obj_player)
	{
		if (state != "climbwall" && (icemovespeed < 2 || place_meeting(x, y + 1, obj_iceblock)) && place_meeting(x, y + 1, other) && scr_slope())
		{
			icemovespeed = 2;
			icedir = -_dir;
		}
		if (state == "climbwall")
		{
			icemovespeed = 0;
		}
	}
}
