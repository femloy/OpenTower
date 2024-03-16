var _self = id;
with other
{
	if object_index != obj_onewaybigblock
		instance_destroy();
	else
	{
		var _col = collision_line(x + (35 * image_xscale), y + (16 * image_yscale), _self.x, _self.y, obj_solid, false, true);
		if _col == noone
			instance_destroy();
	}
}
