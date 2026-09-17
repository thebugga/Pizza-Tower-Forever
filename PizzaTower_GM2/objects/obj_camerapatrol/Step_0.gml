
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
		if (!instance_exists(coneID))
		{
			coneID = instance_create(x, y, obj_patrolcone);
			coneID.xoffset = 24;
			coneID.baddieID = id;
		}
		if (alarm[5] != -1)
		{
			hsp = 0;
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
if (cooldown > 0)
{
	cooldown--;
}
if (state == "walk")
{
	if (!patrolfound)
	{
		if (!instance_exists(obj_jumpscare) && cooldown <= 0 && alarm[5] == -1 && instance_exists(coneID) && coneID.collision)
		{
			patroltimer = patroltimermax;
			patrolfound = true;
			alarm[5] = 30;
		}
	}
	else if (alarm[5] == -1)
	{
		alarm[5] = 30;
	}
}
else if (state == "stun" || state == "grabbed" || state == "hit")
{
	alarm[5] = -1;
}
if (instance_exists(obj_jumpscare))
{
	patrolfound = false;
	alarm[5] = -1;
}
if (state == "walk" && point_in_camera(x, y, view_camera[0]))
{
	var p = false;
	with (obj_player)
	{
		if (state == "backbreaker" && sprite_index == spr_taunt)
		{
			p = true;
		}
	}
	if (!p)
	{
		with (obj_swapmodefollow)
		{
			if (taunttimer > 0)
			{
				p = true;
			}
		}
	}
	if (p && (alarm[5] == -1 || patroltimer > 0))
	{
		patroltimer = 0;
		alarm[5] = -1;
		event_perform(ev_alarm, 5);
	}
}
if (state == "punch")
{
	hsp = 0;
	if (ANIMATION_END)
	{
		state = "walk";
		sprite_index = walkspr;
		cooldown = 100;
	}
}
if (flash == true && alarm[2] <= 0)
{
	alarm[2] = 0.15 * room_speed;
}
if (state != "grabbed")
{
	depth = 0;
}
if (state == "stun" || state == "walk")
{
	movespeed = 0;
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
