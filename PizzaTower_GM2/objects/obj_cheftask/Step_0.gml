if (!finish)
{
	if (!instance_exists(previousID))
	{
		var ty = SCREEN_HEIGHT - 140;
		y = approach(y, ty, movespeed);
		if (abs(ty - y) <= 100)
		{
			movespeed = approach(movespeed, 1, 0.1);
		}
		if (abs(ty - y) <= 16)
		{
			if (alarm[0] == -1)
			{
				alarm[0] = 100;
			}
		}
	}
}
else
{
	var ty = SCREEN_HEIGHT + 200;
	y = approach(y, ty, movespeed);
	movespeed = approach(movespeed, 8, 0.2);
	if (y == ty)
	{
		instance_destroy();
	}
}
