if arrow
{
	with player
		draw_sprite_ext(spr_golf_aimuparrow, other.arrowindex, (x + (32 * xscale)) - camera_get_view_x(view_camera[0]), y - 32 - camera_get_view_y(view_camera[0]), xscale, 1, 0, c_white, 1);
}
