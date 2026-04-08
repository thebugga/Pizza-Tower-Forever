if (ds_list_find_index(global.saveroom, id) != -1)
{
	instance_destroy();
}
if (room == tower_finalhallway)
{
	sprite_index = spr_protojohn;
}
if (scr_get_mode("war").enabled)
{
	instance_destroy(self, false);
	instance_create(x, y - 16, obj_exitgate).warexit = true;
}