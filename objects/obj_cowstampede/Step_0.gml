x += (spd * image_xscale);
if ((image_xscale > 0 && x > (room_width + 100)) || (image_xscale < 0 && x < -100))
	instance_destroy(id, false);
