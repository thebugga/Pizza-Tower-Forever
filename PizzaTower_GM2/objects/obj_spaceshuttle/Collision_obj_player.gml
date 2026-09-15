with (other)
{
	if (other.state == "default" && state != states.spaceshuttle && key_up && grounded && ((state == "ratmount" && brick) || state == "default" || state == "mach1" || state == "mach3" || state == "pogo" || state == "mach3" || state == "Sjumpprep"))
	{
		instance_create(x, y, obj_genericpoofeffect);
		other.state = "hit";
		other.hitLag = 80;
		other.hitX = other.x;
		other.hitY = other.y;
		instance_destroy(other.arrowID);
		fmod_event_instance_play(global.snd_spaceship);
		with (obj_player)
		{
			if (check_player_coop())
			{
				hsp = 0;
				movespeed = 0;
				vsp = 0;
				state = states.spaceshuttle;
				visible = false;
				sprite_index = spr_idle;
			}
		}
	}
}
