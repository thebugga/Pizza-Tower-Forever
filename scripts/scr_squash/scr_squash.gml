function scr_squash()
{
	if (live_call()) return live_result;
	xscale = Approach(xscale, 1, 0.03);
	yscale = Approach(yscale, 1, 0.03);
}
