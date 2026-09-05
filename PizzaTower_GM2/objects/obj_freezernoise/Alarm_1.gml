pause_unpause_music_global(false);
with instance_create(obj_player1.x, obj_player1.y, obj_sausageman_dead)
{
	hsp = obj_player1.image_xscale * 3;
	image_xscale = -other.image_xscale;
	if character == characters.Peppino
		sprite_index = obj_player1.spr_dead;
	else 
		sprite_index = spr_peppinoshotandkilled;
	spr_palette = spr_palette;
	paletteselect = paletteselect;
	oldpalettetexture = global.palettetexture;
}
with obj_player1
{
	character = characters.Noise;
	scr_characterspr();
	state = states.comingoutdoor;
	sprite_index = spr_playerN_freezerintro;
}
instance_destroy();