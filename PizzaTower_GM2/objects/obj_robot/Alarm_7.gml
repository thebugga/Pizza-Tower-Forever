alarm[7] = 10;
if (state == "mach1" || state == "enemy_throw" || state == "tackle" || state == "slap")
{
	with (create_red_afterimage(x, y, sprite_index, image_index - 1, image_xscale))
	{
		if (other.state != "enemy_throw" && other.state != "slap")
		{
			playerid = other.id;
		}
	}
}
