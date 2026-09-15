function player_graffiti()
{
	hsp = 0;
	vsp = -grav;
	image_speed = 0.5;
	if (ANIMATION_END)
	{
		state = "default";
		if (tauntstoredisgustavo)
		{
			state = "ratmount";
		}
		if (global.graffiticount >= global.graffitimax)
		{
			instance_create(x, y, obj_key);
		}
	}
}
