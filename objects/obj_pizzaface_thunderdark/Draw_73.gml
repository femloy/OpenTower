with obj_finaleN_prop
{
	if depth <= -100 && visible
		exit;
}
draw_set_alpha(dark);
draw_set_color(c_white);
draw_rectangle_color(-100, -100, room_width + 100, room_height + 100, 0, 0, 0, 0, false);
draw_set_alpha(1);
