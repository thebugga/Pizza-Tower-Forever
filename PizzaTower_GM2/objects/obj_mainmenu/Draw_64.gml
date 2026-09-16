draw_set_alpha(extrauialpha);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var deletefile_x = 779;
var deletefile_y = 449;
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
taunt_key = scr_compile_icon_text("[x]");
start_key = scr_compile_icon_text("[p]");
lang_draw_sprite(spr_deletefile, 0, deletefile_x, deletefile_y);
scr_draw_text_arr(deletefile_x - 67, deletefile_y, taunt_key, c_white, extrauialpha);
lang_draw_sprite(spr_quitgame, 0, cam_x, cam_y);
var options_x = SCREEN_WIDTH * 0.853125;
var options_y = 84;
lang_draw_sprite(spr_controlseggplant, 0, options_x, options_y);
scr_draw_text_arr(options_x - 88, options_y - 37, start_key, c_white, extrauialpha);
draw_set_alpha(1);
if (state == "savepicker")
{
	var savenum = currentselect + 2; // adding 2 on currentselect makes it 1 :3
	var col_1 = makingnewsave ? c_white : c_gray;
	var col_2 = makingnewsave ? c_gray : c_white;
	
	draw_set_alpha(0.5);
	draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	
	draw_set_font(lang_get_font("creditsfont"));
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_text_color(SCREEN_WIDTH / 2 - 260, SCREEN_HEIGHT / 2, "NEW SAVE", col_1, col_1, col_1, col_1, 1);
	draw_text_color(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, string_concat("SAVE : ", string(savenum)), col_2, col_2, col_2, col_2, 1);
	draw_text_color(SCREEN_WIDTH / 2 + 260, SCREEN_HEIGHT / 2, string_concat("SAVE : ", string(savenum + 1)), col_2, col_2, col_2, col_2, 1);
}
else if (state == "wait")
{
	draw_set_alpha(0.5);
	draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	
	draw_set_font(lang_get_font("creditsfont"));
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	
	var pad = 100;
	var h = string_height(lang_get_value("default_letter"));
	
	var m, scale, yy, xx;
	
	for(var i = 0; i < array_length(global.modes); i++)
	{
		m = global.modes[i];
		scale = (currentmodeselect == i ? Wave(1.7, 1.5, 5, 0) : 1);
		yy = m.enabled ? SCREEN_HEIGHT / 2 + (i < 2 ? -pad : pad) : pad * (i - currentmodeselect + 1);
		xx = m.enabled ? (SCREEN_WIDTH / 2) + (pad * (1.5 + (i % 2))) : pad; 
 
		draw_sprite_ext(spr_mainmenu_modes, m.image_index, xx, yy, scale, scale, 0, c_white, (currentmodeselect == i ? 1 : 0.5));
		tdp_draw_text(xx, yy, string_upper(global.modes[i].name));
	}
	
	tdp_draw_text(pad, (pad * -currentmodeselect), lang_get_value("option_confirm"));
	
	if (currentmodeselect != -1)
	{
		
	}
	
	scr_draw_text_arr(0, SCREEN_HEIGHT, scr_compile_icon_text(concat("[p]", lang_get_value("option_yes"))));
	
	tdp_text_commit(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
}

//if (instance_exists(obj_noiseunlocked))
//{
//	exit;
//}
//draw_set_font(lang_get_font("bigfont"));
//draw_set_halign(fa_center);
//draw_set_valign(fa_middle);
//draw_set_color(c_white);
//draw_set_alpha(1);
//if (state == "titlescreen" || (state == "transitioncutscene" && dark))
//{
//	draw_sprite(spr_menudark, 0, 0, 0);
//}
//scr_draw_text_arr(qx + 50 + cam_x, qy + 100 + cam_y, grab_key);
//if (instance_exists(obj_fadeout))
//{
//	draw_set_alpha(obj_fadeout.fadealpha);
//	draw_set_color(c_black);
//	lang_draw_sprite(spr_quitgame, 0, qx + cam_x, qy + cam_y);
//	draw_set_alpha(1);
//	draw_set_color(c_white);
//}
//draw_set_alpha(1);
//if (state == "bombdelete")
//{
//	draw_set_alpha(0.5);
//	draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
//	draw_set_alpha(1);
//	draw_set_font(lang_get_font("bigfont"));
//	draw_set_halign(fa_center);
//	draw_set_valign(fa_middle);
//	var _str = embed_value_string(lang_get_value_newline("menu_delete"), [string(currentselect + 1)]);
//	tdp_draw_text_color(SCREEN_WIDTH / 2, (SCREEN_HEIGHT / 2) - 30, _str, c_red, c_red, c_red, c_red, 1);
//	var w = string_width(_str) / 2;
//	var spr = spr_menu_filedelete;
//	var ix = index;
//	if (deletebuffer > 0)
//	{
//		spr = spr_menu_filedelete_lit;
//		ix = index * 2.5;
//	}
//	draw_sprite(spr, ix, (SCREEN_WIDTH / 2) + w + 70, SCREEN_HEIGHT / 2);
//	draw_sprite(spr, ix, (SCREEN_WIDTH / 2) - w - 70, SCREEN_HEIGHT / 2);
//	var c1 = (deleteselect == 0) ? c_white : c_gray;
//	var c2 = (deleteselect == 1) ? c_white : c_gray;
//	tdp_draw_text_color((SCREEN_WIDTH / 2) - 100, (SCREEN_HEIGHT / 2) + 30, lang_get_value("option_yes"), c1, c1, c1, c1, 1);
//	tdp_draw_text_color((SCREEN_WIDTH / 2) + 100, (SCREEN_HEIGHT / 2) + 30, lang_get_value("option_no"), c2, c2, c2, c2, 1);
//	tdp_text_commit(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
//}
//else if (state == states.finale)
//{
//	draw_set_alpha(0.5);
//	draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
//	draw_set_alpha(1);
//	draw_set_font(lang_get_font("bigfont"));
//	draw_set_halign(fa_center);
//	draw_set_valign(fa_middle);
//	draw_sprite(spr_menu_byebye, index, (SCREEN_WIDTH / 2) + 210, SCREEN_HEIGHT / 2);
//	draw_sprite(spr_menu_byebye, index, (SCREEN_WIDTH / 2) - 210, SCREEN_HEIGHT / 2);
//	tdp_draw_text_color(SCREEN_WIDTH / 2, (SCREEN_HEIGHT / 2) - 30, lang_get_value("menu_exit"), c_white, c_white, c_white, c_white, 1);
//	var c1 = (exitselect == 0) ? c_white : c_gray;
//	var c2 = (exitselect == 1) ? c_white : c_gray;
//	tdp_draw_text_color((SCREEN_WIDTH / 2) - 100, (SCREEN_HEIGHT / 2) + 30, lang_get_value("option_yes"), c1, c1, c1, c1, 1);
//	tdp_draw_text_color((SCREEN_WIDTH / 2) + 100, (SCREEN_HEIGHT / 2) + 30, lang_get_value("option_no"), c2, c2, c2, c2, 1);
//	tdp_text_commit(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
//}