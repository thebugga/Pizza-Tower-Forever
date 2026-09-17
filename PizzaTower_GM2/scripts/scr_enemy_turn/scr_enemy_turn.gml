function enemy_turn()
{
	sprite_index = turnspr;
	image_speed = 0.35;
	if (ANIMATION_END)
	{
		if (object_index != obj_tank)
		{
			state = "idle";
			image_index = 0;
			sprite_index = idlespr;
		}
		else
		{
			state = "walk";
			image_index = 0;
			sprite_index = walkspr;
		}
	}
}
