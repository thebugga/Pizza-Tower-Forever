function cutscene_title_start()
{
	if (live_call()) return live_result;
	with (obj_player1)
	{
		state = states.actor;
	}
	cutscene_end_action();
}

function cutscene_title_middle()
{
	if (live_call()) return live_result;
	var finish = false;
	with (obj_title)
	{
		collide = true;
		if (grounded)
		{
			finish = true;
		}
	}
	if (finish)
	{
		cutscene_end_action();
	}
}

function cutscene_title_end()
{
	if (live_call()) return live_result;
	with (obj_player1)
	{
		sprite_index = spr_idle;
	}
	if (obj_inputAssigner.device_selected[0])
	{
		with (obj_player1)
		{
			state = states.normal;
		}
		cutscene_end_action();
	}
	else
	{
		with (obj_inputAssigner)
		{
			press_start = true;
		}
	}
}
