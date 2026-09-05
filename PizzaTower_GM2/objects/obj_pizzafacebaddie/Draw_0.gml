if (usepalette)
{
	//shader_set(global.retro_pal_swapper);
	pal_swap_set(spr_palette, paletteselect);
}
draw_sprite_ext(sprite_index, image_index, x, y + 25, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (usepalette)
{
	shader_reset();
}
