with other
{
	if (instance_exists(baddieID) && baddieID.thrown == 1)
		instance_destroy(other);
}
