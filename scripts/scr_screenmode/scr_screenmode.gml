// scaling values:
// 0/absent: fit
// 1: fill (both axes)
// 2: fill screen width
// 3: fill screen height
function eso_calc_fit(scaling = 0) {
	eso_fit_scale = 1;
	eso_fit_aspect = 1;
	var ww = obj_screensizer.actual_width;
	var wh = obj_screensizer.actual_height;
	
	eso_fit_w = 960;
	eso_fit_h = 540;
	
	if (((((ww / wh) < (eso_fit_w / eso_fit_h)) == (scaling == 1)) || scaling == 3) && scaling != 2)
	{
		eso_fit_scale = wh / eso_fit_h;
		eso_fit_aspect = 1;
	}
	else
	{
		eso_fit_scale = ww / eso_fit_w;
		eso_fit_aspect = 0;
	}
}

function eso_fit_integer()
{
	if (eso_fit_scale >= 1)
		eso_fit_scale = floor(eso_fit_scale);
	
	eso_fit_aspect = -1;
}

function eso_get_fit_x(arg0)
{
	if (eso_fit_aspect == 0)
		return arg0 * eso_fit_scale;
	else
		return (arg0 * eso_fit_scale) + ((obj_screensizer.actual_width - (eso_fit_w * eso_fit_scale)) / 2);
}

function eso_get_fit_y(arg0)
{
	if (eso_fit_aspect == 1)
		return arg0 * eso_fit_scale;
	else
		return (arg0 * eso_fit_scale) + ((obj_screensizer.actual_height - (eso_fit_h * eso_fit_scale)) / 2);
}

function eso_draw_sprite_fit(arg0, arg1, arg2, arg3)
{
	draw_sprite_ext(arg0, arg1, eso_get_fit_x(arg2), eso_get_fit_y(arg3), eso_fit_scale, eso_fit_scale, 0, c_white, 1);
}

function eso_lang_draw_sprite_fit(arg0, arg1, arg2, arg3)
{
	lang_draw_sprite_ext(arg0, arg1, eso_get_fit_x(arg2), eso_get_fit_y(arg3), eso_fit_scale, eso_fit_scale, 0, c_white, 1);
}

function eso_draw_sprite_ext_fit(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
{
	draw_sprite_ext(arg0, arg1, eso_get_fit_x(arg2), eso_get_fit_y(arg3), arg4 * eso_fit_scale, arg5 * eso_fit_scale, arg6, arg7, arg8);
}

function eso_lang_draw_sprite_ext_fit(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
{
	lang_draw_sprite_ext(arg0, arg1, eso_get_fit_x(arg2), eso_get_fit_y(arg3), arg4 * eso_fit_scale, arg5 * eso_fit_scale, arg6, arg7, arg8);
}

// just in case find and replace does odd stuff i guess
function lang_eso_draw_sprite_fit(arg0, arg1, arg2, arg3)
{
	lang_draw_sprite_ext(arg0, arg1, eso_get_fit_x(arg2), eso_get_fit_y(arg3), eso_fit_scale, eso_fit_scale, 0, c_white, 1);
}

function lang_eso_draw_sprite_ext_fit(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
{
	lang_draw_sprite_ext(arg0, arg1, eso_get_fit_x(arg2), eso_get_fit_y(arg3), arg4 * eso_fit_scale, arg5 * eso_fit_scale, arg6, arg7, arg8);
}

function eso_should_force_vanillares()
{
	return (room == Loadiingroom || room == Longintro || room == Finalintro) && !instance_exists(obj_option);
}

function eso_reset_settings()
{
	global.screenmode = global.screenmodes.FIXED;
	global.scalemode = global.scalemodes.NORMAL;
	global.screenmode_w = 960;
	global.screenmode_h = 540;
	global.screenmode_scale = 1;
	global.screenmode_autores = false;
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("ExtraScalingOptions", "screenmode", global.screenmode);
	ini_write_real("ExtraScalingOptions", "scalemode", global.scalemode);
	ini_write_real("ExtraScalingOptions", "screenmode_w", global.screenmode_w);
	ini_write_real("ExtraScalingOptions", "screenmode_h", global.screenmode_h);
	ini_write_real("ExtraScalingOptions", "screenmode_scale", global.screenmode_scale);
	obj_savesystem.ini_str_options = ini_close();
	
	with (obj_option)
	{
		screenmode_opt.value = global.screenmode;
		scalemode_opt.value = global.scalemode;
		autores_opt.value = global.screenmode_autores;
	}
	
	screen_apply_size();
	obj_screensizer.dirty = true;
}

function eso_string_set(map, key, value) {
	if (!ds_map_exists(map, key)) {
		ds_map_set(map, key, value);
	}
}

function eso_strings()
{
	var map = ds_map_find_value(global.lang_map, "en");
	eso_string_set(map, "option_eso_screenmode", "SCREEN MODE");
	eso_string_set(map, "option_eso_screenmode_fixed", "FIXED");
	eso_string_set(map, "option_eso_screenmode_fit", "FIT");
	eso_string_set(map, "option_eso_screenmode_fill", "FILL");
	eso_string_set(map, "option_eso_screenmode_expand", "EXPAND");
	eso_string_set(map, "option_eso_scalemode", "SCALE MODE");
	eso_string_set(map, "option_eso_scalemode_normal", "NORMAL");
	eso_string_set(map, "option_eso_scalemode_integer", "INTEGER");
	eso_string_set(map, "option_eso_scalemode_stretch", "STRETCH");
	eso_string_set(map, "option_eso_screensize", "SET TARGET SCREEN SIZE");
	eso_string_set(map, "option_eso_screensize_prompt_w", "Target width?");
	eso_string_set(map, "option_eso_screensize_prompt_h", "Target height?");
	eso_string_set(map, "option_eso_autores", "AUTO RESIZE WINDOW");
	eso_string_set(map, "option_eso_screenscale", "SET SCREEN SCALE");
	eso_string_set(map, "option_eso_screenscale_prompt", "Scale to use in the Expand screen mode?");
	eso_string_set(map, "option_eso_reset", "RESET SCALING OPTIONS");
	eso_string_set(map, "option_eso_windowsize", "WINDOW SIZE");
	eso_string_set(map, "eso_resolution_capped", "RESOLUTION CAPPED AT 4096X4096 TO PREVENT CRASHES.");
}