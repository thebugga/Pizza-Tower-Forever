function player_portal()
{
	if (ANIMATION_END && sprite_index == spr_pizzaportalentrancestart)
	{
		instance_create(x, y, obj_pizzaportalfade);
		state = "freefall";
		grav = 0.5;
	}
	mach2 = 0;
}
