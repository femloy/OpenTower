function quick_ini_read_real(ini_str, section, key, def)
{
	ini_open_from_string(obj_savesystem.ini_str);
	var b = ini_read_real(section, key, def);
	ini_close();
	return b;
}
function quick_ini_read_string(ini_str, section, key, def)
{
	ini_open_from_string(obj_savesystem.ini_str);
	var b = ini_read_string(section, key, def);
	ini_close();
	return b;
}
