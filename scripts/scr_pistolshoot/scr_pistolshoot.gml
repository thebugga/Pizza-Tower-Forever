function scr_pistolshoot(_state, _enable_charge = false)
{
	if (character == "N" || character == "PUP")
	{
		scr_bombshoot();
		exit;
	}
	if (!_enable_charge && pistolchargeshooting)
	{
		exit;
	}
	if character != "V"
	{
		if ((pistolcooldown <= 0 && state == _state && state != states.bump && instance_number(obj_pistolbullet) < 3) || pistolchargeshooting == true)
		{
			input_buffer_shoot = 0;
			pistolanim = spr_pistolshot;
			pistolindex = 0;
			pistolcooldown = 10;
			machslideAnim = false;
			landAnim = false;
			jumpAnim = false;
			crouchslideAnim = false;
			crouchAnim = false;
			stompAnim = false;
			if (_state == states.mach3 || _state == states.mach2)
			{
				state = states.normal;
			}
			windingAnim = 0;
			with (instance_create(x + (xscale * 35), y, obj_parryeffect))
			{
				if (_enable_charge && other.pistolchargeshooting)
				{
					sprite_index = spr_giantpistoleffect;
				}
				else
				{
					sprite_index = spr_player_pistoleffect;
				}
				image_xscale = other.xscale;
				image_speed = 0.4;
			}
			if (_enable_charge && pistolchargeshooting)
			{
				fmod_event_one_shot_3d("event:/sfx/pep/revolverBIGshot", x + (xscale * 20), y);
			}
			else
			{
				fmod_event_one_shot_3d("event:/sfx/pep/pistolshot", x + (xscale * 20), y);
			}
			with (instance_create(x + (xscale * 20), y, obj_pistolbullet))
			{
				image_xscale = other.xscale;
				if (_enable_charge && other.pistolchargeshooting)
				{
					GamepadSetVibration(0, 1, 1, 0.8);
					sprite_index = spr_peppinobulletGIANT;
					x += 25;
				}
				else
				{
					GamepadSetVibration(0, 0.3, 0.3, 0.6);
				}
			}
		}
	}
	else
	{
		if ((pistolcooldown <= 0 && state == _state && state != states.bump && instance_number(obj_cheesebullet) < 3) || pistolchargeshooting == true)
		{
			input_buffer_shoot = 0;
			if grounded
			{
				pistolanim = spr_playerV_revolvershoot;
			}
			else
			{
				pistolanim = spr_playerV_revolvershootair;
			}
			pistolindex = 0;
			pistolcooldown = 10;
			machslideAnim = false;
			landAnim = false;
			jumpAnim = false;
			crouchslideAnim = false;
			crouchAnim = false;
			stompAnim = false;
			if (_state == states.mach3 || _state == states.mach2)
			{
				state = states.normal;
			}
			windingAnim = 0;
			with (instance_create(x + (xscale * 20), y + 10, obj_parryeffect))
			{
				sprite_index = spr_cheesebullet_dead;
				image_xscale = other.xscale;
				image_speed = 0.4;
			}
			fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", x + (xscale * 20), y + 10);
			with (instance_create(x + (xscale * 20), y + 10, obj_cheesebullet))
			{
				image_xscale = other.xscale;
				GamepadSetVibration(0, 0.3, 0.3, 0.6);
			}
		}
	}
}
