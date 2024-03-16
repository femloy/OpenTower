angle += 2;
if angle > 360
	angle -= 360;
x = xstart + lengthdir_x(len, angle);
y = ystart + lengthdir_y(len, angle);
if (place_meeting(x, y, obj_player))
{
	instance_destroy();
	repeat 3
		create_debris(x, y, spr_waterdrop);
}
