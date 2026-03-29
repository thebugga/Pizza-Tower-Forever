function scr_get_activemodes()
{
	var m =	[];
	for (var i = 0; i < array_length(global.modes); i++)
	{
		if (global.modes[i].enabled)
		{
			array_push(m, global.modes[i]);	
		}
	}
	
	return m;
}

function scr_get_modeindex(_mode) 
{
	for (var i = 0; i < array_length(global.modes); i++)
	{
		if (global.modes[i].name == _mode)
		{
			return i;
		}
	}
	
	return -1;
}

function scr_get_mode(_mode)
{
	return global.modes[scr_get_modeindex(_mode)]
}