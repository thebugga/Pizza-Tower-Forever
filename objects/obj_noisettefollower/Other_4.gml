if (obj_player.character == "P" && global.swapmode == false)
{
	instance_destroy();
}
if (ds_list_find_index(global.saveroom, id) != -1)
{
	instance_destroy();
}
