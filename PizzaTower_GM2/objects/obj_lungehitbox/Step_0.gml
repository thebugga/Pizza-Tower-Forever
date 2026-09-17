if (playerid.state != "lungeattack" && playerid.state != "handstandjump")
{
	instance_destroy();
	exit;
}
x = playerid.x + (24 * playerid.xscale);
y = playerid.y;
