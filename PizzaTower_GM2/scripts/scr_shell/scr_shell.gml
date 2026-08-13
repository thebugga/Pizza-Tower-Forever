DebugCommand("set_game_speed", "Sets the game speed", "<int>", function(_int)
{
	game_set_speed(floor(real(_int)), gamespeed_fps);
});
DebugCommand("test_p_rank", "", "", function()
{
	global.collect = global.srank + 5000;
	global.lap = true;
	global.treasure = true;
	global.secretfound = 3;
	global.combodropped = false;
	global.prank_enemykilled = true;
	global.combotime = 60;
	global.combo = 99;
	global.panic = true;
});
DebugCommand("kill_boss", "", "", function()
{
	instance_destroy(obj_baddie);
});
DebugCommand("set_boss_hp", "", "<int>", function(_int)
{
	with (obj_baddie)
	{
		elitehit = real(_int);
	}
});
DebugCommand("switch_char", "Switches character", "", function(arg0)
{
	var _chars = ["P", "N"];
	with (obj_player)
	{
		character = array_get_index(_chars, arg0[1]);
		scr_characterspr();
	}
}, [["P", "N"]]);
DebugCommand("gateswitchmax", "", "", function()
{
	global.gateswitch = global.gateswitchmax;
});
DebugCommand("show_debug_overlay", "Toggles debug overlay", "", function()
{
	show_debug_overlay(!showoverlay);
	showoverlay = !showoverlay;
});
DebugCommand("roomcheck", "", "", function()
{
	instance_create_unique(0, 0, obj_roomcheck);
});
DebugCommand("unlock_toppins", "Unlocks the toppins of the given level", "<level_name_ini>", function(_level_name_ini)
{
	if (is_undefined(_level_name_ini))
	{
		exit;
	}
	ini_open_from_string(obj_savesystem.ini_str);
	ini_write_real("Toppin", concat(_level_name_ini, 1), true);
	ini_write_real("Toppin", concat(_level_name_ini, 2), true);
	ini_write_real("Toppin", concat(_level_name_ini, 3), true);
	ini_write_real("Toppin", concat(_level_name_ini, 4), true);
	ini_write_real("Toppin", concat(_level_name_ini, 5), true);
	obj_savesystem.ini_str = ini_close();
	gamesave_async_save();
});
DebugCommand("unlock_boss_key", "Unlocks the boss key of the given world (1, 2, 3, 4)", "<number>", function(_number)
{
	if (is_undefined(_number))
	{
		exit;
	}
	_number = real(_number);
	ini_open_from_string(obj_savesystem.ini_str);
	var n = concat("w", _number, "stick");
	ini_write_real(n, "bosskey", true);
	obj_savesystem.ini_str = ini_close();
	gamesave_async_save();
});
DebugCommand("lockcam", "", "", function()
{
	with (obj_camera)
	{
		lock = !lock;
	}
});
DebugCommand("bossinv", "", "", function()
{
	global.boss_invincible = !global.boss_invincible;
});
DebugCommand("hidetiles", "", "<bool>", function(_bool)
{
	if (is_undefined(_bool))
	{
		global.hidetiles = !global.hidetiles;
	}
	else
	{
		global.hidetiles = _bool;
	}
	layer_set_visible("Tiles_BG", !global.hidetiles);
	layer_set_visible("Tiles_BG2", !global.hidetiles);
	layer_set_visible("Tiles_BG3", !global.hidetiles);
	layer_set_visible("Tiles_1", !global.hidetiles);
	layer_set_visible("Tiles_2", !global.hidetiles);
	layer_set_visible("Tiles_3", !global.hidetiles);
	layer_set_visible("Tiles_4", !global.hidetiles);
	layer_set_visible("Tiles_Foreground1", !global.hidetiles);
	layer_set_visible("Tiles_Foreground2", !global.hidetiles);
	layer_set_visible("Tiles_Foreground3", !global.hidetiles);
});
DebugCommand("throwarc", "", "<bool>", function(_bool)
{
	if (is_undefined(_bool))
	{
		global.throwarc = !global.throwarc;
	}
	else
	{
		global.throwarc = _bool;
	}
});
DebugCommand("editor", "", "", function()
{
	with (obj_player)
	{
		targetRoom = rm_blank;
		targetDoor = "A";
	}
	instance_create_unique(0, 0, obj_fadeout);
});
DebugCommand("noclip", "", "", function()
{
	with (obj_player1)
	{
		state = states.debugstate;
	}
});
DebugCommand("givekey", "", "", function()
{
	global.key_inv = true;
});
DebugCommand("loadtest", "", "", function()
{
	with (obj_debugcontroller)
	{
		DoCommand("player_room rm_testing4 A");
		alarm[0] = 20;
	}
});
DebugCommand("othertest", "", "", function()
{
	with (obj_debugcontroller)
	{
		DoCommand("showcollisions 1");
		DoCommand("player_room rm_testing4 A");
		DoCommand("switch_char");
		alarm[0] = 20;
	}
});
DebugCommand("set_combo", "Set the combo", "<combo> <combotime:optional>", function(_combo, _combotime)
{
	if (_combo == undefined)
	{
		exit;
	}
	_combotime ??= 60
	global.combo = real(_combo);
	global.combotime = real(_combotime);
	with (obj_player)
	{
		supercharge = 10;
	}
});
DebugCommand("giveheat", "Gives heat", "", function()
{
	global.style += 100;
});
DebugCommand("alltoppins", "Adds all the toppins", "", function()
{
	if (!instance_exists(obj_pizzakincheese))
	{
		instance_create(obj_player1.x, obj_player1.y, obj_pizzakincheese);
	}
	if (!instance_exists(obj_pizzakintomato))
	{
		instance_create(obj_player1.x, obj_player1.y, obj_pizzakintomato);
	}
	if (!instance_exists(obj_pizzakinsausage))
	{
		instance_create(obj_player1.x, obj_player1.y, obj_pizzakinsausage);
	}
	if (!instance_exists(obj_pizzakinpineapple))
	{
		instance_create(obj_player1.x, obj_player1.y, obj_pizzakinpineapple);
	}
	if (!instance_exists(obj_pizzakinshroom))
	{
		instance_create(obj_player1.x, obj_player1.y, obj_pizzakinshroom);
	}
	global.cheesefollow = true;
	global.tomatofollow = true;
	global.sausagefollow = true;
	global.pineapplefollow = true;
	global.shroomfollow = true;
});
DebugCommand("panic", "Toggles pizza time", "<fill>", function(_fill)
{
	if (_fill != undefined && _fill != "")
	{
		_fill = get_number_string(_fill);
	}
	else
	{
		_fill = 4000;
	}
	global.panic = !global.panic;
	global.fill = _fill;
	if (global.panic)
	{
		obj_camera.alarm[1] = 60;
	}
	obj_tv.chunkmax = global.fill;
});
DebugCommand("showcollisions", "Shows the collisions", "<bool>", function(_bool)
{
	if (_bool == undefined)
	{
		exit;
	}
	_bool = get_bool(_bool);
	if (_bool != undefined)
	{
		showcollisions = _bool;
		event_perform(ev_other, ev_room_start);
	}
});
DebugCommand("showhud", "Shows the HUD", "<bool>", function(_bool)
{
	if (_bool == undefined)
	{
		exit;
	}
	_bool = get_bool(_bool);
	show_debug_message(!_bool);
	if (_bool != undefined)
	{
		showhud = _bool;
		with (obj_tv)
		{
			visible = _bool;
			show_debug_message(visible);
		}
		with (obj_camera)
		{
			visible = _bool;
			show_debug_message(visible);
		}
		with (obj_roomname)
		{
			visible = _bool;
			show_debug_message(visible);
		}
		with (obj_pigtotal)
		{
			visible = _bool;
			show_debug_message(visible);
		}
	}
});
DebugCommand("player_room", "Go to given room", "<targetRoom> <targetDoor>", function(_targetRoom, _targetDoor)
{
	if (_targetRoom == undefined)
	{
		exit;
	}
	if (_targetDoor == undefined)
	{
		exit;
	}
	_targetRoom = asset_get_index(_targetRoom);
	if (_targetRoom == -1)
	{
		exit;
	}
	with (obj_player)
	{
		targetRoom = _targetRoom;
		targetDoor = _targetDoor;
	}
	instance_create(x, y, obj_fadeout);
});
DebugCommand("camera_zoom", "Zoom", "<targetzoom> <spd>", function(arg)
{
	var _targetzoom = arg[1];
	var _spd = arg[2];
	if (_targetzoom == undefined)
	{
		exit;
	}
	if (_spd != undefined)
	{
		_spd = get_number_string(_spd);
	}
	with (obj_camera)
	{
		targetzoom = _targetzoom;
		targetzoom = clamp(targetzoom, 0, max_zoom);
		if (_spd != undefined)
		{
			zoomspd = abs(_spd);
		}
	}
});
DebugCommand("destroyice", "", "", function()
{
	instance_destroy(obj_iceblock);
	instance_destroy(obj_iceblockslope);
});
DebugCommand("hardmode", "Toggles hardmode", "<bool>", function(arg)
{
	var _bool = arg[1];
	if (_bool == undefined)
	{
		exit;
	}
	_bool = get_bool(_bool);
	show_debug_message(!_bool);
	if (_bool != undefined)
	{
		global.hardmode = _bool;
		with (obj_hardmode)
		{
			event_perform(ev_other, ev_room_start);
		}
	}
}, [["True", "False"]]);
DebugCommand("player_set_state", "Changes the player state", "<states.state>", function(arg)
{
	var _state = arg[1];
	if (_state == undefined)
	{
		exit;
	}
	_state = ds_map_find_value(state_map, _state);
	if (!is_undefined(_state))
	{
		with (obj_player)
		{
			state = _state;
			var _spr = sprite_index;
			switch (_state)
			{
				case states.normal:
					_spr = spr_idle;
					break;
				case states.cheesepep:
					_spr = spr_cheesepep_idle;
					break;
				case states.knightpep:
					_spr = spr_knightpepidle;
					break;
				case states.firemouth:
					_spr = spr_firemouth;
					break;
				case states.ratmount:
					_spr = spr_player_ratmountidle;
					break;
			}
			sprite_index = _spr;
			image_index = 0;
		}
	}
});