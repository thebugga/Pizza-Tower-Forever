if (!surface_exists(gui_surf))
{
	gui_surf = surface_create(ideal_width, ideal_height);
}
if (surface_get_width(gui_surf) != ideal_width || surface_get_height(gui_surf) != ideal_height)
{
	surface_resize(gui_surf, ideal_width, ideal_height);
}
surface_set_target(gui_surf);
draw_clear_alpha(c_black, 0);
reset_blendmode();
reset_shader_fix();
global.Pattern_Texture_Indexed = noone;
