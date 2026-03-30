function editor_camera_init()
{
	if (live_call()) return live_result;
	cx = camera_get_view_x(view_camera[0]);
	cy = camera_get_view_y(view_camera[0]);
	mouse_xprevious = -1;
	mouse_yprevious = -1;
	spd = 10;
	zoom = 1;
}
