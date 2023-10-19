if (instance_exists(baddieID) && !baddieID.instantkillable && baddieID.destroyable)
{
	instance_destroy();
	instance_destroy(baddieID);
}
