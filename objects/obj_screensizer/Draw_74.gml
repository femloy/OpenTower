if (!surface_exists(gui_surf))
	gui_surf = surface_create(display_get_gui_width(), display_get_gui_height());
if (surface_get_width(gui_surf) != display_get_gui_width() || surface_get_height(gui_surf) != display_get_gui_height())
	surface_resize(gui_surf, display_get_gui_width(), display_get_gui_height());
surface_set_target(gui_surf);
draw_clear_alpha(c_black, 0);
reset_blendmode();
reset_shader_fix();
global.Pattern_Texture_Indexed = -4;
