var ww = window_get_width();
var wh = window_get_height();
if (room != Loadiingroom && !instance_exists(obj_langload) && lang_get_value("use_ttf"))
{
	global.tdp_text_enabled = true;
}
else
{
	global.tdp_text_enabled = false;
}
var cr = noone;
if ((device_mouse_x_to_gui(0) != mouse_xprevious || device_mouse_y_to_gui(0) != mouse_yprevious) && gameframe_mouse_in_window())
{
	if (window_get_cursor() == -1)
	{
		cr = 0;
	}
	disappearbuffer = 100;
	mouse_xprevious = device_mouse_x_to_gui(0);
	mouse_yprevious = device_mouse_y_to_gui(0);
}
if (disappearbuffer > 0)
{
	captionalpha = Approach(captionalpha, 1, 0.2);
	disappearbuffer--;
}
else
{
	captionalpha = Approach(captionalpha, 0, 0.1);
	if (window_get_cursor() != -1 && window_has_focus() && room != Mainmenu)
	{
		cr = -1;
	}
}
if (room != Mainmenu && gameframe_get_fullscreen() > 0)
{
	cr = -1;
}
if (room == Mainmenu && window_get_cursor() == -1)
{
	cr = 0;
}
if (instance_exists(obj_inputAssigner) && obj_inputAssigner.player_input_device[0] >= 0)
{
	cr = -1;
}
if (cr != noone)
{
	window_set_cursor(cr);
	global.gameframe_current_cursor = cr;
	if (cr == -1)
	{
		global.gameframe_set_cursor = false;
	}
	else
	{
		global.gameframe_set_cursor = true;
	}
}
global.gameframe_alpha = captionalpha;
if (window_has_focus())
{
	savedwidth = window_get_width();
	savedheight = window_get_height();
	saved_guiwidth = display_get_gui_width();
	saved_guiheight = display_get_gui_height();
}
else
{
	dirty = true;
	if (global.option_fullscreen > 0)
	{
		alarm[2] = 5;
	}
}
if (startbuffer > 0)
{
	startbuffer--;
}
if (justupdated)
    justupdated = false;
        
if (rescapped_warn > 0)
    rescapped_warn--;
        
if ((dirty || window_width_current != ww || window_height_current != wh || global.option_scale_mode != last_scale_mode || global.option_fullscreen != gameframe_get_fullscreen()) && !instance_exists(obj_loadingscreen) && ww > 0 && wh > 0) {
    if (dirty)
        dirty = false;
            
    var _smw = global.screenmode_w;
            
    if (_smw == -1)
        _smw = room_width;
            
    var _smh = global.screenmode_h;
            
    if (_smh == -1)
        _smh = room_height;
            
    var _sm = global.screenmode;
            
    if (eso_should_force_vanillares()) {
        _sm = global.screenmodes.FIXED;
        _smw = 960;
        _smh = 540;
    }
            
    ideal_width = _smw;
    ideal_height = _smh;
            
    if (_sm == global.screenmodes.FIXED) {
        obj_screensizer.actual_width = obj_screensizer.ideal_width;
        obj_screensizer.actual_height = obj_screensizer.ideal_height;
    } else if (_sm == global.screenmodes.FIT) {
        if ((ww / wh) > (_smw / _smh)) {
            obj_screensizer.actual_width = floor(ww / (wh / obj_screensizer.ideal_height));
            obj_screensizer.actual_height = obj_screensizer.ideal_height;
        } else {
            obj_screensizer.actual_width = obj_screensizer.ideal_width;
            obj_screensizer.actual_height = floor(wh / (ww / obj_screensizer.ideal_width));
        }
    } else if (_sm == global.screenmodes.FILL) {
        if ((ww / wh) < (_smw / _smh)) {
            obj_screensizer.actual_width = floor(ww / (wh / obj_screensizer.ideal_height));
            obj_screensizer.actual_height = obj_screensizer.ideal_height;
        } else {
            obj_screensizer.actual_width = obj_screensizer.ideal_width;
            obj_screensizer.actual_height = floor(wh / (ww / obj_screensizer.ideal_width));
        }
    } else if (_sm == global.screenmodes.SCALE) {
        obj_screensizer.actual_width = floor(ww / global.screenmode_scale);
        obj_screensizer.actual_height = floor(wh / global.screenmode_scale);
    }
            
    var MAX_RES = 4096;
            
    if (obj_screensizer.actual_width > MAX_RES || obj_screensizer.actual_height > MAX_RES) {
        obj_screensizer.actual_width = min(obj_screensizer.actual_width, 4096);
        obj_screensizer.actual_height = min(obj_screensizer.actual_height, 4096);
                
        if (!last_rescapped)
            rescapped_warn = 420;
                
        last_rescapped = true;
    } else {
        last_rescapped = false;
    }
            
    obj_screensizer.ideal_width = obj_screensizer.actual_width;
    obj_screensizer.ideal_height = obj_screensizer.actual_height;
    camera_set_view_size(view_camera[0], obj_screensizer.ideal_width * camzoom, obj_screensizer.ideal_height * camzoom);
            
    if (global.scalemode == global.scalemodes.NORMAL) {
        app_scale_x = min(ww / obj_screensizer.ideal_width, wh / obj_screensizer.ideal_height);
        app_scale_y = app_scale_x;
    } else if (global.scalemode == global.scalemodes.INTEGER) {
        app_scale_x = max(min(ww div obj_screensizer.ideal_width, wh div obj_screensizer.ideal_height), 1);
        app_scale_y = app_scale_x;
    } else if (global.scalemode == global.scalemodes.STRETCH) {
        app_scale_x = ww / obj_screensizer.ideal_width;
        app_scale_y = wh / obj_screensizer.ideal_height;
    } else if (global.scalemode == global.scalemodes.NONE) {
        app_scale_x = (global.screenmode == global.screenmodes.SCALE) ? global.screenmode_scale : 1;
        app_scale_y = app_scale_x;
    }
            
    if (app_scale_x > 0 && app_scale_y > 0) {
        surface_resize(application_surface, obj_screensizer.ideal_width, obj_screensizer.ideal_height);
        __display_set_gui_size_hook(obj_screensizer.ideal_width, obj_screensizer.ideal_height);
    }
            
    last_scale_mode = global.option_scale_mode;
    last_fullscreen = gameframe_get_fullscreen();
    window_width_current = window_get_width();
    window_height_current = window_get_height();
    normal_size_fix_x = (obj_screensizer.actual_width - 960) / 2;
    normal_size_fix_y = (obj_screensizer.actual_height - 540) / 2;
    justupdated = true;
    // uncomment this for some funnies
    //fmod_event_one_shot("event:/sfx/misc/collect");
}
        
if (keyboard_check(vk_control) && keyboard_check_pressed(vk_f11)) {
    eso_reset_settings();
    keyboard_key_release(vk_f11);
}
        
if (keyboard_check(vk_alt) && keyboard_check_pressed(vk_enter)) {
    if (global.option_fullscreen != 0) {
        alarm[2] = 1;
        global.option_fullscreen = 0;
    } else {
        global.option_fullscreen = 2;
    }
            
    screen_apply_fullscreen(global.option_fullscreen);
    screen_apply_size();
    ini_open_from_string(obj_savesystem.ini_str_options);
    ini_write_real("Option", "fullscreen", global.option_fullscreen);
    obj_savesystem.ini_str_options = ini_close();
    keyboard_key_release(vk_enter);
    obj_screensizer.dirty = true;
}