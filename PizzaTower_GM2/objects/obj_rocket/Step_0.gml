if (playerid != noone)
{
	visible = false;
	if (playerid.state != "rocket" && playerid.state != "rocketslide" && playerid.state != "chainsaw")
	{
		visible = true;
		create_particle(x, y, particletypes.genericpoofeffect);
		playerid = noone;
	}
}
else
{
	visible = true;
}
if (visible && buffer > 0)
{
	buffer--;
}
