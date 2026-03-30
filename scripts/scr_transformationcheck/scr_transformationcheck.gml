function scr_transformationcheck()
{
	if (live_call()) return live_result;
	if (state != states.actor && state != states.tube)
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
