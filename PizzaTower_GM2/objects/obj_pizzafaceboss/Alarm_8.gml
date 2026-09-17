if (image_alpha == 1)
{
	image_alpha = 0.5;
}
else
{
	image_alpha = 1;
}
if (!on_y && state == "walk")
{
	alarm[8] = 5;
}
else
{
	image_alpha = 1;
	alarm[8] = -1;
}
