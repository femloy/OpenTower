function cutscene_check_collision(_obj1, _obj2)
{
	var obj1 = _obj1;
	var obj2 = _obj2;
	var finish = false;
	with obj1
	{
		if (place_meeting(x, y, obj2))
			finish = true;
	}
	if finish
		cutscene_end_action();
}
