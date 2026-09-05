function scr_get_activemodes()
{
	var m =	[];
	for (var i = 0; i < array_length(global.modes); i++)
	{
		if (global.modes[i].enabled)
		{
			array_push(m, global.modes[i]);	
		}
	}
	
	return m;
}

function scr_get_modeindex(_mode) 
{
	for (var i = 0; i < array_length(global.modes); i++)
	{
		if (global.modes[i].name == _mode)
		{
			return i;
		}
	}
	
	return -1;
}

function scr_get_mode(_mode)
{
	return global.modes[scr_get_modeindex(_mode)]
}

function scr_get_levelshuffle()
{
	var _levels = []
	with (obj_startgate)
	{
		array_push(_levels, 
			[["entrance", entrance_1, "entrancegroup"], [0, 0, "event:/music/w1/entrancetitle"], [spr_gate_entrance, spr_gate_entranceBG,]],
			[["medieval", medieval_1, "medievalgroup"], [1, 1, "event:/music/w1/medievaltitle"], [spr_gate_medieval, spr_gate_medievalBG,]],
			[["ruin", ruin_1, "entrancegroup"], [2, 2, "event:/music/w1/ruintitle"], [spr_gate_ruin, spr_gate_ruinBG,]],
			[["dungeon", dungeon_1, "dungeongroup"], [0, 0, "event:/music/w1/dungeontitle"], [spr_gate_dungeon, spr_gate_dungeonBG,]],
			[["badland", badland_1, "badlandgroup"], [0, 0, "event:/music/w2/badlandtitle"], [spr_gate_badland, spr_gate_badlandBG,]],
			[["graveyard", graveyard_1, "graveyardgroup"], [0, 0, "event:/music/w2/graveyardtitle"], [spr_gate_graveyard, spr_gate_graveyardBG,]],
			[["farm", farm_2, "farmgroup"], [0, 0, "event:/music/w2/farmtitle"], [spr_gate_farm, spr_gate_farmBG,]],
			[["saloon", saloon_1, "saloongroup"], [0, 0, "event:/music/w2/saloontitle"], [spr_gate_saloon, spr_gate_saloonBG,]],
			[["plage", plage_entrance, "plagegroup"], [0, 0, "event:/music/w3/plagetitle"], [spr_gate_plage, spr_gate_plageBG,]],
			[["forest", forest_1, "forestgroup"], [0, 0, "event:/music/w3/foresttitle"], [spr_gate_forest, spr_gate_forestBG,]],
			[["space", space_1, "spacegroup"], [0, 0, "event:/music/w3/spacetitle"], [spr_gate_space, spr_gate_spaceBG,]],
			[["minigolf", minigolf_1, "minigolfgroup"], [0, 0, "event:/music/w3/golftitle"], [spr_gate_minigolf, spr_gate_minigolfBG,]],
			[["street", street_intro, "streetgroup"], [0, 0, "event:/music/w4/streettitle"], [spr_gate_street, spr_gate_streetBG,]],
			[["sewer", sewer_1, "sewergroup"], [0, 0, "event:/music/w4/sewertitle"], [spr_gate_sewer, spr_gate_entranceBG,]],
			[["industrial", industrial_1, "industrialgroup"], [0, 0, "event:/music/w4/industrialtitle"], [spr_gate_industrial, spr_gate_industrialBG,]],
			[["freezer", freezer_1, "freezergroup"], [0, 0, "event:/music/w4/freezertitle"], [spr_gate_freezer, spr_gate_freezerBG,]],
			//[["mansion", mansion_1, "mansiongroup"], [0, 0, "event:/music/w5/mansiontitle"], [spr_gate_mansion, spr_gate_mansionBG,]],
			[["chateau", chateau_1, "chateaugroup"], [0, 0, "event:/music/w5/chateautitle"], [spr_gate_chateau, spr_gate_chateauBG,]],
			[["kidsparty", kidsparty_1, "kidspartygroup"], [0, 0, "event:/music/w5/kidspartytitle"], [spr_gate_kidsparty, spr_gate_kidspartyBG,]],
			[["war", war_1, "wargroup"], [0, 0, "event:/music/w5/wartitle"], [spr_gate_war, spr_gate_warBG,]]);
	}
	return _levels;
}

function scr_set_levelshuffle(_levels)
{
		
	var _l = array_length(_levels)
	if (_l <= 0)
	{
		exit;	
	}
	with (obj_startgate)
	{
		var i = random(_l);
		var l = _levels[i];
		
		level = l[0, 0];
		targetRoom = l[0, 1];
		group_arr = l[0, 2];
		
		title_index = l[1, 0];
		titlecard_index = l[1, 1];
		title_music = l[1, 2];
		
		sprite_index = l[2, 0];
		bgsprite = l[2, 1];
		
		array_delete(_levels, i, 1);
		_l--;
	}
	
}