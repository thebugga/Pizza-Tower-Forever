var state = other.state;
var attackspeed = other.attackspeed;
if ((state == "freefall" && sprite_index != spr_fakepeppino_bodyslamland) || (state == "mach2" && attackspeed >= 50) || state == "Sjump" || (state == "throwing" && other.sprite_index == spr_fakepeppino_flailing))
{
	if (!collisioned)
	{
		event_user(0);
	}
}
