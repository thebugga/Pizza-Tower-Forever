function scr_player_machfreefall()
{
	hsp = move * movespeed;
	movespeed = 4;
	machslideAnim = true;
	move2 = key_right2 + key_left2;
	move = key_right + key_left;
	crouchslideAnim = true;
	sprite_index = spr_player_machfreefall;
	if (scr_solid(x + 1, y) && xscale == 1)
	{
		machhitAnim = false;
		state = states.bump;
		hsp = -3;
		vsp = -3;
		image_index = 0;
		instance_create(x + 10, y + 10, obj_bumpeffect);
	}
	else if (scr_solid(x - 1, y) && xscale == -1)
	{
		machhitAnim = false;
		state = states.bump;
		hsp = 3;
		vsp = -3;
		image_index = 0;
		instance_create(x - 10, y + 10, obj_bumpeffect);
	}
	if (grounded && !(input_buffer_jump > 0))
	{
		freefallstart = 0;
		with (obj_camera)
		{
			shake_mag = 3;
			shake_mag_acc = 3 / room_speed;
		}
		bounce = false;
		if !key_attack
		{
			state = states.freefallland;
		}
		else
		{
			movespeed = 9;
			state = states.mach2;
		}
		jumpstop = false;
		image_index = 0;
		with (instance_create(x, y + 35, obj_bangeffect))
		{
			image_xscale = other.xscale;
		}
		create_particle(x, y, particletypes.landcloud, 0);
		var c = c_black;
		var lag = 20;
		with (obj_baddie)
		{
			if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
			{
				hp = -99;
				state = states.hit;
				hitLag = lag;
				hitX = x;
				hitY = y;
				if (elite)
				{
					elitehit = -1;
					mach3destroy = true;
				}
				if (destroyable)
				{
					c++;
				}
				instance_create(x, y, obj_parryeffect);
				alarm[3] = 3;
				instance_create(x, y, obj_slapstar);
				instance_create(x, y, obj_slapstar);
				instance_create(x, y, obj_slapstar);
				instance_create(x, y, obj_baddiegibs);
				instance_create(x, y, obj_baddiegibs);
				instance_create(x, y, obj_baddiegibs);
			}
		}
	}
	image_speed = 0.5;
}
