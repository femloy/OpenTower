ini_open_from_string(obj_savesystem.ini_str);
var _destroyed = ini_read_real("Tutorial", "finished", false);
ini_close();
if (_destroyed)
{
	ini_open_from_string(obj_savesystem.ini_str);
	_destroyed = ini_read_real("Tutorial", "tutorialcutscene", false);
	if (!_destroyed)
	{
		ini_write_real("Tutorial", "tutorialcutscene", true);
		with (obj_tutorialblock)
		{
			with (obj_player)
			{
				if (place_meeting(x, y, obj_startgate))
					other.alarm[0] = 100;
			}
		}
	}
	if (alarm[0] == -1)
		instance_destroy();
	obj_savesystem.ini_str = ini_close();
}
