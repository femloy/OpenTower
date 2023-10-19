if (!surface_exists(surface))
	surface = surface_create(SCREEN_WIDTH, SCREEN_HEIGHT);
surface_set_target(surface);
draw_clear_alpha(0, 0);
var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
draw_set_color(c_black);
draw_set_alpha(0.8);
draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
gpu_set_blendmode(bm_subtract);
draw_set_color(c_white);
draw_set_alpha(1);
var tx = room_width / 2;
var ty = room_height / 2;
if (instance_exists(objectID))
{
	tx = objectID.x;
	ty = objectID.y;
}
draw_circle_color(tx - cx, ty - cy, radius, c_white, c_white, 0);
gpu_set_blendmode(bm_normal);
surface_reset_target();
draw_surface(surface, 0, 0);
