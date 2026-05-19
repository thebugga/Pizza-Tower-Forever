#region Base Draw Text Shit
	#macro draw_text_base draw_text
	#macro draw_text draw_text_hook

	function draw_text_hook(_x, _y, _string)
	{
		var _font = draw_get_font();
		var _fontoffset = 
		{
			x : 0,
			y : 0
		};
		if _font != -1 && font_get_info(_font).spriteIndex > -1
		{
			var _spr = font_get_info(_font).spriteIndex;
			_fontoffset = 
			{
				x : sprite_get_xoffset(_spr),
				y : sprite_get_yoffset(_spr)
			};
		}
	
		draw_text_base(_x + _fontoffset.x, _y + _fontoffset.y, _string)
	}

	#macro draw_text_ext_base draw_text_ext
	#macro draw_text_ext draw_text_ext_hook

	function draw_text_ext_hook(_x, _y, _string, _sep, _w)
	{
		var _font = draw_get_font();
		var _fontoffset = 
		{
			x : 0,
			y : 0
		};
		if _font != -1 && font_get_info(_font).spriteIndex > -1
		{
			var _spr = font_get_info(_font).spriteIndex;
			_fontoffset = 
			{
				x : sprite_get_xoffset(_spr),
				y : sprite_get_yoffset(_spr)
			};
		}
	
		draw_text_ext_base(_x + _fontoffset.x, _y + _fontoffset.y, _string, _sep, _w)
	}
#endregion

#region Draw Text Color Shit
	#macro draw_text_color_base draw_text_color
	#macro draw_text_color draw_text_color_hook

	function draw_text_color_hook(_x, _y, _string, _c1, _c2, _c3, _c4, _alpha)
	{
		var _font = draw_get_font();
		var _fontoffset = 
		{
			x : 0,
			y : 0
		};
		if _font != -1 && font_get_info(_font).spriteIndex > -1
		{
			var _spr = font_get_info(_font).spriteIndex;
			_fontoffset = 
			{
				x : sprite_get_xoffset(_spr),
				y : sprite_get_yoffset(_spr)
			};
		}
	
		draw_text_color_base(_x + _fontoffset.x, _y + _fontoffset.y, _string, _c1, _c2, _c3, _c4, _alpha)
	}

	#macro draw_text_ext_color_base draw_text_ext_color
	#macro draw_text_ext_color draw_text_ext_color_hook

	function draw_text_ext_color_hook(_x, _y, _string, _sep, _w, _c1, _c2, _c3, _c4, _alpha)
	{
		var _font = draw_get_font();
		var _fontoffset = 
		{
			x : 0,
			y : 0
		};
		if _font != -1 && font_get_info(_font).spriteIndex > -1
		{
			var _spr = font_get_info(_font).spriteIndex;
			_fontoffset = 
			{
				x : sprite_get_xoffset(_spr),
				y : sprite_get_yoffset(_spr)
			};
		}
	
		draw_text_ext_color_base(_x + _fontoffset.x, _y + _fontoffset.y, _string, _sep, _w, _c1, _c2, _c3, _c4, _alpha)
	}
#endregion

#region Draw Text Transformed Shit
	#macro draw_text_transformed_base draw_text_transformed
	#macro draw_text_transformed draw_text_transformed_hook

	function draw_text_transformed_hook(_x, _y, _string, _xscale, _yscale, _angle)
	{
		var _font = draw_get_font();
		var _fontoffset = 
		{
			x : 0,
			y : 0
		};
		if _font != -1 && font_get_info(_font).spriteIndex > -1
		{
			var _spr = font_get_info(_font).spriteIndex;
			_fontoffset = 
			{
				x : sprite_get_xoffset(_spr),
				y : sprite_get_yoffset(_spr)
			};
		}
	
		draw_text_transformed_base(_x + _fontoffset.x, _y + _fontoffset.y, _string, _xscale, _yscale, _angle)
	}

	#macro draw_text_ext_transformed_base draw_text_ext_transformed
	#macro draw_text_ext_transformed draw_text_ext_transformed_hook

	function draw_text_ext_transformed_hook(_x, _y, _string, _sep, _w, _xscale, _yscale, _angle)
	{
		var _font = draw_get_font();
		var _fontoffset = 
		{
			x : 0,
			y : 0
		};
		if _font != -1 && font_get_info(_font).spriteIndex > -1
		{
			var _spr = font_get_info(_font).spriteIndex;
			_fontoffset = 
			{
				x : sprite_get_xoffset(_spr),
				y : sprite_get_yoffset(_spr)
			};
		}
	
		draw_text_ext_transformed_base(_x + _fontoffset.x, _y + _fontoffset.y, _string, _sep, _w, _xscale, _yscale, _angle)
	}
#endregion

// too lazy to do draw text transformed color shit lol