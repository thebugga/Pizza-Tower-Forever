if (ds_list_find_index(global.saveroom, id) != -1)
{
	instance_destroy();
}
if (obj_player1.character == "P" && !global.swapmode)
{
	instance_destroy();
}
