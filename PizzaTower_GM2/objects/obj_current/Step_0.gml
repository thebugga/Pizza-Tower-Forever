instance_destroy(instance_place(x, y - 1, obj_baddie));
if (place_meeting(x, y - 1, obj_player))
{
	with (obj_player)
	{
		if (state != "golf" && state != "tackle" && state != "gotoplayer" && state != "stringfall" && state != "stringjump" && state != "stringfling")
		{
			if (place_meeting(x, y + 1, other))
			{
				if ((state != "trashjump" && state != "trashroll") || character == "Noise")
				{
					if (!instance_exists(obj_surfback) || ispeppino)
					{
						if (state != "barrel" && state != "barreljump" && state != "barrelslide" && state != "barrelclimbwall")
						{
							if (state != "slipnslide" || sprite_index != spr_currentplayer)
							{
								fmod_event_one_shot_3d("event:/sfx/misc/waterslidesplash", x, y);
							}
							state = "slipnslide";
							sprite_index = spr_currentplayer;
						}
						else
						{
							state = "barrelslide";
							if (sprite_index != spr_barrelslipnslide)
							{
								sprite_index = spr_barrelroll;
							}
						}
						xscale = sign(other.image_xscale);
						movespeed = 20;
					}
					else if (state != "slipnslide")
					{
						fmod_event_one_shot_3d("event:/sfx/misc/waterslidesplash", x, y);
						movespeed = 15;
						state = "slipnslide";
					}
				}
				else
				{
					fmod_event_one_shot_3d("event:/sfx/misc/waterslidesplash", x, y);
					with (instance_create(x, y, obj_slidecloud))
					{
						image_xscale = other.xscale;
						sprite_index = spr_watereffect;
					}
					vsp = -6;
					image_index = 0;
					if (state == "trashjump")
					{
						state = "trashroll";
						movespeed = abs(movespeed);
						dir = xscale;
						movespeed += 3;
						instance_create(x, y, obj_jumpdust);
						sprite_index = spr_player_trashslide;
					}
				}
			}
		}
	}
}
