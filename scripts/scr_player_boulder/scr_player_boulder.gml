function scr_player_boulder()
{
	if (live_call()) return live_result;
	visible = false;
	image_speed = 0.35;
	scr_collide_player();
}
