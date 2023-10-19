active = false;
var xx = room_width + 64;
var _dir = -1;
if (x < (room_width / 2))
{
	xx = -64;
	_dir = 1;
}
with (instance_create(xx, y, obj_spider))
{
	image_xscale = _dir;
	webID = other.id;
}
