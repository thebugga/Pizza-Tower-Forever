image_speed = 0.35;
trans = lerp(trans, !destroyed, 0.1);

with (playerid)
{
	if (!place_meeting(x, y, other.hitboxid))
	{
		other.destroyed = true;
		arrowID = noone
	}
}

if (instance_exists(hitboxid))
{
	x = hitboxid.x;
	y = hitboxid.y;
}
else
{
	instance_destroy();	
}

if (destroyed)
{
	instance_destroy();	
}