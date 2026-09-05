if ((!obj_player1.ispeppino || global.swapmode) && stick)
{
	draw_self();
}
else
{
	//shader_set(global.retro_pal_swapper);
	pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, patterntexture);
	pal_swap_set(spr_palette, paletteselect);
	draw_self();
	pattern_reset();
	shader_reset();
}
