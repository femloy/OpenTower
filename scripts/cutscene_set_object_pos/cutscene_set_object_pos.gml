function cutscene_set_object_pos(_obj, _x, _y)
{
	with _obj
	{
		x = _x;
		y = _y;
	}
	cutscene_end_action();
}
