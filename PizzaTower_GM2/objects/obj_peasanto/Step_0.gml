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
if (place_meeting(x + hsp, y, obj_iceblock) && state == "charge")
{
	with (instance_place(x + hsp, y, obj_iceblock))
	{
		instance_destroy();
	}
}
targetplayer = instance_nearest(x, y, obj_player);
if (state == "walk" && attack_cooldown <= 0)
{
	if (x != targetplayer.x && targetplayer.x > (x - 200) && targetplayer.x < (x + 200) && targetplayer.y < (y + 50) && targetplayer.y > (y - 50))
	{
		flame_buffer = flame_max;
		state = "charge";
		image_xscale = sign(targetplayer.x - x);
		sprite_index = spr_peasanto_flameattack;
		image_index = 0;
		vsp = -5;
		hitboxcreate = false;
	}
}
if (state == "charge")
{
	if (!hitboxcreate)
	{
		hitboxcreate = true;
		with (instance_create(x, y, obj_peasantohitbox))
		{
			ID = other.id;
		}
	}
	if (flame_buffer <= 0)
	{
		state = "walk";
		sprite_index = walkspr;
		attack_cooldown = attack_max;
	}
	if (hsp != 0 && ANIMATION_END)
	{
		create_particle(x - (image_xscale * 20), y + 43, particletypes.cloudeffect, 0);
	}
}
if (flame_buffer > 0)
{
	flame_buffer--;
}
if (attack_cooldown > 0)
{
	attack_cooldown--;
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
if (sprite_index == idlespr && (hsp != 0 || vsp != 0))
{
	sprite_index = walkspr;
}
