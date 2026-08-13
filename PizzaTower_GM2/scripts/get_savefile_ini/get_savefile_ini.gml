function get_savefile_ini(_character = characters.Peppino)
{
	if (global.swapmode)
	{
		_character = characters.Noise;
	}
	return concat("saveData", global.currentsavefile, global.charPrefix[_character], ".ini");
}
