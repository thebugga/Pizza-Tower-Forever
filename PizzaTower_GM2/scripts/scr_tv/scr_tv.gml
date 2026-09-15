function tv_set_idle()
{
	with (obj_tv)
	{
		state = "default";
		sprite_index = spr_tv_idle;
	}
}

function tv_reset()
{
	with (obj_tv)
	{
		state = "default";
		sprite_index = spr_tv_idle;
		ds_list_clear(tvprompts_list);
	}
}

function tv_create_prompt(_text, _type, _spr, _textspd)
{
	return [_text, _type, _spr, _textspd];
}

function tv_push_prompt(_text, _type, _spr, _textspd)
{
	with (obj_tv)
	{
		var b = [_text, _type, _spr, _textspd];
		var play = false;
		switch (_type)
		{
			case tv_prompttypes.normal:
				play = true;
				ds_list_insert(tvprompts_list, 0, b);
				break;
			case tv_prompttypes.triggered:
				var placed = false;
				for (var i = 0; i < ds_list_size(tvprompts_list); i++)
				{
					var b2 = ds_list_find_value(tvprompts_list, i);
					if (b2[1] == tv_prompttypes.transformation)
					{
						if (i == 0)
						{
							play = true;
						}
						ds_list_insert(tvprompts_list, i, b);
						placed = true;
						break;
					}
				}
				if (!placed)
				{
					ds_list_add(tvprompts_list, b);
				}
				break;
			case tv_prompttypes.transformation:
				ds_list_add(tvprompts_list, b);
				break;
		}
		if (play)
		{
			state = "default";
		}
	}
}

function tv_push_prompt_array(_prompt)
{
	for (var i = 0; i < array_length(_prompt); i++)
	{
		with (obj_tv)
		{
			var b = _prompt[i];
			tv_push_prompt(b[0], b[1], b[2], b[3]);
		}
	}
}

function tv_push_prompt_once(_prompt, _ini_key)
{
	with (obj_tv)
	{
		if (special_prompts == noone)
		{
			return false;
		}
		var b = ds_map_find_value(special_prompts, _ini_key);
		if (is_undefined(b))
		{
			return false;
		}
		if (b != 1)
		{
			tv_push_prompt(_prompt[0], _prompt[1], _prompt[2], _prompt[3]);
			ds_map_set(special_prompts, _ini_key, 1);
			ini_open_from_string(obj_savesystem.ini_str);
			ini_write_real("Prompts", _ini_key, 1);
			obj_savesystem.ini_str = ini_close();
			return true;
		}
		return false;
	}
}

function tv_default_condition()
{
	return place_meeting(x, y, obj_player);
}

function tv_get_palette()
{
	if (!instance_exists(obj_player1))
	{
		exit;
	}
	var _info = character == "Peppino" ? get_pep_palette_info() : get_noise_palette_info();
	spr_palette = _info.spr_palette;
	if (obj_player1.isgustavo && obj_player1.character == "Peppino")
	{
		spr_palette = spr_ratmountpalette;
	}
	paletteselect = _info.paletteselect;
	patterntexture = _info.patterntexture;
}

function tv_do_expression(_spr, _reset_palette = false, _make_peppino = false)
{
	with (obj_tv)
	{
		if (expressionsprite != _spr && bubblespr == noone)
		{
			state = states.whitenoise;
			expressionsprite = _spr;
			switch (expressionsprite)
			{
				case spr_tv_exprhurt:
				case spr_tv_exprhurtN:
				case spr_tv_hurtG:
					expressionbuffer = 60;
					break;
				case spr_tv_exprhurt1:
				case spr_tv_exprhurt2:
				case spr_tv_exprhurt3:
				case spr_tv_exprhurt4:
				case spr_tv_exprhurt5:
				case spr_tv_exprhurt6:
				case spr_tv_exprhurt7:
				case spr_tv_exprhurt8:
				case spr_tv_exprhurt9:
				case spr_tv_exprhurt10:
				case spr_tv_exprhurtN1:
				case spr_tv_exprhurtN2:
				case spr_tv_exprhurtN3:
				case spr_tv_exprhurtN4:
				case spr_tv_exprhurtN5:
				case spr_tv_exprhurtN6:
				case spr_tv_exprhurtN7:
				case spr_tv_exprhurtN8:
				case spr_tv_exprhurtN9:
				case spr_tv_exprhurtN10:
					expressionbuffer = 100;
					break;
				case spr_tv_exprcollect:
					expressionbuffer = 150;
					if (obj_player.isgustavo)
					{
						expressionsprite = spr_tv_happyG;
						if (irandom(100) <= 50)
						{
							fmod_event_one_shot_3d("event:/sfx/voice/brickok", obj_player1.x, obj_player1.y);
						}
					}
					if (irandom(100) <= 50)
					{
						scr_fmod_soundeffect(obj_player1.snd_voiceok, obj_player1.x, obj_player1.y);
					}
					break;
			}
			if (!_make_peppino && instance_exists(obj_player1) && obj_player1.character != "Peppino")
			{
				var n = asset_get_index(sprite_get_name(_spr) + global.charPrefix[obj_player1.character_num]);
				if (n > -1)
				{
					expressionsprite = n;
				}
			}
			
			reset_palette = _reset_palette;
		}
	}
}

