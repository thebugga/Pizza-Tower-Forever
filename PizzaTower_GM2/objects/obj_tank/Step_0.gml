
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
}
if (state == "stun" && stunned > 100 && birdcreated == false)
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
	{
		ID = other.id;
	}
}
if (state == "stun" && lasthp != hp && !tired && grounded)
{
	tired = true;
	stunned = 10;
	lasthp = hp;
	killprotection = false;
}
if (state != "stun")
{
	birdcreated = false;
}
if (stuntouchbuffer > 0)
{
	stuntouchbuffer--;
}
if (!instance_exists(spawnenemyID) && state == "walk")
{
	state = "idle";
	sprite_index = spr_tank_spawnenemy;
	image_index = 0;
	with (instance_create(x, y - 18, content))
	{
		important = true;
		other.spawnenemyID = id;
	}
}
var player = instance_nearest(x, y, obj_player);
if (bombreset > 0)
{
	bombreset--;
}
if ((player.x > (x - 400) && player.x < (x + 400)) && (y <= (player.y + 60) && y >= (player.y - 60)))
{
	if (state != "rage" && bombreset <= 0 && (global.stylethreshold >= 3 || elite) && state == "walk")
	{
		state = "rage";
		sprite_index = spr_tank_chargestart;
		if (x != player.x)
		{
			image_xscale = -sign(x - player.x);
		}
		ragebuffer = 100;
		image_index = 0;
		image_speed = 0.5;
		flash = true;
		alarm[4] = 5;
		bombreset = 200;
		create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
	}
	else if (x != player.x && state != "rage" && grounded && bombreset <= 0)
	{
		if (state == "walk")
		{
			state = "enemy_throw";
			hsp = 0;
			sprite_index = spr_tank_shoot;
		}
	}
}
if (flash == true && alarm[2] <= 0)
{
	alarm[2] = 0.15 * room_speed;
}
if (hitboxcreate == false && state == "rage")
{
	hitboxcreate = true;
	with (instance_create(x, y, obj_minijohn_hitbox))
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
if (boundbox == false)
{
	with (instance_create(x, y, obj_baddiecollisionbox))
	{
		sprite_index = other.sprite_index;
		baddieID = other.id;
		other.boxID = id;
		other.boundbox = true;
	}
}
