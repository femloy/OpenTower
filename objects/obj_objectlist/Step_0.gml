image_index = 0;
if (hovered)
{
	if (mouse_wheel_up())
		scroll_y += 32;
	if (mouse_wheel_down())
		scroll_y -= 32;
	scroll_y = clamp(scroll_y, -scroll_ymax, 0);
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	var xx = 0;
	var yy = 0;
	hovered_object = -1;
	for (var i = 0; i < ds_list_size(object_list); i++)
	{
		if (mx > (x + xx) && mx < (x + xx + 64) && my > (y + yy + scroll_y) && my < (y + yy + 64 + scroll_y))
			hovered_object = i;
		xx += 64;
		if (xx >= sprite_width)
		{
			xx = 0;
			yy += 64;
		}
	}
}
else
	hovered_object = -1;
