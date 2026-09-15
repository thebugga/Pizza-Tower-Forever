if (obj_player.state == states.taxi)
{
	//if (!global.pizzadelivery)
	//{
		with (instance_create(obj_stopsign.x - (SCREEN_WIDTH / 2), obj_stopsign.y, obj_taxidud))
		{
			playerid = obj_player1;
			if (obj_player1.policetaxi)
			{
				obj_player1.policetaxi = false;
				sprite_index = spr_taxicop;
			}
		}
	//}
	//else
	//{
	//	with (instance_create(obj_checkpoint.x - (SCREEN_WIDTH / 2), obj_checkpoint.y - 50, obj_taxidud))
	//	{
	//		playerid = obj_player1;
	//	}
	//	with (obj_player)
	//	{
	//		x = obj_checkpoint.x;
	//		y = obj_checkpoint.y - 50;
	//	}
	//}
}
if (obj_player.state == states.taxi2)
{
	with (obj_player)
	{
		visible = true;
		state = states.normal;
	}
}
if (obj_player.state == states.spaceshuttle)
{
	instance_create(obj_spaceshuttlestop.x, camera_get_view_y(view_camera[0]) - 50, obj_spaceshuttletrans);
}
