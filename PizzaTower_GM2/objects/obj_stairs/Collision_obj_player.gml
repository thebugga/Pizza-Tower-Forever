with (other)
{
	if (key_up && ladderbuffer == 0 && (state == "default" || state == "pogo" || state == "mach2" || state == "mach3" || state == "mach1" || state == "shotgunjump" || state == "jump" || state == "highjump") && state != "hurt" && state != "machslide" && state != "freefall" && state != "freefallland")
	{
		mach2 = 0;
		state = "ladder";
		y = floor(y);
		if ((y % 2) == 1)
		{
			y -= 1;
		}
	}
}
