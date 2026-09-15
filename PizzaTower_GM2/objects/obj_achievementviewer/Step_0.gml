if (place_meeting(x, y, obj_player1))
{
	collision = true;
}
else
{
	collision = false;
}
var d = distance_to_object(obj_player);
with (obj_achievementviewer)
{
	if (id != other.id && collision && distance_to_object(obj_player1) <= d)
	{
		other.collision = false;
	}
}
if (collision)
{
	alpha = approach(alpha, 1, 0.1);
}
else
{
	alpha = approach(alpha, 0, 0.1);
}
