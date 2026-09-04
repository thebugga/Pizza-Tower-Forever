function scr_fmod_soundeffect(_fmodinstance, _x = x, _y = y)
{
	if _x != undefined && _y != undefined
		fmod_event_instance_set_3d_attributes(_fmodinstance, _x, _y);
	
	fmod_event_instance_play(_fmodinstance);
}
