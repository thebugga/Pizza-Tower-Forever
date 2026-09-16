
#macro Approach approach
function approach(_val, _valTo, _amt)
{
	return _val + clamp(_valTo - _val, -_amt, _amt);
}

/// @description Returns true, if an object has ended it's animation.
/// @function sprite_animation_end
/// @param [ind] The sprite_index to check.
/// @param [img] image_index.
/// @param [i_end] image_number - 1.
/// @param [i_spd] image_speed.
function sprite_animation_end(ind = sprite_index, img = image_index,  i_end = sprite_get_number(ind), i_spd = image_speed) {
    return (img + (i_spd) * sprite_get_speed(ind) / (sprite_get_speed_type(ind) == spritespeed_framespergameframe ? 1 : game_get_speed(gamespeed_fps)) >= i_end);    
}

function get_milliseconds()
{
	return get_timer() / 1000;
}

function c_rainbow(divider) {
    return make_color_hsv ((current_time / divider) mod 255,255,255);
} 

function camera_zoom(_zoom, _zoomspd)
{
	with (obj_camera)
	{
		targetzoom = _zoom;
		targetzoom = clamp(targetzoom, 0, max_zoom);
		if (_zoomspd != undefined)
		{
			zoomspd = abs(_zoomspd);
		}
	}
}

function camera_set_zoom(_zoom)
{
	with (obj_camera)
	{
		zoom = _zoom;
	}
}

function try_solid(_xspd, _yspd, _obj, _iteration_count)
{
	var old_x = x;
	var old_y = y;
	var n = -1;
	for (var i = 0; i < _iteration_count; i++)
	{
		x += _xspd;
		y += _yspd;
		if (!scr_solid(x, y))
		{
			n = i + 1;
			break;
		}
	}
	x = old_x;
	y = old_y;
	return n;
}

function ledge_bump_vertical(_iteration_count, _yspd)
{
	var old_x = x;
	var old_y = y;
	y += (_yspd * 4);
	var dirs = [-1, 1];
	for (var i = 0; i < array_length(dirs); i++)
	{
		var ledge_dir = dirs[i];
		var tx = try_solid(ledge_dir, 0, obj_solid, _iteration_count);
		y = old_y;
		if (tx != -1)
		{
			x -= (tx * ledge_dir);
			y += _yspd;
			if (scr_solid(x, y))
			{
				x = old_x;
				y = old_y;
				return true;
			}
			return false;
		}
	}
	return true;
}

function ledge_bump(_iteration_count, _xspd = 4)
{
	var old_x = x;
	var old_y = y;
	x += (xscale * _xspd);
	var ty = try_solid(0, -1, obj_solid, _iteration_count);
	x = old_x;
	if (ty != -1)
	{
		y -= ty;
		x += xscale;
		if (scr_solid(x, y))
		{
			x = old_x;
			y = old_y;
			return true;
		}
		with (obj_camera)
		{
			offset_y += ty;
		}
		return false;
	}
	return true;
}

function instance_create_unique(_x, _y, _obj)
{
	if (instance_exists(_obj))
	{
		return noone;
	}
	var b = instance_create(_x, _y, _obj);
	return b;
}

function get_solid_difference(_xspd, _yspd, _iteration_count)
{
	var old_x = x;
	var old_y = y;
	var n = 0;
	for (var i = 0; i < _iteration_count; i++)
	{
		x += _xspd;
		y += _yspd;
		if (!scr_solid(x, y))
		{
			n++;
		}
	}
	x = old_x;
	y = old_y;
	return n;
}

function trace()
{
	var _string = "";
	for (var i = 0; i < argument_count; i++)
	{
		_string += string(argument[i]);
	}
	show_debug_message(_string);
}

function concat()
{
	var _string = "";
	for (var i = 0; i < argument_count; i++)
	{
		_string += string(argument[i]);
	}
	return _string;
}

function embed_value_string(_str, _array)
{
	var str_copy = string_copy(_str, 1, string_length(_str));
	for (var i = 0; i < array_length(_array); i++)
	{
		var b = string(_array[i]);
		str_copy = string_replace(str_copy, "%", b);
	}
	return str_copy;
}

