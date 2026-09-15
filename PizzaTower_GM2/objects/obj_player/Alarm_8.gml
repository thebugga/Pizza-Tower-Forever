if (state == "hurt")
{
	state = "default";
	movespeed = 0;
	if (scr_solid(x, y))
	{
		var ty = try_solid(0, 1, obj_solid, 32);
		if (ty != -1)
		{
			y += ty;
		}
	}
}
else if (state == "ratmounthurt")
{
	state = "ratmount";
	movespeed = 0;
}
