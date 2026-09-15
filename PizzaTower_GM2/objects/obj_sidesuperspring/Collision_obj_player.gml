with (other)
{
	if (state != "gotoplayer")
	{
		if (state == "bombpepside" || state == "motorcycle" || state == "slipnslide" || state == "rocket" || state == "grind" || state == "tumble" || state == "cheeseball" || state == "knightpepslopes" || state == "machroll" || state == "mach3" || state == "mach2")
		{
			other.sprite_index = spr_sidespringblock_bounce;
			other.image_index = 0;
			if (xscale != other.image_xscale)
			{
				xscale = other.image_xscale;
			}
		}
	}
}
