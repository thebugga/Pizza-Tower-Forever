if (instance_exists(obj_player1))
{
	fmod_set_parameter("character", obj_player1.character, true);
}
fmod_set_parameter("swapmode", global.swapmode ? 1 : 0, true);
