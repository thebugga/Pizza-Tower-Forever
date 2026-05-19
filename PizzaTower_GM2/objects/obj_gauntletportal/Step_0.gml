if (distance_to_object(playerid) < 350 && !caughtplayer)
{
	with (playerid)
	{
		sprite_index = spr_player_rockethitwall;
		state = states.gauntletportal;
		gauntletportalID = other.id;
	}
	
	caughtplayer = true;
}

if (caughtplayer)
{
	transition = Approach(transition, 0, 0.009);	
	if (transition <= 0.02)
	{
		transition = 0;	
	}
	with (playerid)
	{
		scale_xs = Approach(scale_xs, 0, 0.05);
		scale_ys = Approach(scale_ys, 0, 0.05);	
	}
}