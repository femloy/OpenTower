image_speed = 0.35;
visited = false;
depth = 103;
targetDoor = "A";
group_arr = -4;
offload_arr = -4;
locked = false;
john = false;
alarm[0] = 1;
uparrowID = scr_create_uparrowhitbox();
if room == tower_5
{
	if global.panic
	{
		with obj_door
			instance_create(x + 50, y + 96, obj_rubble);
		with obj_bossdoor
			instance_create(x + 50, y + 96, obj_rubble);
	}
}
