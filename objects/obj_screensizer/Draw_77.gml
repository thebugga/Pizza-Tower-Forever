if (app_scale_x <= 0 || app_scale_y <= 0)
	exit;
draw_set_alpha(1);
gpu_set_blendmode(bm_normal);
draw_set_color(c_white);
var shd = false;

if (frac(app_scale) > 0 && global.option_texfilter)
{
	var tex = surface_get_texture(application_surface);
	var tw = texture_get_texel_width(tex);
	var th = texture_get_texel_height(tex);
	shader_set(shd_aa);
	gpu_set_texfilter(true);
	shader_set_uniform_f(shader_get_uniform(shd_aa, "u_vTexelSize"), tw, th);
	shader_set_uniform_f(shader_get_uniform(shd_aa, "u_vScale"), window_get_width() / surface_get_width(application_surface), window_get_height() / surface_get_height(application_surface));
	shd = true;
}
else
	gpu_set_texfilter(false);
	
draw_rectangle_color(-100, -100, savedwidth + 100, savedheight + 100, c_black, c_black, c_black, c_black, false);
gpu_set_blendenable(false);
var ratio = window_get_width() / window_get_height()
if ratio != SCREEN_WIDTH / SCREEN_HEIGHT && global.option_letterbox
	draw_sprite_tiled(lb_sprs[global.option_letterboxindex], 0, SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)
draw_surface_ext(application_surface, (savedwidth / 2) - ((surface_get_width(application_surface) * app_scale_x) / 2), (savedheight / 2) - ((surface_get_height(application_surface) * app_scale_y) / 2), app_scale_x, app_scale_y, 0, c_white, 1);
gpu_set_blendenable(true);

if (shd)
	shader_reset();
