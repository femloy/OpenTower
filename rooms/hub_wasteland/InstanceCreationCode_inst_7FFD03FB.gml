if (global.levelcomplete && !global.desertcutscene)
{
	currentroom = room;
	global.desertcutscene = true;
	scene_info = [[cutscene_entrance_start], [cutscene_waitfor_sprite, obj_player1], [cutscene_player_idleanim], [cutscene_change_room, hub_farmland], [cutscene_set_player_visible, false], [cutscene_set_player_pos, 1152, 384], [cutscene_wait, 100], [cutscene_entrance_middle], [cutscene_wait, 100], [cutscene_change_room, currentroom], [cutscene_set_player_visible, true], [cutscene_desert_end], [cutscene_save_game]];
}
else if (global.levelcomplete)
{
	global.levelcomplete = false;
	scene_info = [[cutscene_save_game]];
}
else
	scene_info = [[cutscene_wait, 20]];
