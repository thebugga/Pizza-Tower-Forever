function enemy_rage()
{
	switch (object_index)
	{
		case obj_forknight:
			image_speed = 0.6;
			if (sprite_index == spr_forknight_ragestart)
			{
				hsp = 0;
				if (image_index > (image_number - 1))
				{
					sprite_index = spr_forknight_rageloop;
					image_index = 0;
				}
			}
			else if (sprite_index == spr_forknight_rageloop)
			{
				hsp = xscale * (4 + (global.baddiespeed - 1));
				with (instance_place(x + hsp, y, obj_destructibles))
				{
					instance_destroy();
				}
				if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_slope))
				{
					state = "stun";
					stunned = 100;
					vsp = -8;
					hsp = -xscale * 5;
				}
			}
			break;
		case obj_soldier:
			hsp = 0;
			if (!hitboxcreate)
			{
				hitboxcreate = true;
				with (instance_create(x, y, obj_forkhitbox))
				{
					xscale = other.xscale;
					ID = other.id;
				}
			}
			if (ANIMATION_END)
			{
				ragebuffer = 100;
				state = "walk";
				sprite_index = walkspr;
			}
			break;
		case obj_smokingpizzaslice:
			if (floor(image_index) == 12 && !shot)
			{
				with (instance_create(x + (xscale * 70), y + 8, obj_parryeffect))
				{
					sprite_index = spr_player_pistoleffect;
					xscale = other.xscale;
					image_speed = 0.4;
				}
				fmod_event_one_shot_3d("event:/sfx/enemies/rancherpistol", x, y);
				shot = true;
				with (instance_create(x + (xscale * 15), y + 5, obj_slugbullet))
				{
					xscale = other.xscale;
				}
			}
			if (ANIMATION_END)
			{
				shot = false;
				sprite_index = spr_pizzaslug_walk;
				state = "walk";
				ragecooldown = 100;
			}
			break;
		case obj_indiancheese:
			ragedash--;
			if (ragedash == 0)
			{
				ragecooldown = 200;
				ragedash = 50;
				state = "walk";
				sprite_index = walkspr;
			}
			if (!shot && ragedash < 30)
			{
				fmod_event_one_shot_3d("event:/sfx/enemies/projectile", x, y);
				shot = true;
				with (instance_create(x, y, obj_arcprojectile))
				{
					xscale = other.xscale;
					hsp = xscale * 6;
					vsp = -11;
				}
			}
			break;
		case obj_miniufo:
			if (floor(image_index) == 3 && shoot == false)
			{
				shoot = true;
				instance_create(x, y, obj_warplaserhoming);
			}
			if (ANIMATION_END)
			{
				state = "walk";
			}
			break;
		case obj_cheeseslime:
			if (floor(image_index) > 10)
			{
				hsp = xscale * 8;
				with (instance_create(x, y, obj_baddieragehitbox))
				{
					ID = other.id;
					xscale = other.xscale;
				}
			}
			else
			{
				hsp = 0;
			}
			if (ANIMATION_END)
			{
				state = "walk";
				sprite_index = walkspr;
			}
			break;
		case obj_minijohn:
			hsp = movespeed * xscale;
			if (sprite_index == spr_minijohn_rage1 && ANIMATION_END)
			{
				sprite_index = spr_minijohn_rage2;
			}
			if (grounded && vsp > 0)
			{
				var targetplayer = obj_player1;
				if (obj_player1.spotlight == false)
				{
					targetplayer = obj_player2;
				}
				movespeed = 4;
				xscale = -sign(x - targetplayer.x);
				state = states.chase;
				sprite_index = spr_minijohn_charge;
			}
			break;
		case obj_fencer:
			var thespeed = 0;
			if (image_index > 7)
			{
				thespeed = 12;
			}
			hsp = xscale * thespeed;
			if (ANIMATION_END)
			{
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
			break;
		case obj_ancho:
			hsp = 0;
			if (sprite_index == spr_ancho_rage1)
			{
				vsp = 0;
			}
			if (sprite_index == spr_ancho_rage2)
			{
				vsp = 10;
			}
			if (ANIMATION_END && sprite_index == spr_ancho_rage1)
			{
				sprite_index = spr_ancho_rage2;
			}
			if (grounded && sprite_index == spr_ancho_rage2)
			{
				with (obj_camera)
				{
					shake_mag = 10;
					shake_mag_acc = 30 / room_speed;
				}
				image_index = 0;
				sprite_index = spr_ancho_rage3;
			}
			if (ANIMATION_END && sprite_index == spr_ancho_rage3)
			{
				state = "walk";
				sprite_index = spr_ancho;
			}
			break;
		case obj_spitcheese:
			//ragedash--;
			//if (ragedash <= 0)
			//{
			//	with (instance_create(x, y, obj_bigspitcheesespike))
			//	{
			//		other.ragedash = 50;
			//		hsp = other.xscale * 5;
			//		vsp = -7;
			//	}
			//}
			//if (ANIMATION_END)
			//{
			//	state = "walk";
			//	sprite_index = spr_spitcheese_idle;
			//}
			break;
		case obj_tank:
			if (sprite_index != spr_tank_chargestart)
			{
				if ((x + hsp) == xprevious)
				{
					slope_buffer--;
				}
				else
				{
					slope_buffer = 12;
				}
			}
			if (sprite_index == spr_tank_chargestart)
			{
				hsp = 0;
			}
			if (sprite_index == spr_tank_charge)
			{
				hsp = xscale * 8;
			}
			if (ANIMATION_END && sprite_index == spr_tank_chargestart)
			{
				sprite_index = spr_tank_charge;
			}
			with (instance_place(x + hsp, y, obj_destructibles))
			{
				instance_destroy();
			}
			if ((place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_destructibles) && !scr_slope()) || slope_buffer <= 0)
			{
				slope_buffer = 8;
				state = "stun";
				hsp = -xscale * 7;
				vsp = -6;
				sprite_index = spr_tank_hitwall;
				stunned = 200;
				bombreset = 200;
			}
			break;
		case obj_thug_red:
			if (!shot && floor(image_index) == 9)
			{
				shot = true;
				with (instance_create(x + (8 * xscale), y, obj_robotknife))
				{
					xscale = other.xscale;
					hsp = other.xscale * 5;
				}
			}
			if (ANIMATION_END)
			{
				ragecooldown = 100;
				state = "walk";
			}
			break;
	}
	if (place_meeting(x, y + 1, obj_railparent))
	{
		var _railinst = instance_place(x, y + 1, obj_railparent);
		hsp += (_railinst.movespeed * _railinst.dir);
	}
}
