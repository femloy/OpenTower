x += (spd * image_xscale);
if (image_xscale > 0 && x > (room_width + 200))
	instance_destroy();
else if (image_xscale < 0 && x < -200)
	instance_destroy();
spd = Approach(spd, 7, 0.05);
