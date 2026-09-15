if (playerid > -1)
{
	exit;
}
if (state != "default")
{
	exit;
}
if (other.state == "hurt")
{
	exit;
}
if (other.state == "gotoplayer")
{
	exit;
}
if (other.state == "stringfall")
{
	exit;
}
if (other.state == "stringjump")
{
	exit;
}
if (other.state == "stringfling")
{
	exit;
}
if (object_index != obj_tubeenter && other.state != "tube")
{
	exit;
}
var _offset_x = 32 * image_xscale;
var _offset_y = 14 * image_yscale;
with (other)
{
	if (other.object_index == obj_tubeenter)
	{
		shot = false;
		if (state != "tube")
		{
			repeat (6)
			{
				create_debris(x, y, spr_waterdrop, false);
			}
		}
	}
	state = "tube";
	hsp = 0;
	movespeed = 0;
	vsp = 0;
	tube_vsp = 0;
	x = approach(x, other.xstart + _offset_x, other.approach_spd);
	y = approach(y, other.ystart + _offset_y, other.approach_spd);
	if (y > (other.y + _offset_y))
	{
		tube_vsp = -other.approach_spd;
	}
}
if (floor(other.x) == (xstart + _offset_x) && floor(other.y) == (ystart + _offset_y))
{
	GamepadSetVibration(0, 0.8, 0.8, 0.65);
	other.x = xstart + _offset_x;
	other.y = ystart + _offset_y;
	image_index = 0;
	playerid = other.id;
	if (object_index == obj_tubeenter)
	{
		fmod_event_one_shot_3d("event:/sfx/pipe/start", x, y);
	}
	else
	{
		fmod_event_one_shot_3d("event:/sfx/pipe/end", x, y);
	}
	image_speed = 0.5;
	other.state = "tube";
	other.tube_vsp = 0;
	state = "tube";
}
