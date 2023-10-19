if (instance_exists(other.baddieID) && other.baddieID.object_index != obj_vigilanteboss && other.baddieID.destroyable && !other.baddieID.invincible)
	instance_destroy(other.baddieID);
