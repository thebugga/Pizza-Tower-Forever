function commands_update()
{
	if (live_call()) return live_result;
	if (key_redo)
	{
		if (command_current < ds_list_size(commands_list))
		{
			var cmd = ds_list_find_value(commands_list, command_current++);
			cmd.execute();
		}
	}
	if (key_undo)
	{
		if (command_current > 0)
		{
			var cmd = ds_list_find_value(commands_list, --command_current);
			cmd.undo();
		}
	}
}
