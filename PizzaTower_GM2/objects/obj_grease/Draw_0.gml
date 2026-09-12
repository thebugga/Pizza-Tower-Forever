//Setup
var _cam_x = camera_get_view_x(view_camera[0])
var _cam_y = camera_get_view_y(view_camera[0])

if (!surface_exists(watersurface)) 
    watersurface = surface_create(SCREEN_WIDTH, SCREEN_HEIGHT);

if surface_exists(watersurface)
{
	//Set Surface Water
	surface_set_target(watersurface)
	draw_clear_alpha(c_white, 0);
	
	//Draw body
	draw_sprite_ext(spr_cheesewater2, -1, x - _cam_x, (bbox_top + 32) - _cam_y, image_xscale, round((room_height + 960)/32), image_angle, image_blend, 1)
	
	with obj_greasecurrent
		draw_sprite_ext(sprite_index, -1, x - _cam_x, y - _cam_y, image_xscale, image_yscale, image_angle, image_blend, 1)
	with obj_greasedraft
		draw_sprite_ext(sprite_index, -1, x - _cam_x, y - _cam_y, image_xscale, image_yscale, image_angle, image_blend, 1)
		
	//Draw Clipping Mask
	gpu_set_blendmode(bm_subtract);
	draw_set_color(c_black);
	draw_rectangle(0,0,960, ( bbox_top + 16 ) -_cam_y,false)
	gpu_set_blendmode(bm_normal);

	for (var i = 0; i < abs(image_xscale); i++)
		draw_sprite_ext(spr_cheesewater, -1, (x + (32 * i)  - _cam_x), y  - _cam_y, 1, 1, image_angle, image_blend, 1)	
		
	draw_sprite_ext(sprite_index,-1,x - _cam_x, y - _cam_y,image_xscale,1,0,c_white,1)
	surface_reset_target();
}

//Draw Surface
draw_surface_ext(watersurface,_cam_x,_cam_y,1,1,0,c_white,alpha);