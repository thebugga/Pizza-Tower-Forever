surface_reset_target();
shader_reset();
draw_set_alpha(1);
if (!surface_exists(gui_surf))
{
	gpu_set_blendmode(bm_normal);
	exit;
}
global.Pattern_Texture_Indexed = noone;
var shd = false;
if (frac(app_scale) > 0 && global.option_texfilter)
{
	var tex = surface_get_texture(gui_surf);
	var tw = texture_get_texel_width(tex);
	var th = texture_get_texel_height(tex);
	shader_set(shd_aa);
	gpu_set_texfilter(true);
	shader_set_uniform_f(shader_get_uniform(shd_aa, "u_vTexelSize"), tw, th);
	shader_set_uniform_f(shader_get_uniform(shd_aa, "u_vScale"), window_get_width() / surface_get_width(gui_surf), window_get_height() / surface_get_height(gui_surf));
	shd = true;
}
var ratio = window_get_width() / window_get_height()
if ratio != SCREEN_WIDTH / SCREEN_HEIGHT && global.M_option_letterbox
	draw_sprite_tiled(lb_sprs[global.M_option_letterboxindex], 0, SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)
if (global.option_scale_mode == 0)
{
	draw_surface(gui_surf, 0, 0);
}
else
{
	var _w = display_get_gui_width() * app_scale;
	var _h = display_get_gui_height() * app_scale;
	draw_surface_ext(gui_surf, window_to_gui_x((window_get_width() / 2) - (_w / 2)), window_to_gui_y((window_get_height() / 2) - (_h / 2)), window_to_gui_xscale(app_scale), window_to_gui_yscale(app_scale), 0, c_white, 1);
}
gpu_set_blendmode(bm_normal);
if (shd)
{
	shader_reset();
}
gpu_set_texfilter(false);
if (lang_init && !instance_exists(obj_langload))
{
	global.gameframe_caption_font = lang_get_font("captionfont");
}
if room != Loadingroom
	draw_set_font(global.smallfont);
gameframe_draw();

