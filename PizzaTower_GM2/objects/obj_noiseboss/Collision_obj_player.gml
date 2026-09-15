if ((state == "mach2" && hsp != 0) || (state == states.spin && image_index > 3) || (state == "freefall" && !grounded) || state == "machslide" || state == "pogo" || state == states.jetpack || state == states.bounce)
{
	if (other.flash)
	{
		other.flash = false;
	}
	scr_hurtplayer(other);
}
else if (((state == states.walk || (state == states.stun && !savedthrown)) && flickertime <= 0 && wastedhits == 7 && (other.instakillmove || other.state == "handstandjump")) && !pizzahead)
{
	if (phase == 1)
	{
		scr_boss_do_hurt_phase2(other);
	}
	else
	{
		instance_destroy(obj_noisey);
		instance_destroy(obj_noiseyspawner);
		instance_destroy(obj_noiseyspawner2);
		fightballcount = 0;
		substate = "fightball";
		state = states.finale;
		sprite_index = spr_playerN_fightball;
		image_index = 0;
		image_speed = 0.35;
		other.state = "actor";
		other.image_speed = 0.35;
		other.sprite_index = spr_player_fightball;
		other.image_index = 0;
		if (doise)
		{
			scr_doise_end_start();
		}
	}
}
