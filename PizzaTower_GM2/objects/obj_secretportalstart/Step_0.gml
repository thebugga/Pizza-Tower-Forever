if (room == tower_soundtestlevel && (obj_player1.state == "backtohub" || obj_player1.state == "comingoutdoor" || obj_player1.targetDoor == "A"))
{
	instance_destroy();
	exit;
}
depth = 0;
image_speed = 0.35;
switch (sprite_index)
{
	case spr_secretportal_spawnopen:
		with (obj_heatafterimage)
		{
			visible = false;
		}
		with (obj_player)
		{
			x = other.x;
			y = other.y;
			roomstartx = x;
			roomstarty = y;
			hsp = 0;
			vsp = 0;
			movespeed = 0;
			cutscene = true;
			visible = false;
		}
		waitbuffer = 80;
		drop = false;
		if (ANIMATION_END)
		{
			fmod_event_one_shot_3d("event:/sfx/misc/secretexit", x, y);
			sprite_index = spr_secretportal_spawnidle;
			with (obj_player)
			{
				if (!isgustavo && tauntstoredstate != "knightpep" && tauntstoredstate != "knightpepslopes" && tauntstoredstate != "knightpepbump" && tauntstoredstate != "firemouth")
				{
					visible = true;
					cutscene = false;
					sprite_index = spr_bodyslamstart;
					image_index = 0;
					state = "freefallprep";
					freefallsmash = 0;
					vsp = -5;
				}
				else if (isgustavo)
				{
					state = "ratmount";
				}
				else
				{
					if (state == "knightpep")
					{
						hsp = 0;
					}
					sprite_index = tauntstoredsprite;
				}
			}
		}
		break;
	case spr_secretportal_spawnidle:
		if (!drop)
		{
			with (obj_heatafterimage)
			{
				visible = false;
			}
			with (obj_player)
			{
				if (check_player_coop())
				{
					x = other.x;
					y = other.y - 10;
					visible = true;
					hsp = 0;
					movespeed = 0;
					vsp = 10;
					scale_xs = approach(scale_xs, 1, 0.05);
					scale_ys = approach(scale_ys, 1, 0.05);
					fallinganimation = 0;
					if (scale_xs == 1)
					{
						other.drop = true;
					}
					if (other.drop)
					{
						if (!isgustavo && (tauntstoredstate == "knightpep" || tauntstoredstate == "knightpepslopes" || tauntstoredstate == "knightpepbump" || tauntstoredstate == "firemouth"))
						{
							state = tauntstoredstate;
							movespeed = tauntstoredmovespeed;
							hsp = tauntstoredhsp;
							sprite_index = tauntstoredsprite;
							if (state == "actor" || state == "backbreaker" || state == "chainsaw" || state == "machcancel")
							{
								sprite_index = spr_bodyslamstart;
								image_index = 0;
								state = "freefallprep";
								freefallsmash = 0;
								vsp = -5;
							}
							if (state == "knightpep")
							{
								hsp = 0;
								movespeed = 0;
							}
							else if (state == "knightpepslopes")
							{
								movespeed = 0;
								hsp = 0;
								state = "knightpep";
								sprite_index = spr_knightpepfall;
							}
							else if (state == "firemouth")
							{
								if (sprite_index == spr_firemouthdash)
								{
									hsp = 0;
									movespeed = 0;
									sprite_index = spr_firemouthidle;
								}
							}
						}
					}
				}
			}
		}
		if (drop)
		{
			if (waitbuffer > 0)
			{
				waitbuffer--;
			}
			else
			{
				sprite_index = spr_secretportal_spawnclose;
				image_index = 0;
			}
		}
		break;
	case spr_secretportal_spawnclose:
		if (ANIMATION_END)
		{
			image_index = image_number - 1;
			instance_destroy();
		}
		break;
}
