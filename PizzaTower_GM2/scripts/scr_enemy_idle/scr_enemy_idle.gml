function enemy_idle()
{
	hsp = 0;
	if (vsp > 1 && (grounded || (grounded && !place_meeting(x, y, obj_platform))))
	{
		create_particle(x, y, particletypes.landcloud, 0);
		image_index = 0;
	}
	if ((vsp >= 0 || object_index == obj_miniufo || object_index == obj_kentukybomber) && sprite_index == scaredspr && scaredbuffer <= 0)
	{
		state = "walk";
		sprite_index = walkspr;
		if (object_index == obj_treasureguy)
		{
			state = states.chase;
		}
		if (object_index == obj_pickle && attacking)
		{
			attacking = false;
			bombreset = 0;
		}
	}
	if (scaredbuffer > 0)
	{
		scaredbuffer--;
	}
	if (sprite_index == spr_tank_spawnenemy && ANIMATION_END)
	{
		sprite_index = walkspr;
		state = "walk";
	}
	if (sprite_index == spr_forknight_turn && ANIMATION_END)
	{
		sprite_index = walkspr;
		state = "walk";
	}
	if (sprite_index == spr_patroller_turn && ANIMATION_END)
	{
		sprite_index = walkspr;
		state = "walk";
	}
	if (sprite_index == spr_newpizzice_turn && ANIMATION_END)
	{
		xscale *= -1;
		sprite_index = walkspr;
		state = "charge";
	}
	if (sprite_index == spr_ghostknight_turn && ANIMATION_END)
	{
		sprite_index = walkspr;
		state = "walk";
	}
	if (sprite_index == spr_pizzaslug_turn && ANIMATION_END)
	{
		sprite_index = walkspr;
		xscale *= -1;
		state = "walk";
	}
	if (sprite_index == spr_indiancheese_turn && ANIMATION_END)
	{
		sprite_index = walkspr;
		state = "walk";
	}
	if (sprite_index == spr_tank_turn && ANIMATION_END)
	{
		sprite_index = walkspr;
		state = "walk";
	}
	if (place_meeting(x, y + 1, obj_railparent))
	{
		var _railinst = instance_place(x, y + 1, obj_railparent);
		hsp += (_railinst.movespeed * _railinst.dir);
	}
	image_speed = 0.35;
}
