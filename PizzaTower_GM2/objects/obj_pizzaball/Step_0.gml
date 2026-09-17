
if (state == "walk" && grounded && vsp > 0 && (obj_player1.state == "freefallland" || (obj_player1.state == "ratmountbounce" && obj_player1.sprite_index == spr_playerN_noisecrusherland)) && bbox_in_camera(view_camera[0], 32))
{
	scr_pizzaball_go_to_thrown(0, -10);
}
arrowindex += 0.35;
switch (state)
{
	case "idle":
		enemy_idle();
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
		scr_pizzaball_hit();
		break;
	case "golf":
		scr_pizzaball_golf();
		break;
	case "thrown":
		scr_pizzaball_thrown();
		break;
	case "stun":
		enemy_stun();
		if (stunned > 0)
		{
			stunned -= 1;
		}
		break;
	case "enemy_throw":
		enemy_throw();
		break;
	case "grabbed":
		scr_pizzaball_grabbed();
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
if (state != "golf")
{
	shootup = false;
	arrow = false;
}
if (state == "thrown")
{
	if (blur_effect > 0)
	{
		blur_effect--;
	}
	else
	{
		blur_effect = 2;
		with (create_blur_afterimage(x, y, sprite_index, image_index - 1, xscale))
		{
			playerid = other.id;
		}
	}
}
if ((state == "walk" || state == "idle") && sit)
{
	hsp = 0;
	sprite_index = spr_pizzaball_idle1;
}
if (state != "walk")
{
	sit = false;
}
if (state == "stun" && stunned > 100 && birdcreated == false)
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
	{
		ID = other.id;
	}
}
if (state == "thrown" && !instance_exists(pointerID))
{
	pointerID = instance_create(x, y, obj_objecticontracker);
	pointerID.sprite_index = spr_icon_pizzaball;
	pointerID.objectID = id;
}
if (state != "stun")
{
	birdcreated = false;
}
if (flash == true && alarm[2] <= 0)
{
	alarm[2] = 0.15 * room_speed;
}
if (bigcheeseID != noone)
{
	if (!instance_exists(bigcheeseID) || bigcheeseID.state != "throwing" || bigcheeseID.shot)
	{
		if (instance_exists(bigcheeseID) && bigcheeseID.object_index == obj_golfburger && sprite_index == stunfallspr)
		{
			sprite_index = walkspr;
		}
		bigcheeseID = noone;
	}
	else
	{
		invincible = true;
	}
}
else
{
	invincible = false;
}
if (hitbuffer > 0)
{
	invincible = true;
	hitbuffer--;
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
if (state == "thrown")
{
	with (instance_place(x + xscale, y, obj_destructibles))
	{
		instance_destroy();
	}
	with (instance_place(x + hsp + xscale, y, obj_destructibles))
	{
		instance_destroy();
	}
	with (instance_place(x, y + vsp + 1, obj_destructibles))
	{
		instance_destroy();
	}
	with (instance_place(x, (y + vsp) - 1, obj_destructibles))
	{
		instance_destroy();
	}
	with (instance_place(x, y + 1, obj_destructibles))
	{
		instance_destroy();
	}
	with (instance_place(x, y - 1, obj_destructibles))
	{
		instance_destroy();
	}
}
