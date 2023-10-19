dialog[0] = dialog_create("You gotta pay your fee!");
loop = true;
persistent = false;
scene_info = [[function()
{
	if (!global.exitfeecutscene)
	{
		with (obj_player)
		{
			if (x > other.x)
			{
				with (other)
					cutscene_end_action();
			}
		}
	}
}], [cutscene_set_player_actor], [cutscene_do_dialog, dialog], [cutscene_waitfor_dialog], [cutscene_set_player_actor], [cutscene_move_player, obj_player, x - 200, 8, 12], [cutscene_set_player_normal]];
if (global.exitfeecutscene == noone)
	global.exitfeecutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "exitfee", false);
if (global.exitfeecutscene)
	instance_destroy();
