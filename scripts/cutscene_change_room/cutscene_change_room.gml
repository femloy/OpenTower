function cutscene_change_room(target)
{
	with (obj_player)
		targetRoom = target;
	instance_create(x, y, obj_fadeout);
	if (room == target)
		cutscene_end_action();
}
