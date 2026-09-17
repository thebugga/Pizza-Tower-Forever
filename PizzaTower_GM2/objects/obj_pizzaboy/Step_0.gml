
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
}
if (flash == true && alarm[2] <= 0)
{
	alarm[2] = 0.15 * room_speed;
}
if (state == "walk")
{
	sprite_index = idlespr;
	state = "idle";
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
if elite 
{
	idlespr = spr_pizzabro;
	stunfallspr = spr_pizzabro_stun;
	spr_dead = spr_pizzabro;
}
else
{
	idlespr = spr_pizzaboy;
	stunfallspr = spr_pizzaboy_stun;
	spr_dead = spr_pizzaboy;
}