if fadealpha > 1 && !fadein
{
	if obj_pause.pause
	{
		instance_activate_all();
		scr_deactivate_escape();
		alarm[0] = 1;
		audio_resume_all();
	}
	else if !obj_pause.pause
	{
		audio_pause_all();
		instance_deactivate_all(true);
		instance_activate_object(obj_pause);
		instance_activate_object(obj_inputAssigner);
		instance_activate_object(obj_screensizer);
	}
	obj_pause.pause = !obj_pause.pause;
	fadein = true;
}
fadealpha += !fadein ? 0.1 : -0.1;
if fadein && fadealpha < 0
	instance_destroy();
