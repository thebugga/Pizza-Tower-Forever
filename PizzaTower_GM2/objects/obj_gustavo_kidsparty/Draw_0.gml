//shader_set(global.retro_pal_swapper);
var _palinfo = get_pep_palette_info();
pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, _palinfo.patterntexture);
if (sprite_index == spr_gustavo_kidsparty)
{
	pal_swap_set(_palinfo.spr_palette, _palinfo.paletteselect);
}
else
{
	pal_swap_set(spr_peppaletteN, 1, false);
}
draw_self();
pattern_reset();
shader_reset();
