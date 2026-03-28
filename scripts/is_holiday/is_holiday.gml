enum holidays
{
	normal,
	halloween,
	easter,
	christmas
}

function is_holiday(holiday)
{
	if global.holiday != holiday
		return false;
	
	for (var i = 0; i < array_length(global.game); i++)
	{
		if (global.game[i].judgement != "none")
		{
			return true;
		}
	}
	return false;
}