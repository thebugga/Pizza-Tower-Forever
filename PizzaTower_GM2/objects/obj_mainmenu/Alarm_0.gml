//if (!showswap)
//{
//	global.swapmode = false;
//	scr_start_game(currentselect + 1, shownoise ? "Noise" : "Peppino");
//}
//else
//{
var grouparr = ["characterselectgroup"];
with (obj_player)
{
	targetRoom = characterselect;
	targetDoor = "A";
	state = "titlescreen";
	character = global.game[other.currentselect].character
}
global.swapmode = true;
global.currentsavefile = currentselect + 1;
with (instance_create(0, 0, obj_fadeout))
{
	group_arr = grouparr;
}
//}
