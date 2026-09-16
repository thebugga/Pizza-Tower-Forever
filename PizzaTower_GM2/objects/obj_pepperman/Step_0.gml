
targetplayer = obj_player1.id;
wastedhits = 10 - elitehit;
if (elitehit <= 1 && phase == 2 && destroyable)
{
	destroyable = false;
}
switch (state)
{
	case "arenaintro":
		scr_pepperman_arenaintro();
		break;
	case "walk":
		scr_pepperman_walk();
		break;
	case "shoulderbash":
		scr_pepperman_shoulderbash();
		break;
	case "jump":
		scr_pepperman_jump();
		break;
	case "freefall":
		scr_pepperman_freefall();
		break;
	case "freefallprep":
		scr_pepperman_freefallprep();
		break;
	case "freefallland":
		scr_pepperman_freefallland();
		break;
	case states.shoulderturn:
		scr_pepperman_shoulderturn();
		break;
	case states.rolling:
		scr_pepperman_rolling();
		break;
	case states.contemplate:
		scr_pepperman_contemplate();
		break;
	case states.mini:
		scr_pepperman_mini();
		break;
	case states.phase1hurt:
		scr_pepperman_phase1hurt();
		break;
	case "hit":
		enemy_hit();
		break;
	case "stun":
		enemy_stun();
		break;
	case "grabbed":
		scr_boss_grabbed();
		break;
	case "pummel":
		enemy_pummel();
		break;
	case "staggered":
		enemy_staggered();
		break;
}
if (state != "stun" && state != "hit" && state != states.phase1hurt && state != "supergrab" && (state != "walk" || flickertime <= 0))
{
	scr_pepperman_do_contemplate();
}
if (pizzahead)
{
	with (obj_gustavograbbable)
	{
		if (thrown && (place_meeting(x + hsp, y, other) || place_meeting(x - image_xscale, y, other) || place_meeting(x - (32 * image_xscale), y, other) || place_meeting(x + (32 * image_xscale), y, other)))
		{
			with (other)
			{
				state = "stun";
				stunned = 1000;
				thrown = false;
				hsp = -image_xscale * 8;
				vsp = -4;
				instance_destroy(other);
			}
		}
	}
}
if (!pizzahead && wastedhits >= 10 && phase == 1 && state == "walk" && flickertime <= 0 && grounded && vsp > 0)
{
	repeat (4)
	{
		with (create_debris(x + random_range(-64, 64), y + random_range(-64, 64), spr_flashdots, true))
		{
			hsp = random_range(-5, 5);
			vsp = random_range(-10, 10);
			image_speed = 0.4;
		}
	}
	instance_destroy(obj_peppermanartdude);
	create_heatattack_afterimage(x, y, sprite_index, image_index, xscale);
	with (obj_camera)
	{
		shake_mag = 3;
		shake_mag_acc = 5 / room_speed;
	}
	var lay1 = layer_get_id("Backgrounds_scroll");
	var lay2 = layer_get_id("Backgrounds_2");
	var lay3 = layer_get_id("Backgrounds_1");
	var bg1 = layer_background_get_id(lay1);
	var bg2 = layer_background_get_id(lay2);
	alarm[7] = 5;
	layer_set_visible(lay3, true);
	layer_background_change(bg2, bg_peppermanboss2);
	layer_hspeed(lay1, 5);
	elitehit = 10;
	wastedhits = 0;
	phase = 2;
	fmod_event_one_shot_3d("event:/sfx/voice/peppermanlaugh", x, y);
	instance_destroy(obj_pepper_marbleblock);
	with (obj_pepper_marblespot)
	{
		created = false;
	}
	scr_sleep(25);
}
if (state == "stun")
{
	if (wastedhits >= 8 && sprite_index == spr_playerPM_mach3hitwall && grounded && vsp > 0 && !thrown && stunned > 10)
	{
		stunned = 1;
	}
	if (thrown)
	{
		savedthrown = true;
	}
	if (grounded && vsp > 0 && savedthrown)
	{
		stunned = 1;
		idle_timer = 1;
		if (wastedhits >= 10 && phase == 2 && !pizzahead)
		{
			instance_destroy(obj_pepper_marbleblock);
			fmod_event_one_shot_3d("event:/sfx/pepperman/shrink", x, y);
			fmod_event_one_shot_3d("event:/sfx/voice/peppermanscared", x, y);
			state = states.mini;
			ministate = "transitioncutscene";
			minibuffer = 480;
			sprite_index = spr_pepperman_ministart;
			image_index = 0;
		}
	}
}
else
{
	savedthrown = false;
}
if (prevhp != elitehit)
{
	if (elitehit < prevhp)
	{
		if (irandom(100) <= 33)
		{
			fmod_event_one_shot_3d("event:/sfx/voice/peppermanscared", x, y);
		}
		pizzahead_subhp = pizzahead_maxsubhp;
		bowlingballcount = 0;
		GIANTbowlingballcount = 0;
		touchedground = false;
		hsp += (-image_xscale * 5);
		flickertime = 11;
		alarm[6] = 5;
		global.playerhit++;
		if (pizzahead && elitehit <= 2 && !pizzaheadshot)
		{
			pizzaheadshot = true;
		}
		if (global.playerhit >= 3)
		{
			global.playerhit = 0;
			instance_create(obj_player1.x, -32, obj_hppickup);
		}
	}
	prevhp = elitehit;
}
boss_hurt_gustavo();
if (state == "freefall" || (state == states.rolling && vsp < 0))
{
	if (!instance_exists(hitboxID))
	{
		hitboxID = instance_create(x, y, obj_forkhitbox);
		with (hitboxID)
		{
			ID = other.id;
			sprite_index = spr_playerPM_bodyslamstart;
			mask_index = spr_playerPM_bodyslamstart;
		}
	}
}
else if (instance_exists(hitboxID))
{
	instance_destroy(hitboxID);
}
if (state == "stun" && stunned > 100 && birdcreated == false)
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
	{
		ID = other.id;
	}
}
if (((state != "stun" || savedthrown != thrown || (wastedhits >= 8 && (sprite_index == spr_playerPM_mach3hitwall || sprite_index == spr_playerPM_mach3hitwallstart)) || thrown) && (state != "freefallland" || landbuffer <= 0) && (state != states.rolling || vsp < 0 || sprite_index == spr_playerPM_bodyslamland) && state != states.contemplate) || flickertime > 0 || (wastedhits == 9 && phase == 1))
{
	invincible = true;
}
else
{
	invincible = false;
}
if (pizzahead && elitehit <= 1)
{
	destroyable = true;
	if (state == states.rolling && vsp > 0 && sprite_index != spr_playerPM_bodyslamland)
	{
		invincible = false;
	}
}
if (landbuffer2 > 0)
{
	if (state == "freefallland")
	{
		landbuffer2--;
		invincible = true;
	}
}
if ((!invincible || (state == states.mini && ministate != "transitioncutscene") || (wastedhits == 9 && phase == 1 && state == states.contemplate)) && !flash && alarm[5] < 0)
{
	alarm[5] = 0.15 * room_speed;
}
else if (invincible && (state != states.mini || ministate == "transitioncutscene") && (wastedhits != 9 || phase != 1 || state != states.contemplate))
{
	flash = false;
}
if ((state == "shoulderbash" || state == "freefall") && alarm[4] < 0)
{
	alarm[4] = 10;
	if (state == "freefall")
	{
		alarm[4] = 5;
	}
}
mask_index = spr_pepperman_mask;
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
var _art;
if (!pizzahead)
{
	_art = wastedhits >= 1;
}
else
{
	_art = elitehit <= 3;
}
if (_art && artdudes == false)
{
	alarm[8] = 600;
	artdudes = true;
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
scr_pepperman_sounds();
scr_pepperman_sprites();
