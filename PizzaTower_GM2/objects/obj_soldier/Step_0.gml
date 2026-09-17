
switch (state)
{
	case "idle":
		if (sprite_index != spr_soldier_idleend)
		{
			enemy_idle();
		}
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
if (state != "stun")
{
	birdcreated = false;
}
if (flash == true && alarm[2] <= 0)
{
	alarm[2] = 0.15 * room_speed;
}
var player = instance_nearest(x, y, obj_player);
switch (state)
{
	case "idle":
		if (bush)
		{
			var col = collision_line(x, y, player.x, player.y, obj_solid, false, true);
			var col2 = collision_line(x, y, player.x, player.y, obj_slope, false, true);
			var colX = player.x > (x - threshold_x) && player.x < (x + threshold_x);
			var colY = player.y > (y - threshold_y) && player.y < (y + threshold_y);
			if (sprite_index != scaredspr && col == noone && col2 == noone && colX && colY)
			{
				if (x != player.x)
				{
					image_xscale = sign(player.x - x);
				}
				bush = false;
				sprite_index = spr_soldier_idleend;
				image_index = 0;
			}
		}
		else if (sprite_index == spr_soldier_idleend && ANIMATION_END)
		{
			state = "walk";
			sprite_index = spr_soldier_walk;
		}
		break;
	case "charge":
		hsp = approach(hsp, 0, 0.5);
		if (sprite_index == spr_soldier_shootstart && ANIMATION_END)
		{
			sprite_index = spr_soldier_shoot;
		}
		if (sprite_index != spr_soldier_shootstart)
		{
			if (bullet_count > 0)
			{
				if (can_fire)
				{
					can_fire = false;
					alarm[5] = fire_max;
					bullet_count--;
					sprite_index = spr_soldier_shoot;
					image_index = 0;
					hsp -= (image_xscale * recoil_spd);
					with (instance_create(x, y, obj_enemybullet))
					{
						fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", x, y);
						image_xscale = other.image_xscale;
					}
				}
			}
			else if (ANIMATION_END)
			{
				sprite_index = walkspr;
				attack_cooldown = attack_max;
				state = "walk";
			}
		}
		break;
	case "walk":
		if (attack_cooldown > 0)
		{
			attack_cooldown--;
		}
		else
		{
			var col = collision_line(x, y, player.x, player.y, obj_solid, false, true);
			var col2 = collision_line(x, y, player.x, player.y, obj_slope, false, true);
			var colX = player.x > (x - threshold_x) && player.x < (x + threshold_x);
			var colY = player.y > (y - threshold_y) && player.y < (y + threshold_y);
			if (sprite_index != scaredspr && col == noone && col2 == noone && colX && colY)
			{
				if (x != player.x)
				{
					image_xscale = sign(player.x - x);
				}
				sprite_index = spr_soldier_shootstart;
				image_index = 0;
				state = "charge";
				bullet_count = bullet_max;
				can_fire = true;
			}
		}
		break;
}
//if (elite)
//{
//	if (state == "walk")
//	{
//		if ((player.x > (x - 200) && player.x < (x + 200)) && (y <= (player.y + 60) && y >= (player.y - 60)))
//		{
//			if (state != "rage" && ragebuffer == 0)
//			{
//				hitboxcreate = false;
//				state = "rage";
//				sprite_index = spr_soldier_knife;
//				if (x != player.x)
//				{
//					image_xscale = -sign(x - player.x);
//				}
//				ragebuffer = 100;
//				image_index = 0;
//				image_speed = 0.5;
//				flash = true;
//				alarm[4] = 5;
//				create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
//			}
//		}
//	}
//	if (ragebuffer > 0)
//	{
//		ragebuffer--;
//	}
//}
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
