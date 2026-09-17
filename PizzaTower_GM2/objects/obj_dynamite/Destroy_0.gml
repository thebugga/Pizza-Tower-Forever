if (playerid.object_index == obj_vigilanteboss && place_meeting(x, y, obj_player))
{
	playerid.state = "walk";
	playerid.walkstate = "walk";
	playerid.movespeed = 0;
}
