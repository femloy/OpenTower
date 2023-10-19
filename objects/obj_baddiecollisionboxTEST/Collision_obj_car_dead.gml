if (instance_exists(baddieID) && other.thrown == 1)
{
	instance_destroy();
	instance_destroy(baddieID);
}
