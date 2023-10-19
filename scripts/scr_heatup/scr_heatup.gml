function scr_heatup()
{
	global.baddiespeed += 1;
	if (global.stylethreshold == 2)
		global.baddiepowerup = true;
	if (global.stylethreshold >= 2)
	{
		global.baddierage = true;
		obj_heatafterimage.visible = true;
	}
	with (obj_tv)
	{
		message = "HEAT UP!!";
		alarm[0] = 200;
		showtext = true;
	}
	obj_stylebar.toggle = true;
	obj_stylebar.alarm[0] = 5;
}
