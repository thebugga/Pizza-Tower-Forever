if ((state == "freefall" && sprite_index != spr_fakepeppino_bodyslamland) || (state == "mach2" && attackspeed >= 50) || state == "Sjump" || (state == "throwing" && sprite_index == spr_fakepeppino_flailing))
{
	if (other.flash)
	{
		flash = false;
	}
	scr_hurtplayer(other);
}
