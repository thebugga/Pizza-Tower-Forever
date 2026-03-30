function commands_init()
{
	if (live_call()) return live_result;
	commands_list = ds_list_create();
	command_current = 0;
}
