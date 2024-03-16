x += ((hsp * dir1) + shake);
y += ((vsp * dir2) + shake);
hsp = Approach(hsp, 0, 0.25);
vsp = Approach(vsp, 0, 0.25);
shake = random_range(-1, 1);
if hsp == 0 && vsp == 0
	image_alpha -= 0.05;
if image_alpha < 0
	instance_destroy();
