function scr_player_gottreasure()
{
	if (live_call()) return live_result;
	sprite_index = spr_gottreasure;
	mach2 = 0;
	image_speed = 0.2;
}
