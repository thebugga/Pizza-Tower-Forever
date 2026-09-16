
switch (state)
{
	case "idle":
		enemy_idle();
		break;
	case "turn":
		enemy_turn();
		break;
	case "walk":
		hsp = 0;
		sprite_index = spr_pizzice_idle;
		image_speed = 0.35;
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
		var is = 1.25;
		if (image_speed < is)
		{
			image_speed = approach(image_speed, is, 0.015);
		}
		else if (cooldown > 0)
		{
			cooldown--;
		}
		else
		{
			shot--;
			fmod_event_one_shot_3d("event:/sfx/enemies/projectile", x, y);
			var dirs = [[1, 1], [1, -1], [-1, 1], [-1, -1]];
			cooldown = 35;
			flash = true;
			xscale = 0.6;
			yscale = 1.5;
			var pad = 30;
			var pd = 0;
			for (var i = 0; i < array_length(dirs); i++)
			{
				var b = dirs[i];
				pd = point_direction(0, 0, b[0], b[1]);
				with (instance_create(x + lengthdir_x(pad, pd), y + lengthdir_y(pad, pd), obj_pizzice_projectile))
				{
					image_xscale = b[0];
					image_yscale = b[1];
				}
			}
			if (shot <= 0)
			{
				bombreset = 180;
				state = "stun";
				stunned = 100;
				image_speed = 0.35;
				sprite_index = stunfallspr;
			}
		}
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
	case "ghostpossess":
		enemy_ghostpossess();
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
if (bombreset > 0 && state != "stun")
{
	bombreset--;
}
else if (state == "walk" && distance_to_object(obj_player) < 250)
{
	state = "enemy_throw";
	cooldown = 20;
	sprite_index = spr_pizzice_walk;
	image_speed = 0.25;
	shot = 3;
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
