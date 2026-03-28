function cutscene_set_player_normal()
{
	with (obj_player)
	{
		state = states.normal;
	}
	cutscene_end_action();
}
