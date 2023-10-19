baddieID = instance_nearest(x, y, obj_baddie);
if (instance_exists(baddieID))
	direction = point_direction(x, y, baddieID.x, baddieID.y);
speed = 8;
image_speed = 0.35;
image_angle = direction;
