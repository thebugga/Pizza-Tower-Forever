if (playerid == noone && other.state != "actor" && !instance_exists(obj_bossplayerdeath))
{
	playerid = other.id;
	other.state = states.noiseskateboard;
	other.sprite_index = other.spr_bump;
	other.hsp = 0;
	other.vsp = 0;
}
