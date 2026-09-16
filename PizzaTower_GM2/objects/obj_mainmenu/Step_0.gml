scr_menu_getinput();
//index += 0.1;
switch (state)
{
	case "titlescreen":
		if ((keyboard_check_pressed(vk_anykey) || scr_checkanygamepad(obj_inputAssigner.player_input_device[0]) != noone || scr_checkanystick(obj_inputAssigner.player_input_device[0])) && !instance_exists(obj_mainmenu_jumpscare))
			alarm[1] = 5;
		break;
	case "default":
		if changex 
		{
			extrauialpha = twerp(TwerpType.out_quad, extrauialpha, 1, .02);
			x = twerp(TwerpType.out_quad, x, 480, .02);
		}
		if x >= 400
			can_press_stuff = true;
		if can_press_stuff
		{
			if (key_start && optionbuffer <= 0 && !instance_exists(obj_option))
			{
				with (instance_create(0, 0, obj_option))
				{
					backbuffer = 2;
				}
				break;
			}
			if (instance_exists(obj_option))
			{
				quitbuffer = 3;
				break;
			}
			if (key_jump)
			{
				state = "savepicker";
			}
			else if (key_quit2)
			{
				if (quitbuffer <= 0)
				{
					state = states.finale;
					exitselect = 1;
				}
			}
			else if (key_delete2 && currentselect > -1)
			{
				deletebuffer = 0;
				state = "bombdelete";
				deleteselect = 1;
				fmod_event_one_shot_3d("event:/sfx/voice/pig", 480, 270);
			}
		}
		break;
	case "savepicker":
		move = key_left2 + key_right2;
		
		if key_right2
		{
			currentselect += move;
			currentselect = clamp(currentselect, -1, array_length(global.game) - 1);
			makingnewsave = false;
		}
		
		if key_left2 
		{
			makingnewsave = true;
			if key_jump
			{
				array_push(global.game, game_empty())
				currentselect = array_length(global.game) - 1
				state = "wait";
			}
		}
			
		if (key_jump && !makingnewsave)
		{
			state = "wait";
		}
		
		break;
	case "bombdelete":
		deleteselect += (key_left2 + key_right2);
		deleteselect = clamp(deleteselect, 0, 1);
		if (key_jump2)
		{
			deletebuffer++;
		}
		else
		{
			deletebuffer = 0;
		}
		if ((deleteselect == 1 && key_jump) || (deleteselect == 0 && deletebuffer >= 120))
		{
			if (deleteselect == 0)
			{
				var file = concat(get_save_folder(), "/saveData", currentselect + 1, ".ini");
				if (file_exists(file))
				{
					file_delete(file);
				}
				global.game[currentselect] = game_empty();
				fmod_event_one_shot_3d("event:/sfx/misc/explosion", 480, 270);
				fmod_event_one_shot_3d("event:/sfx/mort/mortdead", 480, 270);
				with (obj_menutv)
				{
					if (trigger == other.currentselect && sprite_index == selectedspr)
					{
						sprite_index = transspr;
					}
				}
				with (obj_camera)
				{
					shake_mag = 4;
					shake_mag_acc = 5 / room_speed;
				}
			}
			state = "default";
		}
		break;
	
	case "wait":
		move = key_down2 - key_up2;
		currentmodeselect = wrap(currentmodeselect + move, -1, array_length(global.modes) - 1);
		
		if (currentmodeselect != -1)
		{	
			if (key_left2)
			{
				global.modes[currentmodeselect].enabled = false;	
			}
			if ((array_length(scr_get_activemodes()) < 4 || 1) && key_right2)
			{
				global.modes[currentmodeselect].enabled = true;	
			}
		}
		if (currentmodeselect <= -1 && key_jump)
		{
			state = "victory";
			fmod_event_instance_stop(obj_music.music.event, true)
			fmod_event_one_shot("event:/sfx/ui/fileselect")
			alarm[0] = 250;
			fmod_event_one_shot("event:/sfx/misc/collectpizza");
			if currentselect == -1
			{
				array_push(global.game, game_empty())
				currentselect = array_length(global.game) - 1
			}	
		}
		break;
	case states.finale:
		exitselect += (key_left2 + key_right2);
		exitselect = clamp(exitselect, 0, 1);
		if (key_jump)
		{
			if (exitselect == 0)
			{
				game_end();
			}
			else
			{
				state = "default";
			}
		}
		break;
}
if (vsp < 20)
{
	vsp += 0.5;
}
y += vsp;
if (y >= ystart && vsp > 0)
{
	y = ystart;
	vsp = 0;
}
if (quitbuffer > 0)
{
	quitbuffer--;
}
if (state == "bombdelete" && deletebuffer > 0)
{
	if (!fmod_event_instance_is_playing(bombsnd))
	{
		fmod_event_instance_play(bombsnd);
	}
}
else
{
	fmod_event_instance_stop(bombsnd, false);
}
if (optionbuffer > 0)
{
	optionbuffer--;
}
if (state != "titlescreen" && state != "transitioncutscene")
{
	extrauialpha = approach(extrauialpha, 1, 0.1);
}
var acc = 2;
game_icon_index += 0.1;
if (game_icon_y != 0)
{
	game_icon_index = 0;
}
if (game_icon_buffer > 0)
{
	game_icon_buffer--;
}
else
{
	game_icon_y = 0;
}
with (obj_menutv)
{
	if (trigger == other.currentselect)
	{
		selected = true;
	}
	else
	{
		selected = false;
	}
}
if (gamepad_button_check_pressed(obj_inputAssigner.player_input_device[0], gp_shoulderrb))
{
	punch_x = x + irandom_range(-40, 40);
	punch_y = y + irandom_range(-30, 30);
	event_user(0);
}
