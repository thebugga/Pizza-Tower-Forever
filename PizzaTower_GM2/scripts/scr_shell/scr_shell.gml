//obj_shell commands to use ingame
#region Roomnames
var i = 0;
while room_exists(i)
{
	global.roomlist[i] = room_get_name(i)
	i++
}	
#endregion	

#region Collision

function sh_toggle_collisions(args) 
{
	var arg1 = args[1]	
	switch arg1
	{
		case "true": 
		case "1":
		arg1 = true 
		break;
		case "false": 
		case "0":
		arg1 = false 
		break;
		default: 
		arg1 = !global.showcollisions
		break;		
	}	
	global.showcollisions = arg1 
	toggle_collision_function()
}
function meta_toggle_collisions() 
{
	return {
		description: "toggles collision object visibility",
		arguments: ["<bool>"],
		suggestions: [
			["true","false"]
		],
		argumentDescriptions: [
			"toggles visibility"
		]
	}
}
function toggle_collision_function()
{
	if !variable_global_exists("showcollisionarray")
	{	
		var i = 0;
	    global.showcollisionarray[i++] = obj_solid    
	    global.showcollisionarray[i++] = obj_slope    
	    global.showcollisionarray[i++] = obj_platform    
	    global.showcollisionarray[i++] = obj_platform_slope    
	    global.showcollisionarray[i++] = obj_ladder
   
	    global.showcollisionarray[i++] = obj_grindrail    
	    global.showcollisionarray[i++] = obj_grindrailslope
   
	    global.showcollisionarray[i++] = obj_secretblock    
	    global.showcollisionarray[i++] = obj_secretbigblock    
	    global.showcollisionarray[i++] = obj_secretmetalblock    
	    global.showcollisionarray[i++] = obj_iceblock    
	    global.showcollisionarray[i++] = obj_iceblockslope 
	    global.showcollisionarray[i++] = obj_pineapplemonsterzone    
	    global.showcollisionarray[i++] = obj_frontcanongoblin_trigger    
	    global.showcollisionarray[i++] = obj_moving_hstop    
	    global.showcollisionarray[i++] = obj_moving_vstop
   
	    global.showcollisionarray[i++] = obj_tubeleft    
	    global.showcollisionarray[i++] = obj_tuberight    
	    global.showcollisionarray[i++] = obj_tubedown    
	    global.showcollisionarray[i++] = obj_tubeup    
	    global.showcollisionarray[i++] = obj_horseyleft    
	    global.showcollisionarray[i++] = obj_horseyright    
	    global.showcollisionarray[i++] = obj_horseydown    
	    global.showcollisionarray[i++] = obj_horseyup    
	    global.showcollisionarray[i++] = obj_lightsource     
	    global.showcollisionarray[i++] = obj_vigilantespot    
	    global.showcollisionarray[i++] = obj_fakepepsolid    
	    //global.showcollisionarray[i++] = obj_tutorialtrap    
	    global.showcollisionarray[i++] = obj_conveyordespawner
	    global.showcollisionarray[i++] = obj_hallway    
	    global.showcollisionarray[i++] = obj_verticalhallway    
	    global.showcollisionarray[i++] = obj_doorA    
	    global.showcollisionarray[i++] = obj_doorB    
	    global.showcollisionarray[i++] = obj_doorC    
	    global.showcollisionarray[i++] = obj_doorD    
	    global.showcollisionarray[i++] = obj_doorE    
	    global.showcollisionarray[i++] = obj_doorF    
	    global.showcollisionarray[i++] = obj_doorG
	}
	var array  = global.showcollisionarray
	var length = array_length(array)
	//Start from the end to the start (more optimized)

	for (var i = length - 1; i >= 0; --i)
	{
		with array[i]
		{
			if (object_index == array[i])
				visible = global.showcollisions
		}
	}
	layer_set_visible("Tiles_Solid",global.showcollisions);	
}
#endregion

#region Hitboxes

