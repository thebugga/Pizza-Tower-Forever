function scr_player_tube()
{
	if (live_call()) return live_result;
	visible = false;
	sprite_index = spr_idle;
	vsp = tube_vsp;
}
