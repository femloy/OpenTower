if (distance_to_object(obj_player1) <= 350 || global.level_minutes > timer)
{
	if global.level_minutes <= timer
		notification_push(notifs.seen_ptg, [global.leveltosave]);
	instance_destroy();
}
