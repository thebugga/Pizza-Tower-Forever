image_xscale = playerid.xscale;
if (playerid.state != "rocket" && playerid.gusdashpadbuffer <= 0 && playerid.state != "mach3" && playerid.ratmount_movespeed < 12 && playerid.state != "crouchslide" && playerid.state != "shoulderbash")
{
	instance_destroy();
}
x = playerid.x + (((playerid.sprite_index == spr_player_Sjumpcancel) ? 20 : 0) * playerid.xscale);
y = playerid.y - 0;
if (playerid.state == "rocket")
{
	x = playerid.x + (playerid.xscale * 18);
}
if (playerid.state == "ratmount")
{
	x = playerid.x + (playerid.xscale * 18);
}
if (playerid.sprite_index == playerid.spr_fightball)
{
	x = playerid.x + (playerid.xscale * 18);
}
visible = !(room == rank_room);
if (place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart))
{
	visible = false;
}
if (playerid.sprite_index == playerid.spr_rocketstart)
{
	visible = false;
}
