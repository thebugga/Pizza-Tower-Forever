with obj_player
{
	character = "N";
	scr_characterspr();
	state = states.comingoutdoor;
	sprite_index = spr_playerN_freezerintro;
}
instance_destroy();
pause_unpause_music_global(false);
image_index = 0;
hsp = 0;