switch (state)
{
	case "default":
		break;
	case "transitioncutscene":
		if (ANIMATION_END)
		{
			instance_activate_object(bossdoorID);
			with (bossdoorID)
			{
				vsp = -5;
				state = "jump";
				event_perform(ev_other, ev_room_start);
			}
			state = "jump";
		}
		break;
	case "jump":
		sprite_index = spr_mrstick_helicopterhat;
		y -= 10;
		if (y < -100)
		{
			instance_destroy();
		}
		break;
}
