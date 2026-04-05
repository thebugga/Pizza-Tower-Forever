function scr_get_activemodes()
{
	if (live_call()) return live_result;
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

function scr_get_levelshuffle()
{
	var _levels = []
	with (obj_startgate)
	{
		array_push(_levels, [[level, targetRoom, group_arr], [title_index, titlecard_index, title_music], [sprite_index, bgsprite]]);
	}
	return _levels;
}

function scr_set_levelshuffle(_levels)
{
	var _l = array_length(_levels)
	if (_l <= 0)
	{
		exit;	
	}
	with (obj_startgate)
	{
		var i = random(_l);
		var l = _levels[i];
		
		level = l[0, 0];
		targetRoom = l[0, 1];
		group_arr = l[0, 2];
		
		title_index = l[1, 0];
		titlecard_index = l[1, 1];
		title_music = l[1, 2];
		
		sprite_index = l[2, 0];
		bgsprite = l[2, 1];
		
		array_delete(_levels, i, 1);
		_l--;
	}
	
}