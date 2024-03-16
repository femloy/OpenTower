if direction > 90 && direction < 270
	image_yscale = -1;
else
	image_yscale = 1;
if stop == 1
	speed = Approach(speed, 0, 0.5);
else
	speed = Approach(speed, 8 * dir, 0.25);
if (abs(speed) == 0 && image_alpha > 0)
	image_alpha -= 0.05;
if image_alpha <= 0
	instance_destroy();
if hurtbuffer > 0
	hurtbuffer--;
