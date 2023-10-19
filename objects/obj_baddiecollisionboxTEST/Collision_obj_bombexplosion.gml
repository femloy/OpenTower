if (instance_exists(baddieID) && baddieID.instantkillable)
{
	instance_destroy(baddieID);
	instance_destroy();
}
