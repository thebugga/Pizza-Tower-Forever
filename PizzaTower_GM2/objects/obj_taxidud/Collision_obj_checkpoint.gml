if (playerid.visible == false)
{
	global.hp = 8;
	global.failcutscene = false;
	with (obj_player1)
	{
		fmod_event_one_shot("event:/sfx/misc/taxibeep");
		state = "default";
		instance_create(x, y, obj_genericpoofeffect);
		cutscene = false;
		if (isgustavo)
		{
			state = "ratmount";
			sprite_index = spr_player_ratmountidle;
		}
	}
	if (global.coopmode == true)
	{
		with (obj_player2)
		{
			state = "default";
			cutscene = false;
			if (isgustavo)
			{
				state = "ratmount";
			}
		}
	}
	obj_player1.visible = true;
	obj_player2.visible = true;
}
