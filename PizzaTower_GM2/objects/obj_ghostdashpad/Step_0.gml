if (obj_player.state != "ghost" && obj_player.state != "chainsaw" && cooldown == 0)
{
	visible = true;
}
if (cooldown > 0)
{
	cooldown--;
}
if (obj_player.state != "ghost" && (obj_player1.state != "chainsaw" || obj_player1.tauntstoredstate != "ghost"))
{
	image_alpha = 0.35;
}
else
{
	image_alpha = 1;
}
