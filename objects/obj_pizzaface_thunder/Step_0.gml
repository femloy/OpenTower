if (floor(image_index) == (image_number - 1))
{
	image_index = image_number - 1;
	image_speed = 0;
	if (buffer > 0)
		buffer--;
	else
		instance_destroy();
}
