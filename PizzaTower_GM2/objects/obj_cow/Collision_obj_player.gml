with (other)
{
	if (state != "ridecow" && vsp > 0 && !place_meeting(x, yprevious, other))
	{
		if (state == "mort" || state == "mortjump" || state == "mortattack")
		{
			has_mort = true;
		}
		else
		{
			has_mort = false;
		}
	}
}
