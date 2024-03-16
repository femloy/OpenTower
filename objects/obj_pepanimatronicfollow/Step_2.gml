event_inherited();
var _dist = distance_between_points(x, y, xprevious, yprevious);
if _dist >= 10 && _dist < 15
	fast_count = 1;
else if _dist >= 15
	fast_count = 2;
else
	fast_count = 0;
if global.monsterspeed > fast_count
	global.monsterspeed -= 0.01;
else if global.monsterspeed < fast_count
	global.monsterspeed = fast_count;
