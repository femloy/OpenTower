if (ds_list_find_index(global.saveroom, id) == -1)
{
	if (!place_meeting(x, y, obj_gnomecustomer))
	{
		with (create_debris(x, y - 32, spr_cagedebris, false))
			image_index = 0;
		with (create_debris(x, y + 32, spr_cagedebris, false))
			image_index = 1;
		with (create_debris(x - 10, y, spr_cagedebris, false))
			image_index = 2;
		with (create_debris(x, y, spr_cagedebris, false))
			image_index = 3;
		with (create_debris(x + 10, y, spr_cagedebris, false))
			image_index = 4;
		fmod_event_one_shot_3d("event:/misc/breakblock", x, y);
	}
	ds_list_add(global.saveroom, id);
}
if (snd != -4)
{
	fmod_event_instance_stop(snd, true);
	fmod_event_instance_release(snd);
}
