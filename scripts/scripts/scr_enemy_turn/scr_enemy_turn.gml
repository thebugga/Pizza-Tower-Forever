function scr_enemy_turn()
{
	if (live_call()) return live_result;
	sprite_index = turnspr;
	image_speed = 0.35;
	if (ANIMATION_END)
	{
		if (object_index != obj_tank)
		{
			state = states.idle;
			image_index = 0;
			sprite_index = idlespr;
		}
		else
		{
			state = states.walk;
			image_index = 0;
			sprite_index = walkspr;
		}
	}
}
