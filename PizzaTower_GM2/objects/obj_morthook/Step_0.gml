var _found = false;
with (obj_player)
{
	if (state == "mort" || state == "mortjump" || state == "mortattack" || state == "morthook")
	{
		_found = true;
	}
}
if (_found)
{
	image_alpha = 1;
}
else
{
	image_alpha = 0.5;
}
if (projectilebuffer > 0)
{
	projectilebuffer--;
}
