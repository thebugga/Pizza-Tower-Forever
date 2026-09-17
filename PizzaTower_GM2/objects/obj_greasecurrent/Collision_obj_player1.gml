with (other)
{
	if (state != "current")
	{
		if (movespeed <= 3 || xscale == sign(other.image_xscale))
		{
			sprite_index = spr_slipnslide;
			state = "current";
			xscale = sign(other.image_xscale);
		}
		else if (movespeed > 3)
			movespeed--
	}
}