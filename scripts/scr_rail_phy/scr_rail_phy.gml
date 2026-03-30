function scr_rail_phy()
{
	if (live_call()) return live_result;
	with (instance_place(x, y + 1, obj_railparent))
	{
		other.hsp_carry = dir * movespeed;
	}
}
