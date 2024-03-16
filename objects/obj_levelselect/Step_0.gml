if (!instance_exists(obj_option))
{
	scr_getinput();
	if (!instance_exists(obj_fadeout))
	{
		var _m = key_down2 - key_up2;
		selected_world += _m;
		selected_world = clamp(selected_world, 0, array_length(level_array) - 1);
		if _m != 0
			selected_level = 0;
		selected_level += (key_left2 + key_right2);
		selected_level = clamp(selected_level, 0, array_length(level_array[selected_world]) - 1);
	}
	with obj_player
	{
		movespeed = 0;
		hsp = 0;
		vsp = 0;
	}
	if !active
		exit;
	if (key_jump2 && !instance_exists(obj_fadeout))
	{
		var _levelinfo = level_array[selected_world][selected_level];
		with obj_player
		{
			global.leveltosave = _levelinfo[2];
			global.leveltorestart = _levelinfo[1];
			state = states.comingoutdoor;
			movespeed = 0;
			hsp = 0;
			vsp = 0;
			targetRoom = _levelinfo[1];
			targetDoor = "A";
			instance_create(x, y, obj_fadeout);
		}
	}
	if (instance_exists(obj_fadeout))
	{
		with obj_player
			image_index = 0;
	}
}
for (var i = 0; i < array_length(toppin_info); i++)
{
	toppin_info[i][0] += 0.35;
	if (toppin_info[i][0] > sprite_get_number(toppin_info[i][1]))
		toppin_info[i][0] = frac(toppin_info[i][0]);
}
