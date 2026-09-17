event_inherited();
if sprite_index == spr_editor_mainmenu_bg && state = "default"
{
	draw_sprite_ext(Sprite3599, x, y + 173, 16, 0.65, 0.65, image_angle, c_black, .5);
	draw_sprite_ext(Sprite3600, x, y + 333, 70, 1, 1, image_angle, c_black, .5);
	draw_sprite_ext(Sprite3599, x, y + 179, 10, 0.65, 0.65, image_angle, c_white, image_alpha);
	draw_sprite_ext(Sprite3600, x, y + 339, 64, 1, 1, image_angle, c_white, image_alpha);
}

