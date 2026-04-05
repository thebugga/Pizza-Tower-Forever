pal_swap_init_system(shd_pal_swapper);
global.roommessage = lang_get_value("room_towerjohngutter");
global.gameframe_caption_text = lang_get_value("caption_tower_johngutterhall");
global.door_sprite = spr_door;
global.door_index = 0;


if !scr_get_mode("levelshuffle").enabled
	exit;
		
var _levels = scr_get_levelshuffle();
array_push(_levels);

scr_set_levelshuffle(_levels);