if (ds_list_find_index(global.saveroom, id) == -1)
{
	ds_list_add(global.saveroom, id);
	scr_sound_multiple("event:/sfx/misc/collect", x, y);
	global.heattime += 10;
	global.heattime = clamp(global.heattime, 0, 60);
	with obj_camera
		healthshaketime = 30;
	global.collect += 50;
	with (instance_create(x, y, obj_smallnumber))
		number = string(50);
	create_particle(x, y, particle.genericpoofeffect, 0);
}
