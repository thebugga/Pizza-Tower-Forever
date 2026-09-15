if (used)
{
	image_index = 1;
}
else
{
	image_index = 0;
}
var s = 16;
if (place_meeting(x, y - s, obj_player))
{
	with (obj_player)
	{
		var by = 4;
		if (state == "mach3")
		{
			by = 10;
		}
		var bx = 8;
		if (state == "mach3" || state == "ratmounttumble")
		{
			bx = 18;
		}
		if ((state == "mach2" || state == "ratmounttumble" || state == "trashroll" || state == "tumble" || state == "mach3" || state == "trickjump") && y <= (other.y + by) && xscale == sign(other.image_xscale) && place_meeting(x, y + s, other))
		{
			vsp = -12;
			movespeed = 14;
			if (sprite_index != spr_rampjump)
			{
				fmod_event_one_shot("event:/sfx/pep/rampjump");
				sprite_index = spr_rampjump;
				image_index = 0;
				if (character == "Noise")
				{
					image_speed = 2;
				}
			}
			if (isgustavo)
			{
				sprite_index = spr_player_ratmountwalljump;
				state = "ratmounttrickjump";
			}
			else
			{
				state = "trickjump";
			}
			if (!other.used)
			{
				ramp = true;
				other.used = true;
			}
			ramp_buffer = 16;
			trace("trickjump");
		}
	}
}
