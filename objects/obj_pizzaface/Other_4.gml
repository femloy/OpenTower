image_alpha = 0;
savedx = x;
savedy = y;
savedcx = camera_get_view_x(view_camera[0]);
savedcy = camera_get_view_y(view_camera[0]);
if instance_exists(obj_player1)
{
	x = obj_player1.x;
	y = obj_player1.y;
}
if (instance_exists(obj_treasure))
	treasure = true;
else
	treasure = false;
if room == rank_room
	instance_destroy();
