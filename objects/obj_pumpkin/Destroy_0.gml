ds_list_add(global.saveroom, id)
with obj_pumpkincounter
	counter--
fmod_event_one_shot("event:/sfx/misc/collecttoppin")
if !trickytreat
{
	scr_fmod_soundeffect(global.snd_breakblock, x, y)
	repeat 7
		create_debris(bbox_left + ((bbox_right - bbox_left) / 2), bbox_top + ((bbox_bottom - bbox_top) / 2), spr_pumpkinchunks)
}
else
	instance_create(bbox_left, bbox_top, obj_pumpkineffect);
if active
{
	ini_open_from_string(obj_savesystem.ini_str)
	var count = (ini_read_real("halloween", "pumpkincount", 0) + 1)
	ini_write_real("halloween", "pumpkincount", count)
	ini_write_real("halloween", room_get_name(room), true)
	obj_savesystem.ini_str = ini_close()
	gamesave_async_save()
	notification_push(notifs.pumpkin_collect, [count])
	var txt = lang_get_value("pumpkin_text2")
	if count <= 1
		txt = lang_get_value("pumpkin_text1")
	txt = embed_value_string(txt, [count])
	create_transformation_tip(txt)
}
else
{
	ini_open_from_string(obj_savesystem.ini_str)
	count = ini_read_real("halloween", "pumpkincount", 0)
	ini_close()
	notification_push(notifs.pumpkin_collect, [count])
}
destroy_sounds([snd])
