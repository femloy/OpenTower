instance_create(x, y, obj_canonexplosion);
var _y = room_height - 138;
with (instance_create(x + (image_xscale * 40), _y, obj_vigilantebazookatrail))
	image_xscale = other.image_xscale;
with (instance_create(x - (image_xscale * 40), _y, obj_vigilantebazookatrail))
	image_xscale = -other.image_xscale;
