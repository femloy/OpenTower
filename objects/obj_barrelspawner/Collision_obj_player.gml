if (cooldown == 0 && other.state == states.freefallland)
{
	instance_destroy(obj_barrel);
	instance_create(x + 50, y - 50, obj_barrel);
	cooldown = 10;
}
