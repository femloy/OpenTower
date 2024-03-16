if (!instance_exists(target))
{
	instance_destroy();
	exit;
}
direction = angle_rotate(direction, point_direction(x, y, target.x, target.y), 2.5);
image_angle = direction;
