function cutscene_waitfor_dialog()
{
	if (!instance_exists(obj_dialogcontroller))
		cutscene_end_action();
}
