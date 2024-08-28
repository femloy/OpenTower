var ww = window_get_width();
var wh = window_get_height();

if room != Loadiingroom && !instance_exists(obj_langload) && lang_get_value("use_ttf")
	global.tdp_text_enabled = true;
else
	global.tdp_text_enabled = false;

var cr = cr_beam;
if ((device_mouse_x_to_gui(0) != mouse_xprevious || device_mouse_y_to_gui(0) != mouse_yprevious) && gameframe_mouse_in_window())
{
	if (window_get_cursor() == -1)
		cr = cr_default;
	disappearbuffer = 100;
	mouse_xprevious = device_mouse_x_to_gui(0);
	mouse_yprevious = device_mouse_y_to_gui(0);
}

if disappearbuffer > 0
{
	captionalpha = Approach(captionalpha, 1, 0.2);
	disappearbuffer--;
}
else
{
	captionalpha = Approach(captionalpha, 0, 0.1);
	if (window_get_cursor() != -1 && window_has_focus() && room != Mainmenu)
		cr = cr_none;
}

if room != Mainmenu && gameframe_get_fullscreen() > 0
	cr = cr_none;
if room == Mainmenu && window_get_cursor() == -1
	cr = cr_default;
if instance_exists(obj_inputAssigner) && obj_inputAssigner.player_input_device[0] >= 0
	cr = cr_none;
if room == editor_room
	cr = cr_none;
if cr != cr_beam
{
	window_set_cursor(cr);
	global.gameframe_current_cursor = cr;
	if cr == cr_none
		global.gameframe_set_cursor = false;
	else
		global.gameframe_set_cursor = true;
}
global.gameframe_alpha = captionalpha;

if window_has_focus()
{
	savedwidth = window_get_width();
	savedheight = window_get_height();
	saved_guiwidth = display_get_gui_width();
	saved_guiheight = display_get_gui_height();
}
else
{
	dirty = true;
	if global.option_fullscreen > 0
		alarm[2] = 5;
}

if startbuffer > 0
	startbuffer--;
if window_has_focus() && (dirty || window_width_current != ww || window_height_current != wh || global.option_scale_mode != last_scale_mode || global.option_fullscreen != gameframe_get_fullscreen())
{
	if dirty
		dirty = false;
	if global.option_scale_mode == 0
	{
		camera_set_view_size(view_camera[0], CAMERA_WIDTH * camzoom, CAMERA_HEIGHT * camzoom);
		app_scale = min(ww / CAMERA_WIDTH, wh / CAMERA_HEIGHT);
		trace(app_scale);
		
		SCREEN_WIDTH = CAMERA_WIDTH;
		SCREEN_HEIGHT = CAMERA_HEIGHT;
		
		if app_scale > 0
		{
			surface_resize(application_surface, CAMERA_WIDTH, CAMERA_HEIGHT);
			display_set_gui_size(CAMERA_WIDTH, CAMERA_HEIGHT);
		}
	}
	else if global.option_scale_mode == 1
	{
		camera_set_view_size(view_camera[0], CAMERA_WIDTH * camzoom, CAMERA_HEIGHT * camzoom);
		app_scale = min(ww div CAMERA_WIDTH, wh div CAMERA_HEIGHT);
		
		SCREEN_WIDTH = CAMERA_WIDTH;
		SCREEN_HEIGHT = CAMERA_HEIGHT;
		
		if app_scale > 0
		{
			surface_resize(application_surface, CAMERA_WIDTH, CAMERA_HEIGHT);
			display_set_gui_size(CAMERA_WIDTH, CAMERA_HEIGHT);
		}
	}
	else if global.option_scale_mode == 2
	{
		app_scale = 1;
		camera_set_view_size(view_camera[0], ww * camzoom, wh * camzoom);
		
		SCREEN_WIDTH = ww;
		SCREEN_HEIGHT = wh;
		
		if ww > 0 && wh > 0
		{
			surface_resize(application_surface, SCREEN_WIDTH, SCREEN_HEIGHT);
			display_set_gui_size(SCREEN_WIDTH, SCREEN_HEIGHT);
		}
	}
	
	last_scale_mode = global.option_scale_mode;
	last_fullscreen = gameframe_get_fullscreen();
	window_width_current = window_get_width();
	window_height_current = window_get_height();
	normal_size_fix_x = (SCREEN_WIDTH - 960) / 2;
	normal_size_fix_y = (SCREEN_HEIGHT - 540) / 2;
}
