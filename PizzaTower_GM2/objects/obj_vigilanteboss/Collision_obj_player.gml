if (state == "crouchslide")
{
	if (other.flash)
	{
		other.flash = false;
	}
	scr_hurtplayer(other);
}
else if ((state == states.reloading || (state == "stun" && savedthrown == thrown && !savedthrown)) && wastedhits == 4 && phase == 1 && (other.instakillmove || other.state == "handstandjump"))
{
	scr_vigilante_do_hurt_phase2(other);
}
