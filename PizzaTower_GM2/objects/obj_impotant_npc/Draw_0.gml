if sprite_index != spr_lonegustavo_idle || sprite_index != spr_player_ratmountidle || sprite_index != spr_player_idle || sprite_index != spr_playerS_idle
	draw_self()
else
{
	//shader_set(global.retro_pal_swapper);
	pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture);
	pal_swap_set(obj_player.spr_palette, obj_player.paletteselect);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	pattern_reset();
	reset_shader_fix();
}