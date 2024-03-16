event_inherited();
player = instance_nearest(x, y, obj_player);
direction = point_direction(x, y, player.x, player.y);
speed = 6;
image_speed = 0.35;
image_angle = direction;
turn = false;
elite = false;
alarm[1] = 250;
depth = -99;
if global.stylethreshold >= 3
	turn = true;
