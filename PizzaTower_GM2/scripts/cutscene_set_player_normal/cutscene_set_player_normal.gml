function cutscene_set_player_default()
{
	with (obj_player)
	{
		if (check_player_coop())
		{
			state = "default";
		}
	}
	cutscene_end_action();
}
