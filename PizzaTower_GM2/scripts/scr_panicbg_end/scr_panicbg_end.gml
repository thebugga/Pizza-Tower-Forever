function scr_panicbg_end()
{
	if (live_call()) return live_result;
    if (event_type == ev_draw && event_number == 0)
    {
        var camw = camera_get_view_width(view_camera[0]);
        var camh = camera_get_view_height(view_camera[0]);
        var _cam_x = camera_get_view_x(view_camera[0]);
        var _cam_y = camera_get_view_y(view_camera[0]);
        surface_reset_target();
        shader_set(shd_panicbg);
        var panic_id = shader_get_uniform(shd_panicbg, "panic");
        shader_set_uniform_f(panic_id, global.wave / global.maxwave);
        var time_id = shader_get_uniform(shd_panicbg, "time");
        shader_set_uniform_f(time_id, global.panicshadetimer / 1000);
        
        with (obj_parallax)
            event_perform(ev_other, ev_user0);
        
        draw_surface(global.panicbg_surface, _cam_x, _cam_y);
        shader_reset();
    }
}
