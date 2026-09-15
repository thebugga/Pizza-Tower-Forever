with (other)
{
	if (other.appear == -1 && key_up && ladderbuffer == 0 && (state == "fireass" || state == "machcancel" || state == "punch" || state == "default" || state == "pogo" || state == "mach2" || (state == "mach3" && sprite_index != spr_fightball) || state == "mach1" || state == "shotgunjump" || state == "jump" || state == "highjump") && state != "hurt" && state != "machslide" && state != "freefall" && state != "freefallland")
	{
		fmod_event_instance_play(other.snd);
		other.hooked = true;
		hooked = true;
		mach2 = 0;
		state = "ladder";
		x = other.x + 16;
		y = other.y + 40;
	}
}
