if (distance_to_point(targetx, targety) <= 40)
	instance_destroy();
image_angle = point_direction(0, 0, hspeed, vspeed);
if image_angle > 90 && image_angle < 270
{
	if image_yscale != -1
		image_xscale *= -1;
	image_yscale = -1;
}
else
{
	if image_yscale != 1
		image_xscale *= -1;
	image_yscale = 1;
}
