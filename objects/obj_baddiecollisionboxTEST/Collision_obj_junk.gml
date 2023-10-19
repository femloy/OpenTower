if (instance_exists(baddieID) && other.thrown == 1 && !baddieID.instantkillable)
{
	instance_destroy();
	instance_destroy(baddieID);
}
