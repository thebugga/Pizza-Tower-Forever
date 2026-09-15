function do_dialog(_dialog)
{
	with (instance_create(x, y, obj_dialog_controller))
	{
		npcID = other.id;
		dialog = _dialog;
		dialogsprite = _dialog[0][1];
		currenttext = scr_calculate_text(_dialog[0][0]);
		dialogheight = scr_calculate_height(currenttext);
		background_spr = _dialog[0][2];
		character_name = _dialog[0][3];
	}
	with (obj_player)
	{
		sprite_index = spr_player_idle;
		image_speed = 0.35;
		state = "actor";
		hsp = 0;
		vsp = 0;
		movespeed = 0;
	}
}

function npc_do_dialog()
{
	do_dialog(dialog);
}

function vigilante_add_battle()
{
	if (global.vigilantecutscene1 == noone || !global.vigilantecutscene1)
	{
		global.vigilantecutscene1 = true;
		quick_ini_write_real(get_savefile_ini(), "cutscene", "vigilante1", true);
	}
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
