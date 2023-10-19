if ((vsp != grav || hsp != 0) && instance_exists(other.baddieID) && state != states.hit && other.baddieID.object_index != obj_bigcheese && other.baddieID.object_index != obj_golfburger && other.baddieID.destroyable && (!other.baddieID.invincible || other.baddieID.object_index == obj_golfdemon))
{
	notification_push(notifs.pizzaball_killenemy, [room, other.baddieID.object_index]);
	instance_destroy(other);
	instance_destroy(other.baddieID);
}
