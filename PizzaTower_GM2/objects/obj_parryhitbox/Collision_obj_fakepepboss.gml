var state = other.state;
var attackspeed = other.attackspeed;
if (state == "freefall" || (state == "mach2" && attackspeed >= 18) || state == "Sjump" || (state == "throwing" && attackspeed > 4))
{
	if (!collisioned)
	{
		event_user(0);
	}
}
