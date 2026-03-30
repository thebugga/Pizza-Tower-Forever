function cutscene_dungeon_middle()
{
	if (live_call()) return live_result;
	with (obj_lavapot)
	{
		destroy = true;
		instance_destroy();
	}
	cutscene_end_action();
}
