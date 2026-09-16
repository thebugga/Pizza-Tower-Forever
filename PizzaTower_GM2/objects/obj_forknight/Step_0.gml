
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
	case "ghostpossess":
		enemy_ghostpossess();
		break;
	case states.pizzaheadjump:
		enemy_pizzaheadjump();
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
if (elite && ragecooldown == 0)
{
	var player = instance_nearest(x, y, obj_player);
	var check = (image_xscale > 0) ? (player.x > x && player.x < (x + 400)) : (player.x < x && player.x > (x - 400));
	if (state == "walk")
	{
		if (check && (y <= (player.y + 60) && y >= (player.y - 60)))
		{
			image_xscale = -sign(x - player.x);
			//sprite_index = spr_forknight_ragestart;
			image_index = 0;
			flash = true;
			alarm[4] = 5;
			state = "rage";
			ragedash = 50;
			create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
		}
	}
}
if (ragedash > 0 && state == "rage")
{
	ragedash--;
}
if (ragedash == 0 && state == "rage")
{
	state = "walk";
	sprite_index = walkspr;
	ragecooldown = 100;
}
if (ragecooldown > 0)
{
	ragecooldown--;
}
if (flash == true && alarm[2] <= 0)
{
	alarm[2] = 0.15 * room_speed;
}
if (hitboxcreate == false && state == "walk")
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
		mask_index = other.sprite_index;
		baddieID = other.id;
		other.boxID = id;
		other.boundbox = true;
	}
}
