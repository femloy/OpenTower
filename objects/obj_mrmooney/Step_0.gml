if (sprite_index == spr_mrmooney_idle)
{
	showmoney = place_meeting(x, y, obj_player);
	if (showmoney && obj_player1.key_up2 && (global.pigtotal - global.pigreduction) >= maxscore)
	{
		sprite_index = spr_mrmooney_smile;
		fmod_event_one_shot_3d("event:/sfx/misc/kashing", x, y);
		instance_destroy(uparrowID);
		ini_open_from_string(obj_savesystem.ini_str);
		ini_write_real("w5stick", "mooneyunlocked", true);
		obj_savesystem.ini_str = ini_close();
		gamesave_async_save();
		notification_push(notifs.mrmooney_donated, [room]);
		with (obj_palettedresser)
		{
			for (var i = 0; i < array_length(palettes); i++)
			{
				if (palettes[i][0] == "mooney")
				{
					palettes[i][1] = true;
					break;
				}
			}
		}
		instance_destroy(obj_pigtotal);
	}
}
else
	showmoney = false;
money_y = Wave(-5, 5, 2, 2);
