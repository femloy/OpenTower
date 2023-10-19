if (vsp != 0 && hsp != 0 && instance_exists(other.baddieID) && other.baddieID.object_index != obj_bigcheese && other.baddieID.object_index != obj_golfburger && other.baddieID.destroyable && (!other.baddieID.invincible || other.baddieID.object_index == obj_golfdemon))
{
	instance_destroy(other);
	instance_destroy(other.baddieID);
}
