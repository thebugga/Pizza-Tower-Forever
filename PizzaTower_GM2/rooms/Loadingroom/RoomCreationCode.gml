#region macros

	#macro ANIMATION_END sprite_animation_end()
	#macro ANIMATION_END_OLD floor(image_index) == (image_number - 1)
	
#endregion

#region saves

	global.game = []
	global.currentsavefile = 1;
	var achievement_arr = ["sranks1", "sranks2", "sranks3", "sranks4", "sranks5"];
	var filenumber = 0
	var file = file_find_first(get_save_folder() + "/*", fa_directory)
	while (file != "") && string_pos(file, ".ini") > -1
	{
		filenumber++
		file = file_find_next()
	}
	file_find_close()
	for (var i = 0; i < filenumber; i++)
	{
		if file_exists(get_save_folder() + "/saveData" + string(i + 1) + ".ini")
			array_push(global.game, scr_read_game(get_save_folder() + "/saveData" + string(i + 1) + ".ini"))
	}

	
#endregion

#region init code 

	tdp_text_init();
	pal_swap_init_system(shd_pal_swapper, shd_pal_html_sprite, shd_pal_html_surface);
	get_editor_data()
	
#endregion

#region modes 

	global.coopmode = false;
	global.swapmode = false;
	
#endregion

#region globals 

	global.stickreq[0] = 100;
	global.stickreq[1] = 150;
	global.stickreq[2] = 200;
	global.stickreq[3] = 200;
	global.stickreq[4] = 210;
	global.levelattempts = 0;
	global.palette_arr = [false, false, false, false, false];
	global.newtoppin[0] = false;
	global.newtoppin[1] = false;
	global.newtoppin[2] = false;
	global.newtoppin[3] = false;
	global.newtoppin[4] = false;
	global.mach_color1 = make_colour_rgb(96, 208, 72);
	global.mach_color2 = make_colour_rgb(248, 0, 0);
	global.mach_color3 = make_colour_rgb(179, 0, 255);
	global.afterimage_color1 = make_colour_rgb(255, 0, 0);
	global.afterimage_color2 = make_colour_rgb(0, 255, 0);
	global.smallnumber_color1 = make_colour_rgb(255, 255, 255);
	global.smallnumber_color2 = make_colour_rgb(248, 0, 0);
	global.smallnumber_fnt = font_add_sprite_ext(spr_smallnumber, "1234567890-+", true, 0);
	global.pigreduction = 0;
	global.pigtotal = 0;
	global.levelcomplete = false;
	global.levelcompletename = noone;
	global.longintro = true;
	global.loadeditor = false;
	global.leveltorestart = noone;
	global.leveltosave = noone;
	global.startgate = false;
	global.exitrank = false;
	
#endregion

