image_speed = 0.1;
if (instance_number(object_index) > 1)
{
	instance_destroy();
	exit;
}
depth = 101;
state = states.normal;
x = SCREEN_WIDTH - 100;
y = SCREEN_HEIGHT - 100;
add_y = -150;
if (global.pigtotal_add > 0)
{
	alarm[0] = 100;
	state = states.titlescreen;
}
global.pigtotal = 0;
global.pigreduction = 0;
world = 1;