function ds_list_add_unique(_val)
{
	if (argument_count > 1)
	{
		for (var i = 1; i < argument_count; i++)
		{
			var b = argument[i];
			if (ds_list_find_index(_val, b) == -1)
			{
				ds_list_add(_val, b);
			}
		}
	}
}

function point_in_camera(_x, _y, _cam)
{
	var cam_x = camera_get_view_x(_cam);
	var cam_y = camera_get_view_y(_cam);
	var cam_w = camera_get_view_width(_cam);
	var cam_h = camera_get_view_height(_cam);
	return point_in_rectangle(_x, _y, cam_x, cam_y, cam_x + cam_w, cam_y + cam_h);
}

function point_in_camera_ext(_x, _y, _cam, _width, _height)
{
	var cam_x = camera_get_view_x(_cam);
	var cam_y = camera_get_view_y(_cam);
	var cam_w = camera_get_view_width(_cam);
	var cam_h = camera_get_view_height(_cam);
	return point_in_rectangle(_x, _y, cam_x - _width, cam_y - _height, cam_x + cam_w + _width, cam_y + cam_h + _height);
}

function bbox_in_camera(_cam, _threshold = 0)
{
	var cam_x = camera_get_view_x(_cam);
	var cam_y = camera_get_view_y(_cam);
	var cam_w = camera_get_view_width(_cam);
	var cam_h = camera_get_view_height(_cam);
	return bbox_left < (cam_x + cam_w + _threshold) && bbox_right > (cam_x - _threshold) && bbox_top < (cam_y + cam_h + _threshold) && bbox_bottom > (cam_y - _threshold);
}

function instance_nearest_random(_obj, _range)
{
	var l = instance_furthest(x, y, _obj);
	var list = ds_list_create();
	for (var i = 0; i < instance_number(_obj); i++)
	{
		b = instance_find(_obj, i);
		var t = distance_to_object(b);
		if (t <= l)
		{
			ds_list_add(list, b);
		}
	}
	var b = undefined;
	if (ds_list_size(list) > 0)
	{
		var n = irandom(_range);
		if (ds_list_size(list) < n)
		{
			n = ds_list_size(list) - 1;
		}
		b = ds_list_find_value(list, ds_list_size(list) - n);
	}
	ds_list_destroy(list);
	return b;
}

function instance_random(_obj)
{
	return instance_find(_obj, irandom(instance_number(_obj) - 1));
}


function heat_calculate(_val)
{
	if scr_get_mode("heatmeter").enabled 
	{
		trace(global.stylemultiplier)
			return (_val + (round(_val * global.stylemultiplier)));
	}
	else
	{
		return _val;
	}
}

function add_background_chunk(sprite, xoffset, yoffset, imagespeed)
{
	return [sprite, xoffset, yoffset, 0, imagespeed];
}

function randomize_animations(_array)
{
	if (ds_list_size(animlist) >= array_length(_array))
	{
		ds_list_clear(animlist);
	}
	sprite_index = _array[irandom(array_length(_array) - 1)];
	while (ds_list_find_index(animlist, sprite_index) != -1)
	{
		sprite_index = _array[irandom(array_length(_array) - 1)];
	}
	ds_list_add(animlist, sprite_index);
}

