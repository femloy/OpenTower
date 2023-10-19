targetRoom = room;
targetDoor = "A";
image_speed = 0.4;
depth = 0;
state = states.idle;
gerome_spr = spr_geromewalkelevator;
gerome_x = SCREEN_WIDTH + 100;
gerome_y = 205;
gerome_index = 0;
cliff_index = 0;
cliff_x = SCREEN_WIDTH;
cliff_y = 256;
peppino_index = 0;
peppino_x = SCREEN_WIDTH / 2;
peppino_xstart = peppino_x;
peppino_y = 426;
with (obj_player)
{
	state = states.titlescreen;
	x = -SCREEN_WIDTH - 100;
	y = -SCREEN_HEIGHT - 100;
}
