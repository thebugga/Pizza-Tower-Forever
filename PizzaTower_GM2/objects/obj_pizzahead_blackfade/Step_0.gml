with (obj_player1)
{
	if (state == "actor" || (state == "supergrab" && supergrabstate != "finishingblow"))
	{
		other.fade = approach(other.fade, 0.6, 0.1);
	}
	else
	{
		other.fade = approach(other.fade, 0, 0.05);
	}
}
