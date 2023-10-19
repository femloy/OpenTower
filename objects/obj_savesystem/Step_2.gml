if (state == 0)
{
	if (dirty)
	{
		if (savegame)
		{
			savegame = false;
			state = 1;
			with (obj_achievementtracker)
			{
				achievement_save_variables(achievements_update);
				achievement_save_variables(achievements_notify);
			}
			showicon = true;
			icon_alpha = 3;
			buffer_async_group_begin("saves");
			savebuff = buffer_create(1, 1, 1);
			ini_open_from_string(ini_str);
			ini_write_real("Game", "percent", get_percentage());
			ini_write_real("Game", "minutes", global.file_minutes);
			ini_write_real("Game", "seconds", global.file_seconds);
			var closestring = ini_close();
			buffer_write(savebuff, 11, closestring);
			buffer_save_async(savebuff, get_savefile_ini(), 0, buffer_get_size(savebuff));
			saveid = buffer_async_group_end();
		}
		else if (saveoptions)
		{
			saveoptions = false;
			state = 3;
			buffer_async_group_begin("");
			savebuff = buffer_create(1, 1, 1);
			showicon = true;
			icon_alpha = 3;
			buffer_write(savebuff, 11, ini_str_options);
			buffer_save_async(savebuff, "saveData.ini", 0, buffer_get_size(savebuff));
			saveid = buffer_async_group_end();
		}
		else
			dirty = false;
	}
}
