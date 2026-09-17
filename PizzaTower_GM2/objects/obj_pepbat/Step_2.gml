event_inherited();
if (state == "stun")
{
	if (!scr_solid(x, y))
	{
		scr_collide();
	}
	else
	{
		x += hsp;
		y += vsp;
	}
}
