var accel = 0.03;
if (!fadeout)
{
	image_alpha = Approach(image_alpha, 1, accel);
	if (image_alpha >= 1)
	{
		text_alpha = Approach(text_alpha, 1, accel);
		if (text_alpha >= 1 && alarm[0] == -1)
			alarm[0] = 150;
	}
}
else
{
	image_alpha = Approach(image_alpha, 0, accel);
	text_alpha = Approach(text_alpha, 0, accel);
	if (text_alpha <= 0)
		instance_destroy();
}
