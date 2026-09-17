
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
if (golfcooldown > 0)
{
	golfcooldown--;
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
if (state == "throwing")
{
	hsp = 0;
	if (ANIMATION_END)
	{
		state = "walk";
		sprite_index = walkspr;
		golfcooldown = 100;
	}
	if (!shot)
	{
		golfcooldown = 100;
		with (golfid)
		{
			invincible = true;
			hsp = 0;
			vsp = 0;
			sprite_index = stunfallspr;
			image_xscale = other.image_xscale;
			x = other.x + (other.image_xscale * 24);
			y = (other.y + 23) - 25;
		}
	}
	if (floor(image_index) >= 6 && !shot)
	{
		shot = true;
		notification_push(notifications.pizzaball_shot, [object_index]);
		with (golfid)
		{
			invincible = false;
			x = other.x;
			y = other.y;
			fmod_event_one_shot_3d("event:/sfx/misc/golfpunch", x, y);
			scr_pizzaball_go_to_thrown(14 * other.image_xscale, -7, false);
		}
		golfcooldown = 100;
		golfid = noone;
	}
}
if (state != "throwing")
{
	scr_scareenemy();
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
