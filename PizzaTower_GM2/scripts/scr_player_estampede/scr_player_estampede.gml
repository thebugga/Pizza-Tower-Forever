function player_estampede()
{
	hsp = movespeed;
	move = key_left + key_right;
	if (hsp != 0)
	{
		image_xscale = sign(hsp);
	}
	if (ANIMATION_END && sprite_index != spr_rockethitwall)
	{
		image_speed = 0;
		if (sprite_index == spr_slipbanan2 && abs(hsp) <= 2)
		{
			state = "default";
			movespeed = 0;
		}
	}
	else
	{
		image_speed = 0.35;
	}
	if (grounded && vsp > 0)
	{
		movespeed = approach(movespeed, 0, 0.5);
		if (sprite_index != spr_slipbanan2)
		{
			sprite_index = spr_slipbanan2;
			image_index = 0;
		}
	}
	else if (move != 0)
	{
		movespeed = approach(movespeed, move * 6, 0.5);
	}
	else
	{
		movespeed = approach(movespeed, 0, 0.5);
	}
}