function scr_tv_get_transfo_sprite()
{
	var _state = obj_player1.state;
	if (_state == "backbreaker" || _state == "chainsaw")
	{
		_state = obj_player1.tauntstoredstate;
	}
	var _spr = noone;
	if (instance_exists(obj_bucketfollower))
	{
		_spr = spr_tv_bucket;
	}
	switch (_state)
	{
		case "knightpep":
		case "knightpepattack":
		case "knightpepbump":
		case "knightpepslopes":
			_spr = spr_tv_knight;
			break;
		case "bombpep":
		case "bombgrab":
			_spr = spr_tv_bombpep;
			break;
		case "fireass":
			_spr = spr_tv_fireass;
			if (obj_player1.sprite_index == obj_player1.spr_scaredjump1 || obj_player1.sprite_index == obj_player1.spr_scaredjump2)
			{
				_spr = spr_tv_scaredjump;
			}
			break;
		case "tumble":
			if (obj_player1.sprite_index == obj_player1.spr_tumble || obj_player1.sprite_index == obj_player1.spr_tumblestart || obj_player1.sprite_index == obj_player1.spr_tumbleend)
			{
				_spr = spr_tv_tumble;
			}
			else if (obj_player1.shotgunAnim)
			{
				_spr = spr_tv_shotgun;
			}
			break;
		case "firemouth":
			_spr = spr_tv_firemouth;
			break;
		case "ghost":
		case "ghostpossess":
			_spr = spr_tv_ghost;
			break;
		case "stunned":
			if (obj_player1.sprite_index == obj_player1.spr_squished)
			{
				_spr = spr_tv_squished;
			}
			break;
		case "default":
		case "jump":
		case "handstandjump":
		case "crouch":
		case "ladder":
		case "mach3":
		case "machslide":
		case "bump":
			with (obj_player1)
			{
				if (shotgunAnim)
				{
					_spr = spr_tv_shotgun;
				}
				else if (global.mort)
				{
					_spr = spr_tv_mort;
				}
			}
			break;
		case "freefallprep":
		case "freefall":
		case "freefallland":
			if (obj_player1.shotgunAnim)
			{
				_spr = spr_tv_shotgun;
			}
			break;
		case "pistol":
			if (global.mort)
			{
				_spr = spr_tv_mort;
			}
			break;
		case "shotgun":
		case "shotgunshoot":
		case "shotgunfreefall":
		case "shotgunjump":
		case "shotgundash":
		case "shotguncrouch":
		case "shotguncrouchjump":
			_spr = spr_tv_shotgun;
			break;
		case "barrel":
		case "barreljump":
		case "barrelslide":
		case "barrelclimbwall":
			_spr = spr_tv_barrel;
			break;
		case "golf":
			_spr = spr_tv_golf;
			break;
		case "rocket":
		case "rocketslide":
			_spr = spr_tv_rocket;
			break;
		case "cheeseball":
			_spr = spr_tv_cheeseball;
			break;
		case "cheesepep":
		case "cheesepepjump":
		case "cheesepepstick":
		case "cheesepepstickside":
		case "cheesepepstickup":
			_spr = spr_tv_cheesepep;
			break;
		case "boxxedpep":
		case "boxxedpepjump":
		case "boxxedpepspin":
			_spr = spr_tv_boxxedpep;
			break;
		case "rideweenie":
			_spr = spr_tv_weenie;
			break;
		case "mort":
		case "mortattack":
		case "morthook":
		case "mortjump":
			_spr = spr_tv_mort;
			break;
		case "mach2":
		case "climbwall":
		case "machroll":
		case "grind":
			if (obj_player1.skateboarding)
			{
				_spr = spr_tv_clown;
			}
			else if (obj_player1.shotgunAnim)
			{
				_spr = spr_tv_shotgun;
			}
			break;
	}
	with (obj_player1)
	{
		if (state == "actor" && sprite_index == spr_tumble)
		{
			_spr = spr_tv_tumble;
		}
	}
	return _spr;
}
