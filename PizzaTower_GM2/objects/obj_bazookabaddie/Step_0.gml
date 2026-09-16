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
var player = instance_nearest(x, y, obj_player);
if (bombreset > 0)
{
	bombreset--;
}
if (x != player.x && grounded && player.x > (x - 500) && player.x < (x + 500) && player.y > (y - 500) && player.y < (y + 500) && !instance_exists(bazookaID))
{
	if (state == "walk" && bombreset <= 0)
	{
		if (x != player.x)
		{
			image_xscale = -sign(x - player.x);
		}
		image_index = 0;
		state = "enemy_throw";
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
