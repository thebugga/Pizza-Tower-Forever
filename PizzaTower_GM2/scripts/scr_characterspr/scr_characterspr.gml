enum characters
{
	Peppino,
	Noise,
	Doise,
	Pepperman,
	Vigilante,
	Shobon
};

//peppino, noise, doise, i think u get it 
global.charPrefix = ["", "N", "D", "PM", "V", "S"];

function scr_getchar_sprite(_sprite, _char = character, _prefix = "spr_player")
{
	var _spr = sprite_get_name(_sprite);
	
	_spr = string_delete(_spr, 0, string_length(_prefix) + 1);
	
	if _char == characters.Doise
	{
		if !sprite_exists(asset_get_index(_spr)) && _spr != "idle"
			_spr = concat(_prefix, "N_", _spr);
		else
			_spr = concat(_prefix, "D_", _spr);
	}
	else
	{
		_spr = concat(_prefix, global.charPrefix[_char], "_", _spr);
	}
	
	// mods obv unfished so like 
	//if (!sprite_exists(asset_get_index(_spr)))
	//	show_message(_spr);
	
	_spr = asset_get_index(_spr);
	
	if _char != characters.Doise
		return sprite_exists(_spr) ? _spr : _sprite;
	else
		return _spr;
}

function scr_characterspr()
{
	spr_idle = scr_getchar_sprite(spr_player_idle);
	spr_move = scr_getchar_sprite(spr_player_move);
	spr_crawl = scr_getchar_sprite(spr_player_crawl);
	spr_breakdancesuper = scr_getchar_sprite(spr_player_crouchslip);
	spr_hurt = scr_getchar_sprite(spr_player_hurt);
	spr_jump = scr_getchar_sprite(spr_player_jump);
	spr_jump2 = scr_getchar_sprite(spr_player_jump2);
	spr_fall = scr_getchar_sprite(spr_player_fall);
	spr_crouch = scr_getchar_sprite(spr_player_crouch);
	spr_crouchjump = scr_getchar_sprite(spr_player_crouchjump);
	spr_crouchfall = scr_getchar_sprite(spr_player_crouchfall);
	spr_crouchstart = scr_getchar_sprite(spr_player_crouchstart);
	spr_bump = scr_getchar_sprite(spr_player_bump);
	spr_land = scr_getchar_sprite(spr_player_land);
	spr_land2 = scr_getchar_sprite(spr_player_land2);
	spr_lookdoor = scr_getchar_sprite(spr_player_lookdoor);
	spr_walkfront = scr_getchar_sprite(spr_player_walkfront);
	spr_victory = scr_getchar_sprite(spr_player_victory);
	spr_Ladder = scr_getchar_sprite(spr_player_ladder);
	spr_laddermove = scr_getchar_sprite(spr_player_laddermove);
	spr_ladderdown = scr_getchar_sprite(spr_player_ladderdown);
	spr_keyget = scr_getchar_sprite(spr_player_keyget);
	spr_crouchslip = scr_getchar_sprite(spr_player_crouchslip);
	spr_pistolshot = scr_getchar_sprite(spr_player_pistolshot);
	spr_pistolwalk = scr_getchar_sprite(spr_player_pistolwalk);
	spr_longjump = scr_getchar_sprite(spr_player_longjump);
	spr_longjumpend = scr_getchar_sprite(spr_player_longjumpend);
	spr_breakdance = scr_getchar_sprite(spr_player_breakdance);
	spr_machslideboostfall = scr_getchar_sprite(spr_player_machslideboostfall);
	spr_mach3boostfall = scr_getchar_sprite(spr_player_machslideboost3fall);
	spr_mrpinch = scr_getchar_sprite(spr_player_mrpinch);
	spr_rampjump = scr_getchar_sprite(spr_player_rampjump);
	spr_mach1 = scr_getchar_sprite(spr_player_mach1);
	spr_mach = scr_getchar_sprite(spr_player_mach);
	spr_secondjump1 = scr_getchar_sprite(spr_player_secondjump1);
	spr_secondjump2 = scr_getchar_sprite(spr_player_secondjump2);
	spr_machslidestart = scr_getchar_sprite(spr_player_machslidestart);
	spr_machslide = scr_getchar_sprite(spr_player_machslide);
	spr_machslideend = scr_getchar_sprite(spr_player_machslideend);
	spr_machslideboost = scr_getchar_sprite(spr_player_machslideboost);
	spr_catched = scr_getchar_sprite(spr_player_catched);
	spr_land2 = scr_getchar_sprite(spr_player_land2);
	spr_punch = scr_getchar_sprite(spr_player_punch);
	spr_shoulder = scr_getchar_sprite(spr_player_shoulder);
	spr_uppunch = scr_getchar_sprite(spr_player_uppunch);
	spr_stomp = scr_getchar_sprite(spr_player_stomp);
	spr_stompprep = scr_getchar_sprite(spr_player_stompprep);
	spr_crouch = scr_getchar_sprite(spr_player_crouch);
	spr_bump = scr_getchar_sprite(spr_player_bump);
	spr_victory = scr_getchar_sprite(spr_player_victory);
	spr_hurt = scr_getchar_sprite(spr_player_hurt);
	spr_climbwall = scr_getchar_sprite(spr_player_climbwall);
	spr_mach2jump = scr_getchar_sprite(spr_player_mach2jump);
	spr_Timesup = scr_getchar_sprite(spr_player_timesup);
	spr_deathend = scr_getchar_sprite(spr_player_deathend);
	spr_hurtjump = scr_getchar_sprite(spr_player_jumphurt);
	spr_entergate = scr_getchar_sprite(spr_player_entergate);
	spr_gottreasure = scr_getchar_sprite(spr_player_gottreasure);
	spr_hurtidle = scr_getchar_sprite(spr_player_hurtidle);
	spr_hurtwalk = scr_getchar_sprite(spr_player_hurtwalk);
	spr_suplexmash1 = scr_getchar_sprite(spr_player_suplexmash1);
	spr_suplexmash2 = scr_getchar_sprite(spr_player_suplexmash2);
	spr_suplexmash3 = scr_getchar_sprite(spr_player_suplexmash3);
	spr_suplexmash4 = scr_getchar_sprite(spr_player_suplexmash4);
	spr_tackle = scr_getchar_sprite(spr_player_tackle);
	spr_airdash1 = scr_getchar_sprite(spr_player_airdash1);
	spr_airdash2 = scr_getchar_sprite(spr_player_airdash2);
	spr_keyget = scr_getchar_sprite(spr_player_keyget);
	spr_idle1 = scr_getchar_sprite(spr_player_idle1);
	spr_idle2 = scr_getchar_sprite(spr_player_idle2);
	spr_idle3 = scr_getchar_sprite(spr_player_idle3);
	spr_idle4 = scr_getchar_sprite(spr_player_idle4);
	spr_idle5 = scr_getchar_sprite(spr_player_idle5);
	spr_idle6 = scr_getchar_sprite(spr_player_idle6);
	spr_wallsplat = scr_getchar_sprite(spr_player_wallsplat);
	spr_piledriver = scr_getchar_sprite(spr_player_piledriver);
	spr_piledriverland = scr_getchar_sprite(spr_player_piledriverland);
	spr_mach3jump = scr_getchar_sprite(spr_player_mach3jump);
	spr_mach4 = scr_getchar_sprite(spr_player_mach4);
	spr_machclimbwall = scr_getchar_sprite(spr_player_climbwall);
	spr_dive = scr_getchar_sprite(spr_player_dive);
	spr_machroll = scr_getchar_sprite(spr_player_machroll);
	spr_hitwall = scr_getchar_sprite(spr_player_mach3hitwall);
	spr_superjumpland = scr_getchar_sprite(spr_player_superjumpland);
	spr_walljumpstart = scr_getchar_sprite(spr_player_walljumpstart);
	spr_superjumpprep = scr_getchar_sprite(spr_player_superjumpprep);
	spr_superjump = scr_getchar_sprite(spr_player_superjump);
	spr_superjumppreplight = scr_getchar_sprite(spr_player_superjumppreplight);
	spr_superjumpright = scr_getchar_sprite(spr_player_superjumpright);
	spr_superjumpleft = scr_getchar_sprite(spr_player_superjumpleft);
	spr_machfreefall = scr_getchar_sprite(spr_player_machfreefall);
	spr_mach3hit = scr_getchar_sprite(spr_player_mach3hit);
	spr_knightpepwalk = scr_getchar_sprite(spr_knightpep_walk);
	spr_knightpepjump = scr_getchar_sprite(spr_knightpep_jump);
	spr_knightpepfall = scr_getchar_sprite(spr_knightpep_fall);
	spr_knightpepidle = scr_getchar_sprite(spr_knightpep_idle);
	spr_knightpepjumpstart = scr_getchar_sprite(spr_knightpep_jumpstart);
	spr_knightpepthunder = scr_getchar_sprite(spr_knightpep_thunder);
	spr_knightpepland = scr_getchar_sprite(spr_knightpep_land);
	spr_knightpepdownslope = scr_getchar_sprite(spr_knightpep_downslope);
	spr_knightpepstart = scr_getchar_sprite(spr_knightpep_start);
	spr_knightpepcharge = scr_getchar_sprite(spr_knightpep_charge);
	spr_knightpepdoublejump = scr_getchar_sprite(spr_knightpep_doublejump);
	spr_knightpepfly = scr_getchar_sprite(spr_knightpep_fly);
	spr_knightpepdowntrust = scr_getchar_sprite(spr_knightpep_downtrust);
	spr_knightpepupslope = scr_getchar_sprite(spr_knightpep_upslope);
	spr_knightpepbump = scr_getchar_sprite(spr_knightpep_bump);
	spr_bodyslamstart = scr_getchar_sprite(spr_player_bodyslamstart);
	spr_bodyslamfall = scr_getchar_sprite(spr_player_bodyslamfall);
	spr_bodyslamland = scr_getchar_sprite(spr_player_bodyslamland);
	spr_crazyrun = scr_getchar_sprite(spr_player_crazyrun);
	spr_bombpepend = scr_getchar_sprite(spr_bombpep_end);
	spr_jetpackstart2 = scr_getchar_sprite(spr_player_jetpackstart2);
	spr_fireass = scr_getchar_sprite(spr_player_fireass);
	spr_fireassground = scr_getchar_sprite(spr_player_fireassground);
	spr_tumblestart = scr_getchar_sprite(spr_player_tumblestart);
	spr_tumbleend = scr_getchar_sprite(spr_player_tumbleend);
	spr_tumble = scr_getchar_sprite(spr_player_tumble);
	spr_stunned = scr_getchar_sprite(spr_player_stunned);
	spr_clown = scr_getchar_sprite(spr_player_clown);
	spr_clownbump = scr_getchar_sprite(spr_player_clownbump);
	spr_clownfall = scr_getchar_sprite(spr_player_clownjump);
	spr_clownjump = scr_getchar_sprite(spr_player_clownjump);
	spr_clownwallclimb = scr_getchar_sprite(spr_player_clownwallclimb);
	spr_downpizzabox = scr_getchar_sprite(spr_player_downpizzabox);
	spr_uppizzabox = scr_getchar_sprite(spr_player_uppizzabox);
	spr_slipnslide = scr_getchar_sprite(spr_player_slipnslide);
	spr_mach3boost = scr_getchar_sprite(spr_player_machslideboost3);
	spr_facehurtup = scr_getchar_sprite(spr_player_facehurtup);
	spr_facehurt = scr_getchar_sprite(spr_player_facehurt);
	spr_walljumpend = scr_getchar_sprite(spr_player_walljumpend);
	spr_suplexdash = scr_getchar_sprite(spr_player_suplexdash);
	spr_suplexdashjumpstart = scr_getchar_sprite(spr_player_suplexgrabjumpstart);
	spr_suplexdashjump = scr_getchar_sprite(spr_player_suplexgrabjump);
	spr_rollgetup = scr_getchar_sprite(spr_player_rollgetup);
	spr_swingding = scr_getchar_sprite(spr_player_swingding);
	spr_swingdingend = scr_getchar_sprite(spr_player_swingdingend);
	spr_haulingjump = scr_getchar_sprite(spr_player_haulingjump);
	spr_haulingidle = scr_getchar_sprite(spr_player_haulingidle);
	spr_haulingwalk = scr_getchar_sprite(spr_player_haulingwalk);
	spr_haulingstart = scr_getchar_sprite(spr_player_haulingstart);
	spr_haulingfall = scr_getchar_sprite(spr_player_haulingfall);
	spr_haulingland = scr_getchar_sprite(spr_player_haulingland);
	spr_uppercutfinishingblow = scr_getchar_sprite(spr_player_uppercutfinishingblow);
	spr_finishingblow1 = scr_getchar_sprite(spr_player_finishingblow1);
	spr_finishingblow2 = scr_getchar_sprite(spr_player_finishingblow2);
	spr_finishingblow3 = scr_getchar_sprite(spr_player_finishingblow3);
	spr_finishingblow4 = scr_getchar_sprite(spr_player_finishingblow4);
	spr_finishingblow5 = scr_getchar_sprite(spr_player_finishingblow5);
	spr_winding = scr_getchar_sprite(spr_player_winding);
	spr_3hpwalk = scr_getchar_sprite(spr_player_3hpwalk);
	spr_3hpidle = scr_getchar_sprite(spr_player_3hpidle);
	spr_panic = scr_getchar_sprite(spr_player_panic);
	spr_facestomp = scr_getchar_sprite(spr_player_facestomp);
	spr_freefall = scr_getchar_sprite(spr_player_freefall);
	spr_shotgunland = scr_getchar_sprite(spr_shotgun_land);
	spr_shotgunshoot = scr_getchar_sprite(spr_player_shotgun);
	spr_shotgunidle = scr_getchar_sprite(spr_shotgun_idle);
	spr_shotgunwalk = scr_getchar_sprite(spr_shotgun_walk);
	spr_shotgunfall = scr_getchar_sprite(spr_shotgun_fall);
	spr_shotgunjump = scr_getchar_sprite(spr_shotgun_jump);
	spr_shotgunjump1 = scr_getchar_sprite(spr_player_shotgunjump1);
	spr_shotgunjump2 = scr_getchar_sprite(spr_player_shotgunjump2);
	spr_shotgunjump3 = scr_getchar_sprite(spr_player_shotgunjump3);
	spr_shotgunpullout = scr_getchar_sprite(spr_shotgun_pullout);
	spr_shotgunduck = scr_getchar_sprite(spr_shotgun_duck);
	spr_shotguncrawl = scr_getchar_sprite(spr_shotgun_crawl);
	spr_shotgungoduck = scr_getchar_sprite(spr_shotgun_goduck);
	spr_fightball = scr_getchar_sprite(spr_player_fightball);
	spr_squished = scr_getchar_sprite(spr_player_squished);
	spr_supertaunt1 = scr_getchar_sprite(spr_player_supertaunt1);
	spr_supertaunt2 = scr_getchar_sprite(spr_player_supertaunt2);
	spr_supertaunt3 = scr_getchar_sprite(spr_player_supertaunt3);
	spr_supertaunt4 = scr_getchar_sprite(spr_player_supertaunt4);
	spr_taunt = scr_getchar_sprite(spr_player_taunt);
	spr_rideweenie = scr_getchar_sprite(spr_player_weeniemount);
	spr_weenieturn = scr_getchar_sprite(spr_player_weenieturn);
	spr_barrelidle = scr_getchar_sprite(spr_player_barrelidle);
	spr_barreljump = scr_getchar_sprite(spr_player_barreljump);
	spr_barrelroll = scr_getchar_sprite(spr_player_barrelroll);
	spr_barrelfall = scr_getchar_sprite(spr_player_barrelfall);
	spr_barrelslipnslide = scr_getchar_sprite(spr_player_barrelslipnslide);
	spr_barrelmove = scr_getchar_sprite(spr_player_barrelmove);
	spr_barrelland = scr_getchar_sprite(spr_player_barrelland);
	spr_dashpadmach = scr_getchar_sprite(spr_player_dashpad);
	spr_firemouthintro = scr_getchar_sprite(spr_player_firemouthintro);
	spr_firemouthend = scr_getchar_sprite(spr_player_firemouthend);
	spr_firemouth = scr_getchar_sprite(spr_player_firemouth);
	spr_firemouthspin = scr_getchar_sprite(spr_player_firemouthspin);
	spr_firemouthdash = scr_getchar_sprite(spr_player_firemouthdash);
	spr_firemouthidle = scr_getchar_sprite(spr_player_firemouthidle);
	spr_ghostdash = scr_getchar_sprite(spr_player_ghostdash);
	spr_ghostdashright = scr_getchar_sprite(spr_player_ghostdashright);
	spr_ghostdashdown = scr_getchar_sprite(spr_player_ghostdashdown);
	spr_ghostdashdownright = scr_getchar_sprite(spr_player_ghostdashdownright);
	spr_ghostdashup = scr_getchar_sprite(spr_player_ghostdashup);
	spr_ghostdashupright = scr_getchar_sprite(spr_player_ghostdashupright);
	spr_ghostidle = scr_getchar_sprite(spr_player_ghostidle);
	spr_ghostjump = scr_getchar_sprite(spr_player_ghostjump);
	spr_playercorpsestart = scr_getchar_sprite(spr_player_corpsestart);
	spr_playercorpsesurf = scr_getchar_sprite(spr_player_corpsesurf);
	spr_mortdoublejumpstart = scr_getchar_sprite(spr_player_mortdoublejump);
	spr_mortdoublejump = scr_getchar_sprite(spr_player_mortjump);
	spr_playermortidle = scr_getchar_sprite(spr_player_mortidle);
	spr_playermortjump = scr_getchar_sprite(spr_player_mortjump);
	spr_playermortjumpstart = scr_getchar_sprite(spr_player_mortjumpstart);
	spr_playermortland = scr_getchar_sprite(spr_player_mortland);
	spr_playermortwalk = scr_getchar_sprite(spr_player_mortwalk);
	spr_scaredjump1 = scr_getchar_sprite(spr_player_scaredjump1);
	spr_scaredjump2 = scr_getchar_sprite(spr_player_scaredjump2);
	spr_currentplayer = scr_getchar_sprite(spr_player_current);
	spr_golfidle = scr_getchar_sprite(spr_player_golfidle);
	spr_golfswing = scr_getchar_sprite(spr_player_golfswing);
	spr_cheeseballplayer = scr_getchar_sprite(spr_player_cheeseball);
	spr_boxxedpepintro = scr_getchar_sprite(spr_boxxedpep_intro);
	spr_boxxedpepidle = scr_getchar_sprite(spr_boxxedpep_idle);
	spr_boxxedpepwalk = scr_getchar_sprite(spr_boxxedpep_walk);
	spr_boxxedpepair = scr_getchar_sprite(spr_boxxedpep_air);
	spr_cheesepepintro = scr_getchar_sprite(spr_cheesepep_intro);
	spr_cheesepepidle = scr_getchar_sprite(spr_cheesepep_idle);
	spr_cheesepepwalk = scr_getchar_sprite(spr_cheesepep_walk);
	spr_cheesepepjump = scr_getchar_sprite(spr_cheesepep_jump);
	spr_cheesepepjumpstart = scr_getchar_sprite(spr_cheesepep_jumpstart);
	spr_cheesepepfall = scr_getchar_sprite(spr_cheesepep_fall);
	spr_cheesepepland = scr_getchar_sprite(spr_cheesepep_land);
	spr_cheesepepstickside = scr_getchar_sprite(spr_cheesepep_stickwall);
	spr_rocketstart = scr_getchar_sprite(spr_player_rocketstart);
	spr_rocket = scr_getchar_sprite(spr_player_rocket);
	spr_rockethitwall = scr_getchar_sprite(spr_player_rockethitwall);
	spr_slipbanan1 = scr_getchar_sprite(spr_player_slipbanan1);
	spr_slipbanan2 = scr_getchar_sprite(spr_player_slipbanan2);
	spr_rageidle = scr_getchar_sprite(spr_player_rageidle);
	spr_ragemove = scr_getchar_sprite(spr_player_ragemove);
	spr_parry1 = scr_getchar_sprite(spr_player_parry1);
	spr_parry2 = scr_getchar_sprite(spr_player_parry2);
	spr_parry3 = scr_getchar_sprite(spr_player_parry3);
	spr_dead = scr_getchar_sprite(spr_player_deathend);
	spr_suplexbump = scr_getchar_sprite(spr_player_suplexbump);
	spr_grind = scr_getchar_sprite(spr_player_grind);
	spr_suplexland = scr_getchar_sprite(spr_player_backflip);
	spr_superspringplayer = scr_getchar_sprite(spr_player_presentbox);
	spr_suplexcancel = scr_getchar_sprite(spr_player_suplexcancel);
	spr_backslide = scr_getchar_sprite(spr_player_backslide);
	spr_backslideland = scr_getchar_sprite(spr_player_backslideland);
	spr_breakdanceuppercut = scr_getchar_sprite(spr_player_breakdanceuppercut);
	spr_breakdanceuppercutend = scr_getchar_sprite(spr_player_breakdanceuppercutend);
	spr_groundpoundjump = scr_getchar_sprite(spr_player_groundpoundjump);
	if character == characters.Peppino
		spr_palette = spr_peppalette;
	else if character == characters.Noise
		spr_palette = spr_peppaletteN;
	else if character == characters.Doise
		spr_palette = spr_peppaletteD;
}