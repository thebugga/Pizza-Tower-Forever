if (active)
{
	if (place_meeting(x, y - 1, other) && other.vsp > 1 && other.state != "barrel" && other.state != "barrelslide" && other.state != "barreljump" && other.state != "barrelclimbwall")
	{
		with (other)
		{
			instance_create(x, y, obj_genericpoofeffect);
			movespeed = hsp;
			state = "barrel";
			image_index = 0;
			create_transformation_tip(lang_get_value("barreltip"), "barrel");
		}
		active = false;
		alarm[0] = 150;
	}
}
