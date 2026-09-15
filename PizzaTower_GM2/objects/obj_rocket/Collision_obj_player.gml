if (buffer > 0)
{
	exit;
}
with (other)
{
	if (other.playerid == noone && state != "rocket" && state != "actor" && state != "rocketslide" && state != "gotoplayer")
	{
		xscale = other.image_xscale;
		state = "rocket";
		other.playerid = id;
		other.buffer = 10;
		if character == "Peppino"
		{
			create_transformation_tip(lang_get_value("rockettip"), "rocket");
		}
		else
		{
			create_transformation_tip(lang_get_value("rockettipN"), "rocketN");
		}
		sprite_index = spr_rocketstart;
		image_index = 0;
		if (movespeed < 8)
		{
			movespeed = 8;
		}
		x = other.x;
		y = other.y + 4;
	}
}
