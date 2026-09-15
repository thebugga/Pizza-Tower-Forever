if (state != "grabbing" && x == xstart && y == ystart)
{
	with (other)
	{
		other.playerid = id;
		other.state = "grabbing";
		if (state == "grabbed")
		{
			state = "default";
			with (playerid)
			{
				bombgrabID = noone;
			}
		}
	}
}