function sh_toggle_hitboxes(args) 
{
	var arg1 = args[1]	
	switch arg1
	{
		case "true": 
		case "1":
		arg1 = true 
		break;
		case "false": 
		case "0":
		arg1 = false 
		break;
		default: 
		arg1 = !global.showhitboxes
		break;		
	}	
	global.showhitboxes = arg1 
	toggle_hitboxes_function()
}
function meta_toggle_hitboxes() 
{
	return {
		description: "toggles hitbox object visibility",
		arguments: ["<bool>"],
		suggestions: [
			["true","false"]
		],
		argumentDescriptions: [
			"toggles visibility for hitboxes"
		]
	}
}
function toggle_hitboxes_function()
{
	if !variable_global_exists("showcollisionarray")
	{	
		var i = 0;
		global.showhitboxesarray[i++] = obj_slaphitbox;
		global.showhitboxesarray[i++] = obj_bosshitbox;
		global.showhitboxesarray[i++] = obj_chargeenemyhitbox;
		global.showhitboxesarray[i++] = obj_lungehitbox;
		global.showhitboxesarray[i++] = obj_swordhitbox;
		global.showhitboxesarray[i++] = obj_swingdinghitbox;
		global.showhitboxesarray[i++] = obj_morthitbox;
		global.showhitboxesarray[i++] = obj_pepgoblin_kickhitbox;
		global.showhitboxesarray[i++] = obj_minijohn_hitbox;
		global.showhitboxesarray[i++] = obj_parryhitbox;
		global.showhitboxesarray[i++] = obj_pineahitbox;
		global.showhitboxesarray[i++] = obj_forkhitbox;
		global.showhitboxesarray[i++] = obj_peasantohitbox;
	}
	var array  = global.showhitboxesarray
	var length = array_length(array)
	//Start from the end to the start (more optimized)

	for (var i = length - 1; i >= 0; --i)
	{
		with array[i]
		{
			if (object_index == array[i])
				visible = global.showhitboxes
		}
	}
}
#endregion

#region Panic
	function sh_panic(args)
	{
	    if (array_length(args) > 1)
	    {
	        global.panic = bool(args[1]);
	        args[2] = real(args[2]) * 60 * 12;
	        args[3] = real(args[3]) * 12;
	        global.fill = args[2] + args[3];
        
	        if (global.panic)
			{
	            obj_camera.alarm[1] = 60;
				obj_tv.chunkmax = global.fill;
			}
	    }
	    else
	    {
	        global.panic = !global.panic;
	        global.fill = 4000;
        
	        if (global.panic)
			{
	            obj_camera.alarm[1] = 60;
				obj_tv.chunkmax = global.fill;
			}
	    }
	}

	function meta_panic()
	{
	    return 
	    {
	        description: "Sets Pizza Time",
	        arguments: ["<bool>", "<minutes>", "<seconds>"],
	        suggestions: [["true", "false"], [], []]
	    };
	}
#endregion

#region Room Goto
	///commands[arrayi++] = "room_goto [roomname] [targetdoor]"
	function sh_room_goto(args) 
	{
		var arg1 = asset_get_index(args[1]), arg2 = args[2]	
		//Error Check 
		if asset_get_type(args[1]) != asset_room { return "Can't find room " + string(args[1]); } //Shamelessy took this from Ethgaming
		//Go to Room
		if asset_get_type(args[1]) = asset_room
		{
			obj_player1.targetRoom = arg1
			obj_player2.targetRoom = arg1
			obj_player1.targetDoor = arg2
			obj_player2.targetDoor = arg2
			instance_create(0, 0, obj_fadeout) 			
		}
	}
	function meta_room_goto() 
	{	
		return {
			description: "allows you to go to another room",
			arguments: ["<room>","<door>"],
			suggestions: [
				global.roomlist,
				["N/A","A","B","C","D","E","F","G","H","I","J","K","start"]
			],
			argumentDescriptions: [
				"sets targetRoom",
				"sets targetDoor"
			]
		}
	}	


	#endregion
	
	
#region Noclip
	///commands[arrayi++] = "room_goto [roomname] [targetdoor]"
	function sh_noclip() 
	{
		obj_player1.state = states.debugstate
	}
	function meta_noclip() 
	{	
		return {
			description: "Noclip",
			arguments: [],
			suggestions: [
			],
			argumentDescriptions: [
			]
		}
	}	


	#endregion
	
	
#region Switch Char
	function sh_switch_char(args) 
	{
		var _char_enum = characters.Peppino
		switch (args[1])
		{
			case "PEPPINO":
				_char_enum = characters.Peppino
			break;
			case "THE_NOISE":
				_char_enum = characters.Noise
			break;
			case "PEPPERMAN":
				_char_enum = characters.Pepperman
			break;
			//case "THE_VIGILANTE":
			//	_char_enum = characters.Vigilante
			//break;
			//case "THE_DOISE":
			//	_char_enum = characters.Doise
			//break;
			//case "SHOBON":
			//	_char_enum = characters.Shobon
			//break;
		}
		with (obj_player1)
		{
			character = _char_enum;
			scr_characterspr();
		}
	}
	function meta_switch_char() 
	{	
		return {
			description: "switch_char",
			arguments: ["<character>"],
			suggestions: [
				["PEPPINO", "THE_NOISE", "PEPPERMAN",/* "THE_VIGILANTE", "THE_DOISE", "SHOBON"*/]
			],
			argumentDescriptions: [
			]
		}
	}	
#endregion

	
#region Switch Char
	function sh_editor(args) 
	{
		with (obj_player)
		{
			targetRoom = rm_editor;
			targetDoor = "A";
		}
		instance_create_unique(0, 0, obj_fadeout);
	}
	function meta_editor() 
	{	
		return {
			description: "editor",
			arguments: ["<bool>"],
			suggestions: [
			],
			argumentDescriptions: [
			]
		}
	}	
#endregion