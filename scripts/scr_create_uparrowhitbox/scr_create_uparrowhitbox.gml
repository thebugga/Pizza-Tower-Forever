function scr_create_uparrowhitbox()
{
	if (live_call()) return live_result;
	var b;
	with (instance_create(x, y, obj_uparrowhitbox))
	{
		ID = other.id;
		b = id;
	}
	return b;
}
