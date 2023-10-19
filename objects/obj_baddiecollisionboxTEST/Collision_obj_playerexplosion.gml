if (instance_exists(baddieID) && !baddieID.instantkillable)
{
	instance_destroy();
	instance_destroy(baddieID);
}
