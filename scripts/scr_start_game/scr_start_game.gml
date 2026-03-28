function scr_start_game(_savefile, _character = "P")
{
	instance_create(x, y, obj_fadeout);
	with (obj_player)
	{
		targetRoom = hub_loadingscreen;
		targetDoor = "A";
	}
	
	with (obj_savesystem)
	{
		character = _character;
	}
	
	global.currentsavefileindex = _savefile;
	gamesave_async_load();
}
