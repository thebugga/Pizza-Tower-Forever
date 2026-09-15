function get_editor_data()
{
	global.editor_data = {};
	var _file = working_directory + "/editor/data.json";
	if file_exists(_file)
	{
		var buff = buffer_load(_file);
		var str = buffer_read(buff, buffer_string);	
		var json = json_parse(str);
		
		buffer_delete(buff);
		global.editor_data = json;
		trace(json);
	}
}