if (floor(image_index) == 3 && madecheese == 0)
{
	instance_create(x + 32, y + 64, obj_cheeseblob);
	madecheese = true;
}
if floor(image_index) == image_number - 1
	madecheese = false;
