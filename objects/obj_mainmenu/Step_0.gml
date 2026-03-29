if (live_call()) return live_result;
scr_menu_getinput();
index += 0.1;

switch state
{
	case states.titlescreen:
		currentselect = -1;
		if !instance_exists(obj_noiseunlocked)
		{
			if (keyboard_check_pressed(vk_anykey) || scr_checkanygamepad(obj_inputAssigner.player_input_device[0]) != -4 || scr_checkanystick(obj_inputAssigner.player_input_device[0]))
			&& !instance_exists(obj_mainmenu_jumpscare)
			{
				state = states.transitioncutscene;
				currentselect = -1;
				darkcount = 7;
				dark = false;
				darkbuffer = 5;
				jumpscarecount = 0;
				fmod_event_one_shot("event:/sfx/ui/lightswitch");
				with obj_music
					fmod_event_instance_set_parameter(music.event, "state", 1, true);
			}
		}
		break;
	
	case states.transitioncutscene:
		if darkbuffer > 0
			darkbuffer--;
		else
		{
			dark = !dark;
			if darkcount > 0
			{
				darkcount--;
				if dark
					darkbuffer = 2 + irandom(3);
				else
					darkbuffer = 6 + irandom(5);
				if darkcount <= 0
				{
					dark = false;
					darkbuffer = 40;
				}
			}
			else
			{
				currentselect = array_equals(global.game, []) ? -1 : 0;
				dark = false;
				state = states.normal;
				image_index = 0;
			}
		}
		break;
	
	case states.normal:
		if key_start && optionbuffer <= 0 && !instance_exists(obj_option) && !instance_exists(obj_noiseunlocked)
		{
			with instance_create(0, 0, obj_option)
				backbuffer = 2;
			break;
		}
		
		if instance_exists(obj_option)
		{
			quitbuffer = 3;
			break;
		}
		
		move = key_left2 + key_right2;
		
		if instance_exists(obj_noiseunlocked)
        {
            move = 0;
            key_jump = false;
            key_jump2 = false;
            key_delete2 = false;
            key_quit2 = false;
            key_down2 = false;
            key_up2 = false;
        }
		
		if move != 0
		{
			if move != 0
				angrybuffer = 0;
			currentselect += move;
			currentselect = clamp(currentselect, -1, array_length(global.game) - 1);
		}
		
		if key_jump
		{
			state = states.wait;
		}
		else if key_quit2
		{
			if quitbuffer <= 0
			{
				state = states.finale;
				exitselect = 1;
			}
		}
		else if (key_delete2 && currentselect > -1)
		{
			deletebuffer = 0;
			state = states.bombdelete;
			deleteselect = 1;
			fmod_event_one_shot_3d("event:/sfx/voice/pig", 480, 270);
		}
		else if key_shoot2
		{
			heatmeteron = !heatmeteron;
			global.heatmeter = !global.heatmeter;
			create_transformation_tip("HEAT METER" + (heatmeteron ? "ON" : "OFF"));
		}
		break;
	
	case states.bombdelete:
		deleteselect += key_left2 + key_right2;
		deleteselect = clamp(deleteselect, 0, 1);
		if key_jump2
			deletebuffer++;
		else
			deletebuffer = 0;
		if ((deleteselect == 1 && key_jump) || (deleteselect == 0 && deletebuffer >= 120))
		{
			if deleteselect == 0
			{
				var file = concat(get_save_folder(), "/saveData", currentselect + 1, ".ini");
				if file_exists(file)
					file_delete(file);
				array_delete(global.game, currentselect, 1)
				currentselect--
				fmod_event_one_shot_3d("event:/sfx/misc/explosion", 480, 270);
				fmod_event_one_shot_3d("event:/sfx/mort/mortdead", 480, 270);
				with obj_camera
				{
					shake_mag = 4;
					shake_mag_acc = 5 / room_speed;
				}
			}
			state = states.normal;
		}
		break;
	
	case states.wait:
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
			state = states.victory;
			fmod_event_instance_stop(obj_music.music.event, true)
			fmod_event_one_shot("event:/sfx/ui/fileselect")
			alarm[0] = 250;
			if shownoise
			{
				alarm[4] = 5;
				timermax = 15;
				explosionsnum = 1;
				fmod_event_one_shot("event:/sfx/ui/menuexplosions");
			}
			fmod_event_one_shot("event:/sfx/misc/collectpizza");
			if currentselect == -1
			{
				array_push(global.game, game_empty())
				currentselect = array_length(global.game) - 1
			}	
		}
		
		break
		
	
	case states.finale:
		exitselect += key_left2 + key_right2;
		exitselect = clamp(exitselect, 0, 1);
		if key_jump
		{
			if exitselect == 0
				game_end();
			else
				state = states.normal;
		}
		break;
}

if state != states.titlescreen && state != states.transitioncutscene
{
	visualselect = lerp(visualselect, currentselect, 0.1)
}


if vsp < 20
	vsp += 0.5;
y += vsp;
if y >= ystart && vsp > 0
{
	y = ystart;
	vsp = 0;
}

if quitbuffer > 0
	quitbuffer--;

if state == states.bombdelete && deletebuffer > 0
{
	if !fmod_event_instance_is_playing(bombsnd)
		fmod_event_instance_play(bombsnd);
}
else
	fmod_event_instance_stop(bombsnd, false);

if optionbuffer > 0
	optionbuffer--;

if state != states.titlescreen && state != states.transitioncutscene
	extrauialpha = Approach(extrauialpha, 1, 0.1);

var acc = 2;

game_icon_index += 0.1;
if game_icon_y != 0
	game_icon_index = 0;

if game_icon_buffer > 0
	game_icon_buffer--;
else
	game_icon_y = 0;

if gamepad_button_check_pressed(obj_inputAssigner.player_input_device[0], gp_shoulderrb)
{
	punch_x = x + irandom_range(-40, 40);
	punch_y = y + irandom_range(-30, 30);
	event_user(0);
}