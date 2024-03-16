if instance_exists(obj_bucketfollower)
{
	instance_destroy()
	with obj_bucketfollower
	{
		instance_create(x, y, obj_bucketeffect)
		instance_destroy()
	}
}
