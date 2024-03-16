if !destroy
{
	image_alpha = Approach(image_alpha, 1, 0.1);
	if (!place_meeting(x, y - 48, obj_ventilator))
		destroy = true;
}
else
{
	image_alpha = Approach(image_alpha, 0, 0.1);
	if image_alpha <= 0
		instance_destroy();
}
y += vsp;
