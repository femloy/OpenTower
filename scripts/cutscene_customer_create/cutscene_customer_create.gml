function cutscene_customer_create(x, y, idle, happy, xscale)
{
	var xx = x;
	var yy = y;
	var _idle = idle;
	var _happy = happy;
	var _xscale = xscale;
	with (instance_create(xx, yy, obj_customeractor))
	{
		image_xscale = _xscale;
		depth = other.depth - 1;
		sprite_index = _idle;
		spr_idle = _idle;
		spr_happy = _happy;
	}
	cutscene_end_action();
}
