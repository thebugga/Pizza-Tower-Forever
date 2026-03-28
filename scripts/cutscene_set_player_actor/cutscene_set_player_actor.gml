function cutscene_set_player_actor()
{
	with (obj_player)
	{
		state = states.actor;
		image_speed = 0.35;
	}
	cutscene_end_action();
}
