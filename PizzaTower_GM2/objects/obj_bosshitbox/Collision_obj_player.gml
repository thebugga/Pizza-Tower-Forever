if (parryable && other.state == "backbreaker" && other.parry_inst != noone)
{
	exit;
}
player_hurt(dmg, other.id);
