
image_speed = 0.35;
switch (state)
{
	case "idle":
		sprite_index = idlespr;
		playerid = instance_nearest(x, y, obj_player);
		hsp = 0;
		vsp = 0;
		var x1 = 370;
		if (bbox_in_camera(view_camera[0], 50))
		{
			var t;
			if (image_xscale > 0)
			{
				t = playerid.x > (x - 16) && playerid.x < (x + x1) && playerid.y > (y - 16) && playerid.y < (y + 200);
			}
			else
			{
				t = playerid.x < (x + 16) && playerid.x > (x - x1) && playerid.y > (y - 16) && playerid.y < (y + 200);
			}
			if (cooldown > 0)
			{
				cooldown--;
			}
			else if (t)
			{
				state = "transitioncutscene";
				sprite_index = spr_ghoul_attackstart;
				image_index = 0;
				attack_y = y;
			}
		}
		break;
	case "charge":
		enemy_charge();
		break;
	case "walk":
		sprite_index = idlespr;
		var d = point_direction(x, y, xstart, ystart);
		x += lengthdir_x(8, d);
		y += lengthdir_y(8, d);
		hsp = 0;
		vsp = 0;
		if (x > (xstart - 10) && x < (xstart + 10) && y > (ystart - 10) && y < (ystart + 10))
		{
			state = "idle";
			image_xscale = start_xscale;
			cooldown = 100;
			x = xstart;
			y = ystart;
		}
		else
		{
			image_xscale = sign(x - xstart);
		}
		break;
	case "transitioncutscene":
		hsp = 0;
		vsp = 0;
		if (ANIMATION_END)
		{
			fmod_event_one_shot_3d("event:/sfx/enemies/minijohnpunch", x, y);
			state = "punch";
			attackvsp = 11;
			attack_y = y;
			sprite_index = spr_ghoul_attack;
		}
		break;
	case "punch":
		attackvsp = approach(attackvsp, -11, 0.5);
		vsp = attackvsp;
		hsp = image_xscale * 10;
		if (y < attack_y && vsp < 0)
		{
			y = attack_y;
			vsp = 0;
			state = "idle";
			cooldown = 100;
			image_xscale *= -1;
		}
		break;
	case "turn":
		break;
	case "land":
		enemy_land();
		break;
	case "hit":
		enemy_hit();
		break;
	case "stun":
		enemy_stun();
		hit = true;
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
if (grounded && state == "enemy_throw" && floor(image_index) == 3)
{
	vsp = -5;
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
