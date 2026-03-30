function scr_player_portal()
{
	if (live_call()) return live_result;
	if (ANIMATION_END && sprite_index == spr_pizzaportalentrancestart)
	{
		instance_create(x, y, obj_pizzaportalfade);
		state = states.freefall;
		grav = 0.5;
	}
	mach2 = 0;
}
