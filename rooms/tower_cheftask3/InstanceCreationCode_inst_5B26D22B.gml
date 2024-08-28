sprite_index = spr_achievement_bosses;
hidden = true;
ini_open_from_string(obj_savesystem.ini_str);
if ini_read_real("w3stick", "bosskey", false)
	hidden = false;
ini_close();
achievement = "noise";
desc_override = "boss";
index = 2;
secretplus = 5;
