function scr_editor_camera_init()
{
	view_w = 960;
	view_h = 540;
	cx = 0;
	cy = 0;
	mouse_xprevious = device_mouse_x_to_gui(0);
	mouse_yprevious = device_mouse_y_to_gui(0);
	camera_speed = 10;
	drag_speed = 0.6;
	zoom = 1;
}
function scr_editor_camera_update()
{
	cx = camera_get_view_x(view_camera[0]);
	cy = camera_get_view_y(view_camera[0]);
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	if (key_mbmiddle)
	{
		cx += ((mouse_xprevious - mx) * (zoom * drag_speed));
		cy += ((mouse_yprevious - my) * (zoom * drag_speed));
	}
	mouse_xprevious = mx;
	mouse_yprevious = my;
	if (key_up)
		cy -= (camera_speed * zoom);
	if (key_down)
		cy += (camera_speed * zoom);
	if (key_left)
		cx -= (camera_speed * zoom);
	if (key_right)
		cx += (camera_speed * zoom);
	if (mouse_wheel_down())
	{
		if (zoom < 8)
		{
			cx -= (view_w / 2 / 2);
			cy -= (view_h / 2 / 2);
			zoom += 0.5;
		}
	}
	if (mouse_wheel_up())
	{
		if (zoom > 0.5)
		{
			cx += (view_w / 2 / 2);
			cy += (view_h / 2 / 2);
			zoom -= 0.5;
		}
	}
	zoom = clamp(zoom, 0.5, 8);
	camera_set_view_pos(view_camera[0], cx, cy);
	camera_set_view_size(view_camera[0], view_w * zoom, view_h * zoom);
}
