switch (state)
{
	case states.fall:
		add_y += 8;
		if (add_y >= 0)
		{
			state = "transitioncutscene";
			y += 20;
		}
		break;
	case "transitioncutscene":
		y = approach(y, SCREEN_HEIGHT - 100, 6);
		if (y == (SCREEN_HEIGHT - 100))
		{
			state = "animation";
			buffer = 1;
		}
		break;
	case "animation":
		if (global.pigtotal_add > 0)
		{
			global.pigtotal_add--;
		}
		else
		{
			state = "default";
		}
		break;
}
