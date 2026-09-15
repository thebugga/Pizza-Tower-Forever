instance_destroy();
with (playerid)
{
	if (!isgustavo)
	{
		state = "default";
	}
	else
	{
		state = "ratmount";
	}
	visible = true;
}
with (obj_ghostfollow)
{
	x = xstart;
	y = ystart;
}
