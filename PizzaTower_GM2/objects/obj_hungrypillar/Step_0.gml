
if (sprite_index != spr_protojohn)
{
	var player = obj_player1.id;
	if (player.x > (x - 400) && player.x < (x + 400) && player.y > (y - 300) && player.y < (y + 300) && (player.state == "chainsawbump" || player.ratmount_movespeed == 12 || player.state == "mach3" || player.state == "rideweenie" || player.state == "rocket" || player.state == "tacklecharge" || player.state == "knightpepslopes" || (player.state == "grab" && player.swingdingdash <= 0 && player.sprite_index == player.spr_swingding)))
	{
		sprite_index = spr_hungrypillar_angry;
	}
	else
	{
		sprite_index = spr_hungrypillar;
	}
}
