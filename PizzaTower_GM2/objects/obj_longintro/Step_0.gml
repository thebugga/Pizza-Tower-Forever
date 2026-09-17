with (obj_player)
{
	state = "titlescreen";
}
if (scene >= 0)
{
	scr_menu_getinput();
	if (!showtext && (key_jump || key_start))
	{
		showtext = true;
		alarm[0] = 120;
	}
	else if (showtext && (key_jump || key_start))
	{
		room_goto(Mainmenu);
		exit;
	}
}
var _switch = false;
if (scenebuffer > 0)
{
	scenebuffer--;
}
else
{
	_switch = true;
}
switch (scene)
{
	case -2:
		if (_switch && !instance_exists(obj_logoprop))
		{
			scene++;
			with (instance_create(0, 0, obj_logoprop))
			{
				sprite_index = spr_intro_ridiculumoon;
			}
		}
		break;
	case -1:
		if (_switch && !instance_exists(obj_logoprop))
		{
			scene++;
			with (instance_create(room_width / 2, room_height / 2, obj_logoprop))
			{
				sprite_index = spr_intro_fmod;
				image_xscale = 0.5;
				image_yscale = image_xscale;
			}
		}
		break;
	case 0:
		if (_switch)
		{
			with (instance_create(0, 0, obj_genericfade))
			{
				persistent = true;
				fade = 2;
				deccel = 0.1;
				color = c_white;
			}
			room_goto(Mainmenu);
		}
		break;
}
