draw_set_font(lang_get_font("smallerfont"));
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_sprite(spr_roomnamebg, 0, x, y);
draw_text(x, y, string_hash_to_newline(global.roommessage));
