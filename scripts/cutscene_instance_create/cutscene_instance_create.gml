function cutscene_instance_create(obj, x, y, imagexscale)
{
	var _obj = obj;
	var xx = x;
	var yy = y;
	var _xscale = imagexscale;
	with (instance_create(xx, yy, _obj))
	{
		depth = other.depth;
		image_xscale = _xscale;
		xscale = _xscale;
	}
	cutscene_end_action();
}
