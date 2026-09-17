image_xscale = playerid.xscale;
x = playerid.x;
y = playerid.y;
if (playerid.sprite_index != spr_knightpep_attack && playerid.state != "parry" && playerid.state != "finishingblow")
{
	instance_destroy();
}
