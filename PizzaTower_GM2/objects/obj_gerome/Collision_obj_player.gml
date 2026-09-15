if global.panic
{
	global.gerome = true;
	ds_list_add(global.saveroom, id);
	global.stylelock = 1;					
	global.collect += 3000;
	global.combotime = 60;
	with (instance_create(x, y, obj_smallnumber))
	{
		number = string(3000);
	}
	fmod_event_one_shot_3d("event:/sfx/voice/geromegot", x, y);
	instance_create(x, y, obj_geromefollow);
	instance_create(x, y, obj_baddietaunteffect);
	//if (!instance_exists(obj_fadeout))
	//{
		//with (obj_player)
		//{
		//	targetDoor = "LAP";
		//	targetRoom = other.targetRoom;
		//}
	for (var i = 0; i < ds_list_size(global.escaperoom); i++)
	{
		var b = ds_list_find_value(global.escaperoom, i);
		var q = ds_list_find_index(global.baddieroom, b);
		var t = false;
		if (q == -1)
		{
			q = ds_list_find_index(global.saveroom, b);
			t = true;
		}
		if (q != -1)
		{
			if (!t)
			{
				ds_list_delete(global.baddieroom, q);
			}
			else
			{
				ds_list_delete(global.saveroom, q);
			}
		}
	}
	global.laps++;
	global.lap = true;
	//	instance_create(0, 0, obj_fadeout);
	//}
	instance_destroy();
}

if !global.panic
{
	event_inherited()
}