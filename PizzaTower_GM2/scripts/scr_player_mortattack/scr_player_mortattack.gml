function player_mortattack()
{
	image_speed = 0.45;
	hsp = movespeed;
	if (character == "Noise")
	{
		if (instance_exists(mortprojectileID) && instance_exists(mortprojectileID.target) && mortprojectileID.target.object_index == obj_morthook)
		{
			targethsp = approach(targethsp, 0, 0.8);
			targetvsp = approach(targetvsp, 0, 0.8);
			hsp = targethsp;
			vsp = targetvsp;
		}
		else
		{
			vsp -= 0.2;
			move = key_left + key_right;
			if (move != 0)
			{
				movespeed = approach(movespeed, move * 4, 0.1);
			}
		}
		if (ANIMATION_END)
		{
			image_index = image_number - 1;
		}
	}
	if ((character == "Peppino" && ANIMATION_END) || (character == "Noise" && !instance_exists(mortprojectileID)))
	{
		if (grounded && vsp > 0)
		{
			state = "mort";
			sprite_index = spr_playermortidle;
			landAnim = false;
		}
		else
		{
			state = "mortjump";
			sprite_index = spr_playermortjump;
		}
	}
	if (punch_afterimage > 0)
	{
		punch_afterimage--;
	}
	else
	{
		punch_afterimage = 5;
		with (create_mach3effect(x, y, sprite_index, image_index, true))
		{
			image_xscale = other.xscale;
		}
	}
}
