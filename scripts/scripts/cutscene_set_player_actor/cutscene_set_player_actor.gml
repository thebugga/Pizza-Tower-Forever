function cutscene_set_player_actor()
{
	if (live_call()) return live_result;
	with (obj_player)
	{
		if (check_player_coop())
		{
			state = states.actor;
			image_speed = 0.35;
		}
	}
	cutscene_end_action();
}
