image_speed = 0.35;
depth = 50;
idlespr = spr_lonegustavo_idle;
dancespr = spr_gusdance;
palinfo = get_char_palette_info("P");
if (obj_player1.character == "N" || global.swapmode)
{
	idlespr = spr_noisette_idle;
	dancespr = spr_noisettedance;
	palinfo = noone;
	sprite_index = idlespr;
}
