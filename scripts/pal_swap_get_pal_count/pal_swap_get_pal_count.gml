function pal_swap_get_pal_count()
{
	if (live_call()) return live_result;
	return sprite_get_width(argument[0]);
}
