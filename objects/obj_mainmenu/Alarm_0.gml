var file = concat(get_save_folder(), "/saveData", currentselect + 1, ".ini");
if !file_exists(file)
{
	var grouparr = ["characterselectgroup"];
	with obj_player
	{
		targetRoom = characterselect;
		targetDoor = "A";
		state = states.titlescreen
	}
	global.currentsavefile = currentselect + 1;
	with (instance_create(0, 0, obj_fadeout))
		group_arr = grouparr;
}
else
{
	global.charsavefile = global.game[currentselect].character
	with obj_player
	{
		character = global.game[other.currentselect].character
		ispeppino = true
		scr_characterspr()
	}
	scr_start_game(currentselect + 1, obj_player.ispeppino);
}