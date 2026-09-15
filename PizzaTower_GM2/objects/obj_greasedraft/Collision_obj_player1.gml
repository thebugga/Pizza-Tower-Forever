if other.in_water == true
{
	with (other)
	{
		if (state != "current")
		{
			sprite_index = spr_machfreefall
			state = "current"
		}
	}
}