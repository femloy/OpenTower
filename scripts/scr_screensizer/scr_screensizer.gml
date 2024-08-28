#macro SCREEN_WIDTH obj_screensizer.actual_width
#macro SCREEN_HEIGHT obj_screensizer.actual_height
#macro SCREEN_X obj_screensizer.normal_size_fix_x
#macro SCREEN_Y obj_screensizer.normal_size_fix_y
#macro CAMERA_WIDTH obj_screensizer.ideal_width
#macro CAMERA_HEIGHT obj_screensizer.ideal_height

function screen_apply_size_delayed()
{
	with obj_screensizer
		alarm[2] = 1;
}
function screen_apply_size()
{
	with obj_screensizer
	{
		if global.option_resolution == 0 && global.option_scale_mode == 1
			global.option_resolution = 1;
		if gameframe_get_fullscreen() == false
			gameframe_restore();
		
		var w = get_resolution_width(global.option_resolution, aspect_ratio);
		var h = get_resolution_height(global.option_resolution, aspect_ratio);
		trace("Setting Window Size: ", w, ", ", h);
		window_set_size(w, h);
		alarm[0] = 2;
	}
}
function screen_apply_vsync()
{
	if room != Loadiingroom
	{
		trace("Applying VSync: ", global.option_vsync);
		display_reset(0, global.option_vsync);
	}
}
function screen_option_apply_fullscreen(fullscreen)
{
	var opt = global.option_fullscreen;
	global.option_fullscreen = fullscreen;
	screen_apply_fullscreen(fullscreen);
	with instance_create(0, 0, obj_screenconfirm)
	{
		savedoption = opt;
		section = "Option";
		key = "fullscreen";
		varname = "option_fullscreen";
		depth = obj_option.depth - 1;
	}
}
function screen_apply_fullscreen(fullscreen)
{
	if fullscreen == 0
	{
		gameframe_set_fullscreen(0);
		obj_screensizer.alarm[2] = 1;
	}
	else if fullscreen == 1
		gameframe_set_fullscreen(1);
	else if fullscreen == 2
		gameframe_set_fullscreen(2);
}
function surface_safe_set_target(surface)
{
	surface_reset_target();
	surface_set_target(surface);
}
function set_gui_target(surface)
{
	while (surface_get_target() != -1 && surface_get_target() != application_surface)
		surface_reset_target();
	surface_set_target(surface);
}
function surface_safe_reset_target()
{
	if (surface_get_target() != -1 && surface_get_target() != application_surface)
		surface_reset_target();
}
function reset_gui_target()
{
	while (surface_get_target() != -1 && surface_get_target() != application_surface)
		surface_reset_target();
	with obj_screensizer
	{
		if (!surface_exists(gui_surf))
			exit;
		surface_set_target(gui_surf);
	}
}
function reset_blendmode()
{
	gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
}
function reset_shader_fix()
{
	if (shader_current() != -1)
		shader_reset();
	shader_set(shd_alphafix);
}
function window_to_gui_x(x)
{
	var _win_pos = x / window_get_width();
	return display_get_gui_width() * _win_pos;
}
function window_to_gui_y(y)
{
	var _win_pos = y / window_get_height();
	return display_get_gui_height() * _win_pos;
}
function window_to_gui_xscale(xscale)
{
	return (xscale * display_get_gui_width()) / window_get_width();
}
function window_to_gui_yscale(yscale)
{
	return (yscale * display_get_gui_height()) / window_get_height();
}
function get_resolution_width(resolution, aspect_ratio = aspectratio.normal)
{
	if (resolution < 0 || resolution >= array_length(global.resolutions[aspect_ratio]))
		return get_resolution_width(1, aspect_ratio);
	return global.resolutions[aspect_ratio][resolution][0];
}
function get_resolution_height(resolution, aspect_ratio = aspectratio.normal)
{
	if (resolution < 0 || resolution >= array_length(global.resolutions[aspect_ratio]))
		return get_resolution_height(1, aspect_ratio);
	return global.resolutions[aspect_ratio][resolution][1];
}
function get_resolution(resolution, aspect_ratio = aspectratio.normal)
{
	if (resolution < 0 || resolution >= array_length(global.resolutions[aspect_ratio]))
		return noone;
	return global.resolutions[aspect_ratio][resolution];
}
function screen_clear(color = c_black)
{
	draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, color, color, color, color, false);
}
function get_options()
{
	ini_open("saveData.ini");
	
	global.option_fullscreen = ini_read_real("Option", "fullscreen", 1);
	global.option_resolution = ini_read_real("Option", "resolution", 1);
	global.option_master_volume = ini_read_real("Option", "master_volume", 1);
	global.option_music_volume = ini_read_real("Option", "music_volume", 0.85);
	global.option_sfx_volume = ini_read_real("Option", "sfx_volume", 1);
	global.option_vibration = ini_read_real("Option", "vibration", 1);
	global.option_scale_mode = ini_read_real("Option", "scale_mode", 0);
	global.option_hud = ini_read_real("Option", "hud", 1);
	global.option_timer = ini_read_real("Option", "timer", 0);
	global.option_speedrun_timer = ini_read_real("Option", "speedrun_timer", 0);
	global.option_timer_type = ini_read_real("Option", "timer_type", 0);
	global.option_unfocus_mute = ini_read_real("Option", "unfocus_mute", 0);
	global.option_texfilter = ini_read_real("Option", "texfilter", 1);
	global.option_vsync = ini_read_real("Option", "vsync", 0);
	
	var lang = ini_read_string("Option", "lang", "none");
	if lang == "none"
	{
		lang = "en";
		var os_lan = os_get_language();
		switch os_lan
		{
			case "zh":
				var region = os_get_region();
				if region == "HK" || region == "MO" || region == "TW"
					lang = "tc";
				else
					lang = "sc";
				break;
			case "ja":
				lang = "jp";
				break;
			case "fr":
				lang = "fr";
				break;
			case "de":
				lang = "gr";
				break;
			case "it":
				lang = "it";
				break;
			case "pt":
				lang = "br";
				break;
			case "ru":
				lang = "ru";
				break;
			case "es":
				region = os_get_region();
				if region == "ES" || region == "ESP"
					lang = "spa";
				else
					lang = "latam";
				break;
		}
		region = os_get_region();
		if region == "KR" || region == "KOR"
			lang = "kr";
		global.option_lang = lang;
	}
	else
		global.option_lang = lang;
	global.offload_lang = noone;
	
	global.option_screenshake = ini_read_real("Option", "screenshake", 1);
	global.lang = global.option_lang;
	
	if true && steam_utils_is_steam_running_on_steam_deck() // "true" os check?
	{
		global.option_fullscreen = 1;
		global.option_resolution = 1;
	}
	
	ini_close();
	screen_apply_fullscreen(global.option_fullscreen);
	obj_screensizer.start_sound = false;
}
