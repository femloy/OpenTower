function scr_heatdown()
{
	global.baddiespeed -= 1;
	if (global.stylethreshold != 2)
		global.baddiepowerup = false;
	if (global.stylethreshold < 2)
	{
		global.baddierage = false;
		obj_heatafterimage.visible = false;
	}
	if (instance_exists(obj_baddie))
	{
		with (obj_tv)
		{
			message = "HEAT DOWN...";
			alarm[0] = 200;
			showtext = true;
		}
	}
	obj_stylebar.toggle = true;
	obj_stylebar.alarm[0] = 5;
}
