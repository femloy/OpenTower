dialog[0] = dialog_create("no");
loop = true;
persistent = false;
scene_info = [[function()
{
	if (!global.noisecutscene2)
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
if (global.noisecutscene2 == noone)
	global.noisecutscene2 = quick_ini_read_real(get_savefile_ini(), "cutscene", "noise2", false);
if (global.noisecutscene2)
	instance_destroy();
