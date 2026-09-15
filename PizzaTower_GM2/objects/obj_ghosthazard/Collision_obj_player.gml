with (other)
{
	if (!isgustavo && state != "ghost" && state != "ghostpossess" && state != states.ghostcaught && state != "actor" && state != "parry" && state != "gotoplayer")
	{
		if character == "Peppino"
		{
			create_transformation_tip(lang_get_value("ghosttip"), "ghost");
		}
		else
		{
			create_transformation_tip(lang_get_value("ghosttipN"), "ghostN");
		}
		fmod_event_one_shot("event:/sfx/pep/ghostintro");
		grav = grav / 2;
		state = "ghost";
		movespeed = hsp;
		ghostdash = false;
		ghostdashbuffer = 0;
		ghostpepper = 0;
		ghostangle = 0;
		ghosttimer = 0;
		sprite_index = spr_ghostidle;
		with (instance_create(x, y, obj_baddie_dead))
		{
			hsp = other.image_xscale * 3;
			image_xscale = -other.image_xscale;
			sprite_index = other.spr_dead;
			spr_palette = other.spr_palette;
			paletteselect = other.paletteselect;
			oldpalettetexture = global.palettetexture;
		}
		other.debris = false;
	}
}
