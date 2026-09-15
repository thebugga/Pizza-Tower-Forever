scr_menu_getinput()

player_v = fmod_event_create_instance("event:/sfx/voice/diaplayer");
gus_v = fmod_event_create_instance("event:/sfx/voice/diagus");

text_xscale = (960 - 64) / sprite_get_width(bubble_spr);
inside_move -= 0.5;

if (textbuffer > 0)
{
	fmod_event_instance_stop(player_v)
	fmod_event_instance_stop(gus_v)
	textbuffer--;
}
else
{
	currentpos++;
    if (currentpos <= string_length(currenttext))
    {
        var letter = string_char_at(currenttext, currentpos);
        var letterstr = letter;
        
        if (letter == "[")
        {
            while (letter != "]")
            {
                currentpos++;
                letter = string_char_at(currenttext, currentpos);
                letterstr += letter;
            }
        }
        
        text = string_insert(letterstr, text, string_length(text) + 1);
        text = scr_separate_text(text);
        textbuffer = textspeed;
		if character_name == "PEPPINO"
		{
			scr_fmod_soundeffect(player_v)
		}
		if character_name == "GUSTAVO"
		{
			scr_fmod_soundeffect(gus_v)
		}
    }
	else if (key_jump)
	{
		if (currentdialog < (array_length(dialog) - 1))
		{
			text_y = approach(text_y, 0, 2);
			currentdialog    ++;
			currentpos       = 0;
			textbuffer       = textspeed;
			text			 = "";
			currenttext      = scr_calculate_text(dialog[currentdialog][0]);
			dialogheight     = scr_calculate_height(currenttext);
			dialogsprite     = dialog[currentdialog][1];
			background_spr   = dialog[currentdialog][2];
			character_name   = dialog[currentdialog][3];
			var func = dialog[currentdialog][4];
			if (func != noone)
			{
				if (npcID != noone && instance_exists(npcID))
				{
					with (npcID)
					{
						method(id, func)();
					}
				}
				else
				{
					method(id, func)();
				}
			}
		}
		else
		{
			text_y = approach(text_y, text_ystart, 2);
			var endfunc = dialog[currentdialog][5];
			if (endfunc != noone)
			{
				if (npcID != noone && instance_exists(npcID))
				{
					with (npcID)
					{
						method(id, endfunc)();
					}
				}
				else
				{
					method(id, endfunc)();
				}
			}
			with obj_player
			{
				sprite_index = spr_player_idle;
				state = "default"
				vsp = 0;
				hsp = 0;
			}
			fmod_event_instance_stop(player_v)
			fmod_event_instance_stop(gus_v)
			instance_destroy();
		}
	}	
	else 
	{	
		fmod_event_instance_stop(player_v)
		fmod_event_instance_stop(gus_v)
	}
}
wave_timer += 20;
text_x = Wave(-5, 5, 2, 10, wave_timer);
text_y = Wave(-1, 1, 4, 0, wave_timer);