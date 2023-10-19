ini_open_from_string(obj_savesystem.ini_str);
unlocked = ini_read_real(save, "unlocked", false);
first = ini_read_real(save, "first", false);
ini_close();
if (first && !unlocked)
{
	with (instance_create(obj_stick_target.x, obj_stick_target.y, obj_stick))
	{
		state = states.normal;
		maxscore = other.maxscore;
		save = other.save;
	}
}
if (!unlocked && (global.pigtotal - global.pigreduction) >= maxscore)
	instance_create(0, 0, obj_mrsticknotification);
if (unlocked)
{
	if (room != tower_5)
	{
		with (instance_create(x, y, obj_bossdoor))
		{
			sprite_index = other.gate_sprite;
			bgsprite = other.bgsprite;
			targetRoom = other.targetRoom;
			group_arr = other.group_arr;
		}
	}
	else
	{
		with (instance_create(x, y, obj_door))
			targetRoom = other.targetRoom;
	}
	instance_destroy();
}
