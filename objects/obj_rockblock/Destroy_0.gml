if (ds_list_find_index(global.saveroom, id) == -1)
{
	if (place_meeting(x + 1, y, obj_rockblock))
	{
		with (instance_place(x + 1, y, obj_rockblock))
		{
			timer = other.timer;
			alarm[1] = timer;
		}
	}
	if (place_meeting(x - 1, y, obj_rockblock))
	{
		with (instance_place(x - 1, y, obj_rockblock))
		{
			timer = other.timer;
			alarm[1] = timer;
		}
	}
	if (place_meeting(x, y + 1, obj_rockblock))
	{
		with (instance_place(x, y + 1, obj_rockblock))
		{
			timer = other.timer;
			alarm[1] = timer;
		}
	}
	if (place_meeting(x, y - 1, obj_rockblock))
	{
		with (instance_place(x, y - 1, obj_rockblock))
		{
			timer = other.timer;
			alarm[1] = timer;
		}
	}
	if (place_meeting(x + 1, y, obj_destructiblerockblock))
	{
		with (instance_place(x + 1, y, obj_destructiblerockblock))
		{
			timer = other.timer;
			alarm[1] = timer;
		}
	}
	if (place_meeting(x - 1, y, obj_destructiblerockblock))
	{
		with (instance_place(x - 1, y, obj_destructiblerockblock))
		{
			timer = other.timer;
			alarm[1] = timer;
		}
	}
	if (place_meeting(x, y + 1, obj_destructiblerockblock))
	{
		with (instance_place(x, y + 1, obj_destructiblerockblock))
		{
			timer = other.timer;
			alarm[1] = timer;
		}
	}
	if (place_meeting(x, y - 1, obj_destructiblerockblock))
	{
		with (instance_place(x, y - 1, obj_destructiblerockblock))
		{
			timer = other.timer;
			alarm[1] = timer;
		}
	}
	fmod_event_one_shot_3d("event:/sfx/misc/rockbreak", x + 32, y + 32);
	repeat (7)
		create_debris(x + 32, y + 32, spr_rockdebris);
	ds_list_add(global.saveroom, id);
}
