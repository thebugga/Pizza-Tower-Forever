function scr_collide_destructibles()
{
	with (obj_player)
	{
		if ((state == "jump" && sprite_index == spr_playerN_noisebombspinjump) || (ghostdash && sprite_index != spr_ghostidle) || state == "machcancel" || state == "slipbanan" || state == "rideweenie" || state == "trickjump" || state == "ratmountbounce" || state == "noisecrusher" || (state == "pogo" && pogochargeactive == true))
		{
			var arr = [[xscale, 0], [hsp + xscale, 0], [0, vsp + 1], [0, vsp - 1], [0, 1], [0, -1]];
			for (var i = 0; i < array_length(arr); i++)
			{
				var b = arr[i];
				if (place_meeting(x + b[0], y + b[1], obj_destructibles))
				{
					num = instance_place_list(x + b[0], y + b[1], obj_destructibles, global.instancelist, false);
					for (var j = 0; j < num; j++)
					{
						var inst = ds_list_find_value(global.instancelist, j);
						if (inst != noone && inst != -1 && inst != undefined)
						{
							with (inst)
							{
								GamepadSetVibration(0, 0.8, 0.8, 0.5);
								instance_destroy();
							}
						}
					}
					ds_list_clear(global.instancelist);
				}
			}
		}
		if (state == "trashroll" || state == states.unknown301 || state == "boxxedpepspin" || ratmount_movespeed >= 12 || state == "ratmountpunch" || state == "ratmounttumble" || state == "punch" || state == "handstandjump" || state == "ratmountattack" || state == "lungeattack" || state == "cheeseball" || state == "bombpepside" || state == "rocket" || state == "shotgundash" || state == "faceplant" || state == "slipnslide" || state == "tacklecharge" || sprite_index == spr_barrelroll || sprite_index == spr_barrelslipnslide || state == "chainsawbump" || state == "mach3" || state == "machcancel" || state == "knightpep" || (state == "boxxedpepjump" && boxxeddash) || (state == "boxxedpep" && boxxeddash) || state == "machroll" || state == "knightpepslopes" || state == "knightpepattack" || state == "tumble" || state == "machcancel" || state == "hookshot" || state == "shoulderbash")
		{
			if (place_meeting(x + hsp, y, obj_destructibles))
			{
				if (character != "V")
				{
					with (instance_place(x + hsp, y, obj_destructibles))
					{
						GamepadSetVibration(0, 0.8, 0.8, 0.5);
						instance_destroy();
					}
					if (state == "mach2")
					{
						machpunchAnim = true;
					}
				}
			}
		}
		if (state == "hurt" && thrown == true)
		{
			if (place_meeting(x - hsp, y, obj_destructibles))
			{
				with (instance_place(x - hsp, y, obj_destructibles))
				{
					GamepadSetVibration(0, 0.8, 0.8, 0.5);
					instance_destroy();
				}
			}
		}
		if ((state == "knightpep" || sprite_index == spr_lonegustavo_groundpoundstart || state == "ratmountbounce" || state == "machcancel" || sprite_index == spr_lonegustavo_groundpound || state == "jetpackjump" || state == "firemouth" || state == "slipbanan" || state == "superslam" || state == "hookshot" || (state == "bombpepup" && bombup_dir == 1)) && vsp > 0)
		{
			var vy = 1;
			if (state == "ratmountbounce" || sprite_index == spr_lonegustavo_groundpoundstart || sprite_index == spr_lonegustavo_groundpound)
			{
				vy = vsp;
			}
			if (place_meeting(x, y + vy, obj_destructibles))
			{
				num = instance_place_list(x, y + vy, obj_destructibles, global.instancelist, false);
				for (var i = 0; i < num; i++)
				{
					with (ds_list_find_value(global.instancelist, i))
					{
						GamepadSetVibration(0, 0.8, 0.8, 0.5);
						instance_destroy();
					}
				}
				ds_list_clear(global.instancelist);
				if (state == "firemouth" || state == "jetpackjump")
				{
					with (instance_place(x, y + vy, obj_tntblock))
					{
						GamepadSetVibration(0, 0.8, 0.8, 0.5);
						instance_destroy();
					}
					if (vsp > -11)
					{
						vsp = -11;
					}
					jumpstop = false;
				}
			}
		}
		if (state == "firemouth")
		{
			with (instance_place(x + xscale, y, obj_tntblock))
			{
				instance_destroy();
				if (other.vsp > -11)
				{
					other.vsp = -11;
				}
				jumpstop = false;
			}
			with (instance_place(x, y + vsp, obj_tntblock))
			{
				instance_destroy();
				if (other.vsp > -11)
				{
					other.vsp = -11;
				}
				jumpstop = false;
			}
			with (instance_place(x, y + 1, obj_tntblock))
			{
				instance_destroy();
				if (other.vsp > -11)
				{
					other.vsp = -11;
				}
				jumpstop = false;
			}
			with (instance_place(x, y - 1, obj_tntblock))
			{
				instance_destroy();
				if (other.vsp > -11)
				{
					other.vsp = -11;
				}
				jumpstop = false;
			}
		}
		var num = instance_place_list(x, y + 1, obj_destructibleplatform, global.instancelist, false);
		for (var k = 0; k < num; k++)
		{
			with (ds_list_find_value(global.instancelist, k))
			{
				if (!falling)
				{
					notification_push(notifications.cheeseblock_destroyed, [room]);
				}
				falling = true;
				if (falling == true)
				{
					image_speed = 0.35;
				}
			}
		}
		ds_list_clear(global.instancelist);
		if (vsp <= 0.5 && (state == "jump" || state == "machcancel" || state == states.unknown300 || state == "ratmountjump" || state == states.unknown301 || state == "mach3" || state == "machcancel" || state == "mach2" || state == "antigrav" || state == "pogo" || (state == "bombpepup" && bombup_dir == -1) || state == "punch" || state == "climbwall" || state == "fireass" || state == "Sjump" || state == states.unknown302 || state == "cheeseballclimbwall" || state == "mach3" || state == "machcancel" || (state == "punch" && (sprite_index == spr_breakdanceuppercut || sprite_index == spr_breakdanceuppercutend))))
		{
			var vy = -1;
			if (state == "punch" && (sprite_index == spr_breakdanceuppercut || sprite_index == spr_breakdanceuppercutend))
			{
				vy = vsp;
				var i = 0;
				repeat (abs(vsp + 50))
				{
					instance_destroy(instance_place(x, y + i, obj_destructibles));
					i--;
				}
			}
			if (place_meeting(x, y + vy, obj_destructibles))
			{
				with (instance_place(x, y + vy, obj_destructibles))
				{
					GamepadSetVibration(0, 0.6, 0.6, 0.5);
					instance_destroy();
					with (other)
					{
						if (state != states.unknown302 && state != states.unknown301 && state != "Sjump" && state != "punch" && state != "climbwall")
						{
							vsp = 0;
						}
						if (state == "Sjump")
						{
							vsp = -11;
						}
					}
				}
			}
		}
		if (vsp >= 0 && (state == "freefall" || state == "superslam" || state == "freefallland" || state == "ratmountgroundpound" || (state == "ratmountbounce" && vsp >= 0) || (state == "slipbanan" && vsp >= 10)))
		{
			if (place_meeting(x, y + vsp + 2, obj_destructibles))
			{
				num = instance_place_list(x, y + vsp + 2, obj_destructibles, global.instancelist, false);
				for (var j = 0; j < num; j++)
				{
					instance_destroy(ds_list_find_value(global.instancelist, j));
				}
				ds_list_clear(global.instancelist);
			}
		}
		if (state == "freefall" || state == "superslam" || state == "freefallland" || state == "slipbanan" || (state == "ratmountbounce" && vsp > 0))
		{
			var vy = 1;
			if (state == "ratmountbounce")
			{
				vy = vsp + 4;
			}
			if (place_meeting(x, y + vy, obj_metalblock) && (freefallsmash >= 10 || state == "slipbanan" || state == "ratmountbounce"))
			{
				with (instance_place(x, y + vy, obj_metalblock))
				{
					instance_destroy();
				}
			}
		}
		if (state == "crouchslide" || state == "machroll" || state == "mach2" || state == "punch")
		{
			with (instance_place(x + hsp, y, obj_destructibles))
			{
				var _destroyed = false;
				with (other)
				{
					if (place_meeting(x + hsp, y, obj_bigdestructibles) && state != "crouchslide" && state != "mach2" && state != "machroll")
					{
						instance_destroy(other);
						_destroyed = true;
					}
					else if (other.object_index != obj_bigdestructibles)
					{
						instance_destroy(other);
						_destroyed = true;
					}
					if (_destroyed && state == "lungeattack")
					{
						hit_connected = true;
					}
				}
			}
		}
	}
}
