if other.fall
{
	dead = true;
	instance_destroy();
	instance_destroy(other);
}
