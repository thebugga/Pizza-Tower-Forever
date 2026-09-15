if (state != "grabbing" && other.state != "bombgrab" && x == xstart && y == ystart)
{
	with (other)
	{
		fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
		fmod_event_instance_play(other.snd);
		if (state != "chainsaw" && state != "backbreaker")
		{
			tauntstoredmovespeed = movespeed;
			tauntstoredvsp = vsp;
			tauntstoredsprite = sprite_index;
			tauntstoredstate = state;
		}
		with (instance_create(x, y - 5, obj_parryeffect))
		{
			image_yscale = -1;
			sprite_index = spr_grabhangeffect;
			image_speed = 0.35;
		}
		state = "actor";
		if (boxxed == false)
		{
			sprite_index = spr_catched;
		}
		else
		{
			sprite_index = spr_boxxedpepair;
		}
		other.playerid = id;
		other.state = "grabbing";
		if (tauntstoredstate != "mach2" && tauntstoredstate != "mach3")
		{
			tauntstoredstate = "jump";
			tauntstoredsprite = spr_jump;
			tauntstoredmovespeed = 0;
			tauntstoredvsp = 0;
		}
		else if (tauntstoredstate == "mach2")
		{
			sprite_index = spr_mach;
		}
		else if (tauntstoredstate == "mach3")
		{
			sprite_index = spr_mach4;
		}
	}
}
