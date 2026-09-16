
if (bombreset > 0)
{
	bombreset--;
}
switch (state)
{
	case "walk":
		if (state == "enemy_throw")
		{
			break;
		}
		if (substate_buffer > 0)
		{
			substate_buffer--;
		}
		else
		{
			substate_buffer = substate_max;
			var old_substate = substate;
			while (substate == old_substate)
			{
				substate = choose("walk", "idle", "turn");
			}
			if (substate == "turn" && state == "enemy_throw")
			{
				substate = "walk";
			}
			if (substate == "walk")
			{
				image_xscale = choose(-1, 1);
			}
			else if (substate == "turn")
			{
				sprite_index = spr_pizzaslug_turn;
				image_index = 0;
				hsp = 0;
			}
		}
		switch (substate)
		{
			case "walk":
				image_speed = 0.35;
				if (sprite_index != spr_pizzaslug_walk)
				{
					image_index = 0;
					sprite_index = spr_pizzaslug_walk;
				}
				if (place_meeting(x, y, obj_solid))
				{
					y--;
				}
				enemy_walk();
				break;
			case "idle":
				image_speed = 0.35;
				hsp = 0;
				sprite_index = spr_pizzaslug_idle;
				break;
			case "turn":
				image_speed = 0.35;
				substate_buffer = 5;
				if (sprite_index != spr_pizzaslug_turn)
				{
					image_index = 0;
					sprite_index = spr_pizzaslug_turn;
				}
				if (sprite_index == spr_pizzaslug_turn && ANIMATION_END)
				{
					image_xscale *= -1;
					substate_buffer = substate_max;
					substate = "idle";
					sprite_index = spr_pizzaslug_idle;
				}
				break;
			case "enemy_throw":
				state = "enemy_throw";
				substate_buffer = 0;
				image_index = 0;
				sprite_index = spr_pizzaslug_cough;
				break;
		}
		break;
	case "idle":
		enemy_idle();
		break;
	case "turn":
		enemy_turn();
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
	case "rage":
		enemy_rage();
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
var player = instance_nearest(x, y, obj_player);
if (state == "walk" && substate != "turn")
{
	if ((player.x > (x - 400) && player.x < (x + 400)) && (y <= (player.y + 60) && y >= (player.y - 60)) && ragecooldown == 0)
	{
		if (global.stylethreshold >= 3 || elite)
		{
			if (x != player.x)
			{
				image_xscale = -sign(x - player.x);
			}
			image_speed = 0.6;
			hsp = 0;
			shot = false;
			sprite_index = spr_pizzaslug_rage;
			image_index = 0;
			state = "rage";
		}
		else
		{
			if (x != player.x)
			{
				image_xscale = -sign(x - player.x);
			}
			ragecooldown = 160;
			state = "enemy_throw";
			substate_buffer = 0;
			image_index = 0;
			sprite_index = spr_pizzaslug_cough;
		}
	}
}
if (ragecooldown > 0)
{
	ragecooldown--;
}
scr_scareenemy();
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
