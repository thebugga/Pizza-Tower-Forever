if (golfcooldown <= 0 && state != "throwing" && state != "stun" && state != "grabbed" && other.state != "golf" && other.state != "grabbed" && other.bigcheeseID == noone)
{
	golfid = other.id;
	shot = false;
	state = "throwing";
	sprite_index = spr_golfburger_golf;
	image_index = 0;
	other.bigcheeseID = id;
	if (shootdir == 0)
	{
		image_xscale *= -1;
	}
	else
	{
		image_xscale = shootdir;
	}
}
