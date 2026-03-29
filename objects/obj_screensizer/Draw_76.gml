if !surface_exists(gui_surf)
	gui_surf = surface_create(SCREEN_WIDTH, SCREEN_HEIGHT)

draw_set_alpha(1);
shader_reset();
gpu_set_blendmode(bm_normal);
