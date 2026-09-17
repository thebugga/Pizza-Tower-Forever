function scr_noisey_float()
{
	sprite_index = spr_noisey_grabbed;
	hsp = 0;
	vsp = 0;
	var spd = 4;
	var acc = 0.25;
	if (dir == 0)
	{
		float_vsp = spd;
		float_hsp = 0;
		y = approach(y, y_to, float_vsp);
		if (abs(y - y_to) < 32)
		{
			dir++;
		}
	}
	else if (dir == 1)
	{
		float_hsp = approach(float_hsp, spd, acc);
		float_vsp = approach(float_vsp, 0, acc);
		x = approach(x, x_to, float_hsp);
		y = approach(y, y_to, float_vsp);
		if (abs(x - x_to) < 32)
		{
			dir++;
		}
	}
	else
	{
		float_hsp = approach(float_hsp, 0, acc);
		float_vsp = approach(float_vsp, spd, acc);
		x = approach(x, x_to, spd);
		y = approach(y, ystart, spd);
		if (abs(y - ystart) < 32)
		{
			instance_destroy(id, false);
		}
	}
}
