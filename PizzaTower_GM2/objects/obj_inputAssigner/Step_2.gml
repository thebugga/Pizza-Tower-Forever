if (!global.option_vibration)
{
	exit;
}
with (obj_player)
{
	var _pindex = (object_index == obj_player1) ? 0 : 1;
	_dvc = other.player_input_device[_pindex];
	if (state != other.prevstate[_pindex])
	{
		switch (state)
		{
			case "tackle":
				GamepadSetVibration(_pindex, 0.8, 0.8, 0.6);
				break;
			case "tumble":
				GamepadSetVibration(_pindex, 0.8, 0.8, 0.8);
				break;
			case "machcancel":
				GamepadSetVibration(_pindex, 0.5, 0.5, 0.5);
				break;
			case "fireass":
				GamepadSetVibration(_pindex, 1, 1, 0.85);
				break;
			case "shotgunshoot":
				GamepadSetVibration(_pindex, 0.9, 0.9, 0.85);
				break;
			case "firemouth":
				GamepadSetVibration(_pindex, 0.8, 0.8, 0.85);
				break;
			case "hurt":
				GamepadSetVibration(_pindex, 1, 1, 0.85);
				break;
			case "bombpep":
				GamepadSetVibration(_pindex, 0.8, 0.8, 0.6);
				if (sprite_index == spr_bombpepend)
				{
					GamepadSetVibration(_pindex, 1, 1, 0.9);
				}
				break;
			case "Sjump":
				GamepadSetVibration(_pindex, 0.8, 0.8, 0.85);
				break;
			case "Sjumpprep":
				GamepadSetVibration(_pindex, 0.8, 0.8, 0.6);
				break;
			case "Sjumpland":
				GamepadSetVibration(_pindex, 1, 1, 0.9);
				break;
			case "knightpep":
				if (sprite_index == spr_knightpepthunder)
				{
					GamepadSetVibration(_pindex, 1, 1, 0.9);
				}
				break;
			case "parry":
				GamepadSetVibration(_pindex, 0.8, 0.8, 0.65);
				break;
			case "freefallland":
				GamepadSetVibration(_pindex, 1, 1, 0.85);
				break;
			case "chainsaw":
				GamepadSetVibration(_pindex, 0.8, 0.8, 0.6);
				break;
			case "bump":
				if (sprite_index != spr_hitwall)
				{
					GamepadSetVibration(_pindex, 0.8, 0.8, 0.6);
				}
				else
				{
					GamepadSetVibration(_pindex, 1, 1, 0.85);
				}
				break;
			case "grab":
				GamepadSetVibration(_pindex, 0.2, 0.2, 0.8);
				break;
			case "ratmountpunch":
				GamepadSetVibration(_pindex, 0.8, 0.8, 0.65);
				break;
			case "barrel":
				GamepadSetVibration(_pindex, 0.4, 0.4, 0.65);
				break;
			case "barrelslide":
				GamepadSetVibration(_pindex, 0.4, 0.4, 0.65);
				break;
			case "barrelclimbwall":
				GamepadSetVibration(_pindex, 0.4, 0.4, 0.65);
				break;
			case "antigrav":
				GamepadSetVibration(_pindex, 0.8, 0.8, 0.65);
				break;
			case "ratmountclimbwall":
				GamepadSetVibration(_pindex, 0.2, 0.2, 0.8);
				break;
			case "cheesepepstick":
				GamepadSetVibration(_pindex, 0.4, 0.4, 0.8);
				break;
			case "cheesepepstickside":
				GamepadSetVibration(_pindex, 0.4, 0.4, 0.8);
				break;
			case "cheesepepstickup":
				GamepadSetVibration(_pindex, 0.4, 0.4, 0.8);
				break;
			case "stringfall":
				GamepadSetVibration(_pindex, 0.7, 0.7, 0.8);
				break;
			case "stringjump":
				GamepadSetVibration(_pindex, 0.7, 0.7, 0.8);
				break;
			case "stringfling":
				GamepadSetVibration(_pindex, 0.7, 0.7, 0.8);
				break;
			case "jetpackjump":
				GamepadSetVibration(_pindex, 0.9, 0.9, 0.8);
				break;
			default:
				other.setVibration(_pindex, 0, 0);
				break;
		}
		if (other.prevstate[_pindex] == "stringfall")
		{
			GamepadSetVibration(_pindex, 0.7, 0.7, 0.8);
		}
		other.prevstate[_pindex] = state;
	}
}
var _dvc = player_input_device[player_index];
vibration[0][0] *= vibration[0][2];
vibration[0][1] *= vibration[0][2];
if (vibration[0][0] < 0)
{
	vibration[0][0] = 0;
}
if (vibration[0][1] < 0)
{
	vibration[0][1] = 0;
}
gamepad_set_vibration(_dvc, vibration[0][0], vibration[0][1]);
if (player_input_device[!player_index] != _dvc)
{
	gamepad_set_vibration(player_input_device[!player_index], 0, 0);
}
