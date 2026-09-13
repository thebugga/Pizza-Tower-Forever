if (ds_list_find_index(global.saveroom, id) != -1)
{
	instance_destroy();
}
if (global.level_minutes > timer)
{
	ds_list_add(global.saveroom, id);
	instance_destroy();
}
sprite_index = choose(spr_PTG, spr_Bugga, spr_Bugga2, spr_David);
//if (is_holiday(holidays.halloween))
//{
//	sprite_index = spr_PTGhalloween;
//}
