if (!instance_exists(ID) && obj_player.state != "mortattack" && obj_player.state != "mort" && obj_player.state != "mortjump" && obj_player.state != "morthook" && place_meeting(x, y, obj_player))
{
	instance_destroy(obj_mort);
	with (instance_create(x, y - 50, obj_mort))
	{
		other.ID = id;
	}
}
