function get_pep_palette_info()
{
	if (live_call()) return live_result;
	if (global.swapmode)
	{
		var pal = 1;
		return 
		{
			spr_palette: pal_peppino,
			paletteselect: obj_player1.player_paletteselect[pal],
			patterntexture: obj_player1.player_patterntexture[pal]
		};
	}
	else if (obj_savesystem.ispeppino)
	{
		return 
		{
			spr_palette: obj_player1.spr_palette,
			paletteselect: obj_player1.paletteselect,
			patterntexture: global.palettetexture
		};
	}
	return 
	{
		spr_palette: pal_peppino,
		paletteselect: 1,
		patterntexture: noone
	};
}

function get_noise_palette_info()
{
	if (live_call()) return live_result;
	if (global.swapmode)
	{
		var pal = 0;
		return 
		{
			spr_palette: pal_noiseplayer,
			paletteselect: obj_player1.player_paletteselect[pal],
			patterntexture: obj_player1.player_patterntexture[pal]
		};
	}
	else if (obj_savesystem.character != "Peppino")
	{
		return 
		{
			spr_palette: obj_player1.spr_palette,
			paletteselect: obj_player1.paletteselect,
			patterntexture: global.palettetexture
		};
	}
	return 
	{
		spr_palette: pal_noiseplayer,
		paletteselect: 1,
		patterntexture: noone
	};
}