with (obj_trapghost)
{
	if (point_distance(obj_player1.x, obj_player1.y, other.x, other.y) < other.ghost_distance_threshold && (state == "default" || trapid == noone || ((point_distance(obj_player1.x, obj_player1.y, trapid.x, trapid.y) > point_distance(obj_player1.x, obj_player1.y, other.x, other.y) || (other.object_index == obj_anchortrap && state == "default" && trapid.object_index == obj_anchortrap)) && trapid.object_index != obj_tvtrap)))
	{
		state = "transitioncutscene";
		trapid = other.id;
		fmod_event_instance_play(snd_move);
	}
}
