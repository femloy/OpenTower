timer += 20;
yoffset = Wave(-2, 2, 2, 2, timer);
var _x = x;
x = Wave(xstart - disx, xstart + disx, time_x, 10, timer);
y = Wave(ystart - disx, ystart + disx, time_y, 10, timer);
y += yoffset;
if ((x - _x) < 0)
	depth = 80;
else
	depth = 0;
last_current_time = current_time;
