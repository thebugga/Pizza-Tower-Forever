if global.game[currentselect].character == ""
{
	var grouparr = ["characterselectgroup"];
	with obj_player1
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
	with obj_player1
	{
		character = global.game[other.currentselect].character
		ispeppino = true
		if global.game[other.currentselect].character == "N"
		{
			character = "P"
			ispeppino = false
			other.shownoise = true
		}
		if global.game[other.currentselect].character == "D"
		{
			character = "D"
			ispeppino = false
			other.shownoise = true
		}
		scr_characterspr()
	}
	scr_start_game(currentselect + 1, obj_player1.ispeppino);
}