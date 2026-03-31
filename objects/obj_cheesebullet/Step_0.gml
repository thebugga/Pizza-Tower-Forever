event_inherited();
if (image_index > 7 && woosh)
{
	spd = 18;
	with (instance_create(x, 401, obj_jumpdust))
	{
		image_xscale = other.image_xscale;
	}
	woosh = false;
}

