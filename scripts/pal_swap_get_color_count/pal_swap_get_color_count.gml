function pal_swap_get_color_count()
{
	if (live_call()) return live_result;
	return sprite_get_height(argument[0]);
}
