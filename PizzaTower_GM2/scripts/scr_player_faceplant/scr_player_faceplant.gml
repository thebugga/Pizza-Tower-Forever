function scr_player_faceplant()
{
	hsp = xscale * movespeed;
	move = key_right + key_left;
	
	if (movespeed < 14 && grounded)
	{
		movespeed += 0.5;
	}
	
	if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_slope) && !place_meeting(x + hsp, y, obj_destructibles))
	{
		var _bump = ledge_bump((vsp >= 0) ? 32 : 22);
		if (_bump)
		{
			fmod_event_one_shot_3d("event:/sfx/pep/splat", x, y);
			state = states.bump;
			image_index = 0;
			sprite_index = spr_wallsplat;
		}
	}
	
	if (ANIMATION_END && !key_attack)
	{
		image_speed = 0.35;
		state = states.normal;
	}
	
	if (ANIMATION_END && key_attack)
	{
		image_speed = 0.35;
		state = states.mach3;
		sprite_index = spr_mach4
		movespeed = 14;
	}
	
	if (key_down && grounded)
	{
		sprite_index = spr_crouchslip;
		machhitAnim = false;
		state = states.tumble;
		movespeed = 12;
		crouchslipbuffer = 23;
	}
	
	if (!instance_exists(obj_dashcloud2) && grounded && movespeed > 5)
	{
		with (instance_create(x, y, obj_dashcloud2))
		{
			image_xscale = other.xscale;
		}
	}
	image_speed = 0.5;
}
