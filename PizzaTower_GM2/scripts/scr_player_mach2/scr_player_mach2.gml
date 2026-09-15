function player_mach2()
{
	var maxmovespeed = 12;
	var jumpspeed = -11;
	var slopeaccel = 0.1;
	var slopedeccel = 0.2;
	var accel = 0.1;
	var mach4accel = 0.4;
	var machrollvsp = 10;
	if (windingAnim < 2000)
	{
		windingAnim++;
	}
	if (place_meeting(x, y + 1, obj_railparent))
	{
		var _railinst = instance_place(x, y + 1, obj_railparent);
		railmovespeed = _railinst.movespeed;
		raildir = _railinst.dir;
	}
	hsp = (xscale * movespeed) + (railmovespeed * raildir);
	move2 = key_right2 + key_left2;
	move = key_right + key_left;
	crouchslideAnim = true;
	if (!key_jump2 && jumpstop == false && vsp < 0.5)
	{
		vsp /= 20;
		jumpstop = true;
	}
	if (grounded && vsp > 0)
	{
		jumpstop = false;
	}
	if (input_buffer_jump > 0 && can_jump && sprite_index != spr_clownjump && !(move == 1 && xscale == -1) && !(move == -1 && xscale == 1))
	{
		input_buffer_jump = 0;
		hsp = movespeed * xscale;
		image_index = 0;
		sprite_index = spr_secondjump1;
		scr_fmod_soundeffect(jumpsnd, x, y);
		particle_set_scale(particletypes.jumpdust, xscale, 1);
		create_particle(x, y, particletypes.jumpdust, 0);
		if (skateboarding)
		{
			sprite_index = spr_clownjump;
		}
		vsp = jumpspeed;
	}
	if (input_buffer_jump > 0 && !can_jump && character == "Noise" && key_up && noisedoublejump && !skateboarding && sprite_index != spr_clownjump)
	{
		player_do_noisecrusher();
	}
	var mortjump = false;
	if (key_jump && global.mort == true && sprite_index != spr_mortdoublejump && !grounded && !skateboarding)
	{
		state = "jump";
		repeat (6)
		{
			create_debris(x, y, spr_feather);
		}
		sprite_index = spr_mortdoublejump;
		image_index = 0;
		grav = 0.25;
		with (instance_create(x, y, obj_highjumpcloud2))
		{
			image_xscale = other.xscale;
		}
		mort = true;
		mortjump = true;
	}
	if (grounded && vsp > 0)
	{
		if (sprite_index == spr_playerN_skateboarddoublejump)
		{
			sprite_index = spr_mach;
			fmod_event_one_shot_3d("event:/sfx/playerN/wallbounceland", x, y);
		}
		if (machpunchAnim == false && sprite_index != spr_mach && sprite_index != spr_mach1 && sprite_index != spr_mach4)
		{
			if (sprite_index != spr_rollgetup && sprite_index != spr_suplexdash && sprite_index != spr_taunt && sprite_index != spr_player_Sjumpcancelstart)
			{
				sprite_index = spr_mach;
			}
		}
		//if (machpunchAnim == true)
		//{
		//	if (punch == false)
		//	{
		//		sprite_index = spr_machpunch1;
		//	}
		//	if (punch == true)
		//	{
		//		sprite_index = spr_machpunch2;
		//	}
		//	if (floor(image_index) == 4 && sprite_index == spr_machpunch1)
		//	{
		//		punch = true;
		//		machpunchAnim = false;
		//	}
		//	if (floor(image_index) == 4 && sprite_index == spr_machpunch2)
		//	{
		//		punch = false;
		//		machpunchAnim = false;
		//	}
		//}
	}
	if (ANIMATION_END && sprite_index == spr_mach1)
	{
		sprite_index = spr_mach;
	}
	if (ANIMATION_END && sprite_index == spr_longjump)
	{
		sprite_index = spr_longjumpend;
	}
	if (ANIMATION_END && sprite_index == spr_playerN_skateboarddoublejump)
	{
		image_index = image_number - 3;
	}
	if (sprite_index == spr_playerN_skateboarddoublejump && grounded && vsp > 0)
	{
		sprite_index = spr_mach;
	}
	if (!grounded)
	{
		machpunchAnim = false;
	}
	if (grounded)
	{
		if ((scr_slope() && hsp != 0) && movespeed > 8)
		{
			player_addslopemomentum(slopeaccel, slopedeccel);
		}
		if (movespeed < maxmovespeed)
		{
			if (mach4mode == false)
			{
				movespeed += accel;
			}
			else
			{
				movespeed += mach4accel;
			}
		}
		if (abs(hsp) >= maxmovespeed && skateboarding == false && sprite_index != spr_suplexdash)
		{
			machhitAnim = false;
			state = "mach3";
			flash = true;
			if (sprite_index != spr_rollgetup)
			{
				sprite_index = spr_mach4;
			}
			particle_set_scale(particletypes.jumpdust, xscale, 1);
			create_particle(x, y, particletypes.jumpdust, 0);
		}
	}
	if ((!grounded && (place_meeting(x + hsp, y, obj_solid) || scr_solid_slope(x + hsp, y)) && !place_meeting(x + hsp, y, obj_destructibles)) || (grounded && (place_meeting(x + sign(hsp), y - 16, obj_solid) || scr_solid_slope(x + sign(hsp), y - 16)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_metalblock) && place_meeting(x, y + 1, obj_slope)))
	{
		var _climb = true;
		if (character == "Noise")
		{
			_climb = ledge_bump(32, abs(hsp) + 1);
		}
		if (_climb)
		{
			wallspeed = movespeed;
			grabclimbbuffer = 0;
			if (movespeed < 1)
			{
				wallspeed = 1;
			}
			else
			{
				movespeed = wallspeed;
			}
			state = "climbwall";
		}
	}
	if (!grounded && place_meeting(x + sign(hsp), y, obj_climbablewall) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_metalblock))
	{
		var _climb = true;
		if (character == "Noise")
		{
			_climb = ledge_bump(32);
		}
		if (_climb)
		{
			wallspeed = movespeed;
			grabclimbbuffer = 0;
			state = "climbwall";
		}
	}
	if (!instance_exists(dashcloudid) && grounded)
	{
		with (instance_create(x, y, obj_dashcloud))
		{
			image_xscale = other.xscale;
			other.dashcloudid = id;
		}
	}
	if (grounded && ANIMATION_END && (sprite_index == spr_rollgetup || sprite_index == spr_player_rampjump))
	{
		sprite_index = spr_mach;
	}
	if (ANIMATION_END && sprite_index == spr_suplexdash)
	{
		sprite_index = spr_mach;
	}
	if (!grounded && sprite_index != spr_playerN_skateboarddoublejump && sprite_index != spr_playerN_sidewayspin && sprite_index != spr_playerN_grindcancel && sprite_index != spr_playerN_sidewayspinend && sprite_index != spr_secondjump2 && sprite_index != spr_clownjump && sprite_index != spr_clownfall && sprite_index != spr_mach2jump && sprite_index != spr_mach2jump && sprite_index != spr_walljumpstart && sprite_index != spr_taunt && sprite_index != spr_player_Sjumpcancelstart && sprite_index != spr_walljumpend && sprite_index != spr_longjump && sprite_index != spr_longjumpend)
	{
		sprite_index = spr_secondjump1;
		if (skateboarding)
		{
			sprite_index = spr_clownfall;
		}
	}
	if (ANIMATION_END && sprite_index == spr_secondjump1)
	{
		sprite_index = spr_secondjump2;
	}
	if (ANIMATION_END && sprite_index == spr_walljumpstart)
	{
		sprite_index = spr_walljumpend;
	}
	if (!grounded && sprite_index != spr_clownfall && sprite_index == spr_clownjump && ANIMATION_END)
	{
		sprite_index = spr_clownfall;
	}
	if (sprite_index == spr_playerN_sidewayspin && ANIMATION_END)
	{
		sprite_index = spr_playerN_sidewayspinend;
	}
	if (grounded && (sprite_index == spr_playerN_sidewayspin || sprite_index == spr_playerN_grindcancel || sprite_index == spr_playerN_sidewayspinend))
	{
		sprite_index = spr_mach;
	}
	if (scr_mach_check_dive() && !skateboarding && sprite_index != spr_playerN_grindcancel && !place_meeting(x, y, obj_dashpad))
	{
		particle_set_scale(particletypes.jumpdust, xscale, 1);
		create_particle(x, y, particletypes.jumpdust, 0);
		flash = false;
		state = "tumble";
		vsp = machrollvsp;
		image_index = 0;
		sprite_index = grounded ? spr_machroll : spr_mach2jump;	
	}

	if ((!key_attack && movespeed >= 8 && grounded && vsp > 0 && skateboarding == false) || (character == "S" && move == 0 && grounded))
	{
		image_index = 0;
		state = "machslide";
		if character == "Peppino"
		{
			fmod_event_one_shot_3d("event:/sfx/pep/break", x, y);
		}
		else if character == "Noise"
		{
			fmod_event_one_shot_3d("event:/sfx/playerN/break", x, y);
		}
		else if character == "Pepperman"
		{
			fmod_event_one_shot_3d("event:/sfx/playerPM/break", x, y);
		}
		sprite_index = spr_machslidestart;
	}
	else if (!key_attack && movespeed < 8 && grounded && vsp > 0 && skateboarding == false)
	{
		state = "default";
	}
	if (move == -xscale && movespeed >= 8 && grounded && vsp > 0 && skateboarding == false)
	{
		if character == "Peppino"
		{
			fmod_event_one_shot_3d("event:/sfx/pep/break", x, y);
		}
		else if character == "Noise"
		{
			fmod_event_one_shot_3d("event:/sfx/playerN/break", x, y);
		}
		else if character == "Pepperman"
		{
			fmod_event_one_shot_3d("event:/sfx/playerPM/break", x, y);
		}
		image_index = 0;
		state = "machslide";
		sprite_index = spr_machslideboost;
	}
	else if (move == -xscale && movespeed < 8 && grounded && vsp > 0 && skateboarding == false)
	{
		xscale *= -1;
		movespeed = 6;
	}
	if (clowntimer > 0 && skateboarding == true)
	{
		clowntimer--;
	}
	if (clowntimer <= 0 && skateboarding == true)
	{
		state = "default";
		instance_create(x, y, obj_genericpoofeffect);
	}
	if (sprite_index == spr_rollgetup || sprite_index == spr_longjumpend || sprite_index == spr_longjump || sprite_index == spr_suplexdash)
	{
		image_speed = 0.4;
	}
	else
	{
		image_speed = abs(movespeed) / 15;
	}
	scr_dotaunt();
	if (skateboarding && sprite_index != spr_clownjump && grounded)
	{
		sprite_index = spr_clown;
	}
	if (mortjump)
	{
		sprite_index = spr_player_mortjumpstart;
	}
	if (state != "machslide" && state != states.unknown300 && scr_solid(x + xscale, y) && !scr_slope() && (scr_solid_slope(x + sign(hsp), y) || place_meeting(x + sign(hsp), y, obj_solid)) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_climbablewall) && grounded)
	{
		if (skateboarding)
		{
			xscale *= -1;
		}
		else
		{
			var _bump = ledge_bump((vsp >= 0) ? 32 : 22);
			if (_bump)
			{
				fmod_event_one_shot_3d("event:/sfx/pep/splat", x, y);
				state = "bump";
				image_index = 0;
				sprite_index = spr_wallsplat;
			}
		}
	}
	scr_dograb()
	scr_douppercut()
	if (input_buffer_shoot > 0 && !skateboarding)
	{
		if (shotgunAnim)
		{
			scr_shotgunshoot();
		}
		else if (global.pistol)
		{
			scr_pistolshoot("mach2");
		}
	}
	if (global.attackstyle == 2 && key_slap2)
	{
		randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_player_suplexmash5, spr_player_suplexmash6, spr_player_suplexmash7, spr_punch]);
		image_index = 0;
		state = "lungeattack";
	}
	if (state != "mach2" && fmod_event_instance_is_playing(rollgetupsnd))
	{
		fmod_event_instance_stop(rollgetupsnd, true);
	}
}
