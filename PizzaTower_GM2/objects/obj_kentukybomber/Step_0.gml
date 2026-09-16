
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
if (state == "walk" && y > ystart && !scr_solid(x, y - 1))
{
	y--;
}
if (state == "walk" && y < ystart && !scr_solid(x, y + 1))
{
	y++;
}
if (state == "stun")
{
	grav = 0.5;
}
else
{
	grav = 0;
}
if (bombreset > 0 && state == "walk")
{
	bombreset--;
}
var player = instance_nearest(x, y, obj_player);
if (ragebuffer > 0)
{
	ragebuffer--;
}
if ((player.x > (x - 200) && player.x < (x + 200)) && (player.y <= (y + 400) && player.y >= (y - 60)))
{
	if (x != player.x && state != "enemy_throw" && bombreset == 0)
	{
		if (state == "walk")
		{
			sprite_index = spr_kentukybomber_attack;
			image_index = 0;
			state = "enemy_throw";
		}
	}
}
if (flash == true && alarm[2] <= 0)
{
	alarm[2] = 0.15 * room_speed;
}
if (state == "enemy_throw" || state == "rage")
{
	hsp = 0;
	vsp = 0;
}
if (state != "grabbed")
{
	depth = 0;
}
scr_scareenemy();
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
