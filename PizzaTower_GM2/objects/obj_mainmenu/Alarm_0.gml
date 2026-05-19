if (!showswap)
{
	global.swapmode = false;
	with (obj_player1)
	{
		character = other.shownoise ? "N" : "P";
		scr_characterspr();
	}
	scr_start_game(currentselect + 1, shownoise ? "N" : "P");
}
else
{
	var grouparr = ["characterselectgroup"];
	with (obj_player)
	{
		targetRoom = characterselect;
		targetDoor = "A";
		state = states.titlescreen;
	}
	global.swapmode = true;
	global.currentsavefile = currentselect + 1;
	with (instance_create(0, 0, obj_fadeout))
	{
		group_arr = grouparr;
	}
}
