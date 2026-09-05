//shader_set(global.retro_pal_swapper);
var _palinfo = get_noise_palette_info();
pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, _palinfo.patterntexture);
pal_swap_set(_palinfo.spr_palette, _palinfo.paletteselect);
draw_self();
pattern_reset();
shader_reset();
