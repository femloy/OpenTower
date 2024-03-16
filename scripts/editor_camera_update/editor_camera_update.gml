function editor_camera_update()
{
	with obj_button
	{
		if hovered
			exit;
	}
	cx = camera_get_view_x(view_camera[0])
	cy = camera_get_view_y(view_camera[0])
	var mx = display_mouse_get_x()
	var my = display_mouse_get_y()
	if mouse_check_button(mb_middle)
	{
		cx += ((mouse_xprevious - mx) * (zoom * 0.4))
		cy += ((mouse_yprevious - my) * (zoom * 0.4))
	}
	mouse_xprevious = mx
	mouse_yprevious = my
	cx += (raxis_horizontal * (spd * zoom))
	cy += (raxis_vertical * (spd * zoom))
	if key_zoom_out
	{
		if zoom < 8
		{
			cx -= ((CAMERA_WIDTH / 2) / 2)
			cy -= ((CAMERA_HEIGHT / 2) / 2)
			zoom += 0.5
		}
	}
	if key_zoom_in
	{
		if zoom > 0.5
		{
			cx += ((CAMERA_WIDTH / 2) / 2)
			cy += ((CAMERA_HEIGHT / 2) / 2)
			zoom -= 0.5
		}
	}
	if zoom < 0.5
		zoom = 0.5
	if zoom > 8
		zoom = 8
	camera_set_view_pos(view_camera[0], cx, cy)
	camera_set_view_size(view_camera[0], (CAMERA_WIDTH * zoom), (CAMERA_HEIGHT * zoom))
}
