if (global.levelcomplete)
{
	with (obj_player)
	{
		x = backtohubstartx;
		y = backtohubstarty;
		image_blend = c_white;
	}
}
if (global.levelcompletename != "CHATEAU")
{
	if (global.levelcomplete && !global.medievalcutscene)
	{
		global.levelcomplete = false;
		with (obj_player1)
		{
			other.backx = backtohubstartx;
			other.backy = backtohubstarty;
		}
		scene_info = [[cutscene_medieval_start], [cutscene_waitfor_sprite, obj_player1], [cutscene_medieval_start2], [cutscene_set_player_visible, false], [cutscene_player_float, true], [cutscene_player_pos_lerp, 1173, 997, 0.03], [cutscene_wait, 40], [cutscene_medieval_middle], [cutscene_player_pos_lerp, backx, backy, 0.03], [cutscene_set_player_pos, backx, backy], [cutscene_set_player_visible, true], [cutscene_player_float, false], [cutscene_medieval_end], [cutscene_save_game]];
	}
	else if (global.levelcomplete)
	{
		global.levelcomplete = false;
		scene_info = [[cutscene_save_game]];
	}
	else
		scene_info = [[cutscene_wait, 20]];
}
else if (global.levelcomplete && !global.chateaucutscene)
{
	global.levelcomplete = false;
	global.chateaucutscene = true;
	currentroom = room;
	scene_info = [[cutscene_entrance_start], [cutscene_waitfor_sprite, obj_player1], [cutscene_player_idleanim], [cutscene_change_room, hub_warpath], [cutscene_set_player_visible, false], [cutscene_set_player_pos, 1888, 369], [cutscene_wait, 100], [cutscene_change_room, currentroom], [cutscene_set_player_visible, true], [function()
	{
		with (obj_player)
		{
			state = states.normal;
			x = backtohubstartx;
			y = backtohubstarty;
		}
		global.levelcomplete = false;
		global.chateaucutscene = true;
		quick_ini_write_real(get_savefile_ini(), "cutscene", "chateau", true);
		cutscene_end_action();
	}], [cutscene_save_game]];
}
else if (global.levelcomplete)
{
	global.levelcomplete = false;
	scene_info = [[cutscene_save_game]];
}
else
	scene_info = [[cutscene_wait, 20]];
