image_speed = 0.35;
if (buffer > 0)
	buffer--;
if (!instance_exists(obj_gravecorpse))
	image_alpha = Approach(image_alpha, 1, 0.08);
