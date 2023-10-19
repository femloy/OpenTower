if (room == rm_editor)
	exit;
image_speed = 0.35;
depth = 1;
solid_inst = -4;
if (image_xscale == 1)
{
	with (instance_create(x, y, obj_solid))
	{
		image_yscale = 2;
		other.solid_inst = id;
	}
}
if (image_xscale == -1)
{
	with (instance_create(x - 32, y, obj_solid))
	{
		image_yscale = 2;
		other.solid_inst = id;
	}
}
