if other.state != states.hit && other.state != states.chainsaw && other.state != states.gotoplayer
{
	var _col = collision_line(x + (35 * image_xscale), y + (16 * image_yscale), other.x, other.y, obj_solid, false, true);
	if _col == noone
		instance_destroy();
}
