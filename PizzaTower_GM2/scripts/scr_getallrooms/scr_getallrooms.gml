global.bossRooms = [boss_pizzaface, boss_noise, boss_pepperman, boss_fakepep, boss_vigilante];
#macro in_bossRoom array_contains(global.bossRooms, room)
#macro in_hudlessRoom (room == init_obj_room || room == rm_editor || room == Longintro || room == Mainmenu || room == rank_room || room == timesuproom  || room == characterselect || room == hub_loadingscreen || (string_copy(room_get_name(room), 1, 5) == "tower" && !global.panic) || in_bossRoom)
#macro no_hud ((instance_exists(obj_debugcontroller) && !obj_debugcontroller.showhud) || !global.option_hud)

function scr_getallrooms()
{
	var _rooms = [];
	
	for (var r = 0; room_exists(r); r++)
	{
		array_push(_rooms, r);	
	}
	
	return _rooms;
}
