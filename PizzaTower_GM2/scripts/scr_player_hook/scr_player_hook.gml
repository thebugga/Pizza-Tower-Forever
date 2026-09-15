function player_hook()
{
	if (key_jump)
	{
		state = "jump";
		sprite_index = spr_jump;
		image_index = 0;
		vsp = -11;
		jumpstop = false;
	}
}
