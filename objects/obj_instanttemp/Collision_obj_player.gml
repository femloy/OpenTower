instance_destroy(obj_iceblock);
instance_destroy(obj_iceblockslope);
if sprite_index != spr_heater2
{
	fmod_event_one_shot("event:/sfx/misc/breakicebig");
	scr_fmod_soundeffect(snd, x, y);
	sprite_index = spr_heater2;
	if (ds_list_find_index(global.saveroom, id) == -1)
		ds_list_add(global.saveroom, id);
}
