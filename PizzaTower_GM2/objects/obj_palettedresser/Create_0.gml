depth = 100;
player_palettes = [];
player_palettes[0] = [
  ["classic", true, 1],
  ["blood", true, 6],
  ["unfunny", true, 3],
  ["money", true, 4],
  ["sage", true, 5],
  ["tv", true, 7],
  ["dark", true, 8],
  ["shitty", true, 9],
  ["golden", true, 10],
  ["garish", true, 11],
  ["mooney", true, 15],
  ["garish", true, 13],
  ["garish", true, 14],
  ["funny", true, 12, spr_peppattern1],
  ["itchy", true, 12, spr_peppattern2],
  ["pizza", true, 12, spr_peppattern3],
  ["stripes", true, 12, spr_peppattern4],
  ["goldemanne", true, 12, spr_peppattern5],
  ["bones", true, 12, spr_peppattern6],
  ["pp", true, 12, spr_peppattern7],
  ["war", true, 12, spr_peppattern8],
  ["john", true, 12, spr_peppattern9]
];
player_palettes[1] = [
  ["classicN", true, 1],
  ["boise", true, 3],
  ["roise", true, 4],
  ["poise", true, 5],
  ["reverse", true, 6],
  ["critic", true, 7],
  ["outlaw", true, 8],
  ["antidoise", true, 9],
  ["flesheater", true, 10],
  ["super", true, 11],
  ["porcupine", true, 15],
  ["feminine", true, 16],
  ["realdoise", true, 17],
  ["forest", true, 19],
  ["forest", true, 13],
  ["forest", true, 14],
  ["racer", true, 28, spr_noisepattern1],
  ["comedian", true, 27, spr_noisepattern2],
  ["banana", true, 26, spr_noisepattern3],
  ["noiseTV", true, 25, spr_noisepattern4],
  ["madman", true, 24, spr_noisepattern5],
  ["bubbly", true, 23, spr_noisepattern6],
  ["welldone", true, 22, spr_noisepattern7],
  ["grannykisses", true, 21, spr_noisepattern8],
  ["towerguy", true, 20, spr_noisepattern9]
];
ini_open_from_string(obj_savesystem.ini_str_options);
for (var i = 0; i < array_length(player_palettes); i++)
{
	array_push(player_palettes[i], ["candy", true, 12, spr_peppattern10]);
	array_push(player_palettes[i], ["bloodstained", true, 12, spr_peppattern11]);
	array_push(player_palettes[i], ["bat", true, 12, spr_peppattern12]);
	array_push(player_palettes[i], ["pumpkin", true, 12, spr_peppattern13]);
	array_push(player_palettes[i], ["fur", true, 12, spr_peppattern14]);
	array_push(player_palettes[i], ["flesh", true, 12, spr_peppattern15]);
	for (var j = 1; j < array_length(player_palettes[i]); j++)
	{
		if (ini_read_real("Palettes", player_palettes[i][j][0], true))
		{
			player_palettes[i][j][1] = true;
		}
	}
}
ini_close();
scr_create_uparrowhitbox();
paletteselect = 0;
ispeppino = -1;
showtext = false;
alpha = 0;
palettetitle = "";
palettedesc = "";
