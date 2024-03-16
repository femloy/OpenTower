function cutscene_waitfor_sprite(obj)
{
	var _obj = obj;
	var finish = false;
	with _obj
	{
		if (image_index > image_number - 1)
		{
			finish = true;
			image_index = image_number - 1;
		}
	}
	if finish
		cutscene_end_action();
}