///@func twerp(TwerpType, start, end, pos, [looped], [option1], [option2]);
function twerp(_type, _start, _end, _pos, _looped = false) {
  _type = clamp(_type,0,TwerpType.count);
  _pos = clamp(_looped ? _pos % 1 : _pos,0,1);
  var _chng = _end-_start;
  var _mid = (_start+_end) / 2;

  #region Tween Types
  enum TwerpType
  {
  	linear,
  	inout_back,	in_back, out_back,
  	inout_bounce,	out_bounce, in_bounce,
  	inout_circle,	out_circle, in_circle,
  	inout_cubic,	out_cubic, 	in_cubic,
  	inout_elastic, out_elastic,	in_elastic,
  	inout_expo,	out_expo,	in_expo,
  	inout_quad,	out_quad,	in_quad,
  	inout_quart, out_quart, in_quart,
  	inout_quint, out_quint, in_quint,
  	inout_sine, out_sine, in_sine,
  	count
  }
  #endregion

  switch(_type)
  {
  	case TwerpType.linear: return lerp(_start,_end,_pos); //Why are you using this?
  	#region Back
  	// Optional Argument: Bounciness - Default: 1.5
  	#macro Twerp_Back_DefaultBounciness 1.5
  	case TwerpType.inout_back:
  				var _b = (argument_count > 5) ? argument[5] : Twerp_Back_DefaultBounciness;	
  				return (_pos < .5) ? twerp(TwerpType.in_back,_start,_mid,_pos*2,_b) 
  												   : twerp(TwerpType.out_back,_mid,_end,(_pos-.5)*2,_b);

  	case TwerpType.in_back:
  				var _b = (argument_count > 5) ? argument[5] : Twerp_Back_DefaultBounciness;
  				return _chng * _pos * _pos * ((_b + 1) * _pos - _b) + _start

  	case TwerpType.out_back:			
  				var _b = (argument_count > 5) ? argument[5] : Twerp_Back_DefaultBounciness;
  				_pos -= 1;
  				return _chng * (_pos * _pos * ((_b + 1) * _pos + _b) + 1) + _start;
				
  	#endregion
  	#region Bounce
  	//No Optional Arguments
  	#macro Twerp_Bounce_DefaultBounciness 7.5625
	
  	case TwerpType.inout_bounce:
  			return (_pos < 0.5) ? twerp(TwerpType.in_bounce,_start, (_start + _end) / 2, _pos*2)
  												  : twerp(TwerpType.out_bounce,(_start + _end) / 2, _end, (_pos-.5)*2);
												
  	case TwerpType.out_bounce:
  				if (_pos < 1/2.75) 
  					return _chng * (Twerp_Bounce_DefaultBounciness * _pos * _pos) + _start;
  				else if (_pos < 2/2.75) 
  				{
  				  _pos -= 1.5/2.75; 
  				  return _chng * (Twerp_Bounce_DefaultBounciness * _pos * _pos + 3/4) + _start;
  				}
  				else if (_pos < 2.5/2.75)
  				{
  				  _pos -= 2.25/2.75; 
  				  return _chng * (Twerp_Bounce_DefaultBounciness * _pos * _pos + 15/16) + _start; 
  				}

  				_pos -= 2.625/2.75;
  				return _chng * (Twerp_Bounce_DefaultBounciness * _pos * _pos + 63/64) + _start;
				
  	case TwerpType.in_bounce:
  				_chng = _end-_pos;
  				_pos = 1-_pos;
  				return _chng - twerp(TwerpType.out_bounce,_start,_end,_pos,Twerp_Bounce_DefaultBounciness)+_start;
				
  	#endregion
  	#region Circle
  	//No Optional Arguments
  	case TwerpType.inout_circle:
  				return (_pos < .5) ? twerp(TwerpType.in_circle,_start,_mid,_pos*2)
  												   : twerp(TwerpType.out_circle,_mid,_end,(_pos-.5)*2);
												 
  	case TwerpType.out_circle:
  				_pos--;
  				return _chng * sqrt(1 - _pos * _pos) + _start;
				
  	case TwerpType.in_circle:
  				return -_chng * (sqrt(1 - _pos*_pos)-1) + _start;
				
  	#endregion
  	#region Cubic
  	//No Optional Arguments
  	case TwerpType.inout_cubic:
  				return (_pos < .5) ? twerp(TwerpType.in_cubic,_start,_mid,_pos*2) 
  												   : twerp(TwerpType.out_cubic,_mid,_end,(_pos-.5)*2);
  	case TwerpType.out_cubic:
  				return _chng * (power(_pos - 1, 3) + 1) + _start;
  	case TwerpType.in_cubic:
  				return _chng * power(_pos, 3) + _start;
  	#endregion
  	#region Elastic
  	// Optional Argument 1: Elasticity <0-1> - Default: .3
  	// Optional Argument 2: Duration - Default: 5
  	case TwerpType.inout_elastic:
  				var _e = (argument_count > 5) ? argument[5] : 0.3;
  				var _d = (argument_count > 6) ? argument[6] : 5.0;
				
  				return (_pos < .5) ? twerp(TwerpType.in_elastic,_start,_mid,_pos*2,_e,_d)
  												   : twerp(TwerpType.out_elastic,_mid,_end,(_pos-.5)*2,_e,_d);
												 
  	case TwerpType.out_elastic:
  				var _s,_p;
  				var _e = (argument_count > 5) ? argument[5] : 0.3;
  				var _d = (argument_count > 6) ? argument[6] : 5.0;

  				if (_pos == 0 || _chng == 0) return _start;
  				if (_pos == 1) return _end;

  				_p = _d * _e;
  				_s = (sign(_chng) == -1) ? _p * 0.25 : _p / (2 * pi) * arcsin (1);

  				return _chng * power(2, -10 * _pos) * sin((_pos * _d - _s) * (2 * pi) / _p ) + _chng + _start;
  	case TwerpType.in_elastic:
  				var _s,_p;
				
  				var _e = (argument_count > 5) ? argument[5] : 0.3;
  				var _d = (argument_count > 6) ? argument[6] : 5.0;

  				if (_pos == 0 || _chng == 0) return _start; 
  				if (_pos == 1) return _end;

  				_p = _d * _e;
  				_s = sign(_chng) == -1 ? _p * 0.25 : _p / (2 * pi) * arcsin(1);

  				return -(_chng * power(2,10 * (--_pos)) * sin((_pos * _d - _s) * (pi * 2) / _p)) + _start;

  	#endregion
  	#region Expo
  	//No Optional arguments
  	case TwerpType.inout_expo:
  			  return (_pos < .5) ? twerp(TwerpType.in_expo,_start,_mid,_pos*2) 
  												   : twerp(TwerpType.out_expo,_mid,_end,(_pos-.5)*2);
												 
  	case TwerpType.out_expo:
  				return _chng * (-power(2, -10 * _pos) + 1) + _start;
				
  	case TwerpType.in_expo:
  				return _chng * power(2, 10 * (_pos - 1)) + _start;
				
  	#endregion
  	#region Quad
  	//No Optional Arguments
  	case TwerpType.inout_quad:
  				return (_pos < .5) ? twerp(TwerpType.in_quad,_start,_mid,_pos*2) 
  												   : twerp(TwerpType.out_quad,_mid,_end,(_pos-.5)*2);
  	case TwerpType.out_quad:
  				return -_chng * _pos * (_pos - 2) + _start;
				
  	case TwerpType.in_quad:
  				return _chng * _pos * _pos + _start;

  	#endregion
  	#region Quart
  	//No Optional Arguments
  	case TwerpType.inout_quart:
  				return (_pos < .5) ? twerp(TwerpType.in_quart,_start,_mid,_pos*2) 
  												   : twerp(TwerpType.out_quart,_mid,_end,(_pos-.5)*2);

  	case TwerpType.out_quart:
  				return -_chng * (((_pos - 1) * (_pos - 1) * (_pos - 1) * (_pos - 1)) - 1) + _start;
				
  	case TwerpType.in_quart:
  				return _chng * (_pos * _pos * _pos * _pos) + _start;
				
  	#endregion
  	#region Quint
  	//No Optional Arguments
  	case TwerpType.inout_quint:
  				return _pos < .5 ? twerp(TwerpType.in_quint,_start,_mid,_pos*2) 
  												 : twerp(TwerpType.out_quint,_mid,_end,(_pos-.5)*2);
												 
  	case TwerpType.out_quint:
	
  				return _chng * ((_pos - 1) * (_pos -1) * (_pos -1) * (_pos -1) * (_pos -1) + 1) + _start;
				
  	case TwerpType.in_quint:
  				return _chng * _pos * _pos * _pos * _pos * _pos + _start;
				
  	#endregion
  	#region Sine
  	//No Optional Arguments
  	#macro Twerp_Sine_Half_Pi 1.57079632679
  	case TwerpType.inout_sine:
  				return _chng * 0.5 * (1 - cos(pi * _pos)) + _start;
				
  	case TwerpType.out_sine:
  				return _chng * sin(_pos * Twerp_Sine_Half_Pi) + _start;
				
  	case TwerpType.in_sine:
  				return _chng * (1 - cos(_pos * Twerp_Sine_Half_Pi)) + _start;
				
  	#endregion
  }
}
