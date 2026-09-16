
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
	case states.pizzaheadjump:
		enemy_pizzaheadjump();
		break;
	case "bump":
		sprite_index = spr_badrat_stun;
		if (grounded && vsp > 0)
		{
			state = "walk";
			sprite_index = walkspr;
		}
		break;
}
var targetplayer = instance_nearest(x, y, obj_player);
if (cooldown > 0)
{
	cooldown--;
}
if (state == "walk" && cooldown <= 0)
{
	if (targetplayer.x > (x - 200) && targetplayer.x < (x + 200) && targetplayer.y > (y - 50) && targetplayer.y < (y + 50))
	{
		state = "enemy_throw";
		sprite_index = spr_badrat_attack1;
		image_index = 0;
		if (x != targetplayer.x)
		{
			image_xscale = sign(targetplayer.x - x);
		}
	}
}
if (state == "enemy_throw")
{
	var mv = 8;
	image_speed = 0.35;
	if (sprite_index == spr_badrat_attack1)
	{
		hsp = 0;
		if (ANIMATION_END)
		{
			fmod_event_one_shot_3d("event:/sfx/enemies/badrat", x, y);
			sprite_index = spr_badrat_attack2;
			cooldown = 30;
		}
	}
	else if (sprite_index == spr_badrat_attack2)
	{
		if (alarm[4] == -1)
		{
			alarm[4] = 5;
		}
		hsp = image_xscale * mv;
		if (!instance_exists(hitboxID))
		{
			hitboxID = instance_create(x, y, obj_forkhitbox);
			hitboxID.ID = id;
		}
		if (cooldown > 0)
		{
			cooldown--;
		}
		else if (grounded)
		{
			sprite_index = spr_badrat_attack2end;
		}
	}
	else if (sprite_index == spr_badrat_attack2end)
	{
		if (alarm[4] == -1)
		{
			alarm[4] = 5;
		}
		hsp = image_xscale * mv;
		if (ANIMATION_END)
		{
			sprite_index = spr_badrat_attack3;
		}
	}
	else
	{
		hsp = approach(hsp, 0, 0.2);
		if (ANIMATION_END)
		{
			sprite_index = walkspr;
			state = "walk";
			instance_destroy(hitboxID);
			cooldown = 80;
		}
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
if (state != "stun")
{
	birdcreated = false;
}
if (flash == true && alarm[2] <= 0)
{
	alarm[2] = 0.15 * room_speed;
}
if (place_meeting(x, y, obj_canonexplosion))
{
	instance_destroy();
}
scr_scareenemy();
if (state != "grabbed")
{
	depth = 0;
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
if (state != "stun")
{
	thrown = false;
}