#region states

	enum states
	{
		normal,
		revolver,
		dynamite,
		boots,
		grabbed,
		tumble,
		finishingblow,
		ejected,
		transitioncutscene,
		fireass,
		firemouth,
		mort,
		mortjump,
		mortattack,
		morthook,
		hook,
		ghost,
		ghostpossess,
		titlescreen,
		hookshot,
		tacklecharge,
		cheeseball,
		cheeseballclimbwall,
		slap,
		cheesepep,
		cheesepepstick,
		cheesepepjump,
		cheesepepfling,
		cheesepeplaunch,
		cheesepepstickside,
		cheesepepstickup,
		rideweenie,
		motorcycle,
		boxxedpep,
		boxxedpepspin,
		boxxedpepjump,
		pistolaim,
		climbwall,
		knightpepslopes,
		portal,
		secondjump,
		chainsawbump,
		handstandjump,
		lungeattack,
		lungegrab,
		dashtumble,
		gottreasure,
		knightpep,
		knightpepattack,
		knightpepbump,
		meteorpep,
		bombpep,
		bombgrab,
		bombpepside,
		bombpepup,
		grabbing,
		chainsawpogo,
		shotgunjump,
		pogo,
		stunned,
		highjump,
		chainsaw,
		facestomp,
		mach4,
		timesup,
		machroll,
		shotgun,
		shotguncrouch,
		shotguncrouchjump,
		shotgunshoot,
		shotgundash,
		shotgunfreefall,
		pistol,
		machfreefall,
		throwing,
		slam,
		superslam,
		skateboard,
		grind,
		grab,
		punch,
		backkick,
		uppunch,
		shoulder,
		backbreaker,
		graffiti,
		bossdefeat,
		pizzathrow,
		bossintro,
		gameover,
		keyget,
		tackle,
		jump,
		ladder,
		slipnslide,
		comingoutdoor,
		smirk,
		Sjump,
		victory,
		Sjumpprep,
		crouch,
		crouchjump,
		crouchslide,
		mach1,
		mach2,
		machslide,
		bump,
		hurt,
		freefall,
		hang,
		unknown110,
		freefallland,
		door,
		barrel,
		barreljump,
		barrelclimbwall,
		barrelslide,
		current,
		boulder,
		taxi,
		runonball,
		mach3,
		freefallprep,
		Sjumpland,
		faceplant,
		rage,
		idle,
		bounce,
		charge,
		pizzagoblinthrow,
		turn,
		unknown131,
		unknown132,
		rolling,
		walk,
		fall,
		land,
		hit,
		stun,
		unknown139,
		unknown140,
		chase,
		arenaspawn,
		arenaend,
		arenaintro,
		arenaround,
		actor,
		parry,
		golf,
		float,
		tube,
		unknown151,
		taxi2,
		shoulderbash,
		pummel,
		staggered,
		thrown,
		supershoulderbash,
		superattackstart,
		superattackcharge,
		superattack,
		shoulderturn,
		fistmatch,
		fistmatchend,
		groundpunchstart,
		slipbanan,
		millionpunch,
		skateboardturn,
		bombthrow,
		bombpogo,
		jetpackstart,
		jetpack,
		jetpackstart2,
		jetpackspin,
		mrstick_shield,
		mrstick_helicopterhat,
		mrstick_panicjump,
		mrstick_smokebombstart,
		mrstick_smokebombcrawl,
		mrstick_springshoes,
		mrstick_cardboard,
		mrstick_cardboardend,
		mrstick_mockery,
		bombdelete,
		rocket,
		rocketslide,
		gotoplayer,
		trickjump,
		dance,
		underground,
		ridecow,
		ratmount,
		ratmountjump,
		ratmountattack,
		ratmountspit,
		ratmountclimbwall,
		ratmounthurt,
		ratmountgroundpound,
		ratmountbounce,
		unknown199,
		ratmountballoon,
		ratmounttumble,
		ratmountgrind,
		ratmounttrickjump,
		ratmountskid,
		ratgrabbed,
		blockstance,
		balloon,
		debugstate,
		trashstart,
		trashjump,
		trashroll,
		stringfling,
		stringjump,
		stringfall,
		noisejetpack,
		spiderweb,

		monsteridle,
		monsterintro,
		monsterwalk,
		monsterchase,
		monsterinvestigate,
		monsterrun,

		flushidle,
		flushflip,
		animatronic,

		moustache,
		mouth,
		eyes,
		nose,
		ram,
		phase2transition,
		look,
		fishing,
		unknown234,
		bombrun,
		npcthrow,
		portraitthrow,
		enguarde,
		sexypicture,
		pullinglevel,
		eat,
		surprisebox,
		spinningrun,
		spin,
		spinningpunch,
		groundpunch,
		bigkick,
		slamhead,
		slamhead2,

		whitenoise,
		expression,
		playersuperattack,
		unknown253,
		jetpackjump,
		unknown255,
		unknown256,
		bee,
		beechase,
		ratmountpunch,
		ratmountcrouch,
		ratmountladder,
		supergrab,
		unknown263,
		attract,
		antigrav,
		secret,
		contemplate,
		mini,
		reloading,
		estampede,
		dropstart,
		drop,
		phase1hurt,
		duel,
		deformed,
		grabdash,
		grabthrow,
		wait,
		flamethrower,
		machinegun,
		bazooka,
		crate,
		noisecrusher,
		droptrap,
		noiseskateboard,
		noiseballooncrash,
		swinging,
		stomp,
		finale,
		backtohub,
		ghostcaught,
		spaceshuttle,
		animation,
		pizzaheadjump,
		fightball,
		secretportal,
		teleporter,
		pizzaheadKO,
		follow,
		unknown300,
		unknown301,
		unknown302,
		unknown303,
		unknown304,
		machcancelstart,
		machcancel,
	
		gauntletportal,
	}

#endregion

#region holidays

	var date = date_current_datetime();
	var month = date_get_month(date);
	var day = date_get_day(date);

	global.holiday = holidays.normal;

	if (month == 10 || (month == 11 && day <= 14))
	{
		global.holiday = holidays.halloween;
	}

#endregion