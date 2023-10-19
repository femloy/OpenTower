function cutscene_dungeon_middle()
{
	with (obj_lavapot)
	{
		destroy = true;
		instance_destroy();
	}
	cutscene_end_action();
}
