function scr_player_graffiti()
{
	if (live_call()) return live_result;
	hsp = 0;
	vsp = -grav;
	image_speed = 0.5;
	if (ANIMATION_END)
	{
		state = states.normal;
		if (tauntstoredisgustavo)
		{
			state = states.ratmount;
		}
		if (global.graffiticount >= global.graffitimax)
		{
			instance_create(x, y, obj_key);
		}
	}
}
