function save_level()
{
	if (live_call()) return live_result;
	with (obj_editor)
	{
		saved_editor_state = editor_state;
		editor_state = editorstates.save_level;
		save_step = -1;
	}
}
