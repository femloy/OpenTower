state = 1;
x = -200;
y = 402;
ystart = y;
movespeed = 8;
vsp = 0;
grav = 0.5;
boulder_x = room_width + 1000;
boulder_y = 402;
boulder_index = 0;
with obj_player
	state = states.titlescreen;
fade = 0;
whitefade = 0;
image_speed = 0.35;
depth = -10;
fade = 1;
state = 3;
