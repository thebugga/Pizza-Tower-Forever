if (!showHitboxes)
{
	exit;
}	


with (all)
{
	if (!bbox_in_camera(view_camera[0]))
	{
		continue;	
	}
	var _oVisible = visible;
	visible = true;
	
	if (sprite_exists(mask_index))
	{
		draw_sprite(mask_index, 0, x, y);
	}
	else
	{
		draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_red, c_red, c_red, c_red, true);
	}
	
	visible = _oVisible;
}
