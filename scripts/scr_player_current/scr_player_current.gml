function scr_player_current()
{
	if (live_call()) return live_result;
	if (!place_meeting(x, y, obj_current))
	{
		state = states.normal;
	}
	sprite_index = spr_player_slipnslide;
	image_speed = 0.35;
}
