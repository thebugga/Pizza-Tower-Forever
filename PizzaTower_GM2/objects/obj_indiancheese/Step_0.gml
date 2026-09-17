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
		if (totemID != noone)
		{
			state = states.dance;
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
	case "ghostpossess":
		enemy_ghostpossess();
		break;
}
scr_scareenemy();
if (state == states.dance && totemID != noone)
{
	image_speed = 0.35;
	if (sprite_index != spr_indiancheese_dance)
	{
		var tx = totemID.x + (64 * totemdir);
		var on_place = (totemdir > 0) ? (x > tx) : (x < tx);
		if (place_meeting(x + image_xscale, y, obj_solid))
		{
			on_place = true;
		}
		hsp = !on_place ? (image_xscale * 3) : 0;
		if (sprite_index == spr_indiancheese_jump && ANIMATION_END)
		{
			image_index = image_number - 1;
		}
		if (sprite_index != spr_indiancheese_jump)
		{
			sprite_index = spr_indiancheese_walk;
		}
		if (grounded && vsp > 0)
		{
			sprite_index = spr_indiancheese_walk;
			if (on_place)
			{
				sprite_index = spr_indiancheese_dance;
				image_index = 0;
				hsp = 0;
			}
		}
	}
	else
	{
		hsp = 0;
		if (ANIMATION_END)
		{
			totemdir = (x > totemID.x) ? -1 : 1;
			image_xscale = totemdir;
			sprite_index = spr_indiancheese_jump;
			vsp = -11;
		}
	}
}
else if (state == states.dance && totemID == noone)
{
	state = "walk";
}
if (state == "stun" && stunned > 40 && birdcreated == false)
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
if (elite && ragecooldown > 0)
{
	ragecooldown--;
}
if (state == "walk" && state != "stun" && sprite_index == walkspr && sprite_index != spr_indiancheese_scared && elite && ragecooldown == 0)
{
	if ((player.x > (x - 400) && player.x < (x + 400)) && (y <= (player.y + 60) && y >= (player.y - 60)))
	{
		if (x != player.x)
		{
			image_xscale = -sign(x - player.x);
		}
		state = "rage";
		sprite_index = spr_indiancheese_howl;
		image_index = 0;
		shot = false;
		ragedash = 100;
		hsp = 0;
	}
}
if (!grounded && sprite_index == spr_indiancheese_jump && ANIMATION_END)
{
	image_speed = 0;
}
else if (image_speed == 0)
{
	image_speed = 0.35;
}
if (sprite_index == spr_indiancheese_land && ANIMATION_END)
{
	sprite_index = spr_indiancheese_walk;
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
