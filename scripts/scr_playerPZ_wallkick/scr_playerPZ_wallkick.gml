function scr_playerPZ_wallkick()
{
	floatyGrab = 0
	move = key_left + key_right
	hsp = movespeed
	
	if (move != 0)
	{
		movespeed = Approach(movespeed, 10 * move, 0.8)
		dir = move
	}
	else
	{
		movespeed = Approach(movespeed, 0, 0.45)
	}
	
	if (scr_solid(x + sign(movespeed), y) && place_meeting(x + sign(movespeed), y, obj_slope) && !place_meeting(x + sign(movespeed), y, obj_destructibles))
		movespeed = 0
	if (!grounded && (key_down || sprite_index == spr_playerPZ_walljumpfastfallloop || sprite_index == spr_playerPZ_wallfastfall))
	{
		vsp = max(vsp, 14)
		
		if (sprite_index != spr_playerPZ_wallfastfall && sprite_index != spr_playerPZ_walljumpfastfallloop)
		{
			sprite_index = spr_playerPZ_wallfastfall
			image_index = 0
			fmod_event_instance_play(snd_dive)
		}
		else if (input_buffer_jump > 0 && sprite_index == spr_playerPZ_walljumpfastfallloop)
		{
			input_buffer_jump = 0
			state = states.freefall
			image_index = 0
			sprite_index = spr_player_poundcancel1
			dir = xscale
			hsp = movespeed * xscale
			movespeed = abs(movespeed)
			vsp = -6
			verticalMovespeed = vsp
			freeFallSmash = 0
		}
	}
	
	if (input_buffer_slap > 0)
	{
		input_buffer_slap = 0
		jumpstop = true
		xscale = dir
		
		if (!key_up)
		{
			sprite_index = spr_playerPZ_walljumpcancel
			image_index = 0
			movespeed = 12
			hsp = movespeed * xscale
			vsp = -5
			state = states.mach3
			fmod_event_instance_play(sndWallkickCancel)
		}
		else
		{
			input_buffer_slap = 0;
			state = states.punch;
			image_index = 0;
			sprite_index = spr_breakdanceuppercut;
			fmod_event_instance_play(snd_uppercut);
			vsp = -10;
			movespeed = hsp;
			particle_set_scale(particletypes.highjumpcloud2, xscale, 1);
			create_particle(x, y, particletypes.highjumpcloud2, 0);
			if (!ispeppino)
			{
				repeat (4)
				{
					with (instance_create(x + irandom_range(-40, 40), y + irandom_range(-40, 40), obj_explosioneffect))
					{
						sprite_index = spr_shineeffect;
						image_speed = 0.35;
					}
				}
			}
		}
	}
	
	if (grounded && vsp >= 0)
	{
		//fmod_event_instance_play(sndWallkickLand)
		flash = true
		xscale = dir
		
		if (key_attack)
		{
			repeat (10)
			{
				instance_create(x, y, obj_firemouthflame);
			}
			movespeed = 12
			hsp = movespeed * dir
			state = states.mach3
			image_index = 0
			sprite_index = spr_rollgetup
			fmod_event_instance_play(snd_dive);
		}
		else
		{
			landAnim = true
			movespeed = 8
			hsp = movespeed * dir
			state = states.normal
			instance_create(x, y, obj_landcloud)
			fmod_event_one_shot("event:/SFX/player/step", x, y)
		}
	}
	
	if (sprite_index == spr_walljumpstart && ANIMATION_END)
		sprite_index = spr_walljumpend
	
	if (sprite_index == spr_playerPZ_wallfastfall && ANIMATION_END)
		sprite_index = spr_playerPZ_walljumpfastfallloop
	
	if (!instance_exists(obj_wallkickDust))
		instance_create(x + random_range(-40, 40), y + random_range(-40, 40), obj_wallkickDust)
	
	scr_dotaunt()

	image_speed = 0.45
}