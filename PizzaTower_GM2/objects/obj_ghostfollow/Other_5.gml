if (object_index == obj_halloweenfollow && state == states.ghostcaught)
{
	with (obj_player1)
	{
		state = "default";
		landAnim = false;
		facehurt = true;
	}
}
destroy_sounds([snd]);
