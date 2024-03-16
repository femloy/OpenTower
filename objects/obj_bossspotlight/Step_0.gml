if expand
{
	radius += 15;
	if (radius > (SCREEN_WIDTH * SCREEN_HEIGHT))
		instance_destroy();
}
if (!instance_exists(objectID))
	instance_destroy();
