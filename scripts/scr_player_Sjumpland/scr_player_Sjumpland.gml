function scr_player_Sjumpland()
{
	if (live_call()) return live_result;
	mach2 = 0;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	machslideAnim = true;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = false;
	machhitAnim = false;
	movespeed = 0;
	start_running = true;
	alarm[4] = 14;
	vsp = 0;
	hsp = 0;
	if ANIMATION_END
	{
		sprite_index = spr_machfreefall;
		state = states.jump;
		jumpAnim = false;
	}
}
