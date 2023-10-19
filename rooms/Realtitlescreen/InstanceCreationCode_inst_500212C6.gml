if !variable_global_exists("titlecutscene")
	global.titlecutscene = true;

if global.titlecutscene
{
	scene_info = [
		[cutscene_title_start],
		[cutscene_set_sprite, obj_player1, spr_file2, 0.35, 1],
		[cutscene_wait, 120],
		[cutscene_title_middle],
		[cutscene_set_sprite, obj_player1, spr_player_bossintro, 0.3, -1],
		[cutscene_set_vsp, obj_player1, -6],
		[cutscene_waitfor_sprite, obj_player1],
		[cutscene_title_end]
	];
}
else
{
	scene_info = [
		[cutscene_wait, 2]
	];
}
