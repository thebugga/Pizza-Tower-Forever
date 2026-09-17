
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
	case "pummel":
		enemy_pummel();
		break;
	case "staggered":
		enemy_staggered();
		break;
	case "rage":
		enemy_rage();
		break;
	case states.float:
		scr_noisey_float();
		break;
	case states.pizzaheadjump:
		scr_boss_pizzaheadjump();
		break;
}
var _b = false;
if (bounce && grounded && vsp > 0)
{
	state = "stun";
	stunned = 100;
	vsp = -8;
	hsp = 0;
	bounce = false;
	stunned = 20;
	_b = true;
	create_particle(x, y, particletypes.highjumpcloud1);
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
if (state != states.float)
{
	scr_scareenemy();
}
if (flash == true && alarm[2] <= 0)
{
	alarm[2] = 0.15 * room_speed;
}
if (hitboxcreate == false && state == "walk" && grounded && vsp > 0 && state != "stun")
{
	hitboxcreate = true;
	with (instance_create(x, y, obj_forkhitbox))
	{
		ID = other.id;
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
if (boundbox == false && ((grounded && vsp > 0) || _b))
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
