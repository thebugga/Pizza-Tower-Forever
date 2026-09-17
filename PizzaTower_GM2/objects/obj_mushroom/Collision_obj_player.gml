if (other.cutscene == false && sprite_index != spr_bigmushroom_bounce && other.state != "gotoplayer")
{
	other.jumpstop = true;
	with (other)
	{
		grounded = false;
		if (state == "machslide")
		{
			state = "jump";
		}
		if (state == "default" || state == "freefall")
		{
			state = "jump";
		}
		if (state == "climbwall")
		{
			state = "mach2";
		}
	}
	if (sprite_index != spr_bigmushroom_bounce || image_index > 5)
	{
		fmod_event_one_shot_3d("event:/sfx/misc/mushroombounce", x, y);
	}
	sprite_index = spr_bigmushroom_bounce;
	if (other.state == "jump" || other.state == "default")
	{
		other.sprite_index = other.spr_machfreefall;
		other.image_index = 0;
	}
	image_index = 0;
	other.noisewalljump = 0;
	other.vsp = -14;
	other.jumpstop = true;
	if (other.isgustavo && other.state != "ratmountskid" && other.state != "mach3")
	{
		if (other.ratmount_movespeed < 12)
		{
			other.sprite_index = spr_player_ratmountmushroombounce;
			if (!other.brick)
			{
				other.sprite_index = spr_lonegustavo_jumpstart;
			}
		}
		else
		{
			other.sprite_index = spr_player_ratmountdashjump;
			if (!other.brick)
			{
				other.sprite_index = spr_lonegustavo_dashjump;
			}
		}
		other.jumpAnim = true;
		other.state = "ratmountjump";
		other.image_index = 0;
	}
}
