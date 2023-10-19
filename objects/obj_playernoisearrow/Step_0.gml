if (baddieID != -4 && !instance_exists(baddieID))
	exit;
if (instance_exists(baddieID))
	direction = angle_rotate(direction, point_direction(x, y, baddieID.x, baddieID.y), 6);
image_angle = direction;
