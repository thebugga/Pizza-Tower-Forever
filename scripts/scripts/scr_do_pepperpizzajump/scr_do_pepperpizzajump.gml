function scr_do_pepperpizzajump()
{
	if (live_call()) return live_result;
	state = states.jetpackjump;
	jumpstop = false;
	sprite_index = spr_jetpackstart2;
}
