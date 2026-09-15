switch (state)
{
	case states.idle:
		if (start && distance_to_object(obj_player) <= 150)
		{
			state = "actor";
			substate = states.idle;
			cutscenebuffer = 120;
			with (obj_player)
			{
				state = "actor";
				sprite_index = spr_idle;
				movespeed = 0;
				image_speed = 0.35;
				hsp = 0;
				vsp = 0;
				if (!grounded)
				{
					create_particle(x, y, particletypes.genericpoofeffect);
				}
			}
		}
		break;
	case "actor":
		switch (substate)
		{
			case states.idle:
				if (cutscenebuffer > 0)
				{
					cutscenebuffer--;
				}
				else
				{
					fmod_event_instance_set_parameter(snd, "state", 1, true);
					substate = "default";
					cutscenebuffer = 100;
					sprite_index = spr_pizzafaceshower3;
				}
				break;
			case "default":
				if (cutscenebuffer > 0)
				{
					cutscenebuffer--;
				}
				else
				{
					fmod_event_instance_set_parameter(snd, "state", 2, true);
					substate = "transitioncutscene";
					cutscenebuffer = 100;
					sprite_index = spr_pizzafaceshower2;
				}
				break;
			case "transitioncutscene":
				if (cutscenebuffer > 0)
				{
					cutscenebuffer--;
				}
				else if (sprite_index == spr_pizzafaceshower2)
				{
					fmod_event_instance_set_parameter(snd, "state", 3, true);
					cutscenebuffer = 70;
					sprite_index = spr_pizzafaceshower3;
				}
				else
				{
					fmod_event_instance_set_parameter(snd, "state", 4, true);
					instance_create(x, y, obj_pizzaface_showerprop);
					x += 13;
					y += 16;
					sprite_index = spr_pizzafaceshower4;
					substate = "jump";
					movespeed = 15;
					vsp = -4;
					depth = 5;
				}
				break;
			case "jump":
				movespeed = approach(movespeed, 0, 0.2);
				vsp = approach(vsp, -15, 0.1);
				x += movespeed;
				y += vsp;
				if (!bbox_in_camera(view_camera[0], 50))
				{
					substate = "gameover";
					with (obj_player)
					{
						state = "default";
						landAnim = false;
					}
				}
				break;
			case "gameover":
				y -= 20;
				if (y < -200)
				{
					ini_open_from_string(obj_savesystem.ini_str);
					ini_write_real("Game", "shower", true);
					obj_savesystem.ini_str = ini_close();
					instance_destroy();
				}
				ini_open_from_string(obj_savesystem.ini_str);
				ini_write_real("Game", "shower", true);
				obj_savesystem.ini_str = ini_close();
				break;
		}
		break;
}
fmod_event_instance_set_3d_attributes(snd, x, y);
