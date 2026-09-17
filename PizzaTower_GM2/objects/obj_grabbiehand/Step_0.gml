fmod_event_instance_set_3d_attributes(snd, x, y);
switch (state)
{
	case "default":
		break;
	case "transitioncutscene":
		if (ANIMATION_END)
		{
			state = states.fall;
			sprite_index = spr_grabbiehand_fall;
		}
		break;
	case states.fall:
		var spd = 12;
		shootdir = angle_rotate(shootdir, point_direction(x, y, targetplayer.x, targetplayer.y), turnspeed);
		hsp = lengthdir_x(spd, shootdir);
		vsp = lengthdir_y(spd, shootdir);
		if (hsp != 0)
		{
			image_xscale = sign(hsp);
		}
		if (grounded)
		{
			state = "stun";
			stunned = 50;
			hsp = 0;
			vsp = 0;
			sprite_index = spr_grabbiehand_catch;
		}
		scr_collide();
		break;
	case "stun":
		if (stunned > 0)
		{
			stunned--;
		}
		else if (grounded)
		{
			state = "ejected";
			sprite_index = spr_grabbiehand_idle;
			grounded = false;
		}
		if (grounded)
		{
			hsp = 0;
		}
		scr_collide();
		break;
	case "ejected":
		var _dir = point_direction(x, y, xstart, ystart);
		x = approach(x, xstart, abs(lengthdir_x(8, _dir)));
		y = approach(y, ystart, abs(lengthdir_y(8, _dir)));
		if (x > (xstart - 8) && x < (xstart + 8) && y > (ystart - 8) && y < (ystart + 8))
		{
			state = "default";
			x = xstart;
			y = ystart;
			fmod_event_instance_stop(snd, true);
		}
		break;
	case "grabbing":
		sprite_index = spr_grabbiehand_catch;
		if (!reverse)
		{
			vsp = -14;
		}
		else
		{
			vsp = 14;
		}
		hsp = 0;
		with (playerid)
		{
			hsp = 0;
			vsp = 0;
			x = other.x;
			y = other.y;
			xscale = other.image_xscale;
			if (object_index != obj_pizzagoblinbomb)
			{
				state = "actor";
				if (boxxed == false)
				{
					sprite_index = spr_catched;
				}
				else
				{
					sprite_index = spr_boxxedpepair;
				}
				if (tauntstoredstate == "mach2")
				{
					sprite_index = spr_mach;
				}
				else if (tauntstoredstate == "mach3")
				{
					sprite_index = spr_mach4;
				}
			}
		}
		if (scr_solid(x, y - 1) || ((reverse && scr_solid(x, y + 1)) || place_meeting(x, y, obj_verticalhallway) || place_meeting(x, y, obj_hallway)))
		{
			fmod_event_one_shot_3d("event:/sfx/enemies/projectile", x, y);
			if (playerid == obj_player1.id)
			{
				with (playerid)
				{
					movespeed = tauntstoredmovespeed;
					vsp = 0;
					sprite_index = tauntstoredsprite;
					state = tauntstoredstate;
					if (state == "mach3")
					{
						sprite_index = spr_mach4;
						machhitAnim = false;
					}
				}
			}
			sprite_index = spr_grabbiehand_idle;
			state = "ejected";
			if (fake)
			{
				instance_destroy();
			}
		}
		scr_collide();
		break;
}
depth = 0;
