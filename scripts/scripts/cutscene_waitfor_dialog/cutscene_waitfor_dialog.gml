function cutscene_waitfor_dialog()
{
	if (live_call()) return live_result;
	if (!instance_exists(obj_dialogcontroller))
	{
		cutscene_end_action();
	}
}
