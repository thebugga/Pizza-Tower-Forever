draw_sprite_ext(sprite_index, image_index, x, y, .42, .42, image_angle, image_blend, image_alpha);
draw_set_font(lang_get_font("tutorialfont"));
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var txt = lang_get_value_newline("swap_press_start");
txt = string_replace_all(txt, "%", lang_get_value("start_button_steam"));
draw_text(x, SCREEN_HEIGHT / 2 + 200, txt);