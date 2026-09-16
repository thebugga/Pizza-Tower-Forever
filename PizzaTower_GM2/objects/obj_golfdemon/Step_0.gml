switch (state)
{
	case "idle":
		enemy_idle();
		break;
	case "turn":
		enemy_turn();
		break;
	case "walk":
		enemy_walk();
		hsp = 0;
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
	case states.chase:
		enemy_chase();
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
}
if (state == "walk" || state == "idle")
{
	if (sprite_index != spr_golfdemon_idle2)
	{
		sprite_index = spr_golfdemon_idle;
	}
}
if (state == "stun" && stunned > 100 && birdcreated == false)
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
	{
		ID = other.id;
	}
}
if (ragecooldown > 0)
{
	ragecooldown--;
}
if (state != "stun")
{
	birdcreated = false;
}
if (flash == true && alarm[2] <= 0)
{
	alarm[2] = 0.15 * room_speed;
}
if (state != states.chase)
{
	momentum = 0;
}
if (state == "walk" || state == "idle")
{
	var targetplayer = instance_nearest(x, y, obj_player);
	if (sprite_index != spr_golfdemon_idle2 && targetplayer.x > (x - 200) && targetplayer.x < (x + 200) && targetplayer.y > (y - 200) && targetplayer.y < (y + 200))
	{
		fmod_event_one_shot_3d("event:/sfx/enemies/demonsuprise", x, y);
		sprite_index = spr_golfdemon_idle2;
		image_index = 0;
	}
	if (sprite_index == spr_golfdemon_idle2 && ANIMATION_END)
	{
		idle = false;
		movespeed = 6;
		if (targetplayer.x != x)
		{
			image_xscale = -sign(x - targetplayer.x);
		}
		alarm[5] = 30;
		state = states.chase;
		sprite_index = spr_golfdemon_charge;
	}
}
if (state == states.chase)
{
	if (!fmod_event_instance_is_playing(snd))
	{
		fmod_event_instance_play(snd);
	}
	fmod_event_instance_set_3d_attributes(snd, x, y);
	snd_count = 0;
	with (obj_golfdemon)
	{
		if (point_in_camera(x, y, view_camera[0]) && fmod_event_instance_is_playing(snd))
		{
			other.snd_count++;
		}
	}
	fmod_event_instance_set_parameter(snd, "count", snd_count, true);
}
else
{
	fmod_event_instance_stop(snd, true);
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
if (state != states.chase && state != "hit")
{
	invincible = false;
}
if (state == states.chase)
{
	invincible = true;
}
