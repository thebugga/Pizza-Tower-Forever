x = playerid.x;
y = playerid.y;
if (playerid.state != "freefall" && playerid.state != "superslam" && playerid.sprite_index != spr_player_ratmountwalljump)
{
	instance_destroy();
}
visible = !(room == rank_room);
