
if (obj_player.state == "knightpep" || (obj_player.state == "chainsaw" && (obj_player.tauntstoredstate == "knightpep" || obj_player.tauntstoredstate == "knightpepslopes")) || obj_player.state == "knightpepattack" || obj_player.state == "knightpepslopes" || obj_player.state == "knightpepbump")
{
	sprite_index = spr_swordstonetaken;
}
else
{
	sprite_index = spr_swordstone;
}
if (sprite_index == spr_swordstone && !instance_exists(ID) && room != boss_pizzaface)
{
	with (instance_create(x, y - 20, obj_grabmarker))
	{
		other.ID = id;
	}
}
else if (sprite_index == spr_swordstonetaken && instance_exists(ID))
{
	instance_destroy(ID);
}
