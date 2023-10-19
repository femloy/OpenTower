if (global.levelcompletename == "SPACE")
{
	if (global.levelcomplete && !global.spacecutscene && global.levelcompletename == "SPACE")
	{
		currentroom = room;
		scene_info = [[cutscene_entrance_start], [cutscene_waitfor_sprite, obj_player1], [cutscene_player_idleanim], [cutscene_change_room, hub_port], [cutscene_set_player_visible, false], [cutscene_player_float, true], [cutscene_set_player_pos, 1152, 238], [cutscene_wait, 39], [cutscene_space_middle], [cutscene_wait, 150], [cutscene_change_room, currentroom], [cutscene_player_float, false], [cutscene_set_player_visible, true], [cutscene_space_end], [cutscene_save_game]];
	}
	else if (global.levelcomplete)
	{
		global.levelcomplete = false;
		scene_info = [[cutscene_save_game]];
	}
	else
		scene_info = [[cutscene_wait, 20]];
}
else if (global.levelcomplete && !global.farmcutscene)
{
	currentroom = room;
	scene_info = [[cutscene_entrance_start], [cutscene_waitfor_sprite, obj_player1], [cutscene_player_idleanim], [cutscene_change_room, hub_superpinball], [cutscene_set_player_visible, false], [cutscene_player_float, true], [cutscene_set_player_pos, 966, 274], [cutscene_wait, 10], [cutscene_farm_middle], [cutscene_change_room, hub_golf], [cutscene_player_float, true], [cutscene_set_player_pos, 555, 370], [cutscene_wait, 10], [cutscene_farm_middle], [cutscene_change_room, currentroom], [cutscene_player_float, false], [cutscene_set_player_visible, true], [cutscene_farm_end], [cutscene_save_game]];
}
else if (global.levelcomplete)
{
	global.levelcomplete = false;
	scene_info = [[cutscene_save_game]];
}
else
	scene_info = [[cutscene_wait, 20]];
