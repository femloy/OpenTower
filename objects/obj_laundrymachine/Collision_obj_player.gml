if (other.key_up && electricity && global.hatcutscene2 && !global.hatcutscene3 && !place_meeting(x, y, obj_hubwater))
{
	global.hatcutscene3 = true;
	quick_ini_write_real(get_savefile_ini(), "cutscene", "hat3", true);
}
