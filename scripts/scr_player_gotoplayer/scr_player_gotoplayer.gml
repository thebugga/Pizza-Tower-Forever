function scr_player_gotoplayer()
{
	pogochargeactive = false;
	movespeed = 0;
	visible = false;

	playerid = (object_index == obj_player2) ? obj_player1 : obj_player2;
	var _dir = point_direction(x, y, playerid.x, playerid.y);
	hsp = lengthdir_x(16, _dir);
	vsp = lengthdir_y(16, _dir);
	var t = spr_tv_golfN;
	repeat (8)
	{
		create_particle(x + irandom_range(-t, t), y + irandom_range(-t, t), particletypes.cloudeffect, 0);
	}
	if (distance_to_object(playerid) < 16)
	{
		create_particle(x, y, particletypes.genericpoofeffect, 0);
	}
}
