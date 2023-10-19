if (instance_exists(baddieID) && baddieID.instantkillable && baddieID.destroyable)
{
	instance_destroy(baddieID);
	instance_destroy();
}
