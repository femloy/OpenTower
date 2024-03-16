x += (spd * image_xscale);
y += (spd * image_yscale);
alpha = Approach(alpha, 0, 0.05);
if alpha <= 0
	instance_destroy();
image_alpha = alpha;
