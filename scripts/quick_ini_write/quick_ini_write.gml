function quick_ini_write_real(ini_string, section, key, value)
{
	with (obj_savesystem)
	{
		ini_open_from_string(ini_str);
		ini_write_real(section, key, value);
		ini_str = ini_close();
	}
}
