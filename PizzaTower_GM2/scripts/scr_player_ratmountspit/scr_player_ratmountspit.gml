function player_ratmountspit()
{
	image_speed = 0.6;
	hsp = 0;
	vsp = 0;
	with (ratgrabbedID)
	{
		scr_enemy_ratgrabbed();
	}
	if (ANIMATION_END)
	{
		state = "ratmount";
		ratgrabbedID = noone;
	}
}
