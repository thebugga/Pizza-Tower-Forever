
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
idlespr = spr_pizzagoblin_idle;
stunfallspr = spr_pizzagoblin_stun;
walkspr = spr_pizzagoblin_walk;
stunspr = spr_pizzagoblin_stun;
grabbedspr = spr_pizzagoblin_stun;
scr_scareenemy();
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
if (bombreset > 0)
{
	bombreset--;
}
var targetplayer = global.coopmode ? instance_nearest(x, y, obj_player) : obj_player1;
if (x != targetplayer.x && state != "enemy_throw" && bombreset <= 0 && grounded)
{
	if ((targetplayer.x > (x - 400) && targetplayer.x < (x + 400)) && (y <= (targetplayer.y + 20) && y >= (targetplayer.y - 20)))
	{
		if (state == "walk" || (state == "idle" && sprite_index != scaredspr))
		{
			sprite_index = spr_pizzagoblin_throwbomb;
			image_index = 0;
			image_xscale = -sign(x - targetplayer.x);
			state = "enemy_throw";
		}
	}
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
