angle += (angle_dir * angle_spd);
if angle > 360
	angle = 0;
if angle < 0
	angle = 360;
x = xstart + lengthdir_x(len, angle);
y = ystart + lengthdir_y(len, angle);
