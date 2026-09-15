image_speed = 0.35;
trans = lerp(trans, !destroyed, 0.1);

with (playerid)
{
	if (!place_meeting(x, y, other.hitboxid))
	{
<<<<<<< HEAD
		instance_destroy(other);
	}
	if (!grounded || (state != "default" && state != "ratmount"))
	{
		instance_destroy(other);
=======
		other.destroyed = true;
		arrowID = noone
>>>>>>> 7d427903e0d0852042ed29a17ede6d2d9282d615
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