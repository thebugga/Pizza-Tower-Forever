if DEBUG
{
	if keyboard_check_pressed(vk_f1)
	{
		with (obj_player1)
		{
			state = states.debugstate
		}
	}
	if keyboard_check_pressed(vk_f2)
		showcollisions = !showcollisions
	if keyboard_check_pressed(vk_f3)
	{
		with (obj_player1)
		{
			debugstats = !debugstats
		}
	}
	if keyboard_check_pressed(vk_f5)
	{
		active = !active;
		keyboard_string = "";
	}
	if active
	{
		var _search = false;
		if (keyboard_check(vk_anykey) && !keyboard_check(vk_f5))
		{
			input_text += keyboard_string;
			for (var i = 0; i < string_length(keyboard_string); i++)
			{
				var b = string_char_at(keyboard_string, i + 1);
				var d = string_upper(b);
				if d == ""
					d = string_lettersdigits(b);
				keyboard_key_release(ord(d));
			}
			keyboard_string = "";
			_search = true;
		}
		if (keyboard_check(vk_backspace))
		{
			input_text = string_delete(input_text, string_length(input_text), 1);
			keyboard_key_release(vk_backspace);
			_search = true;
		}
		if (keyboard_check_pressed(vk_enter))
		{
			DoCommand(input_text);
			input_text = "";
			keyboard_string = "";
			_search = true;
			active = false;
		}
		if _search
		{
			ds_list_clear(search_commands);
			search_w = 0;
			for (var i = 0; i < ds_list_size(command_list); i++)
			{
				var b = ds_list_find_value(command_list, i);
				var s = b.command_id;
				var d = string_split(input_text, " ");
				var t = d[0];
				if (string_copy(s, 1, string_length(t)) == t)
				{
					var txt = concat(b.command_id, " ", b.format, " - ", b.description);
					ds_list_add(search_commands, txt);
					var w = string_width(txt);
					if w > search_w
						search_w = w;
				}
			}
		}
	}
}
if DEBUG
{
    var _objs = [
    obj_solid,
    obj_slope,
    obj_platform,
    obj_ladder,
   
    obj_grindrail,
    obj_grindrailslope,
   
    obj_secretblock,
    obj_secretbigblock,
    obj_secretmetalblock,
    obj_iceblock,
    obj_iceblockslope,
   // obj_mach3solid,
  //  obj_unclimbablewall,
   
   // obj_secrettrigger,
   // obj_tvtrigger,
   // obj_supriseenemyarea,
   // obj_hiddenobjecttrigger,
    obj_pineapplemonsterzone,
    obj_frontcanongoblin_trigger,
    obj_moving_hstop,
    obj_moving_vstop,
   
    obj_tubeleft,
    obj_tuberight,
    obj_tubedown,
    obj_tubeup,
    obj_horseyleft,
    obj_horseyright,
    obj_horseydown,
    obj_horseyup,
    obj_lightsource,
    //obj_chateaulight,
    obj_vigilantespot,
    obj_fakepepsolid,
    //obj_tutorialtrap,
    obj_conveyordespawner,
   // obj_arenalimit,
   // obj_pizzaarrowtrap,

    obj_hallway,
    obj_verticalhallway,
    obj_doorA,
    obj_doorB,
    obj_doorC,
    obj_doorD,
    obj_doorE,
    obj_doorF,
    obj_doorG,
    ]
    for (var i = 0; i < array_length(_objs); i++)
    {
        with _objs[i]
        {
            if object_index = _objs[i]
            {
                visible = other.showcollisions
            }
        }
    }
}