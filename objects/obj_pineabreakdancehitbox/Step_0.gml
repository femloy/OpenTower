if (!instance_exists(ID))
{
	instance_destroy();
	exit;
}
if ID.state != states.punch
{
	instance_destroy();
	ID.breakdanceinst = -4;
	exit;
}
x = ID.x;
y = ID.y;
image_xscale = ID.image_xscale;
image_index = ID.image_index;
