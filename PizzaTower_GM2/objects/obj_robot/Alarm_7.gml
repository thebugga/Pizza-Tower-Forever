alarm[7] = 10;
if (state == "mach1" || state == states.pizzagoblinthrow || state == "tackle" || state == "slap")
{
	with (create_red_afterimage(x, y, sprite_index, image_index - 1, image_xscale))
	{
		if (other.state != states.pizzagoblinthrow && other.state != "slap")
		{
			playerid = other.id;
		}
	}
}
