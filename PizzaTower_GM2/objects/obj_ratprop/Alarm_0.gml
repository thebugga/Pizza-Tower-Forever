if (state == "default")
{
	hsp = 0;
	state = "idle";
	alarm[0] = 80 + irandom(100);
}
else
{
	image_xscale *= -1;
	state = "default";
	alarm[0] = 60 + irandom(120);
}
