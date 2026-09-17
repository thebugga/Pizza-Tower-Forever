var _transfo = false;
var _state = other.state;
with (other)
{
	if (!scr_transformationcheck() && state != "comingoutdoor" && state != "door")
	{
		if (state == "ghost")
		{
			notification_push(notifications.ghost_end, [ghosttimer, room]);
		}
		if (state == "mort" || state == "mortjump" || state == "morthook" || state == "mortattack" || state == "mortjump" || state == "boxxedpep" || state == "boxxedpepjump" || state == "boxxedpepspin" || state == "ghost" || state == "barrelslide" || state == "barrel" || state == "barreljump")
		{
			if (hsp != 0)
			{
				xscale = sign(hsp);
			}
			movespeed = abs(hsp);
		}
		with (obj_mortprojectile)
		{
			create_particle(x, y, particletypes.genericpoofeffect);
			instance_destroy();
		}
		transformationsnd = false;
		state = "default";
		sprite_index = spr_idle;
		dir = xscale;
		ghostdash = false;
		ghostpepper = 0;
		_transfo = true;
		instance_create(x, y, obj_genericpoofeffect);
	}
}
if (_transfo)
{
	fmod_event_one_shot("event:/sfx/pep/pray");
	var p = other.id;
	with (instance_create(other.x - 540, camera_get_view_y(view_camera[0]) - 100, obj_priestangel))
	{
		priestID = other.id;
		playerid = p;
	}
	with (other)
	{
		if (state == "mort" || state == "morthook" || state == "mortjump" || state == "mortattack")
		{
			create_debris(x, y - 40, spr_mortdead);
		}
	}
	if (sprite_index != spr_angelpriest)
	{
		sprite_index = spr_priest_pray;
	}
	if (collect && ds_list_find_index(global.saveroom, id) == -1)
	{
		notification_push(notifications.priest_touched, [room, id, _state]);
		ds_list_add(global.saveroom, id);
		var val = 500;
		global.collect += val;
		global.combotime = 60;
		with (instance_create(x + 16, y, obj_smallnumber))
		{
			number = string(val);
		}
		scr_sound_multiple("event:/sfx/misc/collect", x, y);
		if (escape)
		{
			ds_list_add(global.escaperoom, id);
		}
		var d = round(val / 16);
		for (var i = 0; i < val; i += d)
		{
			create_collect(other.x + irandom_range(-60, 60), other.y + irandom_range(-60, 60), choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect), d);
		}
	}
}
