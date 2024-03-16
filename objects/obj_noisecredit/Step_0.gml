y -= 2;
if y < SCREEN_HEIGHT * 0.55 && !start
{
	start = true;
	alarm[0] = 1;
}
if y < -400
	instance_destroy();
if finish
{
	image_alpha = Approach(image_alpha, 0, 0.1);
	if image_alpha <= 0
		instance_destroy();
}
