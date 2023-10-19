if (instance_exists(other.baddieID))
{
	if (!other.baddieID.elite || other.baddieID.elitehit <= 0)
	{
		if (other.baddieID != baddieID && !other.baddieID.invincible && other.baddieID.killbyenemy && other.baddieID.destroyable && other.baddieID.state != states.grabbed)
			instance_destroy(other.baddieID);
	}
}
