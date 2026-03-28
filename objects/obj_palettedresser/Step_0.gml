if (obj_player1.character != character)
{
	character = obj_player1.character;
	paletteselect = 0;
	if (obj_player1.character == "N")
	{
		palettes = player_palettes[1];
	}
	else
	{
		palettes = player_palettes[0];
	}
	with (obj_player1)
	{
		if (paletteselect > 2)
		{
			for (var i = 0; i < array_length(other.palettes); i++)
			{
				var pal = other.palettes[i][2];
				var info = get_char_palette_info(character);
				if (pal == info.paletteselect && (array_length(other.palettes[i]) <= 3 || (array_length(other.palettes[i]) > 3 && other.palettes[i][3] == info.patterntexture)))
				{
					other.paletteselect = i;
					break;
				}
			}
		}
	}
	palettetitle = lang_get_value(concat("dresser_", palettes[paletteselect][0], "title"));
	palettedesc = lang_get_value_newline(concat("dresser_", palettes[paletteselect][0]));
}
showtext = place_meeting(x, y, obj_player);
if (instance_exists(obj_transfotip))
{
	showtext = false;
}
if (showtext)
{
	alpha = Approach(alpha, 1, 0.1);
}
else
{
	alpha = Approach(alpha, 0, 0.1);
}
