with (other)
{
	if (vsp > -5)
	{
		vsp = approach(vsp, -5, 5);
	}
	noisewalljump = 0;
	if (state == "jump")
	{
		sprite_index = spr_machfreefall;
	}
	jumpstop = true;
	if ((state == "machslide" || state == "freefall") || (state == "tumble" && sprite_index != spr_dive))
	{
		state = "jump";
		movespeed = 0;
		vsp = -5;
		grounded = false;
		if (sprite_index == spr_mach3boost || sprite_index == spr_machslideboost)
		{
			xscale *= -1;
		}
		sprite_index = spr_machfreefall;
	}
	if (!fmod_event_instance_is_playing(global.snd_ventilator))
	{
		scr_fmod_soundeffect(global.snd_ventilator, x, y);
	}
	else
	{
		fmod_event_instance_set_3d_attributes(global.snd_ventilator, x, y);
	}
}
