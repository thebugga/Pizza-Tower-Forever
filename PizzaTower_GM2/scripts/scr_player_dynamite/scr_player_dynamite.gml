function player_dynamite()
{
	if (grounded)
	{
		hsp = xscale * movespeed;
		if (movespeed > 0)
		{
			movespeed -= 0.1;
		}
	}
	if (grounded)
	{
		hsp = 0;
	}
	landAnim = false;
	if (ANIMATION_END && sprite_index == spr_playerV_dynamitethrow)
	{
		if (key_attack && hsp != 0)
		{
			state = "mach2";
		}
		else
		{
			state = "default";
		}
	}
	image_speed = 0.4;
}
