function scr_random_granny()
{
	var count = instance_number(obj_tutorialbook);
	var n = irandom(count - 1);
	var b = noone;
	
	var found = false;
	while !found
	{
		with (instance_find(obj_tutorialbook, n))
		{
			if showgranny
			{
				found = true;
				b = id;
			}
		}
		n = irandom(count - 1);
	}
	
	with obj_tutorialbook
	{
		if id != b && showgranny
			instance_destroy();
	}
}
function lang_get_value_granny(lang)
{
	lang_name = lang;
	return lang_get_value(lang);
}
