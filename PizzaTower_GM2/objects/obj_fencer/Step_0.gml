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
if (state != "stun")
{
	birdcreated = false;
}
scr_scareenemy();
var player = instance_nearest(x, y, obj_player);
if (ragebuffer > 0)
{
	ragebuffer--;
}
if ((player.x > (x - 400) && player.x < (x + 400)) && (y <= (player.y + 60) && y >= (player.y - 60)))
{
	if (state != "rage" && ragebuffer == 0 && elite && (state == "walk" || state == "charge"))
	{
		state = "rage";
		sprite_index = spr_fencer_rage;
		if (x != player.x)
		{
			image_xscale = -sign(x - player.x);
		}
		ragebuffer = 100;
		image_index = 0;
		image_speed = 0.5;
		flash = true;
		alarm[4] = 5;
		create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
	}
	else if (x != player.x && grounded)
	{
		if (state == "walk" && charging == false)
		{
			fmod_event_instance_play(chargesnd);
			fmod_event_instance_set_3d_attributes(chargesnd, x, y);
			with (instance_create(x, y, obj_forkhitbox))
			{
				ID = other.id;
			}
			charging = true;
			state = "charge";
			movespeed = 5;
			vsp = -7;
			sprite_index = spr_fencer_chargestart;
		}
	}
}
if (state == "stun" || state == "walk")
{
	charging = false;
	movespeed = 0;
}
if (sprite_index == spr_fencer_chargestart && ANIMATION_END)
{
	sprite_index = spr_fencer_charge;
}
if (flash == true && alarm[2] <= 0)
{
	alarm[2] = 0.15 * room_speed;
}
if (hitboxcreate == false && (state == "walk" || state == "rage" || state == "charge"))
{
	hitboxcreate = true;
	with (instance_create(x, y, obj_forkhitbox))
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
