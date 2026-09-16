
targetplayer = instance_nearest(x, y, obj_player);
switch (state)
{
	case "idle":
		enemy_idle();
		break;
	case "turn":
		enemy_turn();
		break;
	case "walk":
		if (targetplayer.x > (x - 700) && targetplayer.x < (x + 700) && targetplayer.y < (y + 500) && targetplayer.y > (y - 500))
		{
			if (grounded && x != targetplayer.x)
			{
				image_xscale = sign(targetplayer.x - x);
			}
			if (cooldown > 0)
			{
				cooldown--;
			}
			if (targetplayer.x > (x - 100) && targetplayer.x < (x + 100) && grounded)
			{
				hsp = approach(hsp, 0, 0.5);
				if (cooldown <= 0)
				{
					state = "punch";
					sprite_index = spr_pepclone_attack;
					image_index = 0;
					shot = false;
				}
			}
			else
			{
				hsp = image_xscale * 6;
			}
			if (state != "punch")
			{
				if (grounded)
				{
					if (hsp != 0)
					{
						sprite_index = walkspr;
					}
					else
					{
						sprite_index = idlespr;
					}
				}
				else if (sprite_index != spr_player_jump && sprite_index != spr_player_fall)
				{
					sprite_index = spr_player_fall;
				}
				else if (sprite_index == spr_player_jump && ANIMATION_END)
				{
					sprite_index = spr_player_fall;
				}
				var inst_front = collision_line(x, y + 25, x + (sign(hsp) * 78), y + 25, obj_solid, false, true);
				var inst_down = collision_line(x + (sign(hsp) * 16), y, x + (sign(hsp) * 16), y + 64, obj_solid, false, true);
				var inst_down2 = collision_line(x + (sign(hsp) * 16), y, x + (sign(hsp) * 16), y + 64, obj_platform, false, true);
				var inst_up = collision_line(x + (sign(hsp) * 96), y + 25, x + (sign(hsp) * 96), (y - 78) + 50, obj_platform, false, true);
				if (((!place_meeting(x, y + 1, obj_slope) && (inst_front != noone || inst_up != noone)) || (inst_down == noone && inst_down2 == noone)) && targetplayer.y <= (y + 32) && grounded && state != "charge")
				{
					vsp = -11;
					sprite_index = spr_player_jump;
					image_index = 0;
				}
			}
		}
		break;
	case "punch":
		hsp = approach(hsp, 0, 1);
		if (!shot && floor(image_index) > 14)
		{
			if (!fmod_event_instance_is_playing(snd))
			{
				fmod_event_instance_play(snd);
				fmod_event_instance_set_3d_attributes(snd, x, y);
			}
			shot = true;
			hitboxID = instance_create(x, y, obj_forkhitbox);
			with (hitboxID)
			{
				ID = other.id;
				sprite_index = spr_weeniesquire_hitbox;
			}
		}
		if (floor(image_index) > 23)
		{
			instance_destroy(hitboxID);
		}
		if (ANIMATION_END)
		{
			state = "walk";
			instance_destroy(hitboxID);
			cooldown = 100;
		}
		break;
	case "land":
		enemy_land();
		break;
	case "hit":
		enemy_hit();
		break;
	case "stun":
		enemy_stun();
		break;
	case "enemy_throw":
		enemy_throw();
		break;
	case "grabbed":
		enemy_grabbed();
		break;
	case "pummel":
		enemy_pummel();
		break;
	case "staggered":
		enemy_staggered();
		break;
	case "rage":
		enemy_rage();
		break;
	case "ghostpossess":
		enemy_ghostpossess();
		break;
}
if (state == "stun" && stunned > 100 && birdcreated == false)
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
	{
		ID = other.id;
	}
}
if (state != "stun")
{
	birdcreated = false;
}
if (flash == true && alarm[2] <= 0)
{
	alarm[2] = 0.15 * room_speed;
}
if (state == "stun" && fmod_event_instance_is_playing(snd))
{
	fmod_event_instance_stop(snd);
}
if (state != "grabbed")
{
	depth = 0;
}
if (state != "stun")
{
	thrown = false;
}
if (boundbox == false)
{
	with (instance_create(x, y, obj_baddiecollisionbox))
	{
		sprite_index = other.sprite_index;
		mask_index = other.sprite_index;
		baddieID = other.id;
		other.boxID = id;
		other.boundbox = true;
	}
}
