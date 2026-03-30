function cutscene_set_player_normal()
{
	if (live_call()) return live_result;
	with (obj_player)
	{
		if (check_player_coop())
		{
			state = states.normal;
		}
	}
	cutscene_end_action();
}
