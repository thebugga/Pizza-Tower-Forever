
if (sprite_index == spr_player_ratmountgameover && !gusrat)
{
	gusrat = true;
	with (create_debris(x, y, spr_ratblock_dead))
	{
		image_xscale = other.image_xscale;
		hsp = -image_xscale * 4;
		vsp = -8;
		image_angle = 0;
	}
}
if (state != "grabbed" && state != "hit" && (state != "stun" || (grounded && vsp > 0)))
{
	instance_destroy();
}
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
	case states.pizzaheadjump:
		enemy_pizzaheadjump();
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
scr_scareenemy();
var player = instance_nearest(x, y, obj_player);
if (elite)
{
	var check = (image_xscale > 0) ? (player.x > x && player.x < (x + 200)) : (player.x < x && player.x > (x - 200));
	if (state == "walk")
	{
		if (check && (y <= (player.y + 60) && y >= (player.y - 60)))
		{
			if (state != "rage" && ragebuffer == 0)
			{
				state = "rage";
				sprite_index = ragespr;
				if (x != player.x)
				{
					image_xscale = -sign(x - player.x);
				}
				ragebuffer = 100;
				image_index = 0;
				image_speed = 0.5;
				flash = true;
				alarm[4] = 5;
				create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
			}
		}
	}
	if (ragebuffer > 0)
	{
		ragebuffer--;
	}
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
