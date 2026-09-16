
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
	case "actor":
		hsp = 0;
		if (anim_buffer > 0)
		{
			anim_buffer--;
		}
		else
		{
			sprite_index = walkspr;
			state = "walk";
			bombreset = global.reset_timer[object_index];
		}
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
targetplayer = global.coopmode ? instance_nearest(x, y, obj_player) : obj_player1;
if ((sprite_index == spr_archergoblin_shoot || sprite_index == spr_archergoblin_wave) && x != targetplayer.x)
{
	image_xscale = -sign(x - targetplayer.x);
}
if (x != targetplayer.x && targetplayer.state != "bombpep" && state != "actor" && state != "enemy_throw" && bombreset == 0 && grounded)
{
	if ((targetplayer.x > (x - 200) && targetplayer.x < (x + 200)) && (y <= (targetplayer.y + 200) && y >= (targetplayer.y - 200)))
	{
		if (state == "walk" || (state == "idle" && sprite_index != scaredspr))
		{
			fmod_event_one_shot_3d("event:/sfx/enemies/noisegoblinbow");
			sprite_index = spr_archergoblin_shoot;
			image_index = 0;
			if (x != targetplayer.x)
			{
				image_xscale = -sign(x - targetplayer.x);
			}
			state = "enemy_throw";
			if (!obj_player1.ispeppino && !provoked)
			{
				sprite_index = spr_archergoblin_wave;
				state = "actor";
				anim_buffer = 100;
			}
			provoked = false;
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
