with (instance_create(x, y, obj_baddie_dead))
{
	sprite_index = spr_titlepep_punch;
	image_speed = 0;
	image_index = irandom(sprite_get_number(sprite_index) - 1);
	if (other.currentselect != -1)
	{
		var pal = global.game[other.currentselect].palette;
		var tex = global.game[other.currentselect].palettetexture;
		use_palette = true;
		spr_palette = pal_peppino;
		paletteselect = pal;
		oldpalettetexture = tex;
	}
}
pep_debris = true;
