function scr_playersounds()
{
	with (obj_player)
	{
		if (instance_exists(obj_pizzaface))
		{
			if (!fmod_event_instance_is_playing(global.snd_pizzafacemoving))
			{
				fmod_event_instance_play(global.snd_pizzafacemoving);
			}
			with (obj_pizzaface)
			{
				fmod_event_instance_set_3d_attributes(global.snd_pizzafacemoving, x, y);
			}
		}
		else
		{
			fmod_event_instance_stop(global.snd_pizzafacemoving, true);
		}
		if (state == "actor" && sprite_index == spr_firemouthend)
		{
			if (image_index > 8 && !fmod_event_instance_is_playing(burpsnd))
			{
				fmod_event_instance_play(burpsnd);
				fmod_event_instance_set_3d_attributes(burpsnd, x, y);
			}
		}
		if (global.snd_alarm_baddieID != noone)
		{
			if (!instance_exists(global.snd_alarm_baddieID))
			{
				global.snd_alarm_baddieID = noone;
				fmod_event_instance_stop(global.snd_alarm, true);
			}
			else
			{
				fmod_event_instance_set_3d_attributes(global.snd_alarm, global.snd_alarm_baddieID.x, global.snd_alarm_baddieID.y);
			}
		}
		if (state != "tube" && sprite_index != spr_knightpepstart && state != "bombgrab" && state != "chainsaw" && state != states.teleporter && state != states.secretportal && state != "door" && state != "victory" && state != "stunned" && state != "gameover" && state != "fireass")
		{
			if (!scr_transformationcheck())
			{
				if (!transformationsnd)
				{
					transformationsnd = true;
					if (irandom(100) <= 70)
					{
						fmod_event_instance_play(snd_voicetransfo);
					}
					fmod_event_one_shot_3d("event:/sfx/misc/transfo", x, y);
				}
			}
			else if (transformationsnd)
			{
				transformationsnd = false;
				if (irandom(100) <= 70)
				{
					fmod_event_instance_play(snd_voiceouttransfo);
				}
				fmod_event_one_shot_3d("event:/sfx/misc/detransfo", x, y);
			}
		}
		fmod_event_instance_set_3d_attributes(snd_voiceouttransfo, x, y);
		fmod_event_instance_set_3d_attributes(snd_voicetransfo, x, y);
		fmod_event_instance_set_3d_attributes(snd_voiceok, x, y);
		fmod_event_instance_set_3d_attributes(snd_voicehurt, x, y);
		fmod_event_instance_set_3d_attributes(snd_uppercut, x, y);
		fmod_event_instance_set_3d_attributes(snd_dive, x, y);
		fmod_event_instance_set_3d_attributes(snd_crouchslide, x, y);
		fmod_event_instance_set_3d_attributes(rollgetupsnd, x, y);
		fmod_event_instance_set_3d_attributes(animatronicsnd, x, y);
		fmod_event_instance_set_3d_attributes(snd_dashpad, x, y);
		fmod_event_instance_set_3d_attributes(gallopingsnd, x, y);
		if (state == "freefall" || state == "freefallprep" || (state == "superslam" || (state == "chainsaw" && tauntstoredstate == "superslam")))
		{
			if (!fmod_event_instance_is_playing(freefallsnd))
			{
				fmod_event_instance_play(freefallsnd);
			}
			fmod_event_instance_set_paused(freefallsnd, false);
			fmod_event_instance_set_3d_attributes(freefallsnd, x, y);
		}
		else
		{
			fmod_event_instance_stop(freefallsnd, true);
		}
		if ((character == "Peppino" && (state == "mach2" || state == "mach3" || state == "climbwall")) || (state == "rocket" && sprite_index != spr_rocketstart))
		{
			fmod_event_instance_set_paused(machsnd, false);
			if (!fmod_event_instance_is_playing(machsnd))
			{
				fmod_event_instance_play(machsnd);
			}
			var s = 0;
			if (state == "mach2" && sprite_index == spr_mach1 && grounded)
			{
				s = 1;
			}
			else if ((state == "mach2" && sprite_index == spr_mach) || state == "climbwall")
			{
				s = 2;
			}
			else if (state == "mach3" && sprite_index != spr_crazyrun)
			{
				s = 3;
			}
			else if (sprite_index == spr_crazyrun)
			{
				s = 4;
			}
			if (state == "rocket")
			{
				s = 4;
			}
			fmod_event_instance_set_3d_attributes(machsnd, x, y);
			fmod_event_instance_set_parameter(machsnd, "state", s, true);
		}
		else
		{
			fmod_event_instance_stop(machsnd, true);
		}
		if ((state == "knightpepslopes" && grounded && vsp > 0) || state == "grind" || (state == "trashroll" && grounded && vsp > 0 && sprite_index == spr_player_trashslide))
		{
			if (!fmod_event_instance_is_playing(knightslidesnd))
			{
				fmod_event_instance_play(knightslidesnd);
			}
			fmod_event_instance_set_3d_attributes(knightslidesnd, x, y);
		}
		else if (fmod_event_instance_is_playing(knightslidesnd))
		{
			fmod_event_instance_stop(knightslidesnd, true);
		}
		var sjumpsnd = superjumpsnd;
		if (character == "Peppino")
		{
			if (state == "Sjumpprep")
			{
				if (!fmod_event_instance_is_playing(sjumpsnd))
				{
					fmod_event_instance_set_parameter(sjumpsnd, "state", 0, true);
					fmod_event_instance_play(sjumpsnd);
				}
			}
			else if (state == "Sjump")
			{
				fmod_event_instance_set_parameter(sjumpsnd, "state", 1, true);
			}
			else if (state != "Sjump")
			{
				if (fmod_event_instance_is_playing(sjumpsnd) && fmod_event_instance_get_parameter(sjumpsnd, "state") < 1)
				{
					fmod_event_instance_stop(sjumpsnd, true);
				}
				else if (!fmod_event_instance_is_playing(sjumpsnd))
				{
					fmod_event_instance_set_parameter(sjumpsnd, "state", 0, true);
				}
			}
			if (sprite_index == spr_player_Sjumpcancelstart || sprite_index == spr_playerN_sidewayspin)
			{
				fmod_event_instance_stop(sjumpsnd, true);
			}
			if (fmod_event_instance_is_playing(sjumpsnd))
			{
				fmod_event_instance_set_3d_attributes(sjumpsnd, x, y);
			}
		}
		else
		{
			fmod_event_instance_stop(sjumpsnd, true);
		}
		if (sprite_index == spr_tumblestart || sprite_index == spr_tumble)
		{
			if (!fmod_event_instance_is_playing(tumblesnd))
			{
				fmod_event_instance_play(tumblesnd);
				fmod_event_instance_set_parameter(tumblesnd, "state", 0, true);
				if (sprite_index == spr_tumblestart)
				{
					tumbleintro = true;
				}
			}
			if (sprite_index == spr_tumble && !tumbleintro)
			{
				fmod_event_instance_set_parameter(tumblesnd, "state", 1, true);
			}
			fmod_event_instance_set_3d_attributes(tumblesnd, x, y);
		}
		else
		{
			if (fmod_event_instance_is_playing(tumblesnd))
			{
				fmod_event_instance_set_parameter(tumblesnd, "state", 2, true);
				fmod_event_instance_set_3d_attributes(tumblesnd, x, y);
			}
			tumbleintro = false;
		}
		if (sprite_index == spr_machroll || sprite_index == spr_backslide || sprite_index == spr_backslideland)
		{
			if (!fmod_event_instance_is_playing(machrollsnd))
			{
				fmod_event_instance_play(machrollsnd);
			}
			fmod_event_instance_set_3d_attributes(machrollsnd, x, y);
		}
		else
		{
			fmod_event_instance_stop(machrollsnd, true);
		}
		if (fmod_event_instance_is_playing(suplexdashsnd))
		{
			if (state != "handstandjump")
			{
				fmod_event_instance_stop(suplexdashsnd, true);
			}
			fmod_event_instance_set_3d_attributes(suplexdashsnd, x, y);
		}
		if (state == "trashroll" && sprite_index == spr_playercorpsesurf && grounded && vsp > 0)
		{
			if (!fmod_event_instance_is_playing(gravecorpsesnd))
			{
				fmod_event_instance_play(gravecorpsesnd);
			}
			fmod_event_instance_set_3d_attributes(gravecorpsesnd, x + hsp, y + vsp);
		}
		else
		{
			fmod_event_instance_stop(gravecorpsesnd, true);
		}
		if ((state == "barrelslide" && grounded && vsp > 0) || sprite_index == spr_playerN_barrelclimbwall)
		{
			if (!fmod_event_instance_is_playing(barrelslidesnd))
			{
				fmod_event_instance_play(barrelslidesnd);
			}
			fmod_event_instance_set_3d_attributes(barrelslidesnd, x + hsp, y + vsp);
		}
		else
		{
			fmod_event_instance_stop(barrelslidesnd, true);
		}
		if (state == "slipnslide" && sprite_index == spr_currentplayer)
		{
			if (!fmod_event_instance_is_playing(waterslidesnd))
			{
				fmod_event_instance_play(waterslidesnd);
			}
			fmod_event_instance_set_3d_attributes(waterslidesnd, x + hsp, y + vsp);
		}
		else
		{
			fmod_event_instance_stop(waterslidesnd, true);
		}
		if (state == "stringfall")
		{
			if (!fmod_event_instance_is_playing(mrpinchsnd))
			{
				fmod_event_instance_play(mrpinchsnd);
			}
			fmod_event_instance_set_parameter(mrpinchsnd, "state", 0, true);
			fmod_event_instance_set_3d_attributes(mrpinchsnd, x + hsp, y + vsp);
		}
		else if (fmod_event_instance_is_playing(mrpinchsnd))
		{
			fmod_event_instance_set_parameter(mrpinchsnd, "state", 1, true);
			fmod_event_instance_set_3d_attributes(mrpinchsnd, x + hsp, y + vsp);
		}
		if (hamkuffID != noone && instance_exists(hamkuffID) && !launched)
		{
			if (!fmod_event_instance_is_playing(hamkuffsnd))
			{
				fmod_event_instance_play(hamkuffsnd);
			}
			if (launch)
			{
				fmod_event_instance_set_parameter(hamkuffsnd, "state", 1, true);
			}
			else
			{
				fmod_event_instance_set_parameter(hamkuffsnd, "state", 0, true);
			}
			fmod_event_instance_set_3d_attributes(hamkuffsnd, x + hsp, y + vsp);
		}
		else
		{
			if (fmod_event_instance_is_playing(hamkuffsnd))
			{
				fmod_event_instance_set_parameter(hamkuffsnd, "state", 2, true);
				fmod_event_instance_set_3d_attributes(hamkuffsnd, x + hsp, y + vsp);
			}
			hamkuffID = noone;
		}
		if ((state == "ratmount" || state == "ratmountjump") && (sprite_index == spr_player_ratmountattack || sprite_index == spr_player_ratmountmach3 || sprite_index == spr_player_ratmountdashjump || sprite_index == spr_lonegustavo_dash || sprite_index == spr_lonegustavo_mach3 || sprite_index == spr_lonegustavo_dashjump))
		{
			if (!fmod_event_instance_is_playing(ratmountmachsnd))
			{
				fmod_event_instance_play(ratmountmachsnd);
			}
			var s = 0;
			if (sprite_index == spr_player_ratmountmach3 || sprite_index == spr_lonegustavo_mach3 || sprite_index == spr_player_ratmountdashjump || sprite_index == spr_lonegustavo_dashjump)
			{
				s = 1;
			}
			fmod_event_instance_set_parameter(ratmountmachsnd, "state", s, true);
			if (grounded)
			{
				fmod_event_instance_set_parameter(ratmountmachsnd, "ground", 1, true);
			}
			else
			{
				fmod_event_instance_set_parameter(ratmountmachsnd, "ground", 0, true);
			}
			fmod_event_instance_set_3d_attributes(ratmountmachsnd, x + hsp, y + vsp);
		}
		else
		{
			fmod_event_instance_stop(ratmountmachsnd, true);
		}
		if (state == "ratmountpunch")
		{
			if (!fmod_event_instance_is_playing(ratmountpunchsnd))
			{
				fmod_event_instance_play(ratmountpunchsnd);
			}
			fmod_event_instance_set_3d_attributes(ratmountpunchsnd, x + hsp, y + vsp);
		}
		else
		{
			fmod_event_instance_stop(ratmountpunchsnd, true);
		}
		if (state == "ratmountbounce" && sprite_index == spr_player_ratmountwalljump)
		{
			if (!fmod_event_instance_is_playing(ratmountgroundpoundsnd))
			{
				fmod_event_instance_play(ratmountgroundpoundsnd);
			}
			var s = 0;
			if (instance_exists(superslameffectid))
			{
				s = 1;
			}
			fmod_event_instance_set_parameter(ratmountgroundpoundsnd, "state", s, true);
			fmod_event_instance_set_3d_attributes(ratmountgroundpoundsnd, x + hsp, y + vsp);
		}
		else
		{
			fmod_event_instance_stop(ratmountgroundpoundsnd, true);
		}
		if (state == "animatronic" && character == "Peppino")
		{
			if (!fmod_event_instance_is_playing(animatronicsnd))
			{
				fmod_event_instance_play(animatronicsnd);
			}
			fmod_event_instance_set_3d_attributes(animatronicsnd, x + hsp, y + vsp);
		}
		else
		{
			fmod_event_instance_stop(animatronicsnd, true);
		}
		if (instance_exists(obj_brickball))
		{
			if (!fmod_event_instance_is_playing(ratmountballsnd))
			{
				fmod_event_instance_play(ratmountballsnd);
			}
			fmod_event_instance_set_3d_attributes(ratmountballsnd, obj_brickball.x + obj_brickball.hsp, obj_brickball.y + obj_brickball.vsp);
		}
		else
		{
			fmod_event_instance_stop(ratmountballsnd, true);
		}
		if (instance_exists(obj_balloongrabbableeffect))
		{
			if (!fmod_event_instance_is_playing(ratdeflatesnd))
			{
				fmod_event_instance_play(ratdeflatesnd);
			}
			fmod_event_instance_set_3d_attributes(ratdeflatesnd, obj_balloongrabbableeffect.x, obj_balloongrabbableeffect.y);
		}
		else
		{
			fmod_event_instance_stop(ratdeflatesnd, true);
		}
		if (state == "cheeseball" && grounded && vsp > 0)
		{
			if (!fmod_event_instance_is_playing(cheeseballsnd))
			{
				fmod_event_instance_play(cheeseballsnd);
			}
			fmod_event_instance_set_3d_attributes(cheeseballsnd, x + hsp, y + vsp);
		}
		else
		{
			fmod_event_instance_stop(cheeseballsnd, true);
		}
		if (state == "rideweenie" && abs(hsp) > 8 && grounded)
		{
			if (!fmod_event_instance_is_playing(gallopingsnd))
			{
				fmod_event_instance_play(gallopingsnd);
			}
		}
		else if (fmod_event_instance_is_playing(gallopingsnd))
		{
			fmod_event_instance_stop(gallopingsnd, true);
		}
		if (state == "boxxedpepspin")
		{
			if (!fmod_event_instance_is_playing(boxxedspinsnd))
			{
				fmod_event_instance_play(boxxedspinsnd);
			}
			fmod_event_instance_set_3d_attributes(boxxedspinsnd, x + hsp, y + vsp);
		}
		else
		{
			fmod_event_instance_stop(boxxedspinsnd, true);
		}
		if (fmod_event_instance_is_playing(pizzapeppersnd))
		{
			if (state == "jetpackjump")
			{
				fmod_event_instance_set_parameter(pizzapeppersnd, "state", 0, true);
				fmod_event_instance_set_3d_attributes(pizzapeppersnd, x + hsp, y + vsp);
			}
			else
			{
				fmod_event_instance_set_parameter(pizzapeppersnd, "state", 1, true);
			}
		}
		if (state == "ghost" && sprite_index != spr_ghostidle && sprite_index != spr_ghostjump && (character == "Noise" || ghostdash))
		{
			if (!fmod_event_instance_is_playing(ghostspeedsnd))
			{
				fmod_event_instance_play(ghostspeedsnd);
			}
			var s = 0;
			if (ghostpepper == 1)
			{
				s = 1;
			}
			else if (ghostpepper == 2)
			{
				s = 2;
			}
			else if (ghostpepper >= 3)
			{
				s = 3;
			}
			fmod_event_instance_set_3d_attributes(ghostspeedsnd, x, y);
			fmod_event_instance_set_parameter(ghostspeedsnd, "state", s, true);
		}
		else if (fmod_event_instance_is_playing(ghostspeedsnd))
		{
			fmod_event_instance_stop(ghostspeedsnd, false);
		}
		if (character == "Noise")
		{
			if (sprite_index == spr_playerN_minigunshoot || sprite_index == spr_playerN_minigundown)
			{
				if (!fmod_event_instance_is_playing(snd_minigun))
				{
					fmod_event_instance_play(snd_minigun);
				}
				fmod_event_instance_set_3d_attributes(snd_minigun, x, y);
				fmod_event_instance_set_parameter(snd_minigun, "state", 0, true);
			}
			else if (fmod_event_instance_is_playing(snd_minigun))
			{
				fmod_event_instance_set_parameter(snd_minigun, "state", 1, true);
			}
			if (state == "ghost" || (state == "chainsaw" && tauntstoredstate == "ghost"))
			{
				var s = ghostpepper;
				if (s > 2)
				{
					s = 2;
				}
				fmod_event_instance_set_3d_attributes(snd_ghostdash, x, y);
				fmod_event_instance_set_parameter(snd_ghostdash, "state", s, true);
			}
			else
			{
				fmod_event_instance_stop(snd_ghostdash, true);
			}
			if (state == "Sjumpprep")
			{
				if (!fmod_event_instance_is_playing(snd_noiseSjump))
				{
					fmod_event_instance_play(snd_noiseSjump);
				}
			}
			else
			{
				fmod_event_instance_stop(snd_noiseSjump, true);
			}
			fmod_event_instance_set_3d_attributes(snd_noiseSjump, x, y);
			fmod_event_instance_set_3d_attributes(snd_noiseSjumprelease, x, y);
			fmod_event_instance_set_3d_attributes(snd_noisedoublejump, x, y);
			fmod_event_instance_set_3d_attributes(snd_noisepunch, x, y);
			fmod_event_instance_set_3d_attributes(snd_bossdeathN, x, y);
			if (sprite_index == spr_playerN_sidewayspin)
			{
				fmod_event_instance_stop(snd_noiseSjumprelease, true);
			}
			if (state == "mach2" || state == "mach3" || state == "climbwall")
			{
				if (!fmod_event_instance_is_playing(snd_noisemach))
				{
					fmod_event_instance_play(snd_noisemach);
				}
				var s = 0;
				if (state == "mach2" || state == "climbwall")
				{
					s = 1;
				}
				else if (state == "mach3" && sprite_index != spr_crazyrun)
				{
					s = 2;
				}
				else if (sprite_index == spr_crazyrun)
				{
					s = 3;
				}
				fmod_event_instance_set_3d_attributes(snd_noisemach, x, y);
				fmod_event_instance_set_parameter(snd_noisemach, "state", s, true);
				if (grounded || state == "climbwall")
				{
					fmod_event_instance_set_parameter(snd_noisemach, "ground", 1, true);
				}
				else
				{
					fmod_event_instance_set_parameter(snd_noisemach, "ground", 0, true);
				}
			}
			else
			{
				fmod_event_instance_stop(snd_noisemach, true);
			}
			if (state == "machcancel" || (state == "chainsaw" && tauntstoredstate == "machcancel"))
			{
				if (sprite_index != spr_playerN_divebomb && sprite_index != spr_playerN_divebombfall && sprite_index != spr_playerN_divebombland)
				{
					if (fmod_event_instance_is_playing(snd_divebomb))
					{
						fmod_event_instance_stop(snd_divebomb, true);
					}
					if (!fmod_event_instance_is_playing(snd_wallbounce) && !fmod_event_instance_get_paused(snd_wallbounce))
					{
						fmod_event_instance_play(snd_wallbounce);
					}
					if (fmod_event_instance_get_paused(snd_wallbounce))
					{
						fmod_event_instance_set_paused(snd_wallbounce, false);
					}
					fmod_event_instance_set_3d_attributes(snd_wallbounce, x, y);
				}
				else
				{
					if (fmod_event_instance_is_playing(snd_wallbounce))
					{
						fmod_event_instance_stop(snd_wallbounce, true);
					}
					if (!fmod_event_instance_is_playing(snd_divebomb))
					{
						fmod_event_instance_play(snd_divebomb);
					}
					fmod_event_instance_set_3d_attributes(snd_divebomb, x, y);
					if (!grounded)
					{
						fmod_event_instance_set_parameter(snd_divebomb, "state", 0, true);
					}
					else
					{
						fmod_event_instance_set_parameter(snd_divebomb, "state", 1, true);
					}
				}
			}
			else
			{
				if (state == "backbreaker" && tauntstoredstate == "machcancel")
				{
					fmod_event_instance_set_paused(snd_wallbounce, true);
				}
				else if (fmod_event_instance_is_playing(snd_wallbounce))
				{
					fmod_event_instance_stop(snd_wallbounce, true);
				}
				if (fmod_event_instance_is_playing(snd_divebomb))
				{
					fmod_event_instance_stop(snd_divebomb, true);
				}
			}
			if (state == "firemouth" && sprite_index == spr_playerN_firemouthspin)
			{
				if (!fmod_event_instance_is_playing(snd_noisefiremouth))
				{
					fmod_event_instance_play(snd_noisefiremouth);
				}
				fmod_event_instance_set_3d_attributes(snd_noisefiremouth, x, y);
			}
			else if (fmod_event_instance_is_playing(snd_noisefiremouth))
			{
				fmod_event_instance_stop(snd_noisefiremouth, false);
			}
			if (sprite_index == spr_playerN_rushdown)
			{
				if (!fmod_event_instance_is_playing(snd_rushdown))
				{
					fmod_event_instance_play(snd_rushdown);
				}
				fmod_event_instance_set_3d_attributes(snd_rushdown, x, y);
			}
			else
			{
				fmod_event_instance_stop(snd_rushdown, true);
			}
			if (state == "boxxedpepjump")
			{
				if (sprite_index == spr_playerN_boxxedjetpack && !fmod_event_instance_is_playing(snd_minijetpack))
				{
					fmod_event_instance_play(snd_minijetpack);
				}
				fmod_event_instance_set_3d_attributes(snd_minijetpack, x, y);
				if (sprite_index == spr_playerN_boxxedjetpack)
				{
					fmod_event_instance_set_parameter(snd_minijetpack, "state", 0, true);
				}
				else
				{
					fmod_event_instance_set_parameter(snd_minijetpack, "state", 1, true);
				}
			}
			else if (fmod_event_instance_is_playing(snd_minijetpack))
			{
				fmod_event_instance_set_parameter(snd_minijetpack, "state", 1, true);
			}
			if ((sprite_index == spr_playerN_sidewayspin || sprite_index == spr_playerN_sidewayspinend) && (state == "mach2" || state == "mach3" || ((tauntstoredstate == "mach2" || tauntstoredstate == "mach3") && state == "chainsaw")))
			{
				if (!fmod_event_instance_is_playing(snd_airspin))
				{
					fmod_event_instance_play(snd_airspin);
				}
				fmod_event_instance_set_3d_attributes(snd_airspin, x, y);
			}
			else if (fmod_event_instance_is_playing(snd_airspin))
			{
				if (sprite_index == spr_mach || sprite_index == spr_mach4 || sprite_index == spr_crazyrun)
				{
					fmod_event_one_shot_3d("event:/sfx/playerN/wallbounceland", x, y);
				}
				fmod_event_instance_stop(snd_airspin, true);
			}
		}
		else
		{
			fmod_event_instance_stop(snd_divebomb, true);
			if (fmod_event_instance_get_paused(snd_wallbounce))
			{
				fmod_event_instance_set_paused(snd_wallbounce, false);
			}
			fmod_event_instance_stop(snd_wallbounce, true);
			fmod_event_instance_stop(snd_noisemach, true);
			fmod_event_instance_stop(snd_noiseSjump, true);
			fmod_event_instance_stop(snd_minigun, true);
			fmod_event_instance_stop(snd_noisefiremouth, true);
			fmod_event_instance_stop(snd_airspin, true);
			fmod_event_instance_stop(snd_minijetpack, true);
		}
	}
	if (instance_exists(obj_noiseanimatroniceffect) && (!instance_exists(obj_jumpscare) || obj_jumpscare.sprite_index == spr_tvstatic))
	{
		if (!fmod_event_instance_is_playing(snd_noiseanimatronic))
		{
			fmod_event_instance_play(snd_noiseanimatronic);
		}
		fmod_event_instance_set_3d_attributes(snd_noiseanimatronic, obj_noiseanimatroniceffect.x, obj_noiseanimatroniceffect.ystart);
	}
	else if (state == "animatronic" && !instance_exists(obj_noiseanimatroniceffect) && (!instance_exists(obj_jumpscare) || obj_jumpscare.sprite_index == spr_tvstatic))
	{
		if (!fmod_event_instance_is_playing(snd_noiseanimatronic))
		{
			fmod_event_instance_play(snd_noiseanimatronic);
		}
		fmod_event_instance_set_3d_attributes(snd_noiseanimatronic, x, y);
	}
	else if (instance_exists(obj_noiseboss))
	{
		if (obj_noiseboss.sprite_index == spr_doise_deadair || obj_noiseboss.sprite_index == spr_playerN_animatronic)
		{
			if (!fmod_event_instance_is_playing(snd_noiseanimatronic))
			{
				fmod_event_instance_play(snd_noiseanimatronic);
			}
			fmod_event_instance_set_3d_attributes(snd_noiseanimatronic, obj_noiseboss.x, obj_noiseboss.y);
		}
		else
		{
			fmod_event_instance_stop(snd_noiseanimatronic, true);
		}
	}
	else if (instance_exists(obj_doisedead))
	{
		if (!fmod_event_instance_is_playing(snd_noiseanimatronic))
		{
			fmod_event_instance_play(snd_noiseanimatronic);
		}
		fmod_event_instance_set_3d_attributes(snd_noiseanimatronic, obj_doisedead.x, obj_doisedead.y);
	}
	else
	{
		fmod_event_instance_stop(snd_noiseanimatronic, true);
	}
	if character == "Pepperman"
	{
		if (state == "Sjumpprep")
		{
			if (!fmod_event_instance_is_playing(snd_peppermanSjump))
			{
				fmod_event_instance_play(snd_peppermanSjump);
			}
		}
		else
		{
			fmod_event_instance_stop(snd_peppermanSjump, true);
		}
		if (state == "Sjump")
		{
			fmod_event_instance_play(snd_peppermanSjumprelease);
		}
		else
		{
			fmod_event_instance_stop(snd_peppermanSjump, true);
		}
		if (state == "mach2" || state == "mach3" || state == "climbwall")
		{
			if (!fmod_event_instance_is_playing(snd_peppermanmach))
			{
				fmod_event_instance_play(snd_peppermanmach);
			}
			var s = 0;
			if (state == "mach2" || state == "climbwall")
			{
				s = 1;
			}
			else if (state == "mach3" && sprite_index != spr_crazyrun)
			{
				s = 2;
			}
			else if (sprite_index == spr_crazyrun)
			{
				s = 3;
			}
			fmod_event_instance_set_3d_attributes(snd_peppermanmach, x, y);
			fmod_event_instance_set_parameter(snd_peppermanmach, "state", s, true);
			if (grounded || state == "climbwall")
			{
				fmod_event_instance_set_parameter(snd_peppermanmach, "ground", 1, true);
			}
			else
			{
				fmod_event_instance_set_parameter(snd_peppermanmach, "ground", 0, true);
			}
		}
		else
		{
			fmod_event_instance_stop(snd_peppermanmach, true);
		}
	}
}
