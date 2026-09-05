//shader_set(global.retro_pal_swapper);
pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale * obj_player1.scale_xs, image_yscale * obj_player1.scale_ys, global.palettetexture);
pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect);
draw_self();
pattern_reset();
shader_reset();
