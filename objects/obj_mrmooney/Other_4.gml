ini_open_from_string(obj_savesystem.ini_str);
var w = "w5stick";
var unlocked = ini_read_real(w, "mooneyunlocked", false);
var stickunlocked = ini_read_real(w, "unlocked", false);
ini_close();

if !unlocked && stickunlocked
{
	if global.pigtotal - global.pigreduction >= maxscore
	{
		with (instance_create(0, 0, obj_mrsticknotification))
		{
			sprite_index = spr_mrmooney_notification;
			if (!obj_player1.ispeppino || global.swapmode)
				sprite_index = spr_noisetterabbitTV;
		}
	}
}
else
{
	instance_destroy(uparrowID);
	instance_destroy();
}
