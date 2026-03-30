function scr_player_bossintro()
{
	if (live_call()) return live_result;
	hsp = 0;
	xscale = 1;
	hurted = false;
	inv_frames = false;
	if (sprite_index == spr_player_bossintro && ANIMATION_END)
	{
		state = states.normal;
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
