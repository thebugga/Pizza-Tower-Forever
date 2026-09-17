
switch (state)
{
	case "idle":
		enemy_idle();
		break;
	case "turn":
		enemy_turn();
		break;
	case "walk":
		image_speed = 0.35;
		if (!grounded)
		{
			sprite_index = spr_ufogrounded_fall;
		}
		if (sprite_index != spr_ufogrounded_fall && sprite_index != spr_ufogrounded_land)
		{
			enemy_walk();
		}
		else if (sprite_index == spr_ufogrounded_fall)
		{
			hsp = 0;
			if (grounded)
			{
				sprite_index = spr_ufogrounded_land;
				image_index = 0;
			}
		}
		else
		{
			if (image_index > 11)
			{
				hsp = sign(image_xscale);
			}
			if (ANIMATION_END)
			{
				sprite_index = spr_ufogrounded_walk;
			}
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
if (state != "stun")
{
	birdcreated = false;
}
if (flash == true && alarm[2] <= 0)
{
	alarm[2] = 0.15 * room_speed;
}
scr_scareenemy();
var targetplayer = global.coopmode ? instance_nearest(x, y, obj_player) : obj_player1;
if (bombreset > 0)
{
	bombreset--;
}
if (x != targetplayer.x && state != "enemy_throw" && bombreset == 0 && grounded)
{
	if ((targetplayer.x > (x - 400) && targetplayer.x < (x + 400)) && (y <= (targetplayer.y + 20) && y >= (targetplayer.y - 20)))
	{
		if (state == "walk" && !scr_solid_line(targetplayer))
		{
			sprite_index = spr_ufogrounded_shoot;
			image_index = 0;
			image_xscale = -sign(x - targetplayer.x);
			state = "enemy_throw";
		}
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
