if obj_explosion == obj_canonexplosion
{
	instance_destroy();
	instance_create(x, y, obj_explosion);
}
