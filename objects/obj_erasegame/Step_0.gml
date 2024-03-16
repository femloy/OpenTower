if (!instance_exists(obj_keyconfig))
{
	if ((-obj_player.key_left2 || keyboard_check_pressed(vk_left)) && optionselected > 0)
		optionselected -= 1;
	if ((obj_player.key_right2 || keyboard_check_pressed(vk_right)) && optionselected < 1)
		optionselected += 1;
}
if (optionselected == 1 && (obj_player.key_jump || keyboard_check_pressed(vk_enter)))
{
	file_delete("saveData.ini");
	scr_initinput();
	ini_open("saveData.ini");
	if (!ini_section_exists("SAGE2019"))
	{
		ini_write_string("SAGE2019", "shotgunsnick", false);
		ini_write_string("SAGE2019", "dungeonbackup", false);
		ini_write_string("SAGE2019", "srank", false);
		ini_write_string("SAGE2019", "snicksrank", false);
		ini_write_string("SAGE2019", "combo10", false);
		ini_write_string("SAGE2019", "secret", false);
		ini_write_string("SAGE2019", "knight", false);
		ini_write_string("SAGE2019", "toppin", false);
		ini_write_string("SAGE2019", "treasure", false);
		ini_close();
	}
	global.SAGEshotgunsnick = false;
	global.SAGEshotgunsnicknumber = 0;
	global.SAGEdungeonbackup = false;
	global.SAGEsrank = false;
	global.SAGEsnicksrank = false;
	global.SAGEcombo10 = false;
	global.SAGEsecret = false;
	global.SAGEknight = false;
	global.SAGEknighttaken = false;
	global.SAGEtoppin = false;
	global.SAGEtreasure = false;
	with obj_SAGE2019achievementmarker
	{
		snickshotgun = false;
		dungeonbackup = false;
		srank = false;
		snicksrank = false;
		combo10 = false;
		secret = false;
		knight = false;
		toppin = false;
		treasure = false;
	}
	obj_mainmenuselect.selected = false;
	instance_destroy();
}
if ((obj_player.key_slap2 || keyboard_check_pressed(vk_escape)) || (optionselected == 0 && (obj_player.key_jump || keyboard_check_pressed(vk_enter))))
{
	obj_mainmenuselect.selected = false;
	instance_destroy();
}
