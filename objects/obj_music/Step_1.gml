if (instance_exists(obj_player))
{
	switch obj_player.character
	{
		default:
			fmod_set_parameter("character", 0, true);
		break;
		case "N":
			fmod_set_parameter("character", 1, true);
		break;
		case "PZ":
			fmod_set_parameter("character", 2, true);
		break;
	}
}
fmod_set_parameter("swapmode", global.swapmode ? 1 : 0, true);
