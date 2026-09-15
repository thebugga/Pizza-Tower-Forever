function player_golf()
{
	landAnim = false;
	jumpAnim = false;
	movespeed = 0;
	image_speed = 0.35;
	global.combotime = 60;
	global.heattime = 60;
	if (sprite_index == spr_golfidle)
	{
		move = key_left + key_right;
		if (move != 0)
		{
			xscale = move;
		}
		if (input_buffer_slap > 0)
		{
			input_buffer_slap = 0;
			sprite_index = spr_golfswing;
			image_index = 0;
			if (key_up)
			{
				with (golfid)
				{
					shootup = true;
				}
			}
		}
	}
	if (sprite_index == spr_golfswing && ANIMATION_END)
	{
		state = "default";
	}
	if (instance_exists(golfid) && golfid.state != "golf" && golfid.state != "thrown")
	{
		state = "default";
	}
	if (!instance_exists(golfid))
	{
		state = "default";
	}
}
