var _w = SCREEN_WIDTH
var _h = SCREEN_HEIGHT;
var x1 = rtext_contentpad + text_x;
var _yscale = dialogheight + text_contentpad + (text_contentpad * 2);
var y1 = _h - _yscale + text_y - 60;
var y2 = _yscale / text_sprite_height;

tex_x -= 0.5;

draw_set_alpha(0.5)
draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, c_black, c_black, c_black, c_black, false)
draw_set_alpha(1)

// character sprite
if (dialogsprite != -4)
    draw_sprite(dialogsprite, -1, x1 + text_contentpad + 120, y1 + (text_contentpad / 2));

// name bubble
scr_draw_granny_texture_2(x1 - 15, y1 - 85, 2, 1, tex_x, tex_x, background_spr, bubble_spr)
draw_sprite_ext(spr_computerbubble, 1, x1 - 15, y1 - 85, 2, 1, 0, c_white, 1);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(global.tutorialfont);
draw_set_colour(c_black)
scr_draw_text_arr(x1 + 75, y1 - 75, text_arr_1, c_black, 1, text_effects.wave, 
{
	offset: 1
});

draw_set_colour(c_white)
draw_set_font(global.creditsfont);
scr_draw_text_arr(x1 + 75, y1 - 45, charactername, c_white, 1, text_effects.wave, 
{
	offset: 1
});

// actual bubble
draw_set_font(global.creditsfont);
draw_sprite(spr_tutorialbubble_rope, 0, 64 + text_x, 540 + text_y);
draw_sprite(spr_tutorialbubble_rope, 0, (960 - 64) + text_x, 540 + text_y);
scr_draw_granny_texture(x1, y1, text_xscale, y2, tex_x, tex_x, background_spr, bubble_spr)
draw_sprite_ext(spr_computerbubble, 1, x1, y1, text_xscale, y2, 0, c_white, 1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
scr_draw_text_arr(x1 + text_contentpad, y1 + text_contentpad, "* " + text, c_white, 1, text_effects.wave, 
{
	offset: 1
});
