if !active
{
	global.railspeed--;
	global.railspeed = clamp(global.railspeed, 0, global.maxrailspeed);
	with obj_railparent
		alarm[0] = 1;
	active = true;
	ds_list_add(global.saveroom, id);
}
