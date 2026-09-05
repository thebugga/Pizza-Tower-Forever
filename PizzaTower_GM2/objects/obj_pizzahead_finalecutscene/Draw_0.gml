//shader_set(global.retro_pal_swapper);
pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture);
pal_swap_set(spr_peppalette, obj_player1.paletteselect);
draw_self();
pattern_reset();
shader_reset();
