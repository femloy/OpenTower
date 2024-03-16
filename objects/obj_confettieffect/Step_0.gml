var g = 0.5;
x += hsp;
y += vsp;
if vsp > 0
	g = 0.1;
if vsp < 20
	vsp += g;
if vsp > 5
	image_alpha -= 0.01;
if image_alpha <= 0
	instance_destroy();
