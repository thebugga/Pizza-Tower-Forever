pause_unpause_music_global(true);
create_transformation_tip("UH OH... HERE COMES THE NOISE...");
fmod_event_one_shot("event:/music/thenoise");
obj_player1.sprite_index = spr_player_idle;
obj_player1.xscale = -image_xscale;
hsp = 0.9;