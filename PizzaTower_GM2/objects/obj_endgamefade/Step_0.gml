if (fadein)
{
	fadealpha = approach(fadealpha, 1, 0.1);
}
else
{
	fadealpha = approach(fadealpha, 0, 0.1);
	if (fadealpha <= 0)
	{
		instance_destroy();
	}
}
