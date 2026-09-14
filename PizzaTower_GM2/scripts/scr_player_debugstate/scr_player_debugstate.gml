function scr_player_debugstate()
{
	visible = true;
	image_blend = c_white;
	image_speed = 0.35;
	var _spd = 6;
	if (key_attack)
		_spd = 10;
	move_h = key_left + key_right;
	move_v = -(key_up - key_down);
	hsp = move_h * _spd;
	vsp = move_v * _spd;
	if (move_h != 0)
		xscale = move_h;
	if (move_v != 0)
		yscale = move_v;
	var _ang = point_direction(x, y, mouse_x, mouse_y);
	var _diff = angle_difference(_ang, angle);
	angle += median(-5, _diff, 5)
	if hsp != 0 || vsp != 0
		sprite_index = spr_player_climbstairs;
	else
		sprite_index = spr_player_stairs;
	if (key_jump || key_slap2)
	{
		angle = 0
		state = states.normal;
	}
}
