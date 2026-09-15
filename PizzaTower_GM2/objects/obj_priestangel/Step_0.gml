var tx = playerid.x;
var ty = playerid.y - 60;
var acc = 0.1;
switch (state)
{
	case "default":
		x = lerp(x, tx, acc);
		y = lerp(y, ty, acc);
		if (alarm[0] == -1 && x > (tx - 8) && x < (tx + 8) && y > (ty - 8) && y < (ty + 8))
		{
			alarm[0] = 50;
			x = tx;
			y = ty;
			state = "transitioncutscene";
		}
		break;
	case "transitioncutscene":
		x = lerp(x, tx, 0.2);
		y = lerp(y, ty, 0.2);
		break;
	case "jump":
		x += 4;
		y -= 8;
		if (!bbox_in_camera(view_camera[0], 10))
		{
			instance_destroy();
		}
		break;
}
