var spd = 0.02;
image_xscale = Approach(image_xscale, 0, spd);
image_yscale = Approach(image_yscale, 0, spd);
if image_xscale <= 0
	instance_destroy();
if randombuffer > 0
	randombuffer--;
else
{
	randombuffer = 10 + irandom_range(-5, 12);
	dir = choose(-1, 1);
	dir_spd = 6 + irandom_range(-3, 4);
}
dir2 += (dir_spd * dir);
direction = angle_rotate(direction, dir2, 4);
x += lengthdir_x(2 * dir, direction);
y -= 10;
image_angle = direction;
