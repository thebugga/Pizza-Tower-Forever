x = playerid.x;
y = playerid.y;
image_xscale = playerid.xscale;
if (abs(playerid.hsp) <= 0 || playerid.state != "mach3" || playerid.state == "slipbanan" || abs(playerid.movespeed) <= 12 || (playerid.collision_flags & collisionflags.secret) > 0 || playerid.cutscene || playerid.state == "comingoutdoor" || playerid.state == "door" || room == timesuproom)
{
	instance_destroy();
}
if (room == timesuproom)
{
	instance_destroy();
}
