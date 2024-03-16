scr_delete_pause_image();
if !pause
	scr_pause_activate_objects(false);
else
{
	instance_activate_object(pauseID);
	with pauseID
	{
		alarm[3] = 1;
		scr_pause_activate_objects();
		instance_destroy(obj_option);
		instance_destroy(obj_keyconfig);
		pause = false;
	}
}
