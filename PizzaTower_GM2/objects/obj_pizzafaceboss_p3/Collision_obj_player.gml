if (state == "freefall" || (state == "mach2" && attackspeed >= 18) || state == "Sjump" || (state == "throwing" && attackspeed > 0))
{
	if (other.flash)
	{
		flash = false;
	}
	scr_hurtplayer(other);
}
