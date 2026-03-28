function do_dialog(_dialog)
{
	with (instance_create(x, y, obj_dialogcontroller))
	{
		npcID = other.id;
		dialog = _dialog;
		dialogsprite = dialog[0][1];
		currenttext = scr_calculate_text(dialog[0][0]);
		dialogheight = scr_calculate_height(currenttext);
	}
	with (obj_player)
	{
		if (state == states.ghostpossess)
		{
			visible = true;
			with (possessID)
			{
				state = states.stun;
				stunned = 50;
			}
		}
		sprite_index = spr_idle;
		image_speed = 0.35;
		state = states.actor;
		hsp = 0;
		vsp = 0;
		movespeed = 0;
	}
}

function npc_do_dialog()
{
	do_dialog(dialog);
}

function do_dialog_cutscene(_sceneinfo, _x = 0, _y = 0)
{
	with (instance_create(_x, _y, obj_cutscene_handler))
	{
		scene_info = _sceneinfo;
		for (var i = 0; i < array_length(scene_info); i++)
		{
			scene_info[i][0] = method(id, scene_info[i][0]);
		}
	}
}
