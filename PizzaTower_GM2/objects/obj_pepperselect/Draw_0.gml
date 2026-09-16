//shader_set(global.retro_pal_swapper);
var game = global.game[global.currentsavefile - 1];
var pal = game.palette_player3;
var tex = game.palettetexture_player3;
pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, tex);
pal_swap_set(pal_peppermanplayable, pal, false);
draw_self();
pattern_reset();
shader_reset();
