function pal_swap_enable_override()
{
	if (live_call()) return live_result;
	return sprite_duplicate(argument[0]);
}
