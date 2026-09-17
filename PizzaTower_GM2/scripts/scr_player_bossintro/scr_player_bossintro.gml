function player_bossintro()
{
	hsp = 0;
	xscale = 1;
	hurted = false;
	inv_frames = false;
	if (sprite_index == spr_player_bossintro && ANIMATION_END)
	{
		state = "default";
		image_index = 0;
	}
	if (sprite_index == spr_player_levelcomplete && ANIMATION_END)
	{
		image_speed = 0;
	}
	else
	{
		image_speed = 0.35;
	}
}
