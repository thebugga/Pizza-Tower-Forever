global.bossRooms = [boss_pizzaface, boss_noise, boss_pepperman, boss_fakepep, boss_vigilante];
#macro in_bossRoom array_contains(global.bossRooms, room)

function scr_getallrooms()
{
	var _rooms = [];
	
	for (var r = 0; room_exists(r); r++)
	{
		array_push(_rooms, r);	
	}
	
	return _rooms;
}
