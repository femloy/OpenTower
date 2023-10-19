ini_open_from_string(obj_savesystem.ini_str);
unlocked = ini_read_real(save, "unlocked", false);
with (obj_bossdoor)
{
	if (save == other.save && !other.unlocked)
	{
		other.bossdoorID = id;
		instance_deactivate_object(id);
	}
}
ini_close();
if (unlocked)
	instance_destroy();
