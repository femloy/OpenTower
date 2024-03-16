function cutscene_entrance_middle()
{
	with obj_solidpillar
	{
		destroy = true;
		instance_destroy();
	}
	cutscene_end_action();
}
