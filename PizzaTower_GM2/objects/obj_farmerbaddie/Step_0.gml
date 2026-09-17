
switch (state)
{
	case "idle":
		enemy_idle();
		break;
	case "turn":
		enemy_turn();
		break;
	case "walk":
		if (!idle)
		{
			enemy_walk();
		}
		else
		{
			sprite_index = idlespr;
			hsp = approach(hsp, 0, 1);
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
	case "ghostpossess":
		enemy_ghostpossess();
		break;
}
if (bombreset > 0)
{
	bombreset--;
}
scr_scareenemy();
if (state != "walk" && object_index != obj_farmerbaddie2 && object_index != obj_farmerbaddie3)
{
	idle = false;
}
if (state == "walk")
{
	var x1 = disx;
	playerid = instance_nearest(x, y, obj_player);
	var t = playerid.x > (x - x1) && playerid.x < (x + x1) && playerid.y > (y - 100) && playerid.y < (y + 100);
	if (cooldown > 0)
	{
		cooldown--;
	}
	else if (t && collision_line(x, y, playerid.x, playerid.y, obj_solid, false, true) == noone)
	{
		state = "jump";
		sprite_index = ragespr;
		vsp = -5;
		hsp = 0;
		if (playerid.x != x)
		{
			image_xscale = sign(playerid.x - x);
		}
	}
}
else if (state == "jump")
{
	if (grounded && vsp > 0)
	{
		fmod_event_instance_play(chargesnd);
		fmod_event_instance_set_3d_attributes(chargesnd, x, y);
		state = "charge";
		sprite_index = ragespr;
		attackspeed = 6;
	}
}
else if (state == "charge")
{
	idle = false;
	if (object_index != obj_farmerbaddie3 && !instance_exists(hitboxID))
	{
		with (instance_create(x, y, obj_forkhitbox))
		{
			ID = other.id;
			other.hitboxID = id;
		}
	}
	var x1 = disx_out;
	playerid = instance_nearest(x, y, obj_player);
	var t = playerid.x > (x - x1) && playerid.x < (x + x1) && playerid.y > (y - 400) && playerid.y < (y + 400);
	hsp = image_xscale * attackspeed;
	var q = outofsight;
	if (!t || collision_line(x, y, playerid.x, playerid.y, obj_solid, true, false) != noone)
	{
		outofsight = true;
	}
	if (t)
	{
		outofsight = false;
	}
	if (outofsight)
	{
		if (q != outofsight)
		{
			waitbuffer = 30;
		}
		if (waitbuffer > 0)
		{
			waitbuffer--;
		}
		else
		{
			attackspeed = approach(attackspeed, 0, 0.1);
		}
	}
	else
	{
		attackspeed = approach(attackspeed, attackmaxspeed, 1);
	}
	if (attackspeed <= 0)
	{
		cooldown = 60;
		state = "walk";
		sprite_index = walkspr;
	}
	if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_slope))
	{
		image_xscale *= -1;
	}
}
if (state != "charge" && hitboxID != noone && instance_exists(hitboxID))
{
	instance_destroy(hitboxID);
	hitboxID = noone;
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
