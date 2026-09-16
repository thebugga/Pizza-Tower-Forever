
switch (state)
{
	case "idle":
		enemy_idle();
		break;
	case "turn":
		enemy_turn();
		break;
	case "walk":
		sprite_index = spr_lonegustavo_grabbable;
		image_speed = 0.35;
		hsp = 0;
		var _boss = noone;
		with (obj_baddie)
		{
			if (object_index != obj_gustavograbbable)
			{
				_boss = id;
			}
		}
		if (_boss != noone)
		{
			if (_boss.x != x)
			{
				image_xscale = sign(_boss.x - x);
			}
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
		if (sprite_index == spr_dead)
		{
			sprite_index = spr_lonegustavo_dashjump;
		}
		break;
	case "enemy_throw":
		enemy_throw();
		break;
	case states.pizzaheadjump:
		scr_boss_pizzaheadjump();
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
if (state == states.pizzaheadjump && obj_player1.state != "handstandjump" && place_meeting(x, y, obj_solid))
{
	invincible = true;
}
else
{
	invincible = false;
}
