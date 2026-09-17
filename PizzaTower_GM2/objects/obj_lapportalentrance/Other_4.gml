if global.gerome
{
	with (obj_player)
	{
		sprite_index = spr_bodyslamstart;
		image_index = 0;
		state = "freefallprep";
		freefallsmash = false;
		vsp = -5;
		p = true;
		x = other.x;
		y = other.y;
		roomstartx = x;
		roomstarty = y;
		if (targetDoor == "LAP")
		{
			with (obj_pizzaface)
			{
				x = other.x;
				y = other.y;
			}
		}
	}
}