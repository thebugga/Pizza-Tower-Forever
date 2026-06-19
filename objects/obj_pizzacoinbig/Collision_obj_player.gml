if (other.state != states.gotoplayer)
{
	global.heattime = 60;
	with (obj_camera)
	{
		healthshaketime = 60;
	}
	fmod_event_one_shot("event:/sfx/misc/pizzacoinlarge");
	instance_destroy();
	global.combotime = 60;
	global.style -= 20;
	var val = heat_calculate(value);
	global.pizzacoin += val;
	if (visible)
	{
		create_collect(x, y, sprite_index, val);
	}
	with (instance_create(x + 16, y, obj_smallnumber))
	{
		number = string(val);
	}
	obj_pizzacoinindicator.show = 50
	tv_do_expression(spr_tv_exprcollect, true);
}
