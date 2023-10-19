shot = false;
if (objectlist != -4 && count < array_length(objectlist[wave]) && objectlist[wave] != -4)
{
	finish = false;
	shot = false;
	sprite_index = spr_arenadoor_open;
	image_index = 0;
}
else
{
	finish = true;
	count = 0;
}
