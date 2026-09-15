if (!other.grabbable)
{
	exit;
}
if (state != "boxxedpepspin")
{
	if (state == "handstandjump" || state == "lungeattack" || state == "punch")
	{
		if (other.state == "default" && scr_transformationcheck() && !cutscene && state != "bombgrab" && (state == "handstandjump" || state == "punch" || state == "lungeattack"))
		{
			state = "bombgrab";
			image_index = 0;
			sprite_index = spr_haulingstart;
			other.defused = true;
			bombgrabID = other.id;
			if (character == "Noise")
			{
				create_transformation_tip(lang_get_value("bombtipN"), "bombtipN");
			}
			fmod_event_one_shot_3d("event:/sfx/noise/bombbounce", x, y);
			with (instance_create(x + (xscale * 25), y, obj_parryeffect))
			{
				sprite_index = spr_grabeffect;
				image_xscale = other.xscale;
				image_speed = 0.35;
			}
			with (other)
			{
				state = "grabbed";
				playerid = other.id;
			}
		}
	}
}
else if (other.kickbuffer <= 0)
{
	other.vsp = -9;
	other.movespeed = 7;
	other.image_xscale = xscale;
	other.kickbuffer = 15;
	other.y--;
	other.defused = true;
}
