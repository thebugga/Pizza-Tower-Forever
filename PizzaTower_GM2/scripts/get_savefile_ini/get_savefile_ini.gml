function get_savefile_ini(_character = "P")
{
	if (global.swapmode)
	{
		_character = false;
	}
	return concat("saveData", global.currentsavefile, _character == "P" ? "" : _character, ".ini");
}
