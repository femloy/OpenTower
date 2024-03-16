if fadeout
	fade = Approach(fade, 0, 0.01);
else
	fade = Approach(fade, 1, 0.05);
if fade <= 0
	instance_destroy();
