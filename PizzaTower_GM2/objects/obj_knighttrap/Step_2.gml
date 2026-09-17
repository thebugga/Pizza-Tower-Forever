switch (state)
{
	case "punch":
		if (attackbuffer > 0)
		{
			attackbuffer--;
		}
		else
		{
			state = "default";
		}
		break;
}
if (!place_meeting(x, y, obj_trapghost))
{
	sprite_index = spr_kingghost_spike;
	state = "default";
}
if (cooldown > 0 && state != "punch")
{
	cooldown--;
}
