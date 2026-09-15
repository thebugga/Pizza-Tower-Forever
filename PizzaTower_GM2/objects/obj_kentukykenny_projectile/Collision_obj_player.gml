with (other)
{
	if (scr_transformationcheck())
	{
		if (state != "firemouth" && state != "parry" && hurted == false)
		{
			fmod_event_one_shot_3d("event:/sfx/firemouth/start", x, y);
			create_transformation_tip(lang_get_value("firemouthtip"), "firemouth");
			firemouthflames = false;
			is_firing = false;
			hsp = 0;
			movespeed = 0;
			state = "firemouth";
			image_index = 0;
			sprite_index = spr_firemouthintro;
			state = "firemouth";
			bombpeptimer = 3;
			instance_destroy(other);
		}
	}
}
