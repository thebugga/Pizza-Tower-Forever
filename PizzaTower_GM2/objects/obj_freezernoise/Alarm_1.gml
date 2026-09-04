pause_unpause_music_global(false);
with instance_create(obj_player.x, obj_player.y, obj_sausageman_dead)
{
	hsp = other.image_xscale * 3;
	image_xscale = -other.image_xscale;
	if character == characters.Peppino
		sprite_index = other.spr_dead;
	else 
		sprite_index = spr_peppinoshotandkilled;
	spr_palette = other.spr_palette;
	paletteselect = other.paletteselect;
	oldpalettetexture = global.palettetexture;
}
with obj_player
{
	character = characters.Noise;
	scr_characterspr();
	state = states.comingoutdoor;
	sprite_index = spr_playerN_freezerintro;
}
instance_destroy();