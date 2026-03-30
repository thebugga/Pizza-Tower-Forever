function cutscene_entrance_middle()
{
	if (live_call()) return live_result;
	with (obj_solidpillar)
	{
		destroy = true;
		instance_destroy();
	}
	cutscene_end_action();
}
