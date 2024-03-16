timer += 20;
var _x = x;
x = Wave(xstart - disx, xstart + disx, time_x, offset_x, timer);
y = Wave(ystart - disy, ystart + disy, time_y, offset_y, timer);
if x != _x
	image_xscale = -sign(x - _x);
