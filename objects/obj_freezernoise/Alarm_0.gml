pause_unpause_music_global(true);
create_transformation_tip("UH OH... HERE COMES THE NOISE...");
fmod_event_one_shot("event:/music/thenoise");
obj_player.sprite_index = spr_player_idle;
hsp = 0.9;