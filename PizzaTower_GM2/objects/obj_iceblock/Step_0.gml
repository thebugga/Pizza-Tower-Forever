if (place_meeting(x, y - 1, obj_player))
{
	with (obj_player)
	{
		if (state != "gotoplayer" && place_meeting(x, y + 1, other))
		{
			if (state == "knightpep")
			{
				state = "knightpepslopes";
			}
			else if (state != "knightpepslopes" && state != "Sjumpprep")
			{
				if (state != "machslide" && state != "tumble" && state != "handstandjump" && state != "mach1" && state != "mach2" && state != "mach3")
				{
					if (icedir != -xscale && move != 0)
					{
						if (prevmovespeed != 0)
						{
							icemovespeed = prevmovespeed;
						}
						else
						{
							icemovespeed = 8;
						}
						icedir = -xscale;
						savedicedir = -xscale;
					}
					if (prevmove != move && move == 0)
					{
						icemovespeed = -(prevmovespeed - previcemovespeed);
						icedir = -xscale;
					}
				}
				else if (state == "machslide")
				{
					if (prevstate != state)
					{
						icedir = xscale;
						icemovespeed = floor(abs(movespeed) * 0.5);
					}
				}
				else if (state == "tumble")
				{
					icemovespeed = 0;
				}
			}
		}
	}
}
