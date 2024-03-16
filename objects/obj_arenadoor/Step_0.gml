if sprite_index == spr_arenadoor_open
{
	if (floor(image_index) == 4 && !shot)
	{
		instance_create(x, y, objectlist[wave][count]);
		shot = true;
	}
	if floor(image_index) == image_number - 1
	{
		count++;
		alarm[0] = 10;
		sprite_index = spr_arenadoor;
	}
}
