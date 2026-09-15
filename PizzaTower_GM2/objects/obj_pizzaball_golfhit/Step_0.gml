with (obj_pizzaball)
{
	other.primoburg = golfhit[0];
}
if (instance_exists(obj_pizzaball))
{
	hit = global.golfhit;
}
if (state == "default")
{
	y = approach(y, SCREEN_HEIGHT, 5);
	if (!instance_exists(obj_pizzaball))
	{
		state = "gameover";
	}
}
else
{
	var ty = SCREEN_HEIGHT + sprite_height;
	y = approach(y, ty, 7);
	if (instance_exists(obj_pizzaball))
	{
		state = "default";
	}
	else if (y >= ty)
	{
		instance_destroy();
	}
}
if (!obj_player1.ispeppino)
{
	cloud_index += 0.15;
	if (hand_state == states.fall)
	{
		hand_shake = 0;
		hand_yoffset = lerp(hand_yoffset, 300, 0.2);
		if (hit > primoburg)
		{
			hand_buffer = 20;
			hand_state = "default";
		}
	}
	else if (hand_state == "default")
	{
		hand_yoffset = lerp(hand_yoffset, 0, 0.2);
		if (hand_yoffset <= 16)
		{
			hand_shake = 5;
			if (hand_buffer > 0)
			{
				hand_buffer--;
			}
			else
			{
				hand_state = states.fall;
				while (hit > primoburg)
				{
					primoburg++;
				}
				with (obj_pizzaball)
				{
					golfhit[0] = other.primoburg;
				}
			}
		}
	}
}
