with (other)
{
	if (other.buffer <= 0 && state == "handstandjump")
	{
		fmod_event_one_shot_3d("event:/sfx/weenie/start", x, y);
		state = "rideweenie";
		movespeed = hsp;
		sprite_index = spr_rideweenie;
		xscale = other.image_xscale;
		dir = xscale;
		jumpstop = true;
		if (vsp < 0)
		{
			vsp = 0;
		}
		instance_destroy(other);
		create_transformation_tip(lang_get_value("weenietip"), "weenie");
	}
}
