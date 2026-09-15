pause = false;
var rm = room;
if (!hub)
{
	obj_player1.targetRoom = init_obj_room;
	obj_player2.targetRoom = init_obj_room;
	room = init_obj_room;
	global.leveltosave = noone;
	global.leveltorestart = noone;
	scr_playerreset();
	alarm[0] = 2;
	obj_player1.state = "titlescreen";
	obj_player2.state = "titlescreen";
	obj_player1.targetDoor = "A";
	if (instance_exists(obj_player2))
	{
		obj_player2.targetDoor = "A";
	}
	global.cowboyhat = false;
	global.coopmode = false;
}
else
{
	global.levelreset = false;
	scr_playerreset();
	with (obj_player1)
	{
		swap_player();
	}
	global.levelreset = true;
	obj_player1.targetDoor = "HUB";
	global.leveltorestart = noone;
	global.leveltosave = noone;
	with (instance_create(0, 0, obj_backtohub_fadeout))
	{
		fadealpha = 1;
		fadein = false;
		reset = true;
		pos_player = false;
		obj_player1.targetRoom = obj_player1.backtohubroom;
		obj_player2.targetRoom = obj_player1.backtohubroom;
		room_goto(obj_player1.backtohubroom);
	}
}

if (array_contains(global.bossRooms, rm))
{
	global.bossintro = true;
}
