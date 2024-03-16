if (!is_holiday(holiday.halloween))
{
	instance_destroy(id, false)
	destroy_sounds([snd])
	exit;
}
if (ds_list_find_index(global.saveroom, id) != -1)
{
	instance_destroy(id, false)
	destroy_sounds([snd])
}
if quick_ini_read_real("", "halloween", room_get_name(room), false)
{
	image_alpha = 0.5
	active = false
}
var r = string_letters(room_get_name(room));
trickytreat = r == "trickytreat" || r == "trickytreatb";
