sprite_index = spr_achievement_bosses;
hidden = true;
ini_open_from_string(obj_savesystem.ini_str);
if (ini_read_real("w2stick", "bosskey", false))
	hidden = false;
ini_close();
achievement = "vigilante";
index = 1;
secretplus = 5;
