scr_menu_getinput()
text_xscale = (960 - 64) / sprite_get_width(spr_tutorialbubble);
if (textbuffer > 0)
{
	fmod_event_instance_stop(pep_v)
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
        
        displaytext = string_insert(letterstr, displaytext, string_length(displaytext) + 1);
        displaytext = scr_separate_text(displaytext);
        textbuffer = textspeed;
		if textbgspr == spr_peppattern7
		{
			scr_fmod_soundeffect(pep_v)
		}
		if textbgspr == bg_gus
		{
			scr_fmod_soundeffect(gus_v)
		}
    }
	else if (key_jump)
	{
		if (currentdialog < (array_length(dialog) - 1))
		{
			currentdialog++;
			currentpos = 0;
			textbuffer = textspeed;
			displaytext = "";
			currenttext = scr_calculate_text(dialog[currentdialog][0]);
			dialogheight = scr_calculate_height(currenttext);
			dialogsprite = dialog[currentdialog][1];
			textbgspr    = dialog[currentdialog][2];
			charactername    = dialog[currentdialog][3];
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
				state = states.normal
			}
			fmod_event_instance_stop(pep_v)
			fmod_event_instance_stop(gus_v)
			instance_destroy();
		}
	}	
	else 
	{	
		fmod_event_instance_stop(pep_v)
		fmod_event_instance_stop(gus_v)
	}
}

wave_timer += 20;
text_wave_x = Wave(-5, 5, 2, 10, wave_timer);
text_wave_y = Wave(-1, 1, 4, 0, wave_timer);