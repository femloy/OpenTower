x += ((hsp * dir1) + shake);
y += ((vsp * dir2) + shake);
hsp = Approach(hsp, 0, 0.25);
vsp = Approach(vsp, 0, 0.25);
shake = random_range(-1, 1);
