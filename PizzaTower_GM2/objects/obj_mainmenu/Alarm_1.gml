currentselect = -1;
visualselect = -1;
dark = false;
jumpscarecount = 0;
changex = true;
with (obj_music)
{
	fmod_event_instance_set_parameter(music.event, "state", 1, true);
}
with obj_title
{
	changex = true;
}
state = "default";