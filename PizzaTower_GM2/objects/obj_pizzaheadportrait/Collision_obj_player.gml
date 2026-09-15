if (other.state != "handstandjump" && !hasgrabbed)
{
	if (other.state != "knightpep" && other.state != "knightpepbump")
	{
		scr_hurtplayer(other);
	}
}
else if (!move)
{
	event_inherited();
}
