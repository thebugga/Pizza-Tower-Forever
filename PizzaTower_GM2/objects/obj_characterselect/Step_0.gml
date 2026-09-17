scr_menu_getinput();
if (!ready)
{
	if (!global.swapmode || obj_inputAssigner.player_input_device[obj_inputAssigner.player_index] > -2)
	{
		var move = key_left2 + key_right2;
		selected += move;
		if (move != 0)
		{
			fmod_event_one_shot_3d("event:/sfx/pep/step", room_width / 2, room_height / 2);
		}
		if (selected < 0)
		{
			selected = 2;
		}
		else if (selected > 2)
		{
			selected = 0;
		}
	}
	if ((key_jump || key_start) && (!global.swapmode || obj_inputAssigner.swap_ready))
	{
		ready = true;
		alarm[0] = 100;
		fmod_event_instance_stop(obj_music.music.event, true);
		if (!global.swapmode)
		{
			if (selected == 0)
			{
				fmod_event_one_shot("event:/sfx/ui/pepselect");
				obj_peppinoselect.sprite_index = spr_peppinoselected;
				obj_peppinoselect.image_index = 0;
				with (obj_player1)
				{
					character = "Peppino";
					ispeppino = true;
					scr_characterspr();
				}
			}
			else if (selected == 1)
			{
				fmod_event_one_shot("event:/sfx/ui/noiseselect");
				obj_noiseselect.sprite_index = spr_noiseselected;
				obj_noiseselect.image_index = 0;
				with (obj_player1)
				{
					character = "Noise";
					ispeppino = false;
					scr_characterspr();
				}
			}
			else if (selected == 2)
			{
				fmod_event_one_shot("event:/sfx/ui/pepperselect");
				obj_pepperselect.sprite_index = spr_pepperselected;
				obj_pepperselect.image_index = 0;
				with (obj_player1)
				{
					character = "Pepperman";
					ispeppino = true;
					scr_characterspr();
				}
			}
		}
		else
		{
			fmod_event_one_shot("event:/sfx/ui/pepselect");
			fmod_event_one_shot("event:/sfx/ui/noiseselect");
			obj_peppinoselect.sprite_index = spr_peppinoselected;
			obj_peppinoselect.image_index = 0;
			obj_noiseselect.sprite_index = spr_noiseselected;
			obj_noiseselect.image_index = 0;
			with (obj_player1)
			{
				character = other.selected == 0 ? "Peppino" : "Noise";
				ispeppino = true;
				scr_characterspr();
			}
		}
	}
}
