with (other)
{
	if ((!instakillmove || state == "mach2") && state != "animatronic" && state != "bump" && other.state == states.walk && state != "chainsaw")
	{
		fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
		vsp = -4;
		hsp = -3 * xscale;
		state = "bump";
		sprite_index = spr_bump;
		image_index = 0;
		other.state = "bump";
		other.sprite_index = spr_clownmato_bounce;
		other.image_index = 0;
	}
}
