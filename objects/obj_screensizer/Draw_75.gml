surface_reset_target();
shader_reset();
draw_set_alpha(1);

if (!surface_exists(gui_surf) || app_scale_x <= 0 || app_scale_y <= 0)
{
	gpu_set_blendmode(bm_normal);
	exit;
}

global.Pattern_Texture_Indexed = -4;

if ((frac(app_scale_x) > 0 || frac(app_scale_y) > 0) && global.option_texfilter)
	gpu_set_texfilter(true);
else
	gpu_set_texfilter(false);

var normal_appscale = min(savedwidth / ideal_width, savedheight / ideal_height);
var normal_apps_x = (savedwidth - (ideal_width * normal_appscale)) / 2 / normal_appscale;
var normal_apps_y = (savedheight - (ideal_height * normal_appscale)) / 2 / normal_appscale;
var apps_x = ((savedwidth / 2) - ((surface_get_width(application_surface) * app_scale_x) / 2)) / normal_appscale;
var apps_y = ((savedheight / 2) - ((surface_get_height(application_surface) * app_scale_y) / 2)) / normal_appscale;
draw_surface_ext(gui_surf, -normal_apps_x + apps_x, -normal_apps_y + apps_y, (1 / normal_appscale) * app_scale_x, (1 / normal_appscale) * app_scale_y, 0, c_white, 1);

if (variable_global_exists("smallfont"))
{
	var font = lang_get_font("smallfont");
	
	if (!is_undefined(font) && rescapped_warn > 0)
	{
		draw_set_color(c_yellow);
		draw_set_font(font);
		draw_set_halign(fa_left);
		draw_set_valign(fa_bottom);
		var str = lang_get_value("eso_resolution_capped");
		
		if (is_undefined(str))
			str = "RESOLUTION CAPPED AT 4096X4096 TO PREVENT CRASHES.";
		
		draw_text_ext_transformed(-normal_apps_x + (16 / normal_appscale), -normal_apps_y + ((window_get_height() - 16) / normal_appscale), str, -1, window_get_width() - 32, 1 / normal_appscale, 1 / normal_appscale, 0);
	}
}

gpu_set_blendmode(bm_normal);
gpu_set_texfilter(false);
gameframe_draw();
