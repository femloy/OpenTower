if (instance_exists(baddieID) && other.thrown == 1)
{
	if baddieID.destroyable
	{
		instance_destroy();
		instance_destroy(baddieID);
	}
}
