function cutscene_image_index(obj, index)
{
	var _obj = obj;
	var _index = index;
	with _obj
		image_index = _index;
	cutscene_end_action();
}
