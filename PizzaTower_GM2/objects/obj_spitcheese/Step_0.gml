switch (state)
{
	case "idle":
		enemy_idle();
		break;
	case "charge":
		enemy_charge();
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
	case "rage":
		enemy_rage();
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
scr_scareenemy();
if (bombreset > 0)
{
	bombreset--;
}
var player = instance_nearest(x, y, obj_player);
if ((player.x > (x - 400) && player.x < (x + 400)) && (y <= (player.y + 60) && y >= (player.y - 60)))
{
	if (bombreset <= 0)
	{
		if (state == "walk")
		{
			if (x != player.x)
			{
				image_xscale = -sign(x - player.x);
			}
			image_index = 0;
			state = "enemy_throw";
			//bombreset = 50
		}
	}
}
if (flash == true && alarm[2] <= 0)
{
	alarm[2] = 0.15 * room_speed;
}
if (ANIMATION_END && sprite_index == spr_spitcheese_spit)
{
	sprite_index = spr_spitcheese_idle;
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
