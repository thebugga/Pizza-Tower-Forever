var _magnet = false;
with (obj_magnet)
{
	if (ballID == other.id)
	{
		_magnet = true;
	}
}
if (!_magnet && state != "golf" && state != "hit" && state != "grabbed" && bigcheeseID == noone)
{
	x = obj_player1.x;
	y = obj_player1.y;
}
