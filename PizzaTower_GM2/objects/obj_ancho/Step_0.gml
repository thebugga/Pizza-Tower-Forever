
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
if (flash == true && alarm[2] <= 0)
{
	alarm[2] = 0.15 * room_speed;
}
if (state != "grabbed")
{
	depth = 0;
}
if (state != "charge")
{
	scr_scareenemy();
}
if (sprite_index == spr_ancho_chargestart && ANIMATION_END)
{
	if (hitboxcreate == false && state == "charge")
	{
		hitboxcreate = true;
		with (instance_create(x, y, obj_forkhitbox))
		{
			ID = other.id;
		}
	}
	sprite_index = spr_ancho_charge;
	movespeed = 10;
}
var player = instance_nearest(x, y, obj_player);
if (ragebuffer > 0)
{
	ragebuffer--;
}
if ((player.x > (x - 400) && player.x < (x + 400)) && (y <= (player.y + 60) && y >= (player.y - 60)) && important == false)
{
	if (state != "rage" && ragebuffer == 0 && elite && (state == "walk" || state == "charge"))
	{
		state = "rage";
		//sprite_index = spr_ancho_rage1;
		if (x != player.x)
		{
			image_xscale = -sign(x - player.x);
		}
		ragebuffer = 100;
		image_index = 0;
		image_speed = 0.5;
		flash = true;
		alarm[4] = 5;
		with (instance_create(x, y, obj_forkhitbox))
		{
			sprite_index = spr_bighitbox;
			mask_index = spr_bighitbox;
			ID = other.id;
		}
		create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
	}
	else if (x != player.x && state != "charge" && y == ystart && important == false)
	{
		if (state == "walk")
		{
			fmod_event_instance_play(chargesnd);
			fmod_event_instance_set_3d_attributes(chargesnd, x, y);
			image_index = 0;
			image_xscale = -sign(x - obj_player.x);
			state = "charge";
			sprite_index = spr_ancho_chargestart;
		}
	}
}
if (state == "stun" || state == "walk")
{
	movespeed = 0;
}
if (state == "idle" && sprite_index == scaredspr)
{
	vsp = 0;
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
