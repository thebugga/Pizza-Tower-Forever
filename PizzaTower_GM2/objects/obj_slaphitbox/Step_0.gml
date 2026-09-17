image_xscale = playerid.xscale;
x = playerid.x;
y = playerid.y;
if ((playerid.image_index > 3 || playerid.state != "slap") && playerid.state != "handstandjump" && playerid.state != "hookshot")
{
	instance_destroy();
}
