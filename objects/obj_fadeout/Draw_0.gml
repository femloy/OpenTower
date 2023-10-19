draw_set_alpha(fadealpha);
draw_set_color(c_black);
draw_rectangle(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + SCREEN_WIDTH, camera_get_view_y(view_camera[0]) + SCREEN_HEIGHT, false);
draw_set_alpha(1);
