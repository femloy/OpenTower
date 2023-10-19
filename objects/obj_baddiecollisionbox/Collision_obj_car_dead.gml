if (instance_exists(baddieID) && other.thrown == 1 && baddieID.destroyable)
{
	instance_destroy();
	instance_destroy(baddieID);
}
