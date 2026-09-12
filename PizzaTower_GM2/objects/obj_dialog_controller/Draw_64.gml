var _w = SCREEN_WIDTH
var _h = SCREEN_HEIGHT;
var x1 = text_contentpad + text_x + 10;
var _yscale = dialogheight + (text_contentpad * 3);
var y1 = _h - _yscale + text_y - 60;
var y2 = _yscale / text_sprite_height;

text_x -= 0.5;

draw_set_alpha(0.5);
draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// character sprite
if (dialogsprite != -4)
    draw_sprite(dialogsprite, -1, x1 + text_contentpad + 120, y1 + (text_contentpad / 2));

// name bubble
scr_draw_granny_texture_2(x1 - 15, y1 - 85, 2, 1, inside_move, inside_move, background_spr, bubble_spr)
draw_sprite_ext(spr_computerbubble, 1, x1 - 15, y1 - 85, 2, 1, 0, c_white, 1);
draw_set_font(global.tutorialfont);
draw_set_colour(c_black)
draw_text(x1 + 10, y1 - 75, "my name is")
draw_set_colour(c_white)
draw_set_font(global.creditsfont);
draw_text(x1 + 10, y1 - 45, character_name)

// actual bubble
draw_sprite(spr_tutorialbubble_rope, 0, 64 + text_x, 540 + text_y);
draw_sprite(spr_tutorialbubble_rope, 0, (960 - 64) + text_x, 540 + text_y);
scr_draw_granny_texture(x1, y1, text_xscale, y2 * 1.4, inside_move, inside_move, background_spr, bubble_spr)
draw_sprite_ext(spr_computerbubble, 1, x1, y1, text_xscale, y2 * 1.4, 0, c_white, 1);
draw_text(x1 + text_contentpad, y1 + text_contentpad, "* " + currenttext)