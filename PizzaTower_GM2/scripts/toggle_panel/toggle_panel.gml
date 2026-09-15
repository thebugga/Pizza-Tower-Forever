function toggle_panel(_id)
{
	var _closed = false;
	with (obj_panel)
	{
		if (ID == _id && state == "revolver")
		{
			_closed = true;
		}
	}
	if (_closed)
	{
		with (obj_panel)
		{
			if (ID == _id)
			{
				state = "default";
			}
			else if (ID != noone)
			{
				state = "revolver";
			}
		}
	}
	else
	{
		with (obj_panel)
		{
			if (ID != noone)
			{
				state = "revolver";
			}
		}
	}
}
