y += vsp;
if (vsp < 5)
{
	vsp += grav;
}
if (vsp > -3)
{
	if (dir > 0)
	{
		var tx = xstart + offset;
	}
	else
	{
		var tx = xstart - offset;
	}
	x = approach(x, tx, movespeed);
	movespeed = approach(movespeed, 2, 0.1);
	if (x == tx)
	{
		dir *= -1;
		movespeed *= -1;
		offset += 1;
	}
}
