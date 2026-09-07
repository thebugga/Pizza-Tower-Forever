player_v = fmod_event_create_instance("event:/sfx/voice/diaplayer");
gus_v = fmod_event_create_instance("event:/sfx/voice/diagus");

dialogsprite = noone;
text = "";
character_name = "";
bubble_spr = spr_computerbubble;
background_spr = spr_pizzagrannytexture;
text_arr_1 = noone;
text_arr_2 = noone;
text_arr_3 = noone;

savedstate = states.normal;
dialog = noone;
npcID = noone;

currenttext = noone;
currentdialog = 0;
currentpos = 0;
textbuffer = 0;
textspeed = 1;
dialogheight = 0;
text_contentpad = 16;
text_xscale = (SCREEN_WIDTH - 64) / sprite_get_width(bubble_spr);
text_oldxscale = text_xscale;
text_sprite_width = sprite_get_width(bubble_spr);
text_sprite_height = sprite_get_height(bubble_spr);
surfclip = -4;
surffinal = -4;
surfclip2 = -4;
surffinal2 = -4;
wave_timer = 0;
text_x = 0;
text_ystart = SCREEN_HEIGHT - dialogheight + text_contentpad + (text_contentpad * 2) + text_y - 60;
text_y = 400;
