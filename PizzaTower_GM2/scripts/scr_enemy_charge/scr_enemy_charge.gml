function enemy_charge()
{
	if (object_index == obj_peasanto)
	{
		if (grounded || (grounded && !place_meeting(x, y, obj_platform)))
		{
			hsp = xscale * 6;
		}
		image_speed = 0.35;
		if ((scr_solid(x + 1, y) && xscale == 1) || (scr_solid(x - 1, y) && xscale == -1) || place_meeting(x + hsp, y, obj_hallway))
		{
			if (!place_meeting(x + sign(hsp), y, obj_slope))
			{
				xscale *= -1;
			}
		}
		if (!(scr_solid(x + (xscale * 15), y + 31) || place_meeting(x + (xscale * 15), y + 31, obj_platform)))
		{
			xscale *= -1;
		}
		if (!(grounded || (grounded && !place_meeting(x, y, obj_platform))) && hsp < 0)
		{
			hsp += 0.1;
		}
		else if (!(grounded || (grounded && !place_meeting(x, y, obj_platform))) && hsp > 0)
		{
			hsp -= 0.1;
		}
		sprite_index = spr_peasanto_flameattack;
	}
	if (object_index == obj_indiancheese)
	{
		if (ANIMATION_END)
		{
			image_speed = 0;
		}
		hsp = xscale * movespeed;
		if (grounded && vsp > 0)
		{
			if (place_meeting(x + xscale, y, obj_solid))
			{
				xscale *= -1;
			}
			state = "walk";
			image_index = 0;
			image_speed = 0.35;
			sprite_index = spr_indiancheese_land;
		}
	}
	if (object_index == obj_snowman)
	{
		hsp = xscale * movespeed;
		image_speed = 0.35;
		sprite_index = spr_newpizzice_walk;
		if (((scr_solid(x + 1, y) && xscale == 1) || (scr_solid(x - 1, y) && xscale == -1)) && !place_meeting(x + sign(hsp), y, obj_slope))
		{
			image_index = 0;
			sprite_index = spr_newpizzice_turn;
			state = "idle";
			hsp = 0;
		}
	}
	if (object_index == obj_fencer || object_index == obj_banditochicken)
	{
		if (object_index == obj_fencer)
		{
			if (grounded || (grounded && !place_meeting(x, y, obj_platform)))
			{
				hsp = xscale * movespeed;
			}
			else
			{
				hsp = 0;
			}
		}
		else
		{
			hsp = xscale * movespeed;
		}
		if (((scr_solid(x + 1, y) && xscale == 1) || (scr_solid(x - 1, y) && xscale == -1)) && !place_meeting(x + sign(hsp), y, obj_slope))
		{
			xscale *= -1;
		}
	}
	if (object_index == obj_ancho)
	{
		hsp = xscale * movespeed;
		if (place_meeting(x + hsp, y, obj_solid))
		{
			state = "stun";
			stunned = 100;
		}
	}
	if (object_index == obj_ninja)
	{
		inv_timer = 5;
		hsp = xscale * 2;
		if (grounded && vsp > 0)
		{
			state = "walk";
			sprite_index = idlespr;
		}
		if (alarm[4] == -1)
		{
			alarm[4] = 5;
		}
	}
	if (place_meeting(x, y + 1, obj_railparent))
	{
		var _railinst = instance_place(x, y + 1, obj_railparent);
		hsp += (_railinst.movespeed * _railinst.dir);
	}
}
