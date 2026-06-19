if (other.state != states.gotoplayer)
{
	scr_sound_multiple("event:/sfx/misc/pizzacoin", x, y);
	global.heattime += 10;
	global.heattime = clamp(global.heattime, 0, 60);
	global.style -= 10;
	global.combotime += 10;
	global.combotime = clamp(global.combotime, 0, 60);
	with (obj_camera)
	{
		healthshaketime = 30;
	}
	var val = heat_calculate(10);
	global.pizzacoin += val;
	create_collect(x, y, sprite_index, val);
	with (instance_create(x + 16, y, obj_smallnumber))
	{
		number = string(val);
	}
	obj_pizzacoinindicator.show = 50
	instance_destroy();
}
