if (global.panic == 1)
{
	ds_list_add(global.saveroom, id);
	global.gerome = true;
	global.stylelock = 1;
	fmod_event_one_shot_3d("event:/sfx/voice/geromegot", x, y);
	global.combotime = 60;
	instance_create(x, y, obj_geromefollow);
	instance_create(x, y, obj_baddietaunteffect);
	instance_destroy();
}

if (global.panic == 0)
{
	event_inherited()
}