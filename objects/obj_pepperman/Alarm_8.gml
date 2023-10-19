if (!pizzahead)
{
	var d = knightdir;
	with (obj_peppermanGIANTbowlingball)
	{
		if (xstart > (room_width / 2))
			d = 1;
		else
			d = -1;
	}
	if (d == -1)
	{
		with (instance_create(room_width + 10, 400, obj_peppermanartdude))
			image_xscale = -1;
	}
	if (d == 1)
	{
		with (instance_create(-10, 400, obj_peppermanartdude))
			image_xscale = 1;
	}
	if (d == knightdir && !instance_exists(obj_peppermanGIANTbowlingball))
		knightdir *= -1;
}
alarm[8] = 1000;
