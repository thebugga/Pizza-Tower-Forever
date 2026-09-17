function scr_transformationcheck()
{
	if (state != "actor" && state != "tube")
	{
		for (var i = 0; i < array_length(transformation); i++)
		{
			if (state == transformation[i])
			{
				return false;
			}
		}
	}
	return true;
}
