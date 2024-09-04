var d = 0.03;
scr_menu_getinput();
if (key_jump || key_start)
{
	if alarm[1] > 0
		event_perform(ev_alarm, 1);
	instance_destroy();
}
if fadein
	image_alpha = Approach(image_alpha, 1, d);
else
{
	image_alpha = Approach(image_alpha, 0, d);
	if image_alpha <= 0
		instance_destroy();
}
