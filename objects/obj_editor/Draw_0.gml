var r = ds_list_find_value(rooms, selectedroom);
draw_rectangle_color(0, 0, r.width, r.height, c_white, c_white, c_white, c_white, true);
if (object != -4)
	draw_sprite_ext(object.sprite_index, 0, snap_tile(mouse_x, 32), snap_tile(mouse_y, 32), 1, 1, 0, c_white, 0.5);
