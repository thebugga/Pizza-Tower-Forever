with (other)
{
	if (other.hurtplayer == false)
	{
		if (key_jump2)
		{
			vsp = -20;
			if (state == "default" || state == "jump" || hsp == 0)
			{
				sprite_index = spr_playerV_superjump;
				state = "jump";
			}
			image_index = 0;
			jumpAnim = true;
			jumpstop = true;
			other.hurtplayer = true;
		}
	}
}
