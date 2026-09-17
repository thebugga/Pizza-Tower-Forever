function player_playersuperattack()
{
	image_speed = 0.5;
	switch (superattackstate)
	{
		case "transitioncutscene":
			sprite_index = spr_rageidle;
			with (bossID)
			{
				hsp = 0;
				vsp = 0;
				x = hitX;
				y = hitY;
			}
			hsp = 0;
			vsp = 0;
			x = hitX;
			y = hitY;
			if (hitLag > 0)
			{
				hitLag--;
			}
			else
			{
				superattackstate = "jump";
			}
			break;
		case "jump":
			sprite_index = spr_grab;
			var dir = point_direction(x, y, bossID.x, bossID.y);
			var spd = 20;
			hsp = 0;
			vsp = 0;
			hsp = lengthdir_x(spd, dir);
			vsp = lengthdir_y(spd, dir);
			if (place_meeting(x, y, bossID))
			{
				superattackstate = "punch";
				randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_player_suplexmash5, spr_player_suplexmash6, spr_player_suplexmash7, spr_punch]);
				punchcount = 20;
				image_index = 0;
			}
			break;
		case "punch":
			vsp = 0;
			hsp = xscale * 2;
			with (bossID)
			{
				x = other.x;
				y = other.y;
				hsp = other.hsp;
				image_xscale = -other.xscale;
			}
			if (ANIMATION_END)
			{
				if (punchcount > 0)
				{
					punchcount--;
					randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_player_suplexmash5, spr_player_suplexmash6, spr_player_suplexmash7, spr_punch]);
					image_index = 0;
					fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", x, y);
					with (bossID)
					{
						boss_hurt_noplayer(25);
						state = "playersuperattack";
					}
				}
				else
				{
					with (bossID)
					{
						boss_hurt_noplayer(30);
						state = "hit";
						hitX = x;
						hitY = y;
						hitvsp = -11;
						stunned = 10;
						image_xscale = -other.xscale;
						hithsp = -image_xscale * 12;
						movespeed = abs(hsp);
						hitLag = 10;
					}
					fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", x, y);
					superattackstate = "grab";
					sprite_index = choose(spr_finishingblow1, spr_finishingblow2, spr_finishingblow3, spr_finishingblow4, spr_finishingblow5);
					image_index = 0;
					finishingblow = false;
				}
			}
			break;
		case "grab":
			if (image_index < 7)
			{
				hsp = 0;
				vsp = 0;
			}
			else if (!finishingblow)
			{
				finishingblow = true;
				vsp = -4;
				hsp = -xscale * 4;
			}
			if (ANIMATION_END)
			{
				state = "default";
			}
			break;
	}
}
