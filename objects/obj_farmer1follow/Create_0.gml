image_speed = 0.35;
depth = -6;
xoffset = 25;
yoffset = 0;
LAG_STEPS = 20;
followqueue = ds_queue_create();
spritequeue = ds_queue_create();
farmerpos = 0;
switch (object_index)
{
	case obj_farmer2follow:
		farmerpos = 1;
		break;
	case obj_farmer3follow:
		farmerpos = 2;
		break;
}
following_add_to_front();
dir = obj_player1.xscale;
space = 0;
maxspace = 1;
spaceaccel = 0.2;
idlespr = sprite_index;
walkspr = spr_peasanto_walk;
