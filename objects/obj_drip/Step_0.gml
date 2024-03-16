if grounded && vspeed == 10
	instance_destroy();
if floor(image_index) == image_number - 1
{
	vspeed = 10;
	image_speed = 0;
}
